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

def new_results_dictOLD(APA_LAYERS, APA_SIDES, MAX_WIRE_SEGMENT):
    resultsDict = {}
    for l in APA_LAYERS:
        resultsDict[l] = {}
        for s in APA_SIDES:
            resultsDict[l][s] = {}
            for i in range(MAX_WIRE_SEGMENT[l]):
                resultsDict[l][s][str(i).zfill(5)] = {"tension": {}, "continuity": {}}
    return resultsDict

def new_results_dict(STAGES, APA_LAYERS, APA_SIDES, MAX_WIRE_SEGMENT):
    resultsDict = {}
    for stage in STAGES:
        resultsDict[stage] = {}
        for layer in APA_LAYERS:
            resultsDict[stage][layer] = {}
            for side in APA_SIDES:
                resultsDict[stage][layer][side] = {}
                for i in range(MAX_WIRE_SEGMENT[layer]):
                    resultsDict[stage][layer][side][str(i).zfill(5)] = {"tension": {}, "continuity": {}}
    return resultsDict

def update_results_dict_tension(resultsDict, stage, layer, side, scanId, wireSegments, tensions, tension_stds):
    for i, wireNum in enumerate(wireSegments):
        tension = tensions[i]
        tension_std = tension_stds[i]
        if not tension: continue
        elif tension == -1:
            resultsDict[stage][layer][side][str(wireNum).zfill(5)]["tension"][scanId] = {'tension': 'Not Found'}
        elif tension > 0:
            resultsDict[stage][layer][side][str(wireNum).zfill(5)]["tension"][scanId] = {'tension': tension, 'tension_std': tension_std}

def update_results_dict_continuity(resultsDict, stage, layer, side, scanId, wireSegments, continuous, capacitanceCal, capacitanceUnCal):
    for wireNum in wireSegments:
        resultsDict[stage][layer][side][str(wireNum).zfill(5)]["continuity"][scanId] = {'continuous': continuous, 'capacitance_cal': capacitanceCal, "capacitance_un_cal": capacitanceUnCal}

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

            
def process_channel(layer, apaCh, f, a): 
    segments,expected_resonances = channel_frequencies.get_expected_resonances(layer,apaCh,200)
    roundex = []
    for seg in expected_resonances:
        roundex.append([round(x,2) for x in seg])
    expected_resonances = roundex
    segments_nolim, ex_nolim = channel_frequencies.get_expected_resonances(layer,apaCh,9e9)
    
    bsub = resonance_fitting.baseline_subtracted(np.cumsum(a))
    bsubabs = np.abs(bsub)
    smooth = savgol_filter(bsubabs, 51, 3)
    opt_reduced = smooth.copy()

    #if plot: ax.plot(f,bsub)
    if not resonance_fitting.contains_resonances(f,bsub,layer):
        print(f"DWA Chan {apaCh}: No resonances found")
        return segments, [-1 for s in segments], [-1 for s in segments]

    pks, _ = find_peaks(smooth,prominence=5)
    fpks = np.array([f[pk] for pk in pks])
    fpks = fpks[fpks>55] # TODO: Remove this once we solve the mains noise issue
    placements, costs, diffs, tensions = resonance_fitting.analyze_res_placement(f,smooth,expected_resonances,fpks)
    sorted_placements = np.array([x for _, x in sorted(zip(costs, placements))])
    sorted_diffs = np.array([x for _, x in sorted(zip(costs, diffs))])
    sorted_tensions = np.array([x for _, x in sorted(zip(costs, tensions))])
    sorted_costs = np.array([x for _, x in sorted(zip(costs, costs))])
    if len(sorted_costs) < 1:
        return segments, [-1 for s in segments], [-1 for s in segments]
    lowest_cost = sorted_costs[0]
    lowest_placement = sorted_placements[0]

    #print("lowest: ",lowest_placement)
    #print("sorted costs: ",sorted_costs[:3]) 
    #print("sorted placements: ",sorted_placements[:3]) 
    select_best = (sorted_costs < 1.2*lowest_cost)
    best_tensions = sorted_tensions[select_best]
    #print("best tensions: ",best_tensions)
    best_tension_stds = np.std(best_tensions,0)
    #print("best std: ",best_tensions_std)
    return segments, best_tensions[0], best_tension_stds

def process_scan(resultsDict, dirName):
    '''Process a scan with a given directory name.'''
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

    if scanType == 'Continuity':
        channelNameArr, booleanArr, uncalibratedCapArr, calibratedCapArr = capacitanceFile.connectivityTest(dirName)
        for i, apaChan in enumerate(channelNameArr):
            segments, _ = channel_frequencies.get_expected_resonances(layer,apaChan,200)
            continuous = booleanArr[i]
            capacitanceCal = calibratedCapArr[i]
            capacitanceUnCal = uncalibratedCapArr[i]
            update_results_dict_continuity(resultsDict, stage, layer, side, scanId, segments, continuous, capacitanceCal, capacitanceUnCal)

    else:
        for reg in range(8):
            dwaCh = str(reg)
            #print(data[dwaCh].keys())
            apaCh = data['apaChannels'][reg]
            if not apaCh:
                print(f"DWA Chan {reg}: No channel")
                continue
                
            f = np.array(data[dwaCh]['freq'])
            a = np.array(data[dwaCh]['ampl'])
            if len(f) == 0 or max(f) > 500 or len(f) < 250:
                print(f"DWA Chan {reg}: Not a valid scan")
                continue

            segments, best_tensions, best_tension_stds = process_channel(layer, apaCh, f, a)
            update_results_dict(resultsDict, stage, layer, side, scanId, segments, best_tensions, best_tension_stds)
