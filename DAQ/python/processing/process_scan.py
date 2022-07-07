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


def getAnalysisVersion():
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

def combine_results_dict(STAGES, APA_LAYERS, APA_SIDES, MAX_WIRE_SEGMENT, d1, d2):
    """Combine two results dictionaries"""
    resultsDict = new_results_dict(STAGES, APA_LAYERS, APA_SIDES, MAX_WIRE_SEGMENT)
    for stage in STAGES:
        for layer in APA_LAYERS:
            for side in APA_SIDES:
                for i in range(MAX_WIRE_SEGMENT[layer]):
                    segment = str(i).zfill(5)
                    resultsDict[stage][layer][side][segment] = {
                        "tension": {**d1[stage][layer][side][segment]["tension"], **d2[stage][layer][side][segment]["tension"]}, 
                        "continuity": {**d1[stage][layer][side][segment]["continuity"], **d2[stage][layer][side][segment]["continuity"]}
                    }
    return resultsDict

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
                for i in range(MAX_WIRE_SEGMENT[layer]):
                    resultsDict[stage][layer][side][str(i).zfill(5)] = blank_tension_result()
    return resultsDict

def update_results_dict_tension(resultsDict, stage, layer, side, scanId, wireSegments, tensions, tension_stds):
    for i, wireSegment in enumerate(wireSegments):
        tension = tensions[i]
        tension_std = tension_stds[i]
        wireSegmentStr = str(wireSegment).zfill(5)
        if wireSegmentStr not in resultsDict[stage][layer][side].keys(): resultsDict[stage][layer][side][wireSegmentStr] = blank_tension_result()
        if not tension: continue
        elif tension == -1:
            resultsDict[stage][layer][side][wireSegmentStr]["tension"][scanId] = {'tension': 'Not Found'}
        elif tension > 0:
            resultsDict[stage][layer][side][str(wireSegment).zfill(5)]["tension"][scanId] = {'tension': tension, 'tension_std': tension_std, 'submitted': 'Auto', 'algo_ver':algo_version}

def update_results_dict_continuity(resultsDict, stage, layer, side, scanId, wireSegments, continuous, capacitanceCal, capacitanceUnCal):
    for wireSegment in wireSegments:
        print("Writing ",stage,layer,side,scanId,wireSegment,continuous,capacitanceCal, capacitanceUnCal)
        resultsDict[stage][layer][side][str(wireSegment).zfill(5)]["continuity"][scanId] = {'continuous': continuous, 'capacitance_cal': capacitanceCal, "capacitance_un_cal": capacitanceUnCal}

#def update_results_dict(resultsDict, layer, side, scanId, wireSegments, tensions, tension_stds):
#    for i, wireNum in enumerate(wireSegments):
#        tension = tensions[i]
#        tension_std = tension_stds[i]
#        if not tension: continue
#        elif tension == -1:
#            resultsDict[layer][side][str(wireNum).zfill(5)]["tension"][scanId] = {'tension': 'Not Found'}
#        elif tension > 0:
#            #print(resultsDict.keys())
#            #print(resultsDict[layer].keys())
#            #print(resultsDict[layer][side].keys())
#            #print(resultsDict[layer][side][str(wireNum).zfill(5)].keys())
#            resultsDict[layer][side][str(wireNum).zfill(5)]["tension"][scanId] = {'tension': tension, 'tension_std': tension_std}

def refine_peak_position(f, a, fpk, radius):
    selected = (f > fpk - radius) & (f < fpk + radius)
    selected_f = f[selected]
    selected_a = a[selected]
    pks, props = find_peaks(selected_a,height=0.2*np.max(selected_a),width=4)
    if len(pks) == 0: return fpk
    fpks = np.array([selected_f[pk] for pk in pks])
    return fpks[0]

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

def process_channel(layer, apaCh, f, a, maxFreq=250., verbosity=0):
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
    select_best = (diffs < lowest_diff+20) & (costs < 1.5*lowest_cost)
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
    return segments, best_placement, best_tension, np.std(best_tensions,0), fpks

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

            segments, opt_res_arr, best_tensions, best_tension_stds = process_channel(layer, apaCh, f, a, maxFreq)
            results.append(best_tensions)
            if resultsDict:
                update_results_dict_tension(resultsDict, stage, layer, side, scanId, segments, best_tensions, best_tension_stds)
    return apaChannels, results


def process_scan(resultsDict, dirName, maxFreq=250., verbosity=0):
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

            segments, opt_res_arr, best_tensions, best_tension_stds, fpks = process_channel(layer, apaCh, f, a, maxFreq, verbosity)
            #print('best',best_tensions)
            results.append(best_tensions)
            if resultsDict:
                update_results_dict_tension(resultsDict, stage, layer, side, scanId, segments, best_tensions, best_tension_stds)
        
    return scanType, apaChannels, results
