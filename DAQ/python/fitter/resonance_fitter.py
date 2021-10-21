import numpy as np
from scipy.signal import savgol_filter
from scipy.optimize import curve_fit
from scipy.stats import chisquare

def array_fragment(freqs, amps, f0, f1):
    selection = (freqs>=f0) & (freqs<=f1)
    return freqs[selection], amps[selection]

def baseline_subtracted(amps):
    smooth_curve = savgol_filter(amps, 51, 3)
    return savgol_filter(amps-smooth_curve, 7, 2)

def get_resonance_estimates(freqs, amps):
    bsub = baseline_subtracted(amps)
    resonances = []
    next_zero_crossing = False
    for i, a in enumerate(bsub):
        f = freqs[i]
        if next_zero_crossing and a < 0:
            resonances.append(f)
            next_zero_crossing = False
        if f > freqs[0] + 5 and f < freqs[-1] - 5 and a < -2 and (resonances == [] or f > np.max(resonances) + 2):
            frag_f0, frag_a0 = array_fragment(freqs, bsub, f - 1, f + 1)
            frag_f1, frag_a1 = array_fragment(freqs, bsub, f - 1, f)
            frag_f2, frag_a2 = array_fragment(freqs, bsub, f, f+1)
            if np.max(np.abs(frag_a0)) < 50 and np.max(frag_a1) > 2 and np.max(frag_a2) > 2:
                next_zero_crossing = True
    return resonances

def func(x, a, b, c, d, l):
  return a*np.sin(x*x*b + x*c +d)*np.exp(-x*l)

def process_r2(sel_f,sel_a,sel_r2):
    resonances = []
    for j in range(len(sel_f)):
        this_f = sel_f[j]
        frag_f, frag_a = array_fragment(sel_f, sel_a, this_f, this_f+3)
        max_index = frag_a.argmax(axis=0)
        new_res = frag_f[max_index]
        if resonances == [] or new_res > resonances[-1] + 3:
            resonances.append(new_res)
    return resonances

def get_r2(f,a,fr):
    f = np.array(f)
    a = np.array(a)
    bsub = baseline_subtracted(a)
    x,y = array_fragment(f,bsub,fr,fr+2)
    x = x - x[0]        
    p0 = np.array([12,1e-2,9,0,0.5])
    coeffs = p0
    y_p0 = func(x, p0[0], p0[1], p0[2], p0[3], p0[4])
    param_bounds=([1e-3,1e-3,1e-3,0,1e-3],[50,10,20,2*np.pi,10])
    #try:
    coeffs, matcov = curve_fit(func, x, y, p0, bounds=param_bounds)
    #except:
    #    pass
    y_fit = func(x, coeffs[0], coeffs[1], coeffs[2], coeffs[3], coeffs[4])
    p0 = coeffs
    # residual sum of squares
    ss_res = np.sum((y - y_fit) ** 2)
    # total sum of squares
    ss_tot = np.sum((y - np.mean(y)) ** 2)
    # r-squared
    r2 = 1 - (ss_res / ss_tot)
    return r2

def get_resonances(f, a):
    f = np.array(f)
    a = np.array(a)
    res_f  = []
    res_a  = []
    res_r2 = []
    if len(f)==0: return
    possible_res = get_resonance_estimates(f, a)
    bsub = baseline_subtracted(a)
    w = 40
    for j in range(0,len(f)-w,2):
        if np.min(np.abs(possible_res-f[j]))>2: continue
        x = f[j:j+w]
        y = bsub[j:j+w]
        x = x - x[0]        
        p0 = np.array([7,1,6,0.5])
        y_p0 = func(x, p0[0], p0[1], p0[2], p0[3])
        param_bounds=([1e-3,1e-3,1e-3,1e-3],[50,10,20,10])
        try:
            coeffs, matcov = curve_fit(func, x, y, p0, bounds=param_bounds)
        except:
            pass
        y_fit = func(x, coeffs[0], coeffs[1], coeffs[2], coeffs[3])
        p0 = coeffs
        # residual sum of squares
        ss_res = np.sum((y - y_fit) ** 2)
        # total sum of squares
        ss_tot = np.sum((y - np.mean(y)) ** 2)
        # r-squared
        r2 = 1 - (ss_res / ss_tot)
            
        res_f.append(f[j])
        res_a.append(coeffs[0])
        res_r2.append(r2)

    arr_f = np.array(res_f)
    arr_a = np.array(res_a)
    arr_r2 = np.array(res_r2)
    selection = (arr_r2>0.7) & (arr_a>2.5)
    sel_f = arr_f[selection]
    sel_a = arr_a[selection]
    sel_r2 = arr_r2[selection]
    resonances = process_r2(sel_f,sel_a,sel_r2)
    return resonances