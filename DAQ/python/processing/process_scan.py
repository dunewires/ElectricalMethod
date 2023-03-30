# FIXME: when combining/splitting paths, use os.path tools (like join, basename, etc.)
# instead of string contatenation or splits... this protects against "\" vs "/" (among other things)
import numpy as np
import json
import sys
from scipy.signal import savgol_filter, find_peaks
sys.path.append("../mappings")
sys.path.append("../Continuity")
import capacitanceFile
import channel_frequencies
import resonance_fitting
import os
import subprocess
import itertools
from scipy.interpolate import interp1d
from typing import List, Tuple, Optional, Dict, Any, Union
import pickle

class ResonanceFinderFailed(Exception):
    """Exception raised when a the resonance finder fails."""
    pass

def combine_results_dict(d1, d2):
    """Combine two results dictionaries"""
    result_dict = d1.copy()

    for stage, stageData in d2.items():
        if stage not in result_dict:
            result_dict[stage] = {}
        for layer, layerData in stageData.items():
            if layer not in result_dict[stage]:
                result_dict[stage][layer] = {}
            for side, sideData in layerData.items():
                if side not in result_dict[stage][layer]:
                    result_dict[stage][layer][side] = {}
                for segment, segmentData in sideData.items():
                    if segment not in result_dict[stage][layer][side]:
                        result_dict[stage][layer][side][segment] = {
                            "tension": {},
                            "continuity": {}
                        }
                    result_dict[stage][layer][side][segment]["tension"].update(d2[stage][layer][side][segment]["tension"])
                    result_dict[stage][layer][side][segment]["continuity"].update(d2[stage][layer][side][segment]["continuity"])

    return result_dict

def get_sorted_scan_dirs(base_dir: str, uuids: List[str]) -> List[str]:
    """
    Returns a sorted list of all scan directories corresponding to the given UUIDs.

    Args:
        base_dir (str): The base directory containing the APA_* directories.
        uuids (List[str]): A list of UUIDs.

    Returns:
        List[str]: A sorted list of scan directories corresponding to the given UUIDs.
    """
    scan_dirs = []
    for uuid in uuids:
        uuid_dirs = os.listdir(os.path.join(base_dir, "APA_" + uuid))
        scan_dirs += uuid_dirs
    
    return sorted(scan_dirs)

def get_processed_results(base_dir: str, uuids: List[str]) -> Dict[str, any]:
    """
    Combines processed results from multiple JSON files into a single dictionary.

    Args:
        base_dir (str): The base directory containing the UUID JSON files.
        uuids (List[str]): A list of UUIDs.

    Returns:
        Dict[str, any]: A dictionary containing the combined processed results.
    """
    processed = {}
    for uuid in uuids:
        with open(os.path.join(base_dir, uuid + ".json")) as f:
            processed = combine_results_dict(processed, json.load(f))
    return processed

def get_channel_peak_data(freq: np.ndarray, bsub: np.ndarray, num_peaks: int) -> Tuple[List[float], List[float]]:
    """
    Finds the frequencies and heights of the highest peaks in a given spectrum.

    Args:
        freq (np.ndarray): An array of frequencies.
        bsub (np.ndarray): An array of baseline-subtracted power values.
        num_peaks (int): The number of peaks to return.

    Returns:
        Tuple[List[float], List[float]]: A tuple containing two lists: the frequencies of the highest peaks, and their corresponding heights.
    """
    pks = []
    peak_height_thresh = max(bsub) * 0.75
    while len(pks) < num_peaks:
        peak_height_thresh *= 0.75
        pks, props = find_peaks(bsub, height=peak_height_thresh, width=int(0.5 / (freq[1] - freq[0])))
    fpks = freq[pks]
    heights = props['peak_heights']
    fpks_sorted = sorted(fpks, key=lambda x: heights[fpks.tolist().index(x)], reverse=True)
    heights_sorted = sorted(heights, reverse=True)
    return fpks_sorted[:num_peaks], heights_sorted[:num_peaks]

def predict_tension(row_pos: np.ndarray, row_neg: np.ndarray, model_pos: Optional[any], model_neg: Optional[any]) -> Tuple[float, float]:
    """
    Predicts the tension of a row based on models trained on positive and negative data.

    Args:
        row_pos (np.ndarray): An array of features for the positive row.
        row_neg (np.ndarray): An array of features for the negative row.
        model_pos (Optional[any]): A trained model for positive rows.
        model_neg (Optional[any]): A trained model for negative rows.

    Returns:
        Tuple[float, float]: A tuple containing the predicted tension mean and error.
    """
    pred_tension_pos = model_pos.predict([row_pos])[0] if model_pos else -1
    pred_tension_neg = model_neg.predict([row_neg])[0] if model_neg else -1
    pred_tension_mean = np.mean([pred_tension_pos, pred_tension_neg])
    pred_tension_err = np.abs(pred_tension_mean - pred_tension_neg)
    return pred_tension_mean, pred_tension_err

def baseline_subtracted(freq: np.ndarray, ampl: np.ndarray) -> np.ndarray:
    """
    Subtracts the baseline from the data using a savgol filter.

    Args:
        freq (np.ndarray): An array of frequency values.
        ampl (np.ndarray): An array of amplitude values.

    Returns:
        np.ndarray: An array of baseline-subtracted amplitude values.
    """
    num_bins = _get_num_savgol_bins(freq)
    smooth_curve = savgol_filter(ampl, num_bins, 3)
    return ampl - smooth_curve


