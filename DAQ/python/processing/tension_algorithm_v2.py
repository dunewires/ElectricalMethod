import sys
import joblib
import numpy as np
from typing import List, Tuple, Optional, Dict, Any, Union

from scipy import signal, optimize, stats
from tension_algorithm import TensionAlgorithmBase
from channel_frequencies import get_expected_resonances_unique

GAUSS_SCALE = 15.5
GAUSS_OFFSET = 3.5
"""The scale and offset of the Gaussian kernel used to model the resonances.
Marginalized fits on a number of spectra revealed that these values are a good
approximation of the shape of the resonances in the DWA scans and there is no
need to re-fit them for every spectrum.
"""
GLOBAL_TENSION_OFFSET = 0.02
"""Global offset to apply to the tension values.
The value of this constant was determined as a manual correction after looking 
at a couple of DWA scans.
"""


class TensionAlgorithmV2(TensionAlgorithmBase):
    def __init__(self, verbosity):
        super().__init__(verbosity)

    def process_channel(
        self,
        layer: str,
        apa_channel: int,
        freq_arr: np.ndarray,
        ampl_arr: np.ndarray,
        max_freq: float = 250.0,
        nominal_tension: float = 6.5,
    ) -> Tuple[List, List, List, List]:
        """
        Process a given channel to find the optimal placement of resonances and calculate the tension of each segment.
        Args:
            layer (str): The layer of the channel.
            apa_channel (int): The channel number.
            freq_arr (np.ndarray): A NumPy array of frequency values.
            ampl_arr (np.ndarray): A NumPy array of amplitude values.
            max_freq (float, optional): The maximum frequency to search for resonances. Defaults to 250.
            nominal_tension (float, optional): The nominal tension value. Defaults to 6.5.
        Returns:
            Tuple[List, List, List, List]: A tuple containing the following lists:
                - wire_segments: The list of wire segments corresponding to the channel.
                - selected_moved_res_arr: The list of selected moved resonance arrays.
                - selected_tension: The list of selected tension values.
                - confidences: The list of confidence values for each tension value.
        """
        # Get the frequency expectation for this channel
        segments, default_frequencies = get_expected_resonances_unique(apa_channel, layer, max_freq)
        # Get baseline subtracted amplitude array
        ampl_arr = self.cumsum_and_baseline_subtracted(freq_arr, ampl_arr)
        # Get the resonances for this channel
        tensions, best_fit_freqs, diagnostics_dict = self._find_resonances(
            freq_arr,
            ampl_arr,
            apa_channel,
            layer,
            use_de=True,
            downsample=2,
            prior_width=None,
            max_freq=max_freq,
            gauss_scale=GAUSS_SCALE,
            gauss_offset=GAUSS_OFFSET,
            ignore_first=5,
            popsize=50,
            init="latinhypercube",
            polish=True,
            nominal_tension=nominal_tension,
            amp_regularization=0.0,
            max_tension=9.0,
            verbosity=self.verbosity,
        )
        tensions += GLOBAL_TENSION_OFFSET
        best_fit_freqs = self._get_tension_adjusted_frequencies(tensions, default_frequencies)

        # Get the confidence values for each tension value
        confidences = self.estimate_confidences(layer, diagnostics_dict)

        return segments, best_fit_freqs, tensions, confidences

    def estimate_confidences(self, layer, diagnostics_dict):
        """Estimate confidences for each tension value using the diagnostics dictionary.
        This uses a scikit-learn DecisionTreeRegressor to estimate the absolute value of the error
        in Newtons for each tension value. It expects that the dictionary contains
        the arrays of the input variables that are passed into the decision tree for each segment.
        There are two separate decision trees, one for the X and G layer and one of the U and V layers.
        The decision trees are stored as pkl files in the same directory as this file.
        If these files do not exist, an array of NaNs is returned.

        Args:
            layer (int): The layer of the channel.
            diagnostics_dict (Dict): A dictionary containing the input variables for the decision tree.

        Returns:
            np.ndarray: A NumPy array of confidence values.
        """

        # Check that files exist and load the models. Return NaNs if they don't.
        if layer in ["X", "G"]:
            try:
                model = joblib.load("tension_algorithm_v2_xg.pkl")
            except FileNotFoundError:
                return np.full(len(diagnostics_dict["min_weights"]), np.nan)
        elif layer in ["U", "V"]:
            try:
                model = joblib.load("tension_algorithm_v2_uv.pkl")
            except FileNotFoundError:
                return np.full(len(diagnostics_dict["min_weights"]), np.nan)
        else:
            raise ValueError("Invalid layer number.")

        # Get the input variables from the diagnostics dictionary
        X = np.array(
            [
                diagnostics_dict["min_weights"],
                diagnostics_dict["mean_weights"],
                diagnostics_dict["weight_ratio_min_max"],
                diagnostics_dict["max_unmatched_peak_frequency"],
                diagnostics_dict["max_unmatched_peak_weight"],
            ]
        ).T

        # Get the predicted values from the model
        y_pred = model.predict(X)
        # Return the absolute value of the predicted values
        return np.abs(y_pred)

    def cumsum_and_baseline_subtracted(
        self, freq_arr: np.ndarray, ampl_arr: np.ndarray
    ) -> np.ndarray:
        """
        Take the cumulative sum of the amplitude array and subtract the smoothed curve (baseline).

        Args:
            freq_arr (np.ndarray): A NumPy array of frequency values.
            ampl_arr (np.ndarray): A NumPy array of amplitude values.

        Returns:
            np.ndarray: A NumPy array of baseline-subtracted amplitude values.
        """

        # Even though the butter filter should be able to detrend a signal, in practice
        # it causes very large spikes at the beginning and end of the signal. To avoid
        # this, we detrend the signal using a polynomial first.
        y = np.cumsum(self._poly_detrend(ampl_arr, order=4))
        # apply high-pass filter to the measured amplitude
        b, a = signal.butter(2, [0.1, 0.2], "bandpass", analog=False)
        y = signal.filtfilt(b, a, y)

        return y

    def _frequency_to_tension(self, frequency, nominal_frequency, nominal_tension=6.5):
        """Convert a frequency to a tension value.

        The equation relating two frequencies is f2 = f1*(T2/T1)^0.5, where f2 is
        the new frequency and f1 is the nominal frequency and T1 is the nominal
        tension. Solving for T2 gives T2 = T1*(f2/f1)^2.
        """

        return nominal_tension * (frequency / nominal_frequency) ** 2

    def _poly_detrend(self, data, order=2):
        """Detrend data using a second order polynomial."""
        x = np.arange(len(data))
        coeffs = np.polyfit(x, data, order)
        detrended = data - np.polyval(coeffs, x)
        return detrended

    def _find_resonances(
        self,
        frequencies,
        amplitudes,
        apa_channel,
        layer,
        use_de=False,
        downsample=2,
        prior_width=1.0,
        max_freq=250,
        gauss_scale=GAUSS_SCALE,
        gauss_offset=GAUSS_OFFSET,
        ignore_first=5,
        nominal_tension=6.5,
        max_tension=10,
        verbosity=0,
        amp_regularization=0.0,
        init="latinhypercube",
        **kwargs
    ):
        # We can keep the widths of the wavelets fixed since the step size is always the same.
        corr_amplitude = self._transform_cwt_amplitude(amplitudes)
        segments, default_frequencies = get_expected_resonances_unique(apa_channel, layer, max_freq)
        x = frequencies
        # There is often a spurious resonance at the beginning of the spectrum. We cut the first
        # <ignore_first> Hz off of the spectrum to avoid this.
        valid_mask = (x - np.min(x)) > ignore_first
        x = x[valid_mask]
        corr_amplitude = corr_amplitude[valid_mask]

        # Bounds are individual per segment such that the maximum tension corresponds to the
        # maximum frequency for that segment. We also want the lower bound to be at the minimum
        # frequency of the input + <ignore_first> Hz.
        min_freq = np.min(frequencies) + ignore_first
        if max_freq > np.max(frequencies):
            max_freq = np.max(frequencies)
        bounds = []
        for segment, default_freq_arr in zip(segments, default_frequencies):
            # The maximum tension is the tension that corresponds to the maximum frequency
            # for that segment.
            max_default_freq = np.max(default_freq_arr)
            _max_tension = self._frequency_to_tension(max_freq, max_default_freq, nominal_tension)
            if _max_tension > max_tension:
                _max_tension = max_tension
            # The minimum tension is the tension that corresponds to the minimum frequency
            # for that segment.
            min_default_freq = np.min(default_freq_arr)
            min_tension = self._frequency_to_tension(min_freq, min_default_freq, nominal_tension)

            if min_tension > _max_tension:
                # If the minimum tension is greater than the maximum tension, then we
                # need to swap the values.
                if verbosity > 0:
                    print("Swapping min and max tension for segment {}".format(segment))
                    print("Min tension: {}".format(min_tension))
                    print("Max tension: {}".format(_max_tension))
                min_tension, _max_tension = _max_tension, min_tension
            bounds.append((min_tension, _max_tension))
        if verbosity > 0:
            print("Bounds: {}".format(bounds))
        initial_guess = [nominal_tension] * len(segments)

        args = (x, corr_amplitude, default_frequencies)
        # add additional arguments to the function
        # Gauss scale, a, b, downsample, prior_width
        args += (
            gauss_scale,
            1,
            gauss_offset,
            downsample,
            prior_width,
            nominal_tension,
        )
        # minimize residual
        if use_de:
            if "popsize" in kwargs:
                popsize = kwargs.pop("popsize")
            else:
                popsize = 50
            if init == "truncated_normal":
                # initialize the population with truncated normal distributions
                # within the bounds, centered at the initial guess, and with
                # a standard deviation of 2 N.
                init_samples = []
                scale = 2
                for i, (lower, upper) in enumerate(bounds):
                    a, b = (lower - initial_guess[i]) / scale, (upper - initial_guess[i]) / scale
                    init_samples.append(
                        stats.truncnorm.rvs(a, b, size=popsize, loc=initial_guess[i], scale=scale)
                    )
                init_samples = np.array(init_samples).T
                init = init_samples
            elif init == "correlated":
                # Initialize samples under the assumption that the segments are correlated.
                # We first sample <popsize> tensions uniformly. Then, we sample the tensions
                # for all segments from a normal distribution centered at the tension previously
                # sampled.
                # Make new numpy random state with fixed seed to make sure that the result is
                # reproducible.
                np.random.seed(0)
                scale = 1.5
                max_bound, min_bound = np.max([max(b) for b in bounds]), np.min(
                    [min(b) for b in bounds]
                )
                base_tensions = np.random.uniform(min_bound, max_bound, size=(popsize, 1))
                if len(bounds) == 1:
                    init_samples = base_tensions
                else:
                    init_samples = np.random.normal(
                        loc=base_tensions, scale=scale, size=(popsize, len(bounds))
                    )
                    # Clip init_samples to the bounds for each segment
                    for i, (lower, upper) in enumerate(bounds):
                        init_samples[:, i] = np.clip(init_samples[:, i], lower, upper)
                print(init_samples)
                init = init_samples
            res = optimize.differential_evolution(
                self._tension_fit_residual, bounds, args=args, popsize=popsize, init=init, **kwargs
            )
        else:
            if "method" in kwargs:
                method = kwargs.pop("method")
            else:
                method = "Nelder-Mead"
            # Pop all arguments that are only used by differential evolution
            for de_arg in ["popsize", "init", "polish"]:
                if de_arg in kwargs:
                    kwargs.pop(de_arg)
            res = optimize.minimize(
                self._tension_fit_residual,
                initial_guess,
                args=args,
                bounds=bounds,
                method=method,
                **kwargs
            )
        if verbosity > 0:
            print(res)
        tensions = res.x
        diagnostics_dict = self._get_fit_diagnostics(
            tensions, x, corr_amplitude, default_frequencies, downsample=downsample
        )
        best_fit_freqs = self._get_tension_adjusted_frequencies(tensions, default_frequencies)
        return tensions, best_fit_freqs, diagnostics_dict

    def _deconvolve_resonances(self, input, scale, gauss_locations):
        # Build a kernel matrix, where each row is a Gaussian kernel
        # centered at one of the expected frequencies.
        # We do not adjust the normalization on purpose, we want the peak
        # of each kernel to be 1.
        A = np.exp(
            -0.5
            * (np.arange(len(input))[:, np.newaxis] - gauss_locations[np.newaxis, :]) ** 2
            / scale**2
        )
        # Now we solve a non-negative least-squares problem to find the best
        # combination of the kernels to approximate the correlation
        # amplitude.
        # The result is a vector of weights, which we can use to reconstruct
        # the correlation amplitude.
        weights, residual = optimize.nnls(A, input)
        return weights, residual

    def _reconvolve_resonances(self, input, weights, gauss_locations, scale):
        # Build a kernel matrix, where each row is a Gaussian kernel
        # centered at one of the expected frequencies.
        # We do not adjust the normalization on purpose, we want the peak
        # of each kernel to be 1.
        A = np.exp(
            -0.5
            * (np.arange(len(input))[:, np.newaxis] - gauss_locations[np.newaxis, :]) ** 2
            / scale**2
        )
        return np.dot(A, weights)

    def _get_tension_adjusted_frequencies(self, tensions, frequencies):
        # The default tension is 6.5 N. To rescale a segment, we apply the function
        # f2 = f1*(T2/T1)^0.5
        # where f1 is the frequency for the default tension, f2 is the frequency for
        # the new tension, T1 is the default tension, and T2 is the new tension.
        new_frequencies = []
        for tension, segment_frequencies in zip(tensions, frequencies):
            new_frequencies.append(np.array(segment_frequencies) * (tension / 6.5) ** 0.5)
        return new_frequencies

    def _transform_cwt_amplitude(self, amplitudes, widths=(8, 16)):
        """Get the CWT amplitude for a given signal.
        Transforms the input amplitudes using a CWT with a Morlet wavelet and
        returns the mean of the absolute values of the coefficients.
        """
        # Even though this is only two lines, we want to define it as a function
        # so that we can easily change the CWT parameters globally.
        cwtmatr = signal.cwt(amplitudes, signal.morlet2, widths=np.arange(*widths))
        return np.mean(np.abs(cwtmatr), axis=0)

    def _reconvolve_with_tension_adjustment(
        self,
        x,
        weights,
        default_frequencies,
        tensions,
        gauss_scale=GAUSS_SCALE,
        a=1,
        b=GAUSS_OFFSET,
        downsample=2,
    ):
        # Build a kernel matrix, where each row is a Gaussian kernel
        # centered at one of the expected frequencies.
        adjusted_frequencies = self.get_tension_adjusted_frequencies(tensions, default_frequencies)
        # combined the frequencies for each segment into one array
        expected_frequencies = np.concatenate(adjusted_frequencies)
        # Combine the weights for each segment into one array
        weights = np.concatenate(weights)
        # Expected frequencies where the Gaussian kernels are centered are offset
        expected_frequencies = a * expected_frequencies + b
        x = x[::downsample]
        # Adjust gauss scale
        gauss_scale = gauss_scale / downsample
        # Need to convert from the frequency to the index in the correlation amplitude.
        max_freq, min_freq = np.max(x), np.min(x)
        gauss_locations = ((expected_frequencies - min_freq) / (max_freq - min_freq)) * len(x)
        reconvolved_amplitude = self.reconvolve_resonances(x, weights, gauss_locations, gauss_scale)
        return x, reconvolved_amplitude

    def _deconvolve_with_tension_adjustment(
        self,
        x,
        corr_amplitude,
        default_frequencies,
        tensions,
        gauss_scale=20,
        a=1,
        b=0,
        downsample=1,
    ):
        adjusted_frequencies = self._get_tension_adjusted_frequencies(tensions, default_frequencies)
        # combined the frequencies for each segment into one array
        expected_frequencies = np.concatenate(adjusted_frequencies)
        # Expected frequencies where the Gaussian kernels are centered are offset
        expected_frequencies = a * expected_frequencies + b
        # Downsample the correlation amplitude and input frequencies
        corr_amplitude = corr_amplitude[::downsample]
        x = x[::downsample]
        # Adjust gauss scale
        gauss_scale = gauss_scale / downsample
        # Need to convert from the frequency to the index in the correlation amplitude.
        max_freq, min_freq = np.max(x), np.min(x)
        gauss_locations = ((expected_frequencies - min_freq) / (max_freq - min_freq)) * len(x)
        weights, residual = self._deconvolve_resonances(
            corr_amplitude, gauss_scale, gauss_locations
        )
        # undo the downsampling for gauss locations
        gauss_locations = gauss_locations * downsample
        return weights, residual, gauss_locations

    def _tension_fit_residual(
        self,
        tensions,
        x,
        corr_amplitude,
        default_frequencies,
        gauss_scale=GAUSS_SCALE,
        a=1,
        b=GAUSS_OFFSET,
        downsample=2,
        prior_width=None,
        nominal_tension=6.5,
    ):
        if np.any(tensions < 0):
            raise ValueError("Tensions must be positive")
        weights, residual, gauss_locations = self._deconvolve_with_tension_adjustment(
            x,
            corr_amplitude,
            default_frequencies,
            tensions,
            gauss_scale=gauss_scale,
            a=a,
            b=b,
            downsample=downsample,
        )
        assert np.isfinite(residual), "Residual is not finite"
        if prior_width is not None:
            residual += np.sum((tensions - nominal_tension) ** 2 / (2 * prior_width**2))
        return residual

    def _find_unmatched_peaks(self, x, corr_amplitude, reconvolved_amplitude):
        # Find the peaks in the correlation amplitude that are not matched by the
        # reconvolved correlation amplitude.
        peaks, _ = signal.find_peaks(
            np.clip(corr_amplitude - reconvolved_amplitude, 0, None), height=1, prominence=1
        )
        return x[peaks], corr_amplitude[peaks] - reconvolved_amplitude[peaks]

    def _unflatten_weights(self, frequency_list, flat_weights):
        """Unflatten the weights from a deconvolution into a list of arrays."""
        weights = []
        for frequencies in frequency_list:
            weights.append(flat_weights[: len(frequencies)])
            flat_weights = flat_weights[len(frequencies) :]
        return weights

    def _get_fit_diagnostics(
        self, tensions, x, corr_amplitude, default_frequencies, downsample=2, weight_merge_width=5
    ):
        weights, residual, gauss_locations = self._deconvolve_with_tension_adjustment(
            x,
            corr_amplitude,
            default_frequencies,
            tensions,
            gauss_scale=GAUSS_SCALE,
            a=1,
            b=GAUSS_OFFSET,
            downsample=downsample,
        )

        unmatched_peak_frequencies, unmatched_peak_weights = self._find_unmatched_peaks(
            x,
            corr_amplitude,
            self._reconvolve_resonances(x, weights, gauss_locations, GAUSS_SCALE),
        )
        # We want to use the weights to diagnose bad fits. In particular, we want to
        # find instances where a frequency is not matched by a resonance, which would
        # be indicated by a very small weight.
        merged_weights = []
        frequencies = self._get_tension_adjusted_frequencies(tensions, default_frequencies)
        # Turn the array of flat weights into a list of arrays, where each array corresponds
        # to the weights for a segment. This assumes that the order of the weights is the
        # same as the order of the frequencies.
        weights = self._unflatten_weights(default_frequencies, weights)
        for segment_weights, segment_freq in zip(weights, frequencies):
            # Sometimes two frequencies within a segment are very close to each other,
            # which causes the weight of one of them to go to zero. In these cases
            # we want to sum the weights of the two frequencies.
            resonance_weights = []
            freq_diffs = np.diff(segment_freq)
            for i in range(len(segment_freq)):
                if i == 0:
                    resonance_weights.append(segment_weights[i])
                else:
                    if freq_diffs[i - 1] < weight_merge_width:
                        resonance_weights[-1] += segment_weights[i]
                    else:
                        resonance_weights.append(segment_weights[i])
            merged_weights.append(resonance_weights)

        # All diagnostics have the same length as the number of segments.

        # diagnostics concerning the weights of the peaks that were matched
        min_weights = [np.min(segment_weights) for segment_weights in merged_weights]
        mean_weights = [np.mean(segment_weights) for segment_weights in merged_weights]
        total_max_weight = np.max([np.max(segment_weights) for segment_weights in merged_weights])
        weight_ratio_min_max = min_weights / total_max_weight

        # diagnostics concerning the peaks that were not matched
        if len(unmatched_peak_weights) == 0:
            max_unmatched_peak_weight = 0
            max_unmatched_peak_frequency = 0
        else:
            max_unmatched_peak_weight = np.max(unmatched_peak_weights)
            max_unmatched_peak_frequency = unmatched_peak_frequencies[
                np.argmax(unmatched_peak_weights)
            ]

        diagnostics_dict = {
            "residual": residual,
            "min_weights": min_weights,
            "mean_weights": mean_weights,
            "weight_ratio_min_max": weight_ratio_min_max,
            "max_unmatched_peak_frequency": max_unmatched_peak_frequency,
            "max_unmatched_peak_weight": max_unmatched_peak_weight,
        }
        if self.verbosity > 0:
            print(diagnostics_dict)
        return diagnostics_dict
