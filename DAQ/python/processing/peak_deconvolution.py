"""
This module defines functions to find resonances in DWA scans.

The basic principle of the analysis is to first transform the input signal using 
a continuous wavelet transform (CWT) with a Morlet wavelet. A resonance is modeled
as a Gaussian peak in the mean of the CWT coefficients. For a given set of 
tension values, we first calculate the frequencies at which the resonances occur
and hypothesize a Gaussian peak at each of these frequencies. We then fit the 
amplitudes of the peaks to the avearge CWT coefficients at the corresponding
frequencies using a Non-negative Least Squares (NNLS) algorithm. The NNLS residual
is then used to calculate the goodness of fit of the model to the data. We find 
the best fitting tensions by minimizing the sum of the residuals using scipy.minimize
with the method 'Nelder-Mead' or Differential Evolution (DE).

Alternatively to scipy.minimize, we can also use `dynesty` to find the posterior
distribution over the tension values. This allows us to find all plausible tension
values and their corresponding posterior probabilities and calculate meaningful 
uncertainties.
"""

import os
import numpy as np
from scipy.optimize import minimize, differential_evolution
from scipy import signal
from scipy.optimize import nnls


import sys

sys.path.append("../mappings")
from channel_frequencies import get_frequency_expectation

GAUSS_SCALE = 15.5
GAUSS_OFFSET = 3.5
"""The scale and offset of the Gaussian kernel used to model the resonances.

Marginalized fits on a number of spectra revealed that these values are a good
approximation of the shape of the resonances in the DWA scans and there is no
need to re-fit them for every spectrum.
"""


def preprocess_signal(freq, amps):
    """Preprocess the input signal by applying a butter filter."""
    y = amps
    # apply band-pass filter to get rid of slow trends as well as high-frequency noise
    b, a = signal.butter(2, [0.1, 0.2], "bandpass", analog=False)
    y = signal.filtfilt(b, a, y)
    return y


def deconvolve_resonances(input, scale, gauss_locations):
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
    weights, residual = nnls(A, input)
    return weights, residual


def reconvolve_resonances(input, weights, gauss_locations, scale):
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


def get_tension_adjusted_frequencies(tensions, frequencies):
    # The default tension is 6.5 N. To rescale a segment, we apply the function
    # f2 = f1*(T2/T1)^0.5
    # where f1 is the frequency for the default tension, f2 is the frequency for
    # the new tension, T1 is the default tension, and T2 is the new tension.
    new_frequencies = []
    for tension, segment_frequencies in zip(tensions, frequencies):
        new_frequencies.append(np.array(segment_frequencies) * (tension / 6.5) ** 0.5)
    return new_frequencies


def transform_cwt_amplitude(amplitudes, widths=(8, 16)):
    """Get the CWT amplitude for a given signal.

    Transforms the input amplitudes using a CWT with a Morlet wavelet and
    returns the mean of the absolute values of the coefficients.
    """
    # Even though this is only two lines, we want to define it as a function
    # so that we can easily change the CWT parameters globally.
    cwtmatr = signal.cwt(amplitudes, signal.morlet2, widths=np.arange(*widths))
    return np.mean(np.abs(cwtmatr), axis=0)


