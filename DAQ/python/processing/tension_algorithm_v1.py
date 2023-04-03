import resonance_fitting
from tension_algorithm import TensionAlgorithmBase
import numpy as np
from scipy.signal import savgol_filter, find_peaks
import channel_frequencies
import resonance_fitting
import itertools
from scipy.interpolate import interp1d
from typing import List, Tuple, Optional, Dict, Any, Union
from scipy import signal

BSUB_MIN = 30
SMOOTH_PEAK_HEIGHT_START = 0.3
SMOOTH_PEAK_WIDTH = 0.5
PROM_TO_HEIGHT_FACTOR = 0.1
HEIGHT_TO_LOWEST_SURROUNDING_FACTOR = 5
LOWEST_MAX_SEARCH_RADIUS = 40
LOWEST_MAX_WINDOW = 6
LOOKBACK_FIRST_BUMP_1 = 6.
LOOKBACK_FIRST_BUMP = 4.5
LOOKFORWARD = 4.5
FIRST_BUMP_PROM_FACTOR = 0.3
FIRST_BUMP_PEAK_WIDTH = 0.25
HEIGHT_TO_PREV_HEIGHT_RANGE = 10
HEIGHT_TO_PREV_HEIGHT_FACTOR = 0.1
N_NEAREST_PEAKS = 5
ABOVE_F_USE_UPPER_SUB_SEG = 90
REL_MOVEMENT_FACTOR_MAX = 1.25
ABS_MOVEMENT_FACTOR_MIN = 0.3
ABS_MOVEMENT_FACTOR_MAX = 1.8
NEAR_PEAK_DISTANCE = 4.
NEAR_PEAK_AMPLITUDE = 0.2
COST_F_THRESH = 150.
COST_FIRST_PEAK_FACTOR = 2.

