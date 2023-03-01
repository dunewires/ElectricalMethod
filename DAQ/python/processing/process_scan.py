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

def new_results_dictOLD(APA_LAYERS, APA_SIDES, MAX_WIRE_SEGMENT):
    resultsDict = {}
    for l in APA_LAYERS:
        resultsDict[l] = {}
        for s in APA_SIDES:
            resultsDict[l][s] = {}
            for i in range(MAX_WIRE_SEGMENT[l]+1):
                resultsDict[l][s][str(i).zfill(5)] = {"tension": {}, "continuity": {}}
    return resultsDict

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
            
def process_channel_v1(layer, apaCh, f, a, maxFreq=250.): 
    stepSize = f[1]-f[0]
    segments,expected_resonances = channel_frequencies.get_expected_resonances(layer,apaCh,maxFreq)
    roundex = []
    for seg in expected_resonances:
        roundex.append([round(x,2) for x in seg])
    expected_resonances = roundex
    
    bsub = resonance_fitting.baseline_subtracted(f,np.cumsum(a))
    bsubabs = np.abs(bsub)
    smooth = savgol_filter(bsubabs, resonance_fitting.get_num_savgol_bins(f), 3)

    #if plot: ax.plot(f,bsub)
    if not resonance_fitting.contains_resonances(f,bsub,layer):
        print(f"DWA Chan {apaCh}: No resonances found")
        return segments, [[] for s in segments], [-1 for s in segments], [-1 for s in segments]

 
    if layer in ['X','G']:
        peak_thresh = min_peak_height(layer, bsub)
        pks = f
        while len(pks) > 10:
            pks, _ = find_peaks(bsub,height=peak_thresh,width=int(0.5/stepSize))
            fpks = np.array([f[pk] for pk in pks])
            fcut = np.min(f)+0.1*(np.max(f)-np.min(f)) # Freq value 10% of the way into the trace
            fpks = fpks[fpks>fcut] # Cut peaks occuring in the first 5% to avoid transient effects being confused as peaks
            peak_thresh = peak_thresh*1.2
          
        print("PEAKS", apaCh, fpks)
        wire_segment_res = np.array(expected_resonances[0])
        opt_res_arr = [wire_segment_res - np.min(wire_segment_res) + fpks[0]]
        minMeasured = np.min(opt_res_arr[0])
        minExpected = np.min(expected_resonances[0])
        tension = 6.5*(minMeasured/minExpected)**2
        return segments, opt_res_arr, [tension], [0]
    else:
        peak_thresh = min_peak_height(layer, smooth)
        pks = f
        while len(pks) > 10:
            pks, props = find_peaks(smooth,height=peak_thresh,width=int(0.5/stepSize),prominence=5.)
            peak_thresh = peak_thresh*1.2
        fpks = np.array([f[pk] for pk in pks])   
        print("PEAKS", apaCh, fpks)
        placements, costs, diffs, tensions = resonance_fitting.analyze_res_placement(f,smooth,expected_resonances,fpks)
        if len(placements) < 1: 
            print(f"DWA Chan {apaCh}: No valid placements found")
            return segments, [[] for s in segments], [-1 for s in segments], [-1 for s in segments]
        # lowest_cost = np.min(costs)
        # select_best = (costs < 1.2*lowest_cost)
        # best_placements = placements[select_best]
        # best_diffs = diffs[select_best]
        # best_costs = costs[select_best]
        # best_tensions = tensions[select_best]
        # min_index = np.argmin(best_diffs)

        
        lowest_diff = np.min(diffs)
        select_best = (diffs < 5*lowest_diff)
        best_placements = placements[select_best]
        best_tensions = tensions[select_best]
        best_costs = costs[select_best]
        best_diffs = diffs[select_best]
        min_index = np.argmin(best_costs)        
        # for i,placement in enumerate(best_placements):
        #     print('PLACEMENT', placement, best_diffs[i], best_costs[i])

        return segments, best_placements[min_index], best_tensions[min_index], np.std(best_tensions,0)