def reconvolve_with_tension_adjustment(
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
    adjusted_frequencies = get_tension_adjusted_frequencies(tensions, default_frequencies)
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
    reconvolved_amplitude = reconvolve_resonances(x, weights, gauss_locations, gauss_scale)
    return x, reconvolved_amplitude


def deconvolve_with_tension_adjustment(
    x, corr_amplitude, default_frequencies, tensions, gauss_scale=20, a=1, b=0, downsample=1
):
    adjusted_frequencies = get_tension_adjusted_frequencies(tensions, default_frequencies)
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
    weights, residual = deconvolve_resonances(corr_amplitude, gauss_scale, gauss_locations)
    # undo the downsampling for gauss locations
    gauss_locations = gauss_locations * downsample
    return weights, residual, gauss_locations


def tension_fit_residual(
    tensions,
    x,
    corr_amplitude,
    default_frequencies,
    gauss_scale=GAUSS_SCALE,
    a=1,
    b=GAUSS_OFFSET,
    downsample=2,
    prior_width=None,
):
    if np.any(tensions < 0):
        raise ValueError("Tensions must be positive")
    weights, residual, gauss_locations = deconvolve_with_tension_adjustment(
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
        residual += np.sum((tensions - 6.5) ** 2 / (2 * prior_width**2))
    return residual


def unflatten_weights(frequency_list, flat_weights):
    """Unflatten the weights from a deconvolution into a list of arrays."""
    weights = []
    for frequencies in frequency_list:
        weights.append(flat_weights[: len(frequencies)])
        flat_weights = flat_weights[len(frequencies) :]
    return weights


def get_fit_diagnostics(tensions, x, corr_amplitude, default_frequencies, downsample=2):
    weights, residual, gauss_locations = deconvolve_with_tension_adjustment(
        x,
        corr_amplitude,
        default_frequencies,
        tensions,
        gauss_scale=GAUSS_SCALE,
        a=1,
        b=GAUSS_OFFSET,
        downsample=downsample,
    )
    # We want to use the weights to diagnose bad fits. In particular, we want to
    # find instances where a frequency is not matched by a resonance, which would
    # be indicated by a very small weight.
    # However, sometimes the weight is zero because two frequencies are very close
    # together. To disentangle this, we run the deconvolution for each segment
    # separately, and then combine the weights.
    separated_weights = []
    for tension, frequencies in zip(tensions, default_frequencies):
        weights, *_ = deconvolve_with_tension_adjustment(
            x,
            corr_amplitude,
            [frequencies],
            [tension],
            gauss_scale=GAUSS_SCALE,
            a=1,
            b=GAUSS_OFFSET,
            downsample=downsample,
        )
        separated_weights.append(weights)

    merged_weights = []
    best_fit_frequencies = get_tension_adjusted_frequencies(tensions, default_frequencies)
    for tension, segment_weights, segment_freq in zip(tensions, separated_weights, best_fit_frequencies):
        # Sometimes two frequencies within a segment are very close to each other,
        # which causes the weight of one of them to go to zero. In these cases
        # we want to sum the weights of the two frequencies.
        resonance_weights = []
        freq_diffs = np.diff(segment_freq)
        for i in range(len(segment_freq)):
            if i == 0:
                resonance_weights.append(segment_weights[i])
            else:
                if freq_diffs[i - 1] < 2.0:
                    resonance_weights[-1] += segment_weights[i]
                else:
                    resonance_weights.append(segment_weights[i])
        merged_weights.append(resonance_weights)

    best_fit_frequencies = get_tension_adjusted_frequencies(tensions, default_frequencies)
    unflattened_weights = unflatten_weights(best_fit_frequencies, weights)
    reduced_residual = residual / len(x) * downsample
    diagnostics_dict = {
        "residual": residual,
        "reduced_residual": reduced_residual,
        "fit_weights": unflattened_weights,
        "separated_weights": separated_weights,
        "merged_weights": merged_weights,
        "best_fit_frequencies": best_fit_frequencies,
    }
    return diagnostics_dict

def get_confidences(diagnostics_dict):
    merged_weights = diagnostics_dict["merged_weights"]
    min_weight = [np.min(weights) for weights in merged_weights]

    # Most indicative of a bad fit is a small min_weight. Below 5 is bad.
    # We can run a sigmoid function centered at 5 to get a confidence.

    confidence = 1 / (1 + np.exp(5 - np.array(min_weight)))
    return confidence


def resonance_fit_scipy(
    frequencies,
    amplitudes,
    apa_channel,
    layer,
    use_de=False,
    downsample=2,
    prior_width=1.0,
    gauss_scale=GAUSS_SCALE,
    gauss_offset=GAUSS_OFFSET,
    ignore_first=10,
    **kwargs,
):
    # We can keep the widths of the wavelets fixed since the step size is always the same.
    corr_amplitude = transform_cwt_amplitude(amplitudes)

    segments, default_frequencies = get_frequency_expectation(apa_channel, layer)
    x = frequencies
    # There is often a spurious resonance at the beginning of the spectrum. We cut the first
    # <ignore_first> Hz off of the spectrum to avoid this.
    valid_mask = (x - np.min(x)) > ignore_first
    x = x[valid_mask]
    corr_amplitude = corr_amplitude[valid_mask]

    bounds = [(3.5, 8)] * len(segments)
    initial_guess = [6.5] * len(segments)

    args = (x, corr_amplitude, default_frequencies)
    # add additional arguments to the function
    # Gauss scale, a, b, downsample, prior_width
    args += (gauss_scale, 1, gauss_offset, downsample, prior_width)

    # minimize residual
    if use_de:
        if "popsize" in kwargs:
            popsize = kwargs.pop("popsize")
        else:
            popsize = 50
        res = differential_evolution(
            tension_fit_residual, bounds, args=args, popsize=popsize, **kwargs
        )
    else:
        if "method" in kwargs:
            method = kwargs.pop("method")
        else:
            method = "Nelder-Mead"
        res = minimize(
            tension_fit_residual, initial_guess, args=args, bounds=bounds, method=method, **kwargs
        )

    best_tensions = res.x
    diagnostics_dict = get_fit_diagnostics(
        best_tensions, x, corr_amplitude, default_frequencies, downsample=downsample
    )
    fpks = get_tension_adjusted_frequencies(best_tensions, default_frequencies)
    best_tension_confidences = get_confidences(diagnostics_dict)
    # it is unclear at the moment why fpks is returned twice
    return segments, fpks, best_tensions, best_tension_confidences, fpks


