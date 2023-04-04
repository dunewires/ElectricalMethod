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
import tension_algorithm
import tension_algorithm_v1
import tension_algorithm_v2


def get_tension_algorithm(version: str, verbosity: int) -> Optional[Union[tension_algorithm_v1.TensionAlgorithmV1, tension_algorithm_v2.TensionAlgorithmV2]]:
    """
    Get the appropriate tension algorithm object based on the provided version.
    
    Args:
        version (str): The version of the tension algorithm to use ("v1" or "v2").
        verbosity (int): The verbosity level for the tension algorithm object.
    
    Returns:
        Optional[Union[tension_algorithm_v1.TensionAlgorithm, tension_algorithm_v2.TensionAlgorithm]]: The tension algorithm object corresponding to the specified version, or None if an invalid version is provided.
    """
    # Return the tension algorithm object for version 1
    if version == "v1":
        return tension_algorithm_v1.TensionAlgorithmV1(verbosity)
    
    # Return the tension algorithm object for version 2
    elif version == "v2":
        return tension_algorithm_v2.TensionAlgorithmV2(verbosity)
    
    # Return None if an invalid version is provided
    else:
        return None

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
            resultsDict[stage][layer][side][str(wireSegment).zfill(5)]["tension"][scanId] = {'tension': tension, 'tension_confidence': tension_confidence, 'submitted': 'Auto', 'algo_ver': None} # FIXME: algo-version

def update_results_dict_continuity(resultsDict, stage, layer, side, scanId, wireSegments, continuous, capacitanceCal, capacitanceUnCal):
    for wireSegment in wireSegments:
        print("Writing ",stage,layer,side,scanId,wireSegment,continuous,capacitanceCal, capacitanceUnCal)
        resultsDict[stage][layer][side][str(wireSegment).zfill(5)]["continuity"][scanId] = {'continuous': continuous, 'capacitance_cal': capacitanceCal, "capacitance_un_cal": capacitanceUnCal}

def read_amplitude_data(dir_name: str, verbosity: int) -> Union[Dict[str, Any], None]:
    amplitude_data_file = os.path.join(dir_name, "amplitudeData.json")

    try:
        if verbosity > 0:
            print(amplitude_data_file)

        with open(amplitude_data_file, "r") as file_handle:
            data = json.load(file_handle)
            data["dirName"] = dir_name
        return data
    except Exception as e:
        if verbosity > 0:
            print(f"Could not find scan (bad json file?) {dir_name}...")
        return None


def extract_metadata(data: Dict[str, Any]) -> Tuple[str, str, str, str, str, List[Any]]:
    stage = data["stage"]
    layer = data["layer"]
    side = data["side"]
    scan_id = os.path.basename(data["dirName"])
    scan_type = data["type"]
    apa_channels = data["apaChannels"]

    return stage, layer, side, scan_id, scan_type, apa_channels