def _get_num_savgol_bins(freq: np.ndarray) -> int:
    """
    Determines the appropriate number of bins to use for the savgol filter.

    Args:
        freq (np.ndarray): An array of frequency values.

    Returns:
        int: The number of bins to use for the savgol filter.
    """
    step_size = freq[1] - freq[0]
    num_bins = int(round(27 / (8 * step_size)))
    if (num_bins % 2) == 0:
        num_bins += 1
    return num_bins

def sliding_window_rms_ratio(freqs: np.ndarray, ampl: np.ndarray, window_size_freq: float) -> float:
    """
    Computes the ratio of the maximum window root mean square (RMS) to the minimum window RMS
    when sliding a window of specified width across the trace.
    This ratio is a good indicator of whether a trace contains a resonance or just noise.

    Args:
        freqs (np.ndarray): An array of frequency values.
        ampl (np.ndarray): An array of amplitude values.
        window_size_freq (float): The width of the sliding window in frequency units.

    Returns:
        float: The ratio of the maximum window RMS to the minimum window RMS.
    """
    min_rms = float("inf")
    max_rms = 0.0
    window_size_bins = int(window_size_freq / (freqs[1] - freqs[0]))

    for i in range(len(ampl) - window_size_bins):
        selection = np.array(ampl[i:i+window_size_bins])
        rms = np.sqrt(np.mean(selection ** 2))
        min_rms = min(min_rms, rms)
        max_rms = max(max_rms, rms)

    return float("inf") if min_rms == 0 else max_rms / min_rms


def getAnalysisVersion():
    return None
    #$ git rev-parse --short `git log -n 1 --pretty=format:%H -- processing/`
    #a4df205
    #print(f'********** Resonance algorithm version ***********')
    cmd = ['git', 'log', '-n 1', '--pretty=format:%H', '--', 'processing/']
    out = subprocess.check_output(cmd)
    #print(f'out = {out}')
    cmd = ['git', 'rev-parse', '--short', out]
    out = subprocess.check_output(cmd).strip()   # returns binary string b'a4df205'
    out = out.decode('ascii')  # converts to regular string
    #print(f'out = {out}')
    #print(f'**************************************************')
    return out

algo_version = getAnalysisVersion()
    
def slope_near_bin(freqs, amps, i, window):
    df = freqs[1]-freqs[0]
    startBin = i-int((window-1)/2)
    endBin = i+int((window-1)/2)
    if startBin < 0:
        endBin = endBin - startBin
        startBin = 0
    length = len(freqs)
    if endBin > length - 1:
        endBin = length - 1
        startBin = startBin - (endBin - (length - 1))
    return (amps[endBin]-amps[startBin])/df

def blank_tension_result():
    return {"tension": {}, "continuity": {}}

def new_results_dict(STAGES, APA_LAYERS, APA_SIDES, MAX_WIRE_SEGMENT):
    resultsDict = {}
    for stage in STAGES:
        resultsDict[stage] = {}
        for layer in APA_LAYERS:
            resultsDict[stage][layer] = {}
            for side in APA_SIDES:
                resultsDict[stage][layer][side] = {}
                for i in range(1,MAX_WIRE_SEGMENT[layer]+1):
                    resultsDict[stage][layer][side][str(i).zfill(5)] = blank_tension_result()
    return resultsDict

def update_results_dict_tension(resultsDict, stage, layer, side, scanId, wireSegments, tensions, tension_confidences):
    for i, wireSegment in enumerate(wireSegments):
        tension = tensions[i]
        tension_confidence = tension_confidences[i]
        wireSegmentStr = str(wireSegment).zfill(5)
        if wireSegmentStr not in resultsDict[stage][layer][side].keys(): resultsDict[stage][layer][side][wireSegmentStr] = blank_tension_result()
        if not tension: continue
        elif tension == -1:
            resultsDict[stage][layer][side][wireSegmentStr]["tension"][scanId] = {'tension': 'Not Found'}
        elif tension > 0:
            resultsDict[stage][layer][side][str(wireSegment).zfill(5)]["tension"][scanId] = {'tension': tension, 'tension_confidence': tension_confidence, 'submitted': 'Auto', 'algo_ver':algo_version}

def update_results_dict_continuity(resultsDict, stage, layer, side, scanId, wireSegments, continuous, capacitanceCal, capacitanceUnCal):
    for wireSegment in wireSegments:
        print("Writing ",stage,layer,side,scanId,wireSegment,continuous,capacitanceCal, capacitanceUnCal)
        resultsDict[stage][layer][side][str(wireSegment).zfill(5)]["continuity"][scanId] = {'continuous': continuous, 'capacitance_cal': capacitanceCal, "capacitance_un_cal": capacitanceUnCal}

def refine_peak_position(f, a, fpk, radius):
    selected = (f > fpk - radius) & (f < fpk)
    selected_f = f[selected]
    selected_a = a[selected]
    step_size = f[1]-f[0]
    if len(selected_a) == 0: return fpk
    pks, props = find_peaks(selected_a, height=0.2*np.max(selected_a), width=0.5/step_size)
    if len(pks) == 0: return fpk
    min_index = np.argmin(props['peak_heights'])
    return pks[min_index]

