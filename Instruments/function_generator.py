import pyvisa
import time
import oscilloscope
import array

rm = pyvisa.ResourceManager()

#RIGOL DG992
fgenerator = rm.open_resource('USB0::0x1AB1::0x0643::DG9A210800180::INSTR')


def sweep(cha, func, amp, f_start, f_stop, dur, stops):
	slptime = dur/stops
	fgenerator.write("OUTP1 ON")

	for n in range(-1,stops):
		fgenerator.write("SOUR%s:APPL:%s %s,%s,0,0" %(cha, func, (f_start + (f_stop-f_start)*(n+1)/stops), amp))
		time.sleep(slptime)



def sweep_meas(cha, func, amp, f_start, f_stop, dur, stops, V_pk = [], freq = []):

	slptime = dur/stops
	fgenerator.write("OUTP1 ON")

	for n in range(-1,stops):
		if (n == -1):
			time.sleep(1)
			
		fgenerator.write("SOUR%s:APPL:%s %s,%s,0,0" %(cha, func, (f_start + (f_stop-f_start)*(n+1)/stops), amp))
		oscilloscope.measure(cha, V_pk, freq, dur, stops)
		time.sleep(slptime)

	
	