def process_tension_scan(results_dict: Dict[str, Any], data: Dict[str, Any], max_freq: float, version: str, verbosity: int) -> List[List[float]]:
    """
    Process a tension scan and update the given results dictionary.

    :param results_dict: A dictionary containing the results.
    :param data: A dictionary containing the scan data.
    :param max_freq: Maximum frequency to process.
    :param version: Version of the algorithm to use.
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
        frequencies = np.array(data[str(dwa_channel)]["freq"])
        amplitudes = np.array(data[str(dwa_channel)]["ampl"])

        # Check if the scan data is valid, append None to results and continue if not
        if len(frequencies) == 0 or len(frequencies) < 50:
            if verbosity > 0:
                print(f"Not a valid scan")
            results.append(None)
            continue

        # Get the algorithm we want to use
        algo = get_tension_algorithm(version, verbosity)

        # Process the channel data and obtain tension information
        (
            segments,
            opt_res_arr,
            best_tensions,
            best_tension_confidences,
        ) = algo.process_channel(layer, apa_channel, frequencies, amplitudes, max_freq)

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
    max_freq: float,
    version: str,
    verbosity: int = 0,
) -> Tuple[Union[str, None], Union[List[int], None], Union[List[Any], None]]:
    """
    Process a scan with a given directory name and update the given results dictionary.

    :param results_dict: A dictionary containing the results.
    :param dir_name: The directory name containing the scan.
    :param max_freq: Maximum frequency to process.
    :param version: Version of the algorithm to use.
    :param verbosity: Verbosity level for output messages.
    :return: A tuple containing scan type, APA channels, and results.
    """
    # Read amplitude data from the given directory
    data = read_amplitude_data(dir_name, verbosity)
    if "dir_name" not in data:
        data["dir_name"] = dir_name
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

    if "version" in data:
        version = data["version"]
    else:
        version = "v2"
    # Process tension scans and obtain results
    tension_results = process_tension_scan(results_dict, data, max_freq, version, verbosity)

    # Return the scan type, APA channels, and results
    return scan_type, apa_channels, tension_results


    
# def process_channel_v3(layer, apaCh, f, a, maxFreq=250., verbosity=0, nominalTension = 6.5):

#     if verbosity > 1: 
#         print(f"################################################")
#         print(f"         PROCESSING CHANNEL {apaCh}             ")
#         print(f"################################################")
#     if maxFreq > np.max(f): maxFreq = np.max(f) 
#     segments,expected_resonances = channel_frequencies.get_expected_resonances(layer,apaCh,maxFreq)
#     default_res_arr = [[] for s in segments]
#     default_tensions = [-1 for s in segments]
#     default_confidences = [-1 for s in segments]
#     if expected_resonances == []:
#         if verbosity > 1: print("ERROR: No expected resonances in the given frequency range")
#         return segments, default_res_arr, default_tensions, default_confidences
#     flat_expected = np.array([sub_res for res_seg in expected_resonances for sub_res in res_seg])

#     # Get baseline subtracted trace
#     bsub = resonance_fitting.baseline_subtracted(f,np.cumsum(a))
#     if np.max(np.abs(bsub)) < BSUB_MIN: 
#         print("No expected resonances in the given frequency range")
#         return segments, default_res_arr, default_tensions, default_confidences 
#     # Normalize
#     bsub /= np.max(bsub)
#     # Get the derivative/slope of the trace
#     bsub_dadf = np.array([slope_near_bin(f, bsub, i, 5) for i in range(len(f))])
#     bsub_dadf /= np.max(bsub_dadf)
#     # The ringing resonances appear to be sin-like. So we add the square of the trace to the square of the derivative, which results in peaks where the trace is sin-like due to sin^2 + cos^2 being maximized.
#     pythag = bsub**2+bsub_dadf**2
#     # Smooth out the processed trace
#     pythag_smooth = savgol_filter(pythag, resonance_fitting.get_num_savgol_bins(f), 3)
#     # Normalize the processed trace
#     pythag_smooth /= np.max(pythag_smooth)
#     # Find the peaks in the smoothed trace
#     stepSize = f[1]-f[0]
#     peak_height_thresh = SMOOTH_PEAK_HEIGHT_START        
#     pks, props = find_peaks(pythag_smooth,height=peak_height_thresh,width=int(SMOOTH_PEAK_WIDTH/stepSize))  
#     while len(pks) < 2*len(np.unique(flat_expected)) and peak_height_thresh>0.001:
#         peak_height_thresh = 0.75*peak_height_thresh
#         if verbosity > 1: print(f"Only found {len(pks)} peaks with a threshold of {round(peak_height_thresh,5)}. Reducing threshold.")    
#         pks, props = find_peaks(pythag_smooth,height=peak_height_thresh,width=int(SMOOTH_PEAK_WIDTH/stepSize))  

#     fpks = np.array([round(f[pk],2) for pk in pks])
#     peak_heights = props['peak_heights']
#     clean_fpks = []
#     clean_heights = []
#     if verbosity > 1: print("Peaks in smoothed trace found at ", fpks)
#     for i,fpk in enumerate(fpks):
#         lm = lowest_max_in_surrounding(f, pythag_smooth, fpk-LOWEST_MAX_SEARCH_RADIUS, fpk+LOWEST_MAX_SEARCH_RADIUS, 1, LOWEST_MAX_WINDOW)
#         if peak_heights[i] < HEIGHT_TO_LOWEST_SURROUNDING_FACTOR*lm: 
#             if verbosity > 1: print(f"Peak at {fpk}, {peak_heights[i]} small relative to surroundings {lm}")
#             continue
#         if props['prominences'][i] < PROM_TO_HEIGHT_FACTOR*peak_heights[i]:
#             if verbosity > 1: print(f"Peak at {fpk} has prominence less than a certain factor of its height") 
#             continue
#         if i > 0 and fpk-fpks[i-1] < HEIGHT_TO_PREV_HEIGHT_RANGE and peak_heights[i] < HEIGHT_TO_PREV_HEIGHT_FACTOR*peak_heights[i-1]: 
#             if verbosity > 1: print(f"Peak at {fpk} is right after a much bigger peak")
#             continue
#         clean_fpks.append(fpk)
#         clean_heights.append(peak_heights[i])
#     fpks = np.array(clean_fpks)
#     peak_heights = np.array(clean_heights)
#     if verbosity > 1: print("Peaks in smoothed trace (after processing) found at ", fpks)

#     fpks_first_bump = []
#     amps_first_bump = []
#     for pknum, fpk in enumerate(fpks):
#         if pknum == 0: lookback = LOOKBACK_FIRST_BUMP_1
#         else: 
#             lookback = min((fpk - fpks[pknum-1])/2, LOOKBACK_FIRST_BUMP) 
#         selected = (f > fpk - lookback) & (f < fpk+LOOKFORWARD)
#         selected_f = f[selected]
#         selected_a = bsub[selected]
#         step_size = f[1]-f[0]
#         if len(selected_a) == 0: continue
#         pks, props = find_peaks(selected_a, prominence=FIRST_BUMP_PROM_FACTOR*np.max(np.abs(selected_a)), width=FIRST_BUMP_PEAK_WIDTH/step_size)
#         fpks1 = [round(selected_f[pk],2) for pk in pks]
#         amps1 = [selected_a[pk] for pk in pks]
#         pks_neg, props = find_peaks(-selected_a, prominence=FIRST_BUMP_PROM_FACTOR*np.max(np.abs(selected_a)), width=FIRST_BUMP_PEAK_WIDTH/step_size)
#         fpks1 += [round(selected_f[pk],2) for pk in pks_neg]
#         amps1 += [selected_a[pk] for pk in pks_neg]
            
        
#         if len(fpks1):
#             if verbosity > 1: print(f"For resonance around {fpk}, local peaks found at {fpks1}. Setting resonance-start at {fpks1[np.argmin(fpks1)]}")
#             index_first_bump = np.argmin(fpks1)
#             #fpk_first_bump = fpks1[index_first_bump]
#             # if np.abs(fpk_first_bump-fpk) > 0.5:
#             fpks_first_bump.append(fpks1[index_first_bump])
#             amps_first_bump.append(amps1[index_first_bump])
    
#     fpks_first_bump = np.array(fpks_first_bump)

#     n_nearest = N_NEAREST_PEAKS
#     moved_res_segs_collection = []
#     movement_factors_collection = []
#     for res_seg in expected_resonances:
#         moved_res_segs = []
#         movement_factors = []
#         for i in range(n_nearest):
#             if np.max(res_seg) < ABOVE_F_USE_UPPER_SUB_SEG:
#                 moved_res_seg, movement_factor = move_to_nth_nearest(res_seg, i, fpks_first_bump, 'min')
#             else:
#                 moved_res_seg, movement_factor = move_to_nth_nearest(res_seg, i, fpks_first_bump, 'max')
#             if moved_res_seg == None: continue
#             moved_res_segs.append(moved_res_seg)
#             movement_factors.append(movement_factor)
#         moved_res_segs_collection.append(moved_res_segs)
#         movement_factors_collection.append(movement_factors)
        
#     moved_res_arrs = [list(x) for x in itertools.product(*moved_res_segs_collection)]
#     moved_res_arr_movement_factors = [list(x) for x in itertools.product(*movement_factors_collection)] 

#     pruned_moved_res_arrs = []
#     pruned_moved_res_arr_movement_factors = []
#     if verbosity > 1: print("Analyzing placements:")
#     if verbosity > 1 and len(moved_res_arr_movement_factors) == 0: print("    No placements found")
#     for i, moved_res_arr_movement_factor in enumerate(moved_res_arr_movement_factors):
#         moved_res_arr = moved_res_arrs[i]
#         if verbosity > 1: print("    Checking",moved_res_arr)
#         within_movement_factor = True
#         if np.max(moved_res_arr_movement_factor) > REL_MOVEMENT_FACTOR_MAX*np.min(moved_res_arr_movement_factor):
#             if verbosity > 1: print("        Tensions are too diverse", [str(round(x*100,2))+'%' for x in moved_res_arr_movement_factor])
#             for j, res_seg in enumerate(moved_res_arr):
#                 if len(res_seg) == 1:
#                     moved_res_arr[j] = []
#                     moved_res_arr_movement_factor[j] = np.nan
#                     if verbosity > 1: print("        Dropping the short segment")
#             if np.nanmax(moved_res_arr_movement_factor) > REL_MOVEMENT_FACTOR_MAX*np.nanmin(moved_res_arr_movement_factor):
#                 within_movement_factor = False
#                 if verbosity > 1: print("        Tensions still too diverse", [str(round(x*100,2))+'%' for x in moved_res_arr_movement_factor])
#         if np.nanmax(moved_res_arr_movement_factor) > ABS_MOVEMENT_FACTOR_MAX or np.nanmin(moved_res_arr_movement_factor) < ABS_MOVEMENT_FACTOR_MIN:
#             if verbosity > 1: print("        Absolute movement factor out of range", [str(round(x*100,2))+'%' for x in moved_res_arr_movement_factor])
#             within_movement_factor = False

#         if within_movement_factor == False: 
#             continue
        
#         flat_res = np.array([sub_seg for res_seg in moved_res_arrs[i] for sub_seg in res_seg])
#         res_not_near_peak = []
#         for sub_seg in flat_res:
#             if np.max(np.min(np.abs(sub_seg-fpks_first_bump))) > NEAR_PEAK_DISTANCE:
#                 if sub_seg < np.min(f) or sub_seg > np.max(f):
#                     res_not_near_peak.append(sub_seg)
#                     if verbosity > 1: print(f"        This placement puts the resonance at {sub_seg} outside the scanned range ({np.min(f)}, {np.max(f)})")
#                     continue
                    
#                 t_smooth_interp = interp1d(f, pythag_smooth)
#                 if t_smooth_interp(sub_seg) < NEAR_PEAK_AMPLITUDE:
#                     res_not_near_peak.append(sub_seg)
#                     if verbosity > 1: print(f"        This placement puts the resonance at {sub_seg} more than {NEAR_PEAK_DISTANCE} from a peak and not in a high amplitude region ({t_smooth_interp(sub_seg)}).")
#         if res_not_near_peak:
#             continue
            
#         pruned_moved_res_arrs.append(moved_res_arrs[i])
#         pruned_moved_res_arr_movement_factors.append(moved_res_arr_movement_factors[i]) 
#     if verbosity > 1: 
#         if verbosity > 1: print("The following placements look valid, now checking which one is optimal")   

#     pruned_moved_res_arr_costs = []
#     for moved_res_arr in pruned_moved_res_arrs:
#         cost = 0
#         flat_res = []
#         for res_seg in moved_res_arr:
#             for sub_seg in res_seg:
#                 if sub_seg is not np.nan: flat_res.append(sub_seg)
#         for i,fpk in enumerate(fpks_first_bump):
#             #if fpk < COST_F_THRESH:
#             diffs = np.abs((fpk-flat_res))
#             index_for_cost = np.argmin(diffs)
#             fpk_cost = diffs[index_for_cost]*peak_heights[i]*((np.max(f)-fpk)/(np.max(f)-np.min(f)))
#             if i == 0: fpk_cost *= COST_FIRST_PEAK_FACTOR
#             cost += fpk_cost
#         cost = round(cost,2)
#         pruned_moved_res_arr_costs.append(cost)
    

#     if verbosity > 1: 
#         sorted_res_arr = [x for _, x in sorted(zip(pruned_moved_res_arr_costs, pruned_moved_res_arrs))]
#         sorted_costs = sorted(pruned_moved_res_arr_costs)
#         for cost, res_arr in zip(sorted_costs, sorted_res_arr):
#             print(f"    Cost: ({cost}) for {res_arr}")

    
#     selected_moved_res_arr = []
#     if len(pruned_moved_res_arr_costs):
#         selected_moved_res_arr_index = np.argmin(pruned_moved_res_arr_costs)
#         selected_moved_res_arr = pruned_moved_res_arrs[selected_moved_res_arr_index]

#     if verbosity > 1: print("Selected placement", selected_moved_res_arr)   
    
#     selected_tension = []
#     if selected_moved_res_arr:
#         for i in range(len(expected_resonances)):
#             if selected_moved_res_arr[i] == []:
#                 selected_tension.append([])
#             else:
#                 selected_tension.append(nominalTension*(np.max(selected_moved_res_arr[i])/np.max(expected_resonances[i]))**2)

#     if selected_moved_res_arr == []:
#         return segments, default_res_arr, default_tensions, default_confidences
#     else:
#         return segments, selected_moved_res_arr, selected_tension, [0]*len(selected_tension)
