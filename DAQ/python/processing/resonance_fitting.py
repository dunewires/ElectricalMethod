from scipy import signal
import numpy as np
import itertools

def get_num_savgol_bins(freq):
    step_size = freq[1] - freq[0]
    num_bins = int(round(27/(8*step_size)))
    if (num_bins % 2) == 0: num_bins += 1
    return num_bins

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
    '''Reduces amplitudes around f0 so that the r2 decreases.'''
    idx = np.argmax(f>f0)
    idx1 = max(0,idx-50)
    idx2 = min(len(a)-1,idx+50)
    gaus = signal.gaussian(idx2-idx1, std=20)*0.8
    mult = -gaus + 1
    a[idx1:idx2] = a[idx1:idx2]*mult

def contains_resonances(f,a,layer):
    '''Checks if a scan contains resonances by sliding a window across the scan and looking for variation in r2.'''
    a = a[f>f[0]+5]
    abso = np.abs(a)
    maxval = np.max(abso)
    r2l = get_r2(a)/len(a)
    if maxval < 4: 
        print("Max val too small")
        return False
    # if maxval > 150: 
    #     print("Max val too large")
    #     return False
    # if r2l < 20: 
    #     print("R-squared too small")
    #     return False
    # if layer in ['G','X'] and r2l > 1000: 
    #     print("R-squared too large")
    #     return False
    # if layer in ['U','V'] and r2l > 800: 
    #     print("R-squared too large")
    #     return False
    return True
    
def shift_res_seg_to_f0(res_seg, res, f0):
    '''Shift a resonance segment like [64,70,70] so that the given resonance matches f0'''
    return [round(x/res*f0,2) for x in res_seg]

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

def is_res_seg_valid(res_seg, fpks, ex_res_arr, f, i):
    for res in np.unique(res_seg):
        #print(np.min(fpks - res))
        #print(res)
        #if res > 120: continue # Noisy above 120, not a big deal if there's no match
        if res > np.max(f): continue # Can't expect a resonance where there's no data
        # Make sure each resonance is within 10% of a peak
        if np.min(np.abs(fpks - res))/res > 0.1:
            #print(" "," invalid because ",res," in ", res_seg," > 10 percent away from a peak")
            return False
    return True


def is_res_arr_valid(res_arr, fpks, peak_heights):
    flattened_res_arr = np.array([res for res_seg in res_arr for res in res_seg])
    # Make sure all large peaks under 200 Hz have a nearby resonance
    all_pks_near_res = True
    large_fpks = fpks[peak_heights > 0.4]
    for fpk in large_fpks:
        if fpk < 200 and np.min(np.abs(flattened_res_arr - fpk))/fpk > 0.1:
            #print(" ",shifted_res_arr," invalid because ",res," in ", res_seg," > 10 percent away from a peak")
            #print("failed proximity", res, fpks)
            all_pks_near_res = False
            return False
    return True

def add_viable_placement(f, a, res_arr, shifted_res_arr, costs, reductions, placements, diffs, tensions):
    reduced_a = a.copy()
    for res_seg in shifted_res_arr:
        for res in res_seg:
            reduce_surrounding(f,reduced_a,res)
    cost = np.sum(reduced_a)
    reductions.append(reduced_a)
    costs.append(cost)
    placements.append(shifted_res_arr)
    # Calculate diff
    diff = 0
    tension_arr = []
    for i, res_seg in enumerate(res_arr):
        diff += np.abs(np.min(res_seg)-np.min(shifted_res_arr[i]))
        minMeasured = np.min(shifted_res_arr[i])
        minExpected = np.min(res_seg)
        tension_arr.append(6.5*(minMeasured/minExpected)**2)
    diffs.append(diff)
    tensions.append(tension_arr) 

def analyze_res_placement(f,a,res_arr,fpks,peak_heights):
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
    reductions = []
    possible_placements = itertools.product(fpks, repeat=len(res_arr))
    if len(res_arr) == 1:
        for f0 in fpks:
            for res0 in res_arr[0]:
                if np.abs(f0 - res0)/res0 > 0.3: continue
                shifted_res_seg_0 = shift_res_seg_to_f0(res_arr[0], res0, f0)
                if not is_res_seg_valid(shifted_res_seg_0, fpks, res_arr, f, 0): continue
                shifted_res_arr = [shifted_res_seg_0]
                if not is_res_arr_valid(shifted_res_arr, fpks, peak_heights): continue
                add_viable_placement(f, a, res_arr, shifted_res_arr, costs, reductions, placements, diffs, tensions)
    
    if len(res_arr) == 2:
        for f0 in fpks:
            for res0 in res_arr[0]:
                if np.abs(f0 - res0)/res0 > 0.3: continue
                shifted_res_seg_0 = shift_res_seg_to_f0(res_arr[0], res0, f0)
                if not is_res_seg_valid(shifted_res_seg_0, fpks, res_arr, f, 0): continue
                for f1 in fpks:
                    for res1 in res_arr[1]:
                        if np.abs(f1 - res1)/res1 > 0.3: continue
                        shifted_res_seg_1 = shift_res_seg_to_f0(res_arr[1], res1, f1)
                        if not is_res_seg_valid(shifted_res_seg_1, fpks, res_arr, f, 1): continue                
                        shifted_res_arr = [shifted_res_seg_0,shifted_res_seg_1]
                        if not is_res_arr_valid(shifted_res_arr, fpks, peak_heights): continue
                        add_viable_placement(f, a, res_arr, shifted_res_arr, costs, reductions, placements, diffs, tensions) 
                        
    if len(res_arr) == 3:
        for f0 in fpks:
            for res0 in res_arr[0]:
                if np.abs(f0 - res0)/res0 > 0.3: continue
                shifted_res_seg_0 = shift_res_seg_to_f0(res_arr[0], res0, f0)
                if not is_res_seg_valid(shifted_res_seg_0, fpks, res_arr, f, 0): continue
                for f1 in fpks:
                    for res1 in res_arr[1]:
                        if np.abs(f1 - res1)/res1 > 0.3: continue
                        shifted_res_seg_1 = shift_res_seg_to_f0(res_arr[1], res1, f1)
                        if not is_res_seg_valid(shifted_res_seg_1, fpks, res_arr, f, 1): continue     
                        for f2 in fpks:
                            for res2 in res_arr[2]:
                                if np.abs(f2 - res2)/res2 > 0.3: continue
                                shifted_res_seg_2 = shift_res_seg_to_f0(res_arr[2], res2, f2)
                                if not is_res_seg_valid(shifted_res_seg_2, fpks, res_arr, f, 2): continue             
                                shifted_res_arr = [shifted_res_seg_0,shifted_res_seg_1,shifted_res_seg_2]
                                if not is_res_arr_valid(shifted_res_arr, fpks, peak_heights): continue
                                add_viable_placement(f, a, res_arr, shifted_res_arr, costs, reductions, placements, diffs, tensions)
                    
    return np.array(placements), np.array(costs), np.array(diffs), np.array(tensions), np.array(reductions)