def process_channel_v2(layer, apaCh, f, a, maxFreq=250., verbosity=0):
    if maxFreq > np.max(f): maxFreq = np.max(f) 
    segments,expected_resonances = channel_frequencies.get_expected_resonances(layer,apaCh,maxFreq)
    # Get baseline subtracted trace
    bsub = resonance_fitting.baseline_subtracted(f,np.cumsum(a))
    # Scale trace to counter the effect that resonances at higher frequencies are smaller
    bsubf = bsub*f**(1.5)
    # Normalize
    bsubf /= np.max(bsubf)
    # Get the derivative/slope of the trace
    m = np.array([slope_near_bin(f, bsubf, i, 5) for i in range(len(f))])
    m /= np.max(m)
    # The ringing resonances appear to be sin-like. So we add the square of the trace to the square of the derivative, which results in peaks where the trace is sin-like due to sin^2 + cos^2 being maximized.
    t = bsubf**2+m**2
    # Smooth out the processed trace
    t_smooth = savgol_filter(t, resonance_fitting.get_num_savgol_bins(f), 3)
    # Normalize the ptocessed trace
    t_smooth /= np.max(t_smooth)
    # Find the peaks in the trace that are at leas 5% of the largest peak.
    stepSize = f[1]-f[0]
    pks, props = find_peaks(t_smooth,height=0.05,width=int(0.5/stepSize))
    fpks = np.array([f[pk] for pk in pks])
    peak_heights = props['peak_heights']
    clean_fpks = []
    clean_heights = []
    for i,fpk in enumerate(fpks):
        lm = lowest_max_in_surrounding(f, t_smooth, fpk-30, fpk+30, 1, 5)
        #print("lowest max", peak_heights[i], lm)
        if peak_heights[i] > 10*lm: 
            clean_fpks.append(fpk)
            clean_heights.append(peak_heights[i])
    fpks = np.array(clean_fpks)
    peak_heights = np.array(clean_heights)
    # If there are too many peaks, it is likely noisy data
    # if len(fpks) > 20 or (layer in ['X','G'] and len(fpks) > 10): 
    #     print(f"DWA Chan {apaCh}: Too noisy")
    #     return segments, [[] for s in segments], [-1 for s in segments], [-1 for s in segments], fpks
    if verbosity > 1: print("PEAKS", apaCh, fpks)
    # Analyze all the possible placements for the resonances
    placements, costs, diffs, tensions, reductions = resonance_fitting.analyze_res_placement(f,t_smooth,expected_resonances,fpks, peak_heights)
    
    # If no valid placements were found, abort
    if len(placements) < 1: 
        print(f"DWA Chan {apaCh}: No valid placements found")
        return segments, [[] for s in segments], [-1 for s in segments], [-1 for s in segments], fpks
    
    # Gathe the placements that require moving the least away from the nominal tensions
    lowest_diff = np.min(diffs)
    select_low_diffs = (diffs < lowest_diff+20)
    # Of those, choose the ones that minimize the "cost", which is a complex calculation but essentially means minimizing the number of peaks that don't have assigned resonances 
    lowest_cost = np.min(costs[select_low_diffs])
    select_best = select_low_diffs & (costs < 1.1*lowest_cost)
    best_placements = placements[select_best]
    best_tensions = tensions[select_best]
    best_costs = costs[select_best]
    best_diffs = diffs[select_best]
    best_reductions = reductions[select_best]
    # Select the best placement
    min_index = np.argmin(best_diffs)        
    for i,placement in enumerate(placements):
        if verbosity > 1: print('Placement/diff/cost', placement, diffs[i], costs[i])
    best_placement = best_placements[min_index]
    best_tension = best_tensions[min_index]
    dts = np.abs(best_tensions-best_tension)
    refined_placement = []
    refined_tension = []
    for i,res_seg in enumerate(best_placement):
        old_res = np.min(res_seg)
        if np.max(res_seg) > 90: old_res = np.max(res_seg)
        new_res = refine_peak_position(f,bsubf,old_res,radius=3)
        new_res_seg = resonance_fitting.shift_res_seg_to_f0(res_seg, old_res, new_res)
        refined_placement.append(new_res_seg)
        refined_tension.append(best_tension[i]*new_res**2/old_res**2)
    best_tension = refined_tension
    best_placement = refined_placement
    return segments, best_placement, best_tension, np.max(np.abs(dts),0), fpks

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