def lowest_max_in_surrounding(f, a, start, stop, step, width):
    lowest_max = np.max(a)
    if start < np.min(f): start = np.min(f)
    if stop > np.max(f): stop = np.max(f)
    for fi in range(int(start), int(stop-width), step):
        #print("lowest max RANGE ",fi,fi + width)
        selected = (f > fi) & (f < fi + width)
        #print("f", f)
        selected_a = a[selected]
        max_a = np.max(selected_a)
        if max_a < lowest_max: lowest_max = max_a
    return lowest_max

def min_peak_height(layer, a):
    length = len(a)
    trimmed = a[int(length/20):] # cut out first 5% of scan to avoid having transients affect the min peak height
    if layer in ['X','G']: return 0.1*np.max(trimmed)
    else: return max(5., 0.05*np.max(trimmed))

def move_to_nth_nearest(res_seg, n, fpks, min_or_max = 'max'):
    if min_or_max == 'max':
        f_in_seg = np.max(res_seg)
    elif min_or_max == 'min':
        f_in_seg = np.min(res_seg)
    else: return None, None
    diffs = list(np.abs(f_in_seg-fpks))
    nearest_indices = [diffs.index(x) for x in sorted(diffs)]
    if n >= len(nearest_indices): return None, None
    nth_index = nearest_indices[n]
    nth_fpk = fpks[nth_index]
    shifted_res_seg = resonance_fitting.shift_res_seg_to_f0(res_seg, f_in_seg, nth_fpk)
    return shifted_res_seg, nth_fpk/f_in_seg

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

def print_verbose(message: str, verbosity: int, verbosity_level: int = 1) -> None:
    """
    Print a message if the given verbosity level is greater than or equal to the specified verbosity level.

    Args:
        message (str): The message to be printed.
        verbosity (int): The current verbosity level.
        verbosity_level (int, optional): The minimum verbosity level required to print the message. Defaults to 1.

    Returns:
        None
    """
    # Check if the current verbosity level is greater than or equal to the specified verbosity level
    if verbosity >= verbosity_level:
        print(message)

def get_default_values(segments: List[float], default_value: float) -> Tuple[List[List[float]], List[float], List[float]]:
    """
    Generate default values for resonances, tensions, and confidences based on the segments list.

    Args:
        segments (List[int]): A list of segments.
        verbosity (int, optional): Verbosity level for displaying errors. Defaults to 1.

    Returns:
        Tuple[List[int], List[List[float]], List[int], List[int]]: A tuple containing:
            - segments (List[int]): The input segments list.
            - default_res_arr (List[List[float]]): A list of empty lists, one for each segment.
            - default_tensions (List[int]): A list of -1 values, one for each segment.
            - default_confidences (List[int]): A list of -1 values, one for each segment.
    """
    # Create default arrays with the same length as the segments
    default_res_arr = [[] for s in segments]
    default_tensions = [default_value for s in segments]
    default_confidences = [default_value for s in segments]

    return default_res_arr, default_tensions, default_confidences

def process_baseline_and_normalize(baseline: List[float], data: List[float]) -> List[float]:
    """
    Process the input baseline and normalize the input data with respect to the baseline.

    Args:
        baseline (List[float]): A list of float values representing the baseline.
        data (List[float]): A list of float values representing the data to be normalized.

    Returns:
        List[float]: A list of normalized data values.

    Raises:
        ValueError: If the lengths of baseline and data lists are not equal.
    """
    # Check if the lengths of baseline and data are equal
    if len(baseline) != len(data):
        raise ValueError("Baseline and data lengths must be equal.")

    # Calculate the minimum value in the baseline
    min_baseline = min(baseline)

    # Normalize the data with respect to the baseline
    normalized_data = [(value - min_baseline) / (base - min_baseline) for value, base in zip(data, baseline)]

    return normalized_data

def calculate_slope(frequencies: np.ndarray, bsub: np.ndarray, index_range: int) -> np.ndarray:
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
    bsub_dadf = np.array([slope_near_bin(frequencies, bsub, i, index_range) for i in range(len(frequencies))])

    return bsub_dadf

def process_pythagorean(bsub: np.ndarray, bsub_dadf: np.ndarray, freq_arr: np.ndarray) -> np.ndarray:
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
    
def apply_savgol_filter(data: np.ndarray, window_length: int, polyorder: int = 3) -> np.ndarray:
    """
    Apply a Savitzky-Golay filter to smooth a given data array.

    Parameters
    ----------
    data : np.ndarray
        Data array to be smoothed.
    window_length : int
        The length of the filter window (i.e., the number of coefficients). It must be an odd integer.
    polyorder : int, optional, default=3
        The order of the polynomial used to fit the samples. It must be less than `window_length`.

    Returns
    -------
    np.ndarray
        Smoothed data array.
    """
    # Ensure the window_length is odd
    if window_length % 2 == 0:
        window_length += 1

    # Apply the Savitzky-Golay filter to the data array
    smoothed_data = savgol_filter(data, window_length, polyorder)

    return smoothed_data

def find_adaptive_peaks(freq_arr: np.ndarray, pythag_smooth: np.ndarray, flat_expected: np.ndarray, verbosity: int = 0) -> Tuple[np.ndarray, np.ndarray]:
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
        
        if verbosity > 1:
            print(f"Only found {len(pks)} peaks with a threshold of {round(peak_height_thresh, 5)}. Reducing threshold.")    
        
        pks, props = find_peaks(pythag_smooth, height=peak_height_thresh, width=int(SMOOTH_PEAK_WIDTH/stepSize))  

    # Round peak frequencies to 2 decimal places
    peak_freqs = np.array([round(freq_arr[pk], 2) for pk in pks])

    # Extract peak heights from properties
    peak_heights = props['peak_heights']
    peak_proms = props['peak_prominences']

    return peak_freqs, peak_heights, peak_proms

