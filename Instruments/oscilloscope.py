import visa
import numpy as np
from struct import unpack
import pylab
import math
import xlsxwriter
import array

rm = visa.ResourceManager()

#Tektronix MSO2024B
scope = rm.open_resource('USB0::0x0699::0x03A4::C030230::INSTR')


#Acquiring Data from the Oscilloscope
def acquire(cha, Volts, Time):

	scope.write("DATA:SOU CH%s" %cha)
	scope.write('DATA:WIDTH 1')
	scope.write('DATA:ENC RPB')

	ymult = float(scope.query('WFMPRE:YMULT?'))
	yzero = float(scope.query('WFMPRE:YZERO?'))
	yoff = float(scope.query('WFMPRE:YOFF?'))
	xincr = float(scope.query('WFMPRE:XINCR?'))

	scope.write('CURVE?')
	data = scope.read_raw()
	headerlen = 2 + int(data[1])
	header = data[:headerlen]
	ADC_wave = data[headerlen:-1]

	ADC_wave = np.array(unpack('%sB' % len(ADC_wave),ADC_wave))

	Volts = (ADC_wave - yoff) * ymult  + yzero

	Time = np.arange(0, xincr * len(Volts), xincr)

#Measuring the Amplitude and Frequency of the Waveform
def measure(cha, amp, freq, dur, stops):

	scope.write('HORizontal:SCAle 1E-2')
	scope.write("MEASUrement:IMMed:SOU%s" %cha)

	scope.write('MEASU:IMM:TYPE FREQ')	
	freq_meas = float(scope.query('MEASUrement:IMMed:VALue?'))

		#To avoid high frequency noise
	if (freq_meas < 1000000): 
		freq.append(freq_meas)

		scope.write('MEASU:IMM:TYPE AMP')	
		amp_meas = float(scope.query('MEASUrement:IMMed:VALue?'))
		amp.append(amp_meas)
	

 

		
	