def process_channel_x_g(layer, apa_ch, freq, ampl, model, max_freq=250., verbosity=0, nominal_tension = 6.5):
    if verbosity > 1: 
        print(f"################################################")
        print(f"         PROCESSING CHANNEL {apa_ch}            ")
        print(f"################################################")
    num_peaks = 5 # This must match the value used during training
    if max_freq > np.max(freq): 
        max_freq = np.max(freq) 
    segments, expected_resonances = channel_frequencies.get_expected_resonances(layer, apa_ch, max_freq)
    default_res_arr = [[] for s in segments]
    default_tensions = [-1 for s in segments]
    default_confidences = [-1 for s in segments]
    default_fpks = []

    try:
        if expected_resonances == []:
            raise ResonanceFinderFailed("No expected resonances in the given frequency range")

        # Prevent short scans or connectivity scans from being processed
        if len(freq) < 50 or max(freq) > 450: 
            raise ResonanceFinderFailed("Trace size out of range")
            
        # Get baseline subtracted trace
        bsub = baseline_subtracted(freq, np.cumsum(ampl))
        
        # Remove scans with low rms ratio because they are likely all noise
        rms_ratio = sliding_window_rms_ratio(freq, bsub, 10)
        if rms_ratio < 4: 
            raise ResonanceFinderFailed("Trace is too noisy")

        # Get positive peak data
        fpks_pos, heights_pos = get_channel_peak_data(freq, bsub, num_peaks)

        # Generate a row of data
        row_pos = fpks_pos + heights_pos
        
        # Get negative peak data
        fpks_neg, heights_neg = get_channel_peak_data(freq, -bsub, num_peaks)

        # Generate a row of data
        row_neg = fpks_neg + heights_neg
        
        # Get the tension
        pred_tension, pred_tension_err = predict_tension(row_pos, row_neg, model[0], model[1])

        # Compute the resonance array
        moved_res_array = [[val * (pred_tension / nominal_tension) ** 0.5 for val in expected_resonances[0]]]


    except ResonanceFinderFailed as e:
        if verbosity > 1: print("Error:", e)
        return segments, default_res_arr, default_tensions, default_confidences, default_fpks
    else:
        if verbosity > 1: 
            print("segments:", segments)
            print("moved_res_array:", moved_res_array)
            print("pred_tensions:", [pred_tension])
            print("pred_tension_errs:", [pred_tension_err])
        return segments, moved_res_array, [pred_tension], [pred_tension_err], fpks_pos


def process_channel(layer, apaCh, f, a, model_x_g, maxFreq=250., verbosity=0, nominalTension = 6.5):
    #if layer == "X" or layer == "G":
    #    return process_channel_x_g(layer, apaCh, f, a, model_x_g, maxFreq, verbosity, nominalTension)
    #verbosity = 2
    if verbosity > 1: 
        print(f"################################################")
        print(f"         PROCESSING CHANNEL {apaCh}             ")
        print(f"################################################")
    if maxFreq > np.max(f): maxFreq = np.max(f) 
    segments,expected_resonances = channel_frequencies.get_expected_resonances(layer,apaCh,maxFreq)
    default_res_arr = [[] for s in segments]
    default_tensions = [-1 for s in segments]
    default_confidences = [-1 for s in segments]
    default_fpks = []
    if expected_resonances == []:
        if verbosity > 1: print("ERROR: No expected resonances in the given frequency range")
        return segments, default_res_arr, default_tensions, default_confidences, default_fpks
    flat_expected = np.array([sub_res for res_seg in expected_resonances for sub_res in res_seg])

    # Get baseline subtracted trace
    bsub = resonance_fitting.baseline_subtracted(f,np.cumsum(a))
    if np.max(np.abs(bsub)) < BSUB_MIN: 
        print("No expected resonances in the given frequency range")
        return segments, default_res_arr, default_tensions, default_confidences, default_fpks 
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
        return segments, default_res_arr, default_tensions, default_confidences, fpks
    else:
        return segments, selected_moved_res_arr, selected_tension, [0]*len(selected_tension), fpks