def clean_peak_data(freq_arr: np.ndarray, pythag_smooth: np.ndarray, peak_freqs: np.ndarray, peak_heights: np.ndarray, peak_proms: np.ndarray, verbosity: int = 0) -> Tuple[np.ndarray, np.ndarray]:
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
        lm = lowest_max_in_surrounding(freq_arr, pythag_smooth, fpk - LOWEST_MAX_SEARCH_RADIUS, fpk + LOWEST_MAX_SEARCH_RADIUS, 1, LOWEST_MAX_WINDOW)
        
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
        if i > 0 and fpk - fpks[i - 1] < HEIGHT_TO_PREV_HEIGHT_RANGE and peak_heights[i] < HEIGHT_TO_PREV_HEIGHT_FACTOR * peak_heights[i - 1]: 
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
    
def find_first_bump_peaks(freq_arr: np.ndarray, bsub: np.ndarray, peak_freqs: np.ndarray, verbosity: int = 0) -> np.ndarray:
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

def find_first_bumps(data: np.ndarray, min_height: float = None, max_height: float = None, min_distance: int = None) -> np.ndarray:
    """
    Find the indices of the first bumps (local maxima) in the given data based on height and distance constraints.

    :param data: A numpy array containing the data to search for local maxima.
    :param min_height: Minimum height (value) of the local maxima. If not provided, no minimum height constraint is applied.
    :param max_height: Maximum height (value) of the local maxima. If not provided, no maximum height constraint is applied.
    :param min_distance: Minimum distance (number of indices) between consecutive local maxima. If not provided, no minimum distance constraint is applied.
    :return: A numpy array containing the indices of the first bumps that satisfy the height and distance constraints.
    """
    peak_indices = []
    data_len = len(data)

    for index in range(1, data_len - 1):
        # Check if current data point is a peak
        if data[index - 1] < data[index] > data[index + 1]:
            peak_indices.append(index)

    # Filter the found peaks using height and distance constraints
    filtered_peak_indices = filter_peaks(
        np.array(peak_indices),
        data,
        min_height=min_height,
        max_height=max_height,
        min_distance=min_distance,
    )

    return filtered_peak_indices

def move_to_nth_nearest(data: List[float], start_index: int, target_value: float, n: int) -> int:
    """
    Given a list of numeric data, this function finds the index of the n-th nearest value to a target_value, 
    excluding the value at the specified start_index. If the start_index value is among the n nearest values,
    the function returns the start_index itself.

    Args:
        data (List[float]): A list of numeric data to search through.
        start_index (int): The index of a value in the data list that should be excluded from the search.
        target_value (float): The target value to find the n-th nearest value to.
        n (int): The number of nearest values to consider.

    Returns:
        int: The index of the n-th nearest value to the target_value, or the start_index if it's among the n nearest values.
    """
    # Initialize variables to store the distance and index of the closest values
    closest_distances = [float('inf')] * n
    closest_indices = [-1] * n

    # Iterate through the data to find the n nearest values to the target_value
    for index, value in enumerate(data):
        distance = abs(target_value - value)
        
        # Check if the current value is closer than any of the previously stored values
        for i in range(n):
            if distance < closest_distances[i]:
                # Shift the current values to the right
                closest_distances[i+1:] = closest_distances[i:-1]
                closest_indices[i+1:] = closest_indices[i:-1]

                # Update the current closest distance and index
                closest_distances[i] = distance
                closest_indices[i] = index
                break

    # Check if the start_index is one of the n nearest values
    if start_index in closest_indices:
        return start_index

    # Otherwise, return the nearest value that is not the start_index
    for index in closest_indices:
        if index != start_index:
            return index

def move_resonances_to_nearest_peaks(expected_resonances: List[np.ndarray], fpks_first_bump: np.ndarray) -> Tuple[List[List[np.ndarray]], List[List[float]]]:
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
                moved_res_seg, movement_factor = move_to_nth_nearest(res_seg, i, fpks_first_bump, 'min')
            else:
                moved_res_seg, movement_factor = move_to_nth_nearest(res_seg, i, fpks_first_bump, 'max')
            
            if moved_res_seg is None:
                continue
            
            moved_res_segs.append(moved_res_seg)
            movement_factors.append(movement_factor)

        moved_res_segs_collection.append(moved_res_segs)
        movement_factors_collection.append(movement_factors)

    moved_res_arrs = [list(x) for x in itertools.product(*moved_res_segs_collection)]
    moved_res_arr_movement_factors = [list(x) for x in itertools.product(*movement_factors_collection)]

    return moved_res_arrs, moved_res_arr_movement_factors

def prune_resonance_placements(moved_res_arrs: List[List[np.ndarray]], moved_res_arr_movement_factors: List[List[float]], freq_arr: np.ndarray, fpks_first_bump: np.ndarray, pythag_smooth: np.ndarray, verbosity: int = 1) -> Tuple[List[List[np.ndarray]], List[List[float]]]:
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


def compute_placement_costs(pruned_moved_res_arrs: List[List[float]], fpks_first_bump: np.ndarray, peak_heights: np.ndarray, freq_arr: np.ndarray, verbosity: int) -> List[float]:
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

