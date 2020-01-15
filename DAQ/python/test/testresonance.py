import numpy as np
import matplotlib.pyplot as plt
import dwaTools as dwa

#f0 = 120.0 # Hz
f0 = 45.0 # Hz
a0 = 1.0 # volts
slope = 0.0   # Volts/Hz
cc = 1.0
gamma = 0.1

npts = 500 
freqs = np.linspace(40, 50, num=npts)
ampls = dwa.resonanceModel(freqs, a0, slope, cc, f0, gamma)
plt.plot(freqs, ampls)
plt.ion()
plt.show()