class TensionAlgorithmV1(TensionAlgorithmBase):
    def __init__(self, verbosity):
        super().__init__(verbosity)

    def process_channel(self, layer: int, apa_channel: int, freq_arr: np.ndarray, ampl_arr: np.ndarray, 
                        max_freq: float = 250., verbosity: int = 0, nominal_tension: float = 6.5) -> Tuple[List, List, List, List]:
        """
        Process a given channel to find the optimal placement of resonances and calculate the tension of each segment.
        
        Args:
            layer (int): The layer of the channel.
            apa_channel (int): The channel number.
            freq_arr (np.ndarray): A NumPy array of frequency values.
            ampl_arr (np.ndarray): A NumPy array of amplitude values.
            max_freq (float, optional): The maximum frequency to search for resonances. Defaults to 250.
            verbosity (int, optional): Verbosity level of the output. Defaults to 0.
            nominal_tension (float, optional): The nominal tension value. Defaults to 6.5.
        
        Returns:
            Tuple[List, List, List, List]: A tuple containing the following lists:
                - wire_segments: The list of wire segments corresponding to the channel.
                - selected_moved_res_arr: The list of selected moved resonance arrays.
                - selected_tension: The list of selected tension values.
                - confidences: The list of confidence values for each tension value.
        """
 
        self.print_if_verbose(f"################################################", 1)
        self.print_if_verbose(f"         PROCESSING CHANNEL {apa_channel}       ", 1)
        self.print_if_verbose(f"################################################", 1)

        # Make sure the maximum frequency to search for resonances does not exceed the domain of the trace
        max_freq = np.min(max_freq, np.max(freq_arr))

        # Get the list of wire segments corresponding to this channel and a list of lists containing the expected resonance values for each segment
        wire_segments, expected_resonances = channel_frequencies.get_expected_resonances(layer, apa_channel, max_freq)
        

        # If there are no expected frequencies in the given domain, return
        if expected_resonances == []:
            self.print_if_verbose("ERROR: No expected resonances in the given frequency range", 1)
            return self.get_default_values(wire_segments)
        flat_expected = np.array([sub_res for res_seg in expected_resonances for sub_res in res_seg])

        # Get baseline subtracted trace
        bsub = self.cumsum_and_baseline_subtracted(freq_arr, np.cumsum(ampl_arr))

        # Normalize
        bsub /= np.max(bsub)
        
        # Remove scans with low rms ratio because they are likely all noise
        rms_ratio = self.sliding_window_rms_ratio(freq_arr, ampl_arr, 10)
        if rms_ratio < 4:
            self.print_if_verbose("No expected resonances in the given frequency range", 1)
            return self.get_default_values(wire_segments)

        # Get the derivative/slope of the trace
        bsub_dadf = self.calculate_slope(freq_arr, ampl_arr, 10)
        bsub_dadf /= np.max(bsub_dadf)

        # The ringing resonances appear to be sin-like. So we add the square of the trace to the square of the derivative, which results in peaks where the trace is sin-like due to sin^2 + cos^2 being maximized.
        pythag_smooth = self.process_pythagorean(bsub, bsub_dadf, freq_arr)

        # Find the peaks in the smoothed trace
        peak_freqs, peak_heights, peak_proms = self.find_adaptive_peaks(freq_arr, pythag_smooth, flat_expected, verbosity)
        
        # Find the clean peaks
        peak_freqs, peak_heights = self.clean_peak_data(freq_arr, pythag_smooth, peak_freqs, peak_heights, peak_proms)
        
        # Find the frequencies corresponding to the first bump of each resonance
        fpks_first_bump = self.find_first_bump_peaks(freq_arr, bsub, peak_freqs, verbosity)

        # Gather placements to test by performing a grid search on the nearest resonances to the nominal placements 
        moved_res_arrs, moved_res_arr_movement_factors = self.move_resonances_to_nearest_peaks(expected_resonances, fpks_first_bump)

        # Filter out the unreasonable placements
        pruned_moved_res_arrs, pruned_moved_res_arr_movement_factors = self.prune_resonance_placements(moved_res_arrs, moved_res_arr_movement_factors, freq_arr, fpks_first_bump, pythag_smooth, verbosity)
    
        # Compute the cost of each placement
        pruned_moved_res_arr_costs = self.compute_placement_costs(pruned_moved_res_arrs, fpks_first_bump, peak_heights, freq_arr, verbosity)

        # Select the optimal placement
        selected_moved_res_arr = self.select_optimal_placement(pruned_moved_res_arrs, pruned_moved_res_arr_costs, verbosity)
    
        # Compute the tension of the segment
        selected_tension = self.calculate_selected_tension(selected_moved_res_arr, expected_resonances, nominal_tension)
        
        # Return
        if selected_moved_res_arr == []:
            return self.get_default_values(wire_segments, -1)
        else:
            return wire_segments, selected_moved_res_arr, selected_tension, [0]*len(selected_tension)

    def cumsum_and_baseline_subtracted(self, freq_arr: np.ndarray, ampl_arr: np.ndarray) -> np.ndarray:
        """
        Take the cumulative sum of the amplitude array and subtract the smoothed curve (baseline) using the Savitzky-Golay filter.
        
        Args:
            freq_arr (np.ndarray): A NumPy array of frequency values.
            ampl_arr (np.ndarray): A NumPy array of amplitude values.
        
        Returns:
            np.ndarray: A NumPy array of baseline-subtracted amplitude values.
        """
        # Calculate the number of bins for the Savitzky-Golay filter
        num_bins = self.get_num_savgol_bins(freq_arr)

        # Apply the Savitzky-Golay filter to smooth the amplitude array
        smooth_curve = signal.savgol_filter(np.cumsum(ampl_arr), num_bins, 3)

        # Subtract the smoothed curve (baseline) from the original amplitude array
        return ampl_arr - smooth_curve

    def get_num_savgol_bins(freq: List[float]) -> int:
        """
        Calculate the number of bins for the Savitzky-Golay filter based on the frequency array.
        
        Args:
            freq (List[float]): A list of frequency values.
        
        Returns:
            int: The number of bins for the Savitzky-Golay filter.
        """
        # Calculate the step size between consecutive frequency values
        step_size = freq[1] - freq[0]

        # Calculate the number of bins based on the step size
        num_bins = int(round(27 / (8 * step_size)))

        # Ensure the number of bins is odd, as required by the Savitzky-Golay filter
        if (num_bins % 2) == 0:
            num_bins += 1

        return num_bins

    def move_to_nth_nearest(res_seg: List[float], n: int, fpks: List[float], min_or_max: str = 'max') -> Tuple[Optional[List[float]], Optional[float]]:
        """
        Move the resonance segment to the nth nearest peak frequency in the given list of peak frequencies.
        
        Args:
            res_seg (List[float]): A list of resonance frequencies for a wire segment.
            n (int): The index of the nearest peak frequency to move the resonance segment to.
            fpks (List[float]): A list of peak frequencies.
            min_or_max (str, optional): The criterion for choosing the frequency in the resonance segment, either 'max', 'min', or something else. Defaults to 'max'.
        
        Returns:
            Tuple[Optional[List[float]], Optional[float]]: The shifted resonance segment and the movement factor, or (None, None) if an invalid min_or_max value is provided or n is out of range.
        """
        # Find the maximum or minimum frequency in the resonance segment
        if min_or_max == 'max':
            f_in_seg = np.max(res_seg)
        elif min_or_max == 'min':
            f_in_seg = np.min(res_seg)
        else:
            return None, None

        # Calculate the absolute differences between the frequency in the segment and the peak frequencies
        diffs = list(np.abs(f_in_seg - fpks))

        # Find the indices of the nearest peak frequencies in ascending order
        nearest_indices = [diffs.index(x) for x in sorted(diffs)]

        # Check if the nth nearest index is within the range of nearest_indices
        if n >= len(nearest_indices):
            return None, None

        # Get the nth nearest peak frequency and its index
        nth_index = nearest_indices[n]
        nth_fpk = fpks[nth_index]

        # Shift the resonance segment to the nth nearest peak frequency
        shifted_res_seg = resonance_fitting.shift_res_seg_to_f0(res_seg, f_in_seg, nth_fpk)

        return shifted_res_seg, nth_fpk / f_in_seg

    def slope_near_bin(self, freq_arr: List[float], ampl_arr: List[float], i: int, window: int) -> float:
        """
        Calculate the slope of the amplitude values near a specified bin index within a frequency array.
        
        Args:
            freq_arr (List[float]): A list of frequency values.
            ampl_arr (List[float]): A list of amplitude values corresponding to the frequency values.
            i (int): The index of the target bin in the frequency array.
            window (int): The window size around the target bin to calculate the slope.
        
        Returns:
            float: The slope of the amplitude values near the specified bin index.
        """
        # Calculate the frequency step size
        df = freq_arr[1] - freq_arr[0]

        # Define the start and end bin indices for the specified window size
        startBin = i - int((window - 1) / 2)
        endBin = i + int((window - 1) / 2)

        # Adjust the start and end bin indices if they are outside the range of the frequency array
        if startBin < 0:
            endBin = endBin - startBin
            startBin = 0

        length = len(freq_arr)
        if endBin > length - 1:
            endBin = length - 1
            startBin = startBin - (endBin - (length - 1))

        # Calculate the slope using the amplitude values at the start and end bin indices
        return (ampl_arr[endBin] - ampl_arr[startBin]) / df

    def calculate_slope(self, frequencies: np.ndarray, bsub: np.ndarray, index_range: int) -> np.ndarray:
        """
        Calculate the derivative/slope of the baseline-subtracted trace.

        Parameters
        ----------
        frequencies : np.ndarray
            Array of frequencies.
        bsub : np.ndarray
            Baseline-subtracted trace.
        index_range : int
            Range for calculating the slope.

        Returns
        -------
        np.ndarray
            Array containing the calculated slopes.
        """
        # Calculate the slope of the trace for each frequency point in the input array
        bsub_dadf = np.array([self.slope_near_bin(frequencies, bsub, i, index_range) for i in range(len(frequencies))])

        return bsub_dadf

    def process_pythagorean(self, bsub: np.ndarray, bsub_dadf: np.ndarray, freq_arr: np.ndarray) -> np.ndarray:
        """
        Process the Pythagorean sum of the square of the baseline-subtracted trace and its derivative.

        Parameters
        ----------
        bsub : np.ndarray
            Baseline-subtracted trace.
        bsub_dadf : np.ndarray
            Derivative/slope of the baseline-subtracted trace.
        f : np.ndarray
            Array of frequencies.

        Returns
        -------
        np.ndarray
            Smoothed and normalized processed trace.
        """
        # Calculate the Pythagorean sum of the square of the baseline-subtracted trace and its derivative
        pythag = bsub**2 + bsub_dadf**2

        # Smooth out the processed trace using a Savitzky-Golay filter
        pythag_smooth = savgol_filter(pythag, resonance_fitting.get_num_savgol_bins(freq_arr), 3)

        # Normalize the processed trace
        pythag_smooth /= np.max(pythag_smooth)

        return pythag_smooth

    def find_adaptive_peaks(self, freq_arr: np.ndarray, pythag_smooth: np.ndarray, flat_expected: np.ndarray, verbosity: int = 0) -> Tuple[np.ndarray, np.ndarray]:
        """
        Find peaks in a smoothed spectrum adaptively, based on a given height threshold and width.

        Parameters
        ----------
        freq_arr : np.ndarray
            Frequency array of the spectrum.
        pythag_smooth : np.ndarray
            Smoothed power spectrum.
        flat_expected : np.ndarray
            Array of expected peak frequencies.
        verbosity : int, optional
            Verbosity level, by default 0.

        Returns
        -------
        Tuple[np.ndarray, np.ndarray]
            Tuple containing the array of found peak frequencies and the array of peak heights.
        """

        # Calculate step size from the frequency array
        stepSize = freq_arr[1] - freq_arr[0]
        
        # Initialize peak height threshold
        peak_height_thresh = SMOOTH_PEAK_HEIGHT_START        

        # Find peaks using initial threshold and width
        pks, props = find_peaks(pythag_smooth, height=peak_height_thresh, width=int(SMOOTH_PEAK_WIDTH/stepSize))  
        
        # Adaptively adjust threshold until at least twice the number of unique expected peaks are found or threshold becomes too small
        while len(pks) < 2 * len(np.unique(flat_expected)) and peak_height_thresh > 0.001:
            peak_height_thresh = 0.75 * peak_height_thresh
            
            self.print_if_verbose(f"Only found {len(pks)} peaks with a threshold of {round(peak_height_thresh, 5)}. Reducing threshold.", 1)    
            
            pks, props = find_peaks(pythag_smooth, height=peak_height_thresh, width=int(SMOOTH_PEAK_WIDTH/stepSize))  

        # Round peak frequencies to 2 decimal places
        peak_freqs = np.array([round(freq_arr[pk], 2) for pk in pks])

        # Extract peak heights from properties
        peak_heights = props['peak_heights']
        peak_proms = props['peak_prominences']

        return peak_freqs, peak_heights, peak_proms

    def lowest_max_in_surrounding(self, freq_arr: List[float], ampl_arr: List[float], start: float, stop: float, step: int, width: float) -> float:
        """
        Find the lowest maximum amplitude in the specified frequency range, with a given step and width.
        
        Args:
            freq_arr (List[float]): A list of frequency values.
            ampl_arr (List[float]): A list of amplitude values corresponding to the frequency values.
            start (float): The starting frequency of the search range.
            stop (float): The ending frequency of the search range.
            step (int): The step size for the search.
            width (float): The width of the frequency window to search within.
        
        Returns:
            float: The lowest maximum amplitude found within the specified frequency range.
        """
        # Initialize the lowest maximum amplitude to the global maximum of the amplitude array
        lowest_max = np.max(ampl_arr)

        # Adjust the start and stop frequencies if they are outside the range of the frequency array
        if start < np.min(freq_arr):
            start = np.min(freq_arr)
        if stop > np.max(freq_arr):
            stop = np.max(freq_arr)

        # Iterate through the frequency range with the specified step size
        for fi in range(int(start), int(stop - width), step):
            # Select the amplitude values within the current frequency window
            selected = (freq_arr > fi) & (freq_arr < fi + width)
            selected_a = ampl_arr[selected]

            # Find the maximum amplitude within the selected range
            max_a = np.max(selected_a)

            # Update the lowest maximum amplitude if the current maximum amplitude is lower
            if max_a < lowest_max:
                lowest_max = max_a

        return lowest_max

    def clean_peak_data(self, freq_arr: np.ndarray, pythag_smooth: np.ndarray, peak_freqs: np.ndarray, peak_heights: np.ndarray, peak_proms: np.ndarray, verbosity: int = 0) -> Tuple[np.ndarray, np.ndarray]:
        """
        Clean the peak data by filtering out peaks based on various criteria.

        Parameters
        ----------
        freq_arr : np.ndarray
            Frequency array of the spectrum.
        pythag_smooth : np.ndarray
            Smoothed power spectrum.
        peak_freqs : np.ndarray
            Array of found peak frequencies.
        peak_heights : np.ndarray
            Array of peak heights.
        peak_proms : np.ndarray
            Array of peak prominences.
        verbosity : int, optional
            Verbosity level, by default 0.

        Returns
        -------
        Tuple[np.ndarray, np.ndarray]
            Tuple containing the cleaned array of found peak frequencies and the cleaned array of peak heights.
        """

        clean_fpks = []
        clean_heights = []

        if verbosity > 1:
            print("Peaks in smoothed trace found at ", peak_freqs)

        for i, fpk in enumerate(peak_freqs):
            lm = self.lowest_max_in_surrounding(freq_arr, pythag_smooth, fpk - LOWEST_MAX_SEARCH_RADIUS, fpk + LOWEST_MAX_SEARCH_RADIUS, 1, LOWEST_MAX_WINDOW)
            
            # Filter out peaks with height less than a factor of the lowest maximum in the surrounding region
            if peak_heights[i] < HEIGHT_TO_LOWEST_SURROUNDING_FACTOR * lm: 
                if verbosity > 1:
                    print(f"Peak at {fpk}, {peak_heights[i]} small relative to surroundings {lm}")
                continue
            
            # Filter out peaks with prominence less than a factor of their height
            if peak_proms[i] < PROM_TO_HEIGHT_FACTOR * peak_heights[i]:
                if verbosity > 1:
                    print(f"Peak at {fpk} has prominence less than a certain factor of its height") 
                continue
            
            # Filter out peaks right after a much bigger peak
            if i > 0 and fpk - peak_freqs[i - 1] < HEIGHT_TO_PREV_HEIGHT_RANGE and peak_heights[i] < HEIGHT_TO_PREV_HEIGHT_FACTOR * peak_heights[i - 1]: 
                if verbosity > 1:
                    print(f"Peak at {fpk} is right after a much bigger peak")
                continue

            clean_fpks.append(fpk)
            clean_heights.append(peak_heights[i])

        peak_freqs = np.array(clean_fpks)
        peak_heights = np.array(clean_heights)

        if verbosity > 1:
            print("Peaks in smoothed trace (after processing) found at ", peak_freqs)
        
        return peak_freqs, peak_heights
        
    def find_first_bump_peaks(self, freq_arr: np.ndarray, bsub: np.ndarray, peak_freqs: np.ndarray, verbosity: int = 0) -> np.ndarray:
        """
        Find peaks corresponding to the first bump of each resonance in the frequency array.

        Parameters
        ----------
        freq_arr : np.ndarray
            Frequency array of the spectrum.
        bsub : np.ndarray
            Baseline-subtracted power spectrum.
        peak_freqs : np.ndarray
            Array of found peak frequencies.
        verbosity : int, optional
            Verbosity level, by default 0.

        Returns
        -------
        np.ndarray
            Array of found first bump peak frequencies.
        """

        fpks_first_bump = []

        for pknum, fpk in enumerate(peak_freqs):
            if pknum == 0:
                lookback = LOOKBACK_FIRST_BUMP_1
            else: 
                lookback = min((fpk - peak_freqs[pknum-1])/2, LOOKBACK_FIRST_BUMP)
            
            selected = (freq_arr > fpk - lookback) & (freq_arr < fpk + LOOKFORWARD)
            selected_f = freq_arr[selected]
            selected_a = bsub[selected]
            step_size = freq_arr[1] - freq_arr[0]
            
            if len(selected_a) == 0:
                continue

            pks, props = find_peaks(selected_a, prominence=FIRST_BUMP_PROM_FACTOR*np.max(np.abs(selected_a)), width=FIRST_BUMP_PEAK_WIDTH/step_size)
            fpks1 = [round(selected_f[pk],2) for pk in pks]
            amps1 = [selected_a[pk] for pk in pks]
            pks_neg, props = find_peaks(-selected_a, prominence=FIRST_BUMP_PROM_FACTOR*np.max(np.abs(selected_a)), width=FIRST_BUMP_PEAK_WIDTH/step_size)
            fpks1 += [round(selected_f[pk],2) for pk in pks_neg]
            amps1 += [selected_a[pk] for pk in pks_neg]

            if len(fpks1):
                if verbosity > 1:
                    print(f"For resonance around {fpk}, local peaks found at {fpks1}. Setting resonance-start at {fpks1[np.argmin(fpks1)]}")
                index_first_bump = np.argmin(fpks1)
                fpks_first_bump.append(fpks1[index_first_bump])

        fpks_first_bump = np.array(fpks_first_bump)

        return fpks_first_bump

    def move_resonances_to_nearest_peaks(self, expected_resonances: List[np.ndarray], fpks_first_bump: np.ndarray) -> Tuple[List[List[np.ndarray]], List[List[float]]]:
        """
        Move each resonance segment in the expected_resonances to the nearest n_nearest peaks.

        Parameters
        ----------
        expected_resonances : List[np.ndarray]
            List of expected resonance segments.
        fpks_first_bump : np.ndarray
            Array of found first bump peak frequencies.
        move_to_nth_nearest : callable
            Function to move a resonance segment to the n-th nearest peak.

        Returns
        -------
        Tuple[List[List[np.ndarray]], List[List[float]]]
            Tuple containing the list of moved resonance segments and their corresponding movement factors.
        """

        moved_res_segs_collection = []
        movement_factors_collection = []

        for res_seg in expected_resonances:
            moved_res_segs = []
            movement_factors = []

            for i in range(N_NEAREST_PEAKS):
                if np.max(res_seg) < ABOVE_F_USE_UPPER_SUB_SEG:
                    moved_res_seg, movement_factor = self.move_to_nth_nearest(res_seg, i, fpks_first_bump, 'min')
                else:
                    moved_res_seg, movement_factor = self.move_to_nth_nearest(res_seg, i, fpks_first_bump, 'max')
                
                if moved_res_seg is None:
                    continue
                
                moved_res_segs.append(moved_res_seg)
                movement_factors.append(movement_factor)

            moved_res_segs_collection.append(moved_res_segs)
            movement_factors_collection.append(movement_factors)

        moved_res_arrs = [list(x) for x in itertools.product(*moved_res_segs_collection)]
        moved_res_arr_movement_factors = [list(x) for x in itertools.product(*movement_factors_collection)]

        return moved_res_arrs, moved_res_arr_movement_factors

    def prune_resonance_placements(self, moved_res_arrs: List[List[np.ndarray]], moved_res_arr_movement_factors: List[List[float]], freq_arr: np.ndarray, fpks_first_bump: np.ndarray, pythag_smooth: np.ndarray, verbosity: int = 1) -> Tuple[List[List[np.ndarray]], List[List[float]]]:
        """
        Prune the list of moved resonance placements based on their movement factors and proximity to peaks.

        Parameters
        ----------
        moved_res_arrs : List[List[np.ndarray]]
            List of moved resonance arrays.
        moved_res_arr_movement_factors : List[List[float]]
            List of movement factors corresponding to the moved resonance arrays.
        freq_arr : np.ndarray
            Array of frequency values.
        fpks_first_bump : np.ndarray
            Array of found first bump peak frequencies.
        pythag_smooth : np.ndarray
            Array of smoothed Pythagorean values.
        verbosity : int, optional
            Verbosity level, by default 1.

        Returns
        -------
        Tuple[List[List[np.ndarray]], List[List[float]]]
            Tuple containing the pruned list of moved resonance arrays and their corresponding movement factors.
        """

        pruned_moved_res_arrs = []
        pruned_moved_res_arr_movement_factors = []

        if verbosity > 1:
            print("Analyzing placements:")
        if verbosity > 1 and len(moved_res_arr_movement_factors) == 0:
            print("    No placements found")

        for i, moved_res_arr_movement_factor in enumerate(moved_res_arr_movement_factors):
            moved_res_arr = moved_res_arrs[i]

            if verbosity > 1:
                print("    Checking", moved_res_arr)

            within_movement_factor = True
            # Check if tensions are too diverse
            if np.max(moved_res_arr_movement_factor) > REL_MOVEMENT_FACTOR_MAX * np.min(moved_res_arr_movement_factor):
                if verbosity > 1:
                    print("        Tensions are too diverse", [str(round(x * 100, 2)) + '%' for x in moved_res_arr_movement_factor])

                # Drop the short segment if tensions are too diverse
                for j, res_seg in enumerate(moved_res_arr):
                    if len(res_seg) == 1:
                        moved_res_arr[j] = []
                        moved_res_arr_movement_factor[j] = np.nan
                        if verbosity > 1:
                            print("        Dropping the short segment")

                if np.nanmax(moved_res_arr_movement_factor) > REL_MOVEMENT_FACTOR_MAX * np.nanmin(moved_res_arr_movement_factor):
                    within_movement_factor = False
                    if verbosity > 1:
                        print("        Tensions still too diverse", [str(round(x * 100, 2)) + '%' for x in moved_res_arr_movement_factor])

            # Check if the absolute movement factor is out of range
            if np.nanmax(moved_res_arr_movement_factor) > ABS_MOVEMENT_FACTOR_MAX or np.nanmin(moved_res_arr_movement_factor) < ABS_MOVEMENT_FACTOR_MIN:
                if verbosity > 1:
                    print("        Absolute movement factor out of range", [str(round(x * 100, 2)) + '%' for x in moved_res_arr_movement_factor])
                within_movement_factor = False

            if within_movement_factor == False:
                continue

            flat_res = np.array([sub_seg for res_seg in moved_res_arrs[i] for sub_seg in res_seg])
            res_not_near_peak = []

            for sub_seg in flat_res:
                if np.max(np.min(np.abs(sub_seg - fpks_first_bump))) > NEAR_PEAK_DISTANCE:
                    if sub_seg < np.min(freq_arr) or sub_seg > np.max(freq_arr):
                        res_not_near_peak.append(sub_seg)
                        if verbosity > 1:
                            print(f"        This placement puts the resonance at {sub_seg} outside the scanned range ({np.min(freq_arr)}, {np.max(freq_arr)})")
                        continue

                    t_smooth_interp = interp1d(freq_arr, pythag_smooth)
                    if t_smooth_interp(sub_seg) < NEAR_PEAK_AMPLITUDE:
                        res_not_near_peak.append(sub_seg)
                        if verbosity > 1:
                            print(f"        This placement puts the resonance at {sub_seg} more than {NEAR_PEAK_DISTANCE} from a peak and not in a high amplitude region ({t_smooth_interp(sub_seg)}).")

            if res_not_near_peak:
                continue

            pruned_moved_res_arrs.append(moved_res_arrs[i])
            pruned_moved_res_arr_movement_factors.append(moved_res_arr_movement_factors[i])

        return pruned_moved_res_arrs, pruned_moved_res_arr_movement_factors


    def compute_placement_costs(self, pruned_moved_res_arrs: List[List[float]], fpks_first_bump: np.ndarray, peak_heights: np.ndarray, freq_arr: np.ndarray, verbosity: int) -> List[float]:
        """
        Compute the cost of each pruned moved resonance array.
        Args:
        pruned_moved_res_arrs: List of pruned moved resonance arrays.
        fpks_first_bump: Array of the first bumps in the frequency peaks.
        peak_heights: Array of the heights of the peaks.
        freq_arr: Array of frequencies.
        verbosity: Level of verbosity for print statements.

        Returns:
        List of costs for each pruned moved resonance array.
        """
        if verbosity > 1:
            print("The following placements look valid, now checking which one is optimal")

        pruned_moved_res_arr_costs = []

        for moved_res_arr in pruned_moved_res_arrs:
            cost = 0
            flat_res = []

            for res_seg in moved_res_arr:
                for sub_seg in res_seg:
                    if sub_seg is not np.nan:
                        flat_res.append(sub_seg)

            for i, fpk in enumerate(fpks_first_bump):
                diffs = np.abs((fpk - flat_res))
                index_for_cost = np.argmin(diffs)
                fpk_cost = diffs[index_for_cost] * peak_heights[i] * (
                    (np.max(freq_arr) - fpk) / (np.max(freq_arr) - np.min(freq_arr))
                )
                if i == 0:
                    fpk_cost *= COST_FIRST_PEAK_FACTOR
                cost += fpk_cost

            cost = round(cost, 2)
            pruned_moved_res_arr_costs.append(cost)

        return pruned_moved_res_arr_costs

    def select_optimal_placement(self, pruned_moved_res_arrs: List[List[float]], pruned_moved_res_arr_costs: List[float], verbosity: int) -> List[float]:
        """
        Select the optimal placement of resonances based on the computed costs.
        Args:
        pruned_moved_res_arrs: List of pruned moved resonance arrays.
        pruned_moved_res_arr_costs: List of costs for each pruned moved resonance array.
        verbosity: Level of verbosity for print statements.

        Returns:
        The optimal placement of resonances as a list of floats.
        """
        selected_moved_res_arr = []

        if len(pruned_moved_res_arr_costs):
            selected_moved_res_arr_index = np.argmin(pruned_moved_res_arr_costs)
            selected_moved_res_arr = pruned_moved_res_arrs[selected_moved_res_arr_index]

        if verbosity > 1:
            print("Selected placement", selected_moved_res_arr)

        return selected_moved_res_arr

    def calculate_selected_tension(self, selected_moved_res_arr: List[Union[float, List[float]]], expected_resonances: List[List[float]], nominal_tension: float) -> List[Union[float, List[float]]]:
        """
        Calculate the selected tension based on the optimal placement of resonances.
        Args:
        selected_moved_res_arr: The optimal placement of resonances as a list of floats or empty lists.
        expected_resonances: List of expected resonances.
        nominal_tension: Nominal tension value.

        Returns:
        The selected tension as a list of floats or empty lists.
        """
        selected_tension = []

        if selected_moved_res_arr:
            for i in range(len(expected_resonances)):
                if selected_moved_res_arr[i] == []:
                    selected_tension.append([])
                else:
                    selected_tension.append(nominal_tension * (np.max(selected_moved_res_arr[i]) / np.max(expected_resonances[i])) ** 2)

        return selected_tension