def select_optimal_placement(pruned_moved_res_arrs: List[List[float]], pruned_moved_res_arr_costs: List[float], verbosity: int) -> List[float]:
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

def calculate_selected_tension(selected_moved_res_arr: List[Union[float, List[float]]], expected_resonances: List[List[float]], nominal_tension: float) -> List[Union[float, List[float]]]:
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


def calculate_costs(movements: List[int], costs: List[int]) -> List[int]:
    # Initialize an empty list to store the calculated costs
    calculated_costs = []

    # Iterate through the movements
    for movement in movements:
        # Calculate the cost for the current movement and append it to the calculated_costs list
        cost = 0
        for i in range(len(costs)):
            cost += movement * costs[i]
        calculated_costs.append(cost)

    # Return the list of calculated costs
    return calculated_costs

def select_best_arr(costs: List[int], arrays: List[List[int]]) -> Tuple[int, List[int]]:
    # Find the index of the minimum cost in the costs list
    min_cost_index = costs.index(min(costs))
    
    # Get the array corresponding to the minimum cost
    best_arr = arrays[min_cost_index]

    # Return the minimum cost and the best array as a tuple
    return min_cost_index, best_arr

def get_selected_tension(tensions: List[float], best_index: int) -> float:
    # Get the selected tension corresponding to the best_index
    selected_tension = tensions[best_index]

    # Return the selected tension
    return selected_tension

def process_channel(layer, apa_channel, freq_arr, ampl_arr, max_freq=250., verbosity=0, nominal_tension = 6.5):
 
    print_verbose(f"################################################", verbosity, 1)
    print_verbose(f"         PROCESSING CHANNEL {apa_channel}       ", verbosity, 1)
    print_verbose(f"################################################", verbosity, 1)

    # Make sure the maximum frequency to search for resonances does not exceed the domain of the trace
    max_freq = np.min(max_freq, np.max(freq_arr))

    # Get the list of wire segments corresponding to this channel and a list of lists containing the expected resonance values for each segment
    wire_segments, expected_resonances = channel_frequencies.get_expected_resonances(layer, apa_channel, max_freq)
    
    # Generate the default return values in case the algorithm fails
    default_res_arr, default_tensions, default_confidences = get_default_values(wire_segments, -1)

    # If there are no expected frequencies in the given domain, return
    if expected_resonances == []:
        print_verbose("ERROR: No expected resonances in the given frequency range", verbosity, 1)
        return wire_segments, default_res_arr, default_tensions, default_confidences
    flat_expected = np.array([sub_res for res_seg in expected_resonances for sub_res in res_seg])

    # Get baseline subtracted trace
    bsub = resonance_fitting.baseline_subtracted(freq_arr, np.cumsum(ampl_arr))

    # Normalize
    bsub /= np.max(bsub)
    
    # Remove scans with low rms ratio because they are likely all noise
    rms_ratio = sliding_window_rms_ratio(freq_arr, ampl_arr, 10)
    if rms_ratio < 4:
        print("No expected resonances in the given frequency range")
        return wire_segments, default_res_arr, default_tensions, default_confidences 

    # Get the derivative/slope of the trace
    bsub_dadf = calculate_slope(freq_arr, ampl_arr, 10)
    bsub_dadf /= np.max(bsub_dadf)

    # The ringing resonances appear to be sin-like. So we add the square of the trace to the square of the derivative, which results in peaks where the trace is sin-like due to sin^2 + cos^2 being maximized.
    pythag_smooth = process_pythagorean(bsub, bsub_dadf, freq_arr)

    # Find the peaks in the smoothed trace
    peak_freqs, peak_heights, peak_proms = find_adaptive_peaks(freq_arr, pythag_smooth, flat_expected, verbosity)
    
    # Find the clean peaks
    peak_freqs, peak_heights = clean_peak_data(freq_arr, pythag_smooth, peak_freqs, peak_heights, peak_proms)
    
    # Find the frequencies corresponding to the first bump of each resonance
    fpks_first_bump = find_first_bump_peaks(freq_arr, bsub, peak_freqs, verbosity)

    # Gather placements to test by performing a grid search on the nearest resonances to the nominal placements 
    moved_res_arrs, moved_res_arr_movement_factors = move_resonances_to_nearest_peaks(expected_resonances, fpks_first_bump)

    # Filter out the unreasonable placements
    pruned_moved_res_arrs, pruned_moved_res_arr_movement_factors = prune_resonance_placements(moved_res_arrs, moved_res_arr_movement_factors, freq_arr, fpks_first_bump, pythag_smooth, verbosity)
  
    # Compute the cost of each placement
    pruned_moved_res_arr_costs = compute_placement_costs(pruned_moved_res_arrs, fpks_first_bump, peak_heights, freq_arr, verbosity)

    # Select the optimal placement
    selected_moved_res_arr = select_optimal_placement(pruned_moved_res_arrs, pruned_moved_res_arr_costs, verbosity)
  
    # Compute the tension of the segment
    selected_tension = calculate_selected_tension(selected_moved_res_arr, expected_resonances, nominal_tension)
    
    # Return
    if selected_moved_res_arr == []:
        return wire_segments, default_res_arr, default_tensions, default_confidences
    else:
        return wire_segments, selected_moved_res_arr, selected_tension, [0]*len(selected_tension)



