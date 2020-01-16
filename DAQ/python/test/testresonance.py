import sys
import numpy as np
import matplotlib.pyplot as plt
import dwaTools as dwa

print("stimPeriodOfFreq = {}".format(dwa.stimPeriodOfFreq(257.0)))
print("hexStringOfFreq = [{}]".format(dwa.hexStringOfFreq(257.0)))
sys.exit()

#f0 = 120.0 # Hz
f0 = 150.0 # Hz
a0 = 0.3 # volts
slope = 0.02/50   # Volts/Hz
cc = 100.0
gamma = 3.0
freqs = np.linspace(100, 200, num=100)

ampls = dwa.resonanceModel(freqs, a0, slope, cc, f0, gamma)
plt.plot(freqs, ampls)
plt.plot(freqs, ampls, 'ko')
plt.ion()
plt.show()




nSamples = 100 # samples per waveform, at a single frequency
dt = 0.5e-3    # seconds
tt = np.arange(nSamples)*dt

freqs = np.linspace(100, 200, num=10)

ampls = dwa.resonanceModel(freqs, a0, slope, cc, f0, gamma)
plt.plot(freqs, ampls, 'ro')
sys.exit()

plt.clf()
for freq in freqs:
    ampl = dwa.resonanceModel(freq, a0, slope, cc, f0, gamma)
    vv = ampl*np.sin(2*np.pi*freq*tt)
    plt.plot(tt, vv)

