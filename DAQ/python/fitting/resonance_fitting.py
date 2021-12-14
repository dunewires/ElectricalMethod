from scipy import signal
import numpy as np
import itertools

def baseline_subtracted(amps):
    '''Use the savgol filter to smooth out a trace.'''
    smooth_curve = signal.savgol_filter(amps, 101, 3)
    return signal.savgol_filter(amps-smooth_curve, 7, 2)

def get_r2(arr):
    '''Comutes the r-squared of an array'''
    return np.sum(arr**2)

def reduce_values(arr):
    '''Right now this function reduces all amplitudes by the same amount, but we may eventually want to assign a cost to placing a resonance where there is none.'''
    absarr = np.abs(arr)
    arr[np.where(absarr>3)] *= 0.3
    arr[np.where(absarr<=3)] *= 0.3
    return arr

def reduce_surrounding(f,a,f0):
    '''Reduces amplitudes around f0 ro that the r2 decreases.'''
    idx = np.argmax(f>f0)
    idx1 = max(0,idx-100)
    idx2 = min(len(a)-1,idx+100)
    gaus = signal.gaussian(idx2-idx1, std=25)*0.8
    mult = -gaus + 1
    a[idx1:idx2] = a[idx1:idx2]*mult

def contains_resonances(arr,layer):
    '''Checks if a scan contains resonances by sliding a window across the scan and looking for variation in r2.'''
    abso = np.abs(arr)
    maxval = np.max(abso)
    if maxval < 10: 
        print("Max val too small")
        return False
    if maxval > 150: 
        print("Max val too large")
        return False
    r2l = get_r2(arr)/len(arr)
    if r2l < 20: return False
    if layer in ['G','X'] and r2l > 1000: 
        print("R-squared too large")
        return False
    if layer in ['U','V'] and r2l > 200: 
        print("R-squared too large")
        return False
    return True
    
def shift_res_seg_to_f0(res_seg, res, f0):
    '''Shift a resonance segment like [64,70,70] so that the given resonance matches f0'''
    return [x/res*f0 for x in res_seg]

def shift_res_arr_to_placement(res_arr, placement):
    '''Shift a resonance array like [[64,70,70],[70,85],[101]] so that the each permutation of the resonance in each segment corresponds to the placement frequencies'''
    l = len(res_arr)
    if l != len(placement): return np.array([res_arr])
    shifted_res_arrs = []
    if l == 1:
        for i,res0 in enumerate(np.unique(res_arr[0])):
            shifted_res_arr = []
            shifted_res_arr.append(shift_res_seg_to_f0(res_arr[0], res0, placement[0]))
            shifted_res_arrs.append(shifted_res_arr)
    if l == 2:
        for i,res0 in enumerate(np.unique(res_arr[0])):
            for j,res1 in enumerate(np.unique(res_arr[1])):
                shifted_res_arr = []
                shifted_res_arr.append(shift_res_seg_to_f0(res_arr[0], res0, placement[0])) 
                shifted_res_arr.append(shift_res_seg_to_f0(res_arr[1], res1, placement[1]))
                shifted_res_arrs.append(shifted_res_arr)
    if l == 3:
        for i,res0 in enumerate(np.unique(res_arr[0])):
            for j,res1 in enumerate(np.unique(res_arr[1])): 
                for k,res2 in enumerate(np.unique(res_arr[2])):
                    shifted_res_arr = []
                    shifted_res_arr.append(shift_res_seg_to_f0(res_arr[0], res0, placement[0]))
                    shifted_res_arr.append(shift_res_seg_to_f0(res_arr[1], res1, placement[1]))
                    shifted_res_arr.append(shift_res_seg_to_f0(res_arr[2], res2, placement[2])) 
            shifted_res_arrs.append(shifted_res_arr)
    return shifted_res_arrs   

def analyze_res_placement(f,a,res_arr,fpks):
    '''
    Arguments:
    f: frequency array
    a: amplitude array
    res_arr: 2D array of expected resonances for all the wire segments that correspond to the trace, ex. [[64, 69], [69,69,105]]
    fpks: array of possible peak positions found with the peak finder
    Returns:
    placements: list of valid placements for the resonances
    costs: list of costs associated with each placement
    diffs: list of summed differences from the nominal tensions associated with each placement
    tensions: list of tensions associated with each placement
    '''
    costs = []
    placements = []
    diffs = []
    tensions = []
    possible_placements = itertools.product(fpks, repeat=len(res_arr))
    for p, placement in enumerate(possible_placements):
        possible_res_arr = shift_res_arr_to_placement(res_arr, placement)
        for r, shifted_res_arr in enumerate(possible_res_arr):
            #print("-----------")
            #print(shifted_res_arr)
            #print(possible_placements[r])
            all_res_near_ex = True
            # See if all resonances are near an expected resonance
            # Make sure each other resonance is within 3 Hz of a peak
            for i,res_seg in enumerate(shifted_res_arr):
                for res in np.unique(res_seg):
                    #print(np.min(fpks - res))
                    #print(res)
                    if res > 120: continue # Noisy above 120, not a big deal if there's no match
                    if res > np.max(f): continue # Can't expect a resonance where there's no data
                    if np.min(np.abs(fpks - res)) > 4:
                        #print("failed proximity", res, fpks)
                        all_res_near_ex = False
                # Make sure it is somewhat near where expected
                ex_res_seg = res_arr[i]
                #print('offset ',np.abs(ex_res_seg[0] - res_seg[0])/ex_res_seg[0])
                num_res = len(ex_res_seg)
                offset = np.abs(ex_res_seg[0] - res_seg[0])/ex_res_seg[0] > 0.20
                if num_res == 1 and offset > 0.1:
                    #print("failed expectaion")
                    all_res_near_ex = False
                elif offset > 0.25:
                    #print("failed expectaion")
                    all_res_near_ex = False

            # If all resonances are valid, compute the cost
            #print(all_res_near_ex, shifted_res_arr)
            if all_res_near_ex:
                reduced_a = a.copy()
                for res_seg in shifted_res_arr:
                    for res in res_seg:
                        reduce_surrounding(f,reduced_a,res)
                cost = np.sum(reduced_a)
                costs.append(cost)
                placements.append(shifted_res_arr)
                # Calculate diff
                diff = 0
                tension_arr = []
                for i, res_seg in enumerate(res_arr):
                    diff += np.sum(np.abs(np.array(res_seg)-np.array(shifted_res_arr[i])))
                    minMeasured = np.min(shifted_res_arr[i])
                    minExpected = np.min(res_seg)
                    tension_arr.append(6.5*(minMeasured/minExpected)**2)
                diffs.append(diff)
                tensions.append(tension_arr)
                    
    return placements, costs, diffs, tensions