def process_channel_v3(layer, apaCh, f, a, maxFreq=250., verbosity=0, nominalTension = 6.5):

    if verbosity > 1: 
        print(f"################################################")
        print(f"         PROCESSING CHANNEL {apaCh}             ")
        print(f"################################################")
    if maxFreq > np.max(f): maxFreq = np.max(f) 
    segments,expected_resonances = channel_frequencies.get_expected_resonances(layer,apaCh,maxFreq)
    default_res_arr = [[] for s in segments]
    default_tensions = [-1 for s in segments]
    default_confidences = [-1 for s in segments]
    if expected_resonances == []:
        if verbosity > 1: print("ERROR: No expected resonances in the given frequency range")
        return segments, default_res_arr, default_tensions, default_confidences
    flat_expected = np.array([sub_res for res_seg in expected_resonances for sub_res in res_seg])

    # Get baseline subtracted trace
    bsub = resonance_fitting.baseline_subtracted(f,np.cumsum(a))
    if np.max(np.abs(bsub)) < BSUB_MIN: 
        print("No expected resonances in the given frequency range")
        return segments, default_res_arr, default_tensions, default_confidences 
    # Normalize
    bsub /= np.max(bsub)
    # Get the derivative/slope of the trace
    bsub_dadf = np.array([slope_near_bin(f, bsub, i, 5) for i in range(len(f))])
    bsub_dadf /= np.max(bsub_dadf)
    # The ringing resonances appear to be sin-like. So we add the square of the trace to the square of the derivative, which results in peaks where the trace is sin-like due to sin^2 + cos^2 being maximized.
    pythag = bsub**2+bsub_dadf**2
    # Smooth out the processed trace
    pythag_smooth = savgol_filter(pythag, resonance_fitting.get_num_savgol_bins(f), 3)
    # Normalize the processed trace
    pythag_smooth /= np.max(pythag_smooth)
    # Find the peaks in the smoothed trace
    stepSize = f[1]-f[0]
    peak_height_thresh = SMOOTH_PEAK_HEIGHT_START        
    pks, props = find_peaks(pythag_smooth,height=peak_height_thresh,width=int(SMOOTH_PEAK_WIDTH/stepSize))  
    while len(pks) < 2*len(np.unique(flat_expected)) and peak_height_thresh>0.001:
        peak_height_thresh = 0.75*peak_height_thresh
        if verbosity > 1: print(f"Only found {len(pks)} peaks with a threshold of {round(peak_height_thresh,5)}. Reducing threshold.")    
        pks, props = find_peaks(pythag_smooth,height=peak_height_thresh,width=int(SMOOTH_PEAK_WIDTH/stepSize))  

    fpks = np.array([round(f[pk],2) for pk in pks])
    peak_heights = props['peak_heights']
    clean_fpks = []
    clean_heights = []
    if verbosity > 1: print("Peaks in smoothed trace found at ", fpks)
    for i,fpk in enumerate(fpks):
        lm = lowest_max_in_surrounding(f, pythag_smooth, fpk-LOWEST_MAX_SEARCH_RADIUS, fpk+LOWEST_MAX_SEARCH_RADIUS, 1, LOWEST_MAX_WINDOW)
        if peak_heights[i] < HEIGHT_TO_LOWEST_SURROUNDING_FACTOR*lm: 
            if verbosity > 1: print(f"Peak at {fpk}, {peak_heights[i]} small relative to surroundings {lm}")
            continue
        if props['prominences'][i] < PROM_TO_HEIGHT_FACTOR*peak_heights[i]:
            if verbosity > 1: print(f"Peak at {fpk} has prominence less than a certain factor of its height") 
            continue
        if i > 0 and fpk-fpks[i-1] < HEIGHT_TO_PREV_HEIGHT_RANGE and peak_heights[i] < HEIGHT_TO_PREV_HEIGHT_FACTOR*peak_heights[i-1]: 
            if verbosity > 1: print(f"Peak at {fpk} is right after a much bigger peak")
            continue
        clean_fpks.append(fpk)
        clean_heights.append(peak_heights[i])
    fpks = np.array(clean_fpks)
    peak_heights = np.array(clean_heights)
    if verbosity > 1: print("Peaks in smoothed trace (after processing) found at ", fpks)

    fpks_first_bump = []
    amps_first_bump = []
    for pknum, fpk in enumerate(fpks):
        if pknum == 0: lookback = LOOKBACK_FIRST_BUMP_1
        else: 
            lookback = min((fpk - fpks[pknum-1])/2, LOOKBACK_FIRST_BUMP) 
        selected = (f > fpk - lookback) & (f < fpk+LOOKFORWARD)
        selected_f = f[selected]
        selected_a = bsub[selected]
        step_size = f[1]-f[0]
        if len(selected_a) == 0: continue
        pks, props = find_peaks(selected_a, prominence=FIRST_BUMP_PROM_FACTOR*np.max(np.abs(selected_a)), width=FIRST_BUMP_PEAK_WIDTH/step_size)
        fpks1 = [round(selected_f[pk],2) for pk in pks]
        amps1 = [selected_a[pk] for pk in pks]
        pks_neg, props = find_peaks(-selected_a, prominence=FIRST_BUMP_PROM_FACTOR*np.max(np.abs(selected_a)), width=FIRST_BUMP_PEAK_WIDTH/step_size)
        fpks1 += [round(selected_f[pk],2) for pk in pks_neg]
        amps1 += [selected_a[pk] for pk in pks_neg]
            
        
        if len(fpks1):
            if verbosity > 1: print(f"For resonance around {fpk}, local peaks found at {fpks1}. Setting resonance-start at {fpks1[np.argmin(fpks1)]}")
            index_first_bump = np.argmin(fpks1)
            #fpk_first_bump = fpks1[index_first_bump]
            # if np.abs(fpk_first_bump-fpk) > 0.5:
            fpks_first_bump.append(fpks1[index_first_bump])
            amps_first_bump.append(amps1[index_first_bump])
    
    fpks_first_bump = np.array(fpks_first_bump)

    n_nearest = N_NEAREST_PEAKS
    moved_res_segs_collection = []
    movement_factors_collection = []
    for res_seg in expected_resonances:
        moved_res_segs = []
        movement_factors = []
        for i in range(n_nearest):
            if np.max(res_seg) < ABOVE_F_USE_UPPER_SUB_SEG:
                moved_res_seg, movement_factor = move_to_nth_nearest(res_seg, i, fpks_first_bump, 'min')
            else:
                moved_res_seg, movement_factor = move_to_nth_nearest(res_seg, i, fpks_first_bump, 'max')
            if moved_res_seg == None: continue
            moved_res_segs.append(moved_res_seg)
            movement_factors.append(movement_factor)
        moved_res_segs_collection.append(moved_res_segs)
        movement_factors_collection.append(movement_factors)
        
    moved_res_arrs = [list(x) for x in itertools.product(*moved_res_segs_collection)]
    moved_res_arr_movement_factors = [list(x) for x in itertools.product(*movement_factors_collection)] 

    pruned_moved_res_arrs = []
    pruned_moved_res_arr_movement_factors = []
    if verbosity > 1: print("Analyzing placements:")
    if verbosity > 1 and len(moved_res_arr_movement_factors) == 0: print("    No placements found")
    for i, moved_res_arr_movement_factor in enumerate(moved_res_arr_movement_factors):
        moved_res_arr = moved_res_arrs[i]
        if verbosity > 1: print("    Checking",moved_res_arr)
        within_movement_factor = True
        if np.max(moved_res_arr_movement_factor) > REL_MOVEMENT_FACTOR_MAX*np.min(moved_res_arr_movement_factor):
            if verbosity > 1: print("        Tensions are too diverse", [str(round(x*100,2))+'%' for x in moved_res_arr_movement_factor])
            for j, res_seg in enumerate(moved_res_arr):
                if len(res_seg) == 1:
                    moved_res_arr[j] = []
                    moved_res_arr_movement_factor[j] = np.nan
                    if verbosity > 1: print("        Dropping the short segment")
            if np.nanmax(moved_res_arr_movement_factor) > REL_MOVEMENT_FACTOR_MAX*np.nanmin(moved_res_arr_movement_factor):
                within_movement_factor = False
                if verbosity > 1: print("        Tensions still too diverse", [str(round(x*100,2))+'%' for x in moved_res_arr_movement_factor])
        if np.nanmax(moved_res_arr_movement_factor) > ABS_MOVEMENT_FACTOR_MAX or np.nanmin(moved_res_arr_movement_factor) < ABS_MOVEMENT_FACTOR_MIN:
            if verbosity > 1: print("        Absolute movement factor out of range", [str(round(x*100,2))+'%' for x in moved_res_arr_movement_factor])
            within_movement_factor = False

        if within_movement_factor == False: 
            continue
        
        flat_res = np.array([sub_seg for res_seg in moved_res_arrs[i] for sub_seg in res_seg])
        res_not_near_peak = []
        for sub_seg in flat_res:
            if np.max(np.min(np.abs(sub_seg-fpks_first_bump))) > NEAR_PEAK_DISTANCE:
                if sub_seg < np.min(f) or sub_seg > np.max(f):
                    res_not_near_peak.append(sub_seg)
                    if verbosity > 1: print(f"        This placement puts the resonance at {sub_seg} outside the scanned range ({np.min(f)}, {np.max(f)})")
                    continue
                    
                t_smooth_interp = interp1d(f, pythag_smooth)
                if t_smooth_interp(sub_seg) < NEAR_PEAK_AMPLITUDE:
                    res_not_near_peak.append(sub_seg)
                    if verbosity > 1: print(f"        This placement puts the resonance at {sub_seg} more than {NEAR_PEAK_DISTANCE} from a peak and not in a high amplitude region ({t_smooth_interp(sub_seg)}).")
        if res_not_near_peak:
            continue
            
        pruned_moved_res_arrs.append(moved_res_arrs[i])
        pruned_moved_res_arr_movement_factors.append(moved_res_arr_movement_factors[i]) 
    if verbosity > 1: 
        if verbosity > 1: print("The following placements look valid, now checking which one is optimal")   

    pruned_moved_res_arr_costs = []
    for moved_res_arr in pruned_moved_res_arrs:
        cost = 0
        flat_res = []
        for res_seg in moved_res_arr:
            for sub_seg in res_seg:
                if sub_seg is not np.nan: flat_res.append(sub_seg)
        for i,fpk in enumerate(fpks_first_bump):
            #if fpk < COST_F_THRESH:
            diffs = np.abs((fpk-flat_res))
            index_for_cost = np.argmin(diffs)
            fpk_cost = diffs[index_for_cost]*peak_heights[i]*((np.max(f)-fpk)/(np.max(f)-np.min(f)))
            if i == 0: fpk_cost *= COST_FIRST_PEAK_FACTOR
            cost += fpk_cost
        cost = round(cost,2)
        pruned_moved_res_arr_costs.append(cost)
    

    if verbosity > 1: 
        sorted_res_arr = [x for _, x in sorted(zip(pruned_moved_res_arr_costs, pruned_moved_res_arrs))]
        sorted_costs = sorted(pruned_moved_res_arr_costs)
        for cost, res_arr in zip(sorted_costs, sorted_res_arr):
            print(f"    Cost: ({cost}) for {res_arr}")

    
    selected_moved_res_arr = []
    if len(pruned_moved_res_arr_costs):
        selected_moved_res_arr_index = np.argmin(pruned_moved_res_arr_costs)
        selected_moved_res_arr = pruned_moved_res_arrs[selected_moved_res_arr_index]

    if verbosity > 1: print("Selected placement", selected_moved_res_arr)   
    
    selected_tension = []
    if selected_moved_res_arr:
        for i in range(len(expected_resonances)):
            if selected_moved_res_arr[i] == []:
                selected_tension.append([])
            else:
                selected_tension.append(nominalTension*(np.max(selected_moved_res_arr[i])/np.max(expected_resonances[i]))**2)

    if selected_moved_res_arr == []:
        return segments, default_res_arr, default_tensions, default_confidences
    else:
        return segments, selected_moved_res_arr, selected_tension, [0]*len(selected_tension)




def read_amplitude_data(dir_name: str, verbosity: int) -> Union[Dict[str, Any], None]:
    amplitude_data_file = os.path.join(dir_name, "amplitudeData.json")

    try:
        if verbosity > 0:
            print(amplitude_data_file)

        with open(amplitude_data_file, "r") as file_handle:
            data = json.load(file_handle)
        return data
    except Exception as e:
        if verbosity > 0:
            print(f"Could not find scan (bad json file?) {dir_name}...")
        return None


def extract_metadata(data: Dict[str, Any]) -> Tuple[str, str, str, str, str, List[Any]]:
    stage = data["stage"]
    layer = data["layer"]
    side = data["side"]
    scan_id = os.path.basename(data["dir_name"])
    scan_type = data["type"]
    apa_channels = data["apaChannels"]

    return stage, layer, side, scan_id, scan_type, apa_channels

def process_tension_scan(results_dict: Dict[str, Any], data: Dict[str, Any], max_freq: float, verbosity: int) -> List[List[float]]:
    """
    Process a tension scan and update the given results dictionary.

    :param results_dict: A dictionary containing the results.
    :param data: A dictionary containing the scan data.
    :param max_freq: Maximum frequency to process.
    :param verbosity: Verbosity level for output messages.
    :return: A list of best tensions for each channel. Each element is a sublist of the segment tensions for that channel.
    """
    results = []

    # Extract metadata from the data
    stage, layer, side, scan_id, scan_type, apa_channels = extract_metadata(data)

    # Iterate through the APA channels
    for dwa_channel, apa_channel in enumerate(apa_channels):

        # Print processing information if verbosity is enabled
        if verbosity > 0:
            print(f"Processing APA channel {apa_channel}")

        # If the APA channel does not exist, append None to the results and continue
        if not apa_channel:
            if verbosity > 0:
                print(f"No channel")
            results.append(None)
            continue

        # Extract frequency and amplitude data for the current APA channel
        frequencies = np.array(data[dwa_channel]["freq"])
        amplitudes = np.array(data[dwa_channel]["ampl"])

        # Check if the scan data is valid, append None to results and continue if not
        if len(frequencies) == 0 or len(frequencies) < 50:
            if verbosity > 0:
                print(f"Not a valid scan")
            results.append(None)
            continue

        # Process the channel data and obtain tension information
        (
            segments,
            opt_res_arr,
            best_tensions,
            best_tension_confidences,
        ) = process_channel(layer, apa_channel, frequencies, amplitudes, max_freq, verbosity)

        # Update the results dictionary with the tension information
        update_results_dict_tension(
            results_dict,
            stage,
            layer,
            side,
            scan_id,
            segments,
            best_tensions,
            best_tension_confidences,
        )

        # Append the best tensions for the current channel to the results
        results.append(best_tensions)

    return results

