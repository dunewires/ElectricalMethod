from scipy.signal import savgol_filter
import numpy as np

def array_fragment(freqs, amps, f0, f1):
    selection = (freqs>=f0) & (freqs<=f1)
    return freqs[selection], amps[selection]

def baseline_subtracted(amps):
    smooth_curve = savgol_filter(amps, 101, 3)
    return savgol_filter(amps-smooth_curve, 7, 2)

def get_r2(arr):
    '''Comutes the r-squared of an array'''
    return np.sum(arr**2)

def reduce_values(arr):
    '''Right now this function reduces all amplitudes by the same amount, but we may eventually want to assign a cost to placing a resonance where there is none.'''
    absarr = np.abs(arr)
    arr[np.where(absarr>3)] *= 0.5
    arr[np.where(absarr<=3)] *= 0.5
    return arr

def reduce_surrounding(f,a,f0,w):
    '''Reduces amplitudes around f0 ro that the r2 decreases.'''
    indices = np.where((f>f0-w/4) & (f<f0+3*w/4))
    a[indices] = reduce_values(a[indices])
    
def contains_resonances(arr):
    '''Checks if a scan contains resonances by sliding a window across the scan and looking for variation in r2.'''
    r2s = []
    for i in range(0,len(arr)-51):
        r2s.append(get_r2(arr[i:i+50]))
    r2s = np.array(r2s)
    #print(np.min(r2s),np.mean(r2s),np.max(r2s))
    if np.max(r2s) > 3*np.mean(r2s) or np.max(r2s) > 100:
        return True
    else:
        return False
        

def optimize_res_placement(f,a,res):
    lowest_r2 = 9e9
    lowest_f = f[0]
    res0 = np.min(res)
    for i in range(0,len(f),2):
        if f[i] < res0*0.8 or f[i] > res0*1.2: continue
        reduced_a = a.copy()
        res_i = (f[i]/res0)*(res-res0)+res0
        res_i = res/res0*f[i]
        for r in res_i:
            reduce_surrounding(f,reduced_a,r,4)
        r2 = get_r2(reduced_a**2)
        #print(i,f[i],res,res_i,r2)
        if r2 < lowest_r2:
            lowest_r2 = r2
            lowest_f = f[i]
    return res + (lowest_f - res0)


    