def process_scan_v1(resultsDict, dirName, maxFreq=250.):
    '''Process a scan with a given directory name and update the given results dictionary.'''
    try: # Ensure that there is an amplitudeData.json file present!
        with open(dirName+'/amplitudeData.json', "r") as fh:
            data = json.load(fh)

    except:
        print(f"Could not find scan (bad json file?) {dirName}...")
        return None
    
    stage = data['stage']
    layer = data['layer']
    side = data['side']
    scanId = os.path.basename(dirName)
    scanType = data['type']
    print("Processing ",stage,layer,side,scanId,scanType)
    results = []
    apaChannels = data['apaChannels']

    if scanType == 'Continuity':
        for reg, apaCh in enumerate(apaChannels):
            dwaCh = str(reg)
            print(f"Processing {reg}")
            #print(data[dwaCh].keys())
            apaCh = data['apaChannels'][reg]
            if not apaCh:
                results.append("no channel")
            a = np.array(data[dwaCh]['ampl'])
            # If 80% of the values are above 30000, it's probably a bridged channel
            if len(a) > 0 and len(a[a>30000])/len(a) > 0.8:
                results.append("bridged")
            else:
                results.append("ok")

        # channelNameArr, booleanArr, uncalibratedCapArr, calibratedCapArr = capacitanceFile.connectivityTest(dirName)
        # print("Continuity results")
        # print(booleanArr)
        # for i, chanName in enumerate(channelNameArr):
        #     apaChan = int(chanName[1:]) # Converts "U1" to 1
        #     segments, _ = channel_frequencies.get_expected_resonances(layer,apaChan)
        #     continuous = booleanArr[i]
        #     capacitanceCal = calibratedCapArr[i]
        #     capacitanceUnCal = uncalibratedCapArr[i]
        #     if resultsDict:
        #         update_results_dict_continuity(resultsDict, stage, layer, side, scanId, segments, continuous, capacitanceCal, capacitanceUnCal)
    else:
        for reg in range(8):
            dwaCh = str(reg)
            print(f"Processing {reg}")
            #print(data[dwaCh].keys())
            apaCh = data['apaChannels'][reg]
            if not apaCh:
                print(f"DWA Chan {reg}: No channel")
                continue
                
            f = np.array(data[dwaCh]['freq'])
            a = np.array(data[dwaCh]['ampl'])
            if len(f) == 0 or len(f) < 50:
                print(f"DWA Chan {reg}: Not a valid scan")
                continue

            segments, opt_res_arr, best_tensions, best_tension_confidences = process_channel(layer, apaCh, f, a, maxFreq)
            results.append(best_tensions)
            if resultsDict:
                update_results_dict_tension(resultsDict, stage, layer, side, scanId, segments, best_tensions, best_tension_confidences)
    return apaChannels, results


def process_scan(resultsDict, dirName, model_x_g, maxFreq=250., verbosity=0):
    #verbosity = 2
    '''Process a scan with a given directory name and update the given results dictionary.'''
    try: # Ensure that there is an amplitudeData.json file present!
        if verbosity > 0: print(dirName+'/amplitudeData.json')
        with open(dirName+'/amplitudeData.json', "r") as fh:
            data = json.load(fh)

    except:
        #print(f"Could not find scan (bad json file?) {dirName}...")
        return None, None, None
    
    stage = data['stage']
    layer = data['layer']
    side = data['side']
    scanId = os.path.basename(dirName)
    scanType = data['type']
    if verbosity > 0: 
        print("Processing ",stage,layer,side,scanId,scanType)
    results = []
    apaChannels = data['apaChannels']

    if scanType == 'Continuity':
        for reg, apaCh in enumerate(apaChannels):
            dwaCh = str(reg)
            if verbosity > 0: print(f"Processing {reg}")
            #print(data[dwaCh].keys())
            apaCh = data['apaChannels'][reg]
            if not apaCh:
                results.append("no channel")
            a = np.array(data[dwaCh]['ampl'])
            # If 80% of the values are above 30000, it's probably a bridged channel
            if len(a) > 0 and len(a[a>30000])/len(a) > 0.8:
                results.append("bridged")
            else:
                results.append("ok")

        # channelNameArr, booleanArr, uncalibratedCapArr, calibratedCapArr = capacitanceFile.connectivityTest(dirName)
        # print("Continuity results")
        # print(booleanArr)
        # for i, chanName in enumerate(channelNameArr):
        #     apaChan = int(chanName[1:]) # Converts "U1" to 1
        #     segments, _ = channel_frequencies.get_expected_resonances(layer,apaChan)
        #     continuous = booleanArr[i]
        #     capacitanceCal = calibratedCapArr[i]
        #     capacitanceUnCal = uncalibratedCapArr[i]
        #     if resultsDict:
        #         update_results_dict_continuity(resultsDict, stage, layer, side, scanId, segments, continuous, capacitanceCal, capacitanceUnCal)
    else:
        for reg in range(8):
            dwaCh = str(reg)
            #print(data[dwaCh].keys())
            apaCh = data['apaChannels'][reg]
            if verbosity > 0: print(f"Processing {reg}: APA {apaCh}")
            if not apaCh:
                if verbosity > 0: print(f"DWA Chan {reg}: No channel")
                results.append(None)
                continue
                
            f = np.array(data[dwaCh]['freq'])
            a = np.array(data[dwaCh]['ampl'])
            if len(f) == 0 or len(f) < 50:
                if verbosity > 0: print(f"DWA Chan {reg}: Not a valid scan")
                results.append(None)
                continue

            segments, opt_res_arr, best_tensions, best_tension_confidences, fpks = process_channel(layer, apaCh, f, a, model_x_g, maxFreq, verbosity)
            #print('best',best_tensions)
            results.append(best_tensions)
            if resultsDict:
                update_results_dict_tension(resultsDict, stage, layer, side, scanId, segments, best_tensions, best_tension_confidences)
        
    return scanType, apaChannels, results