def process_scan(
    results_dict: Dict[str, Any],
    dir_name: str,
    max_freq: float = 250.0,
    verbosity: int = 0,
) -> Tuple[Union[str, None], Union[List[int], None], Union[List[Any], None]]:
    """
    Process a scan with a given directory name and update the given results dictionary.

    :param results_dict: A dictionary containing the results.
    :param dir_name: The directory name containing the scan.
    :param max_freq: Maximum frequency to process.
    :param verbosity: Verbosity level for output messages.
    :return: A tuple containing scan type, APA channels, and results.
    """
    # Read amplitude data from the given directory
    data = read_amplitude_data(dir_name, verbosity)

    # If data couldn't be read, return None values
    if not data:
        return None, None, None

    # Extract metadata from the read data
    stage, layer, side, scan_id, scan_type, apa_channels = extract_metadata(data)

    # Print processing information if verbosity is enabled
    if verbosity > 0:
        print(f"Processing {stage} {layer} {side} {scan_id} {scan_type}")

    # If the scan type is "Continuity", no further processing is required
    if scan_type == "Continuity":
        return scan_type, apa_channels, None

    # Process tension scans and obtain results
    tension_results = process_tension_scan(results_dict, data, max_freq, verbosity)

    # Return the scan type, APA channels, and results
    return scan_type, apa_channels, tension_results