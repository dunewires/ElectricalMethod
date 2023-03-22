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
from typing import List, Tuple, Optional, Dict
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

def process_channel(layer, apaCh, f, a, maxFreq=250., verbosity=0, nominalTension = 6.5):

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

from typing import Any, Dict, List, Tuple, Union


def load_amplitude_data(
    dir_name: str, verbosity: int = 0
) -> Union[Dict[str, Any], None]:
    """Load amplitude data from a JSON file in the specified directory."""
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


def process_non_continuity_scan(
    data: Dict[str, Any], max_freq: float, verbosity: int
) -> List[Any]:
    """Process a non-continuity scan given the loaded amplitude data."""
    results = []

    for reg in range(8):
        dwa_channel = str(reg)
        apa_channel = data["apaChannels"][reg]

        if verbosity > 0:
            print(f"Processing {reg}: APA {apa_channel}")

        if not apa_channel:
            if verbosity > 0:
                print(f"DWA Channel {reg}: No channel")
            results.append(None)
            continue

        frequencies = np.array(data[dwa_channel]["freq"])
        amplitudes = np.array(data[dwa_channel]["ampl"])

        if len(frequencies) == 0 or len(frequencies) < 50:
            if verbosity > 0:
                print(f"DWA Channel {reg}: Not a valid scan")
            results.append(None)
            continue

        (
            segments,
            opt_res_arr,
            best_tensions,
            best_tension_confidences,
            fpks,
        ) = process_channel(layer, apa_channel, frequencies, amplitudes, max_freq, verbosity)

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

    data = load_amplitude_data(dir_name, verbosity)
    if not data:
        return None, None, None

    stage = data["stage"]
    layer = data["layer"]
    side = data["side"]
    scan_id = os.path.basename(dir_name)
    scan_type = data["type"]

    if verbosity > 0:
        print(f"Processing {stage} {layer} {side} {scan_id} {scan_type}")

    apa_channels = data["apaChannels"]

    if scan_type == "Continuity":
        results = []
    else:
        results = process_non_continuity_scan(data, max_freq, verbosity)

        if results_dict:
            for idx, best_tensions in enumerate(results):
                if best_tensions:
                    segments, _, _, best_tension_confidences, _ = process_channel
                    
    return scan_type, apa_channels, results

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

    # Define amplitude data file path
    amplitude_data_file = os.path.join(dir_name, "amplitudeData.json")

    # Load the JSON file
    try:
        if verbosity > 0:
            print(amplitude_data_file)

        with open(amplitude_data_file, "r") as file_handle:
            data = json.load(file_handle)

    except Exception as e:
        if verbosity > 0:
            print(f"Could not find scan (bad json file?) {dir_name}...")
        return None, None, None

    # Extract metadata from the loaded data
    stage = data["stage"]
    layer = data["layer"]
    side = data["side"]
    scan_id = os.path.basename(dir_name)
    scan_type = data["type"]

    if verbosity > 0:
        print(f"Processing {stage} {layer} {side} {scan_id} {scan_type}")

    results = []
    apa_channels = data["apaChannels"]

    # Check if the scan is of type "Continuity"
    if scan_type == "Continuity":
        pass

    else:
        # Process non-continuity scans
        for reg in range(8):
            dwa_channel = str(reg)
            apa_channel = data["apaChannels"][reg]

            if verbosity > 0:
                print(f"Processing {reg}: APA {apa_channel}")

            # Check if APA channel exists
            if not apa_channel:
                if verbosity > 0:
                    print(f"DWA Channel {reg}: No channel")
                results.append(None)
                continue

            # Extract frequency and amplitude data
            frequencies = np.array(data[dwa_channel]["freq"])
            amplitudes = np.array(data[dwa_channel]["ampl"])

            # Check if frequency data is valid
            if len(frequencies) == 0 or len(frequencies) < 50:
                if verbosity > 0:
                    print(f"DWA Channel {reg}: Not a valid scan")
                results.append(None)
                continue

            # Process the channel data
            (
                segments,
                opt_res_arr,
                best_tensions,
                best_tension_confidences,
                fpks,
            ) = process_channel(layer, apa_channel, frequencies, amplitudes, max_freq, verbosity)

            results.append(best_tensions)

            # Update the results dictionary
            if results_dict:
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

    return scan_type, apa_channels, results