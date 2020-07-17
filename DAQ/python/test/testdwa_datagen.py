import sys
import numpy as np
import dwaTools as dwa  

nSamples = 100 # samples per waveform, at a single frequency  MUST BE EVEN
dt = 0.5e-3    # seconds
phase = np.pi*0.5  # phase shift
amplFactor = 3.0

fmin = 100
fmax = 200
nf   = 3
freqs = np.linspace(fmin, fmax, num=nf)

# adc sampling dt
adc_dt = 2.0e-6
nskip = int(dt/adc_dt)-1
skipStr = dwa.adcSkipHexStringOfDt(dt, adc_dt=adc_dt)
#print('skipStr = {}'.format(skipStr))

#print('data = {}'.format(dwa.hexStrOfSignedInt(-54, 4)))
#print('data = {}'.format(dwa.hexStrOfSignedInt(54, 4)))
#print('data = {}'.format(dwa.hexStrOfSignedInt(-54, 6)))

dt_actual = adc_dt*(nskip+1)
tt = np.arange(nSamples)*dt_actual

# parameters for the resonance model
f0 = 150.0 # Hz
a0 = 0.3 # volts
slope = 0.02/50   # Volts/Hz
cc = 100.0
gamma = 3.0

def adcify(voltage, vmax=5.0):
    # kluge for now: compute the ADC value of a voltage
    # assume range is +/- vmax (so +/- 5V) 
    # and that ADC is 16 bits
    return int( (voltage/vmax)*2**15 )

for freq in freqs:

    # hex string of (approximate) frequency
    #period_str = dwa.hexStringOfFreq(freq)  # e.g. '05EFF1'
    period_10ns = dwa.stimPeriodOfFreq(freq) # e.g. 389105
    period_str = dwa.hexStringOfPeriod(period_10ns) # e.g. '05EFF1'  (no 0x prefix)

    period_ms12 = period_str[0:3]  # e.g. '05E'
    period_ls12 = period_str[3:6]  # e.g. 'FF1'
    #print('[{}]'.format(period_str))
    #print('[{}]'.format(period_ms12))
    #print('[{}]'.format(period_ls12))

    # generate header information
    hdr1 = 'CAFE8{}'.format(period_ms12)   
    hdr2 = '8{}{}'.format(period_ls12, skipStr)

    print(hdr1)
    print(hdr2)

    # Compute the actual frequency ...
    freqActual = dwa.freqOfPeriod(period_10ns)
    # ... and the sine wave at that freq
    ampl = dwa.resonanceModel(freqActual, a0, slope, cc, f0, gamma)
    vv = amplFactor*ampl*np.sin(2*np.pi*freqActual*tt-phase)
    
    for ii in range(nSamples//2):
        # convert the floating point voltage to an integer (ADC value)

        data1 = dwa.hexStrOfSignedInt( adcify(vv[2*ii]),   strLen=4)
        data2 = dwa.hexStrOfSignedInt( adcify(vv[2*ii+1]), strLen=4)
        dataStr = data1+data2
        print(dataStr)

#print(dwa.freqOfPeriod(389105))
sys.exit()

