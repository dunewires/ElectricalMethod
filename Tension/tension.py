import visa
import pyvisa
from Instruments import function_generator
from Instruments import oscilloscope 
import time
import pylab
import array
import fitter
import numpy as np



cha = 1                       #Channel No.
sweep_function = "SIN"        #Sweep Function
sweep_amp = 5                 #Sweep Amplitude
sweep_freq_start = 15         #Sweep Starting Frequency
sweep_freq_stop = 100         #Sweep Stopping Frequency
sweep_duration = 20           #Sweep Duration
sweep_stops = 6               #No. of Stops in Sweep 

Output = []
Frequency = []

#For plotting a continuous fit function
x = np.linspace(0, 110, 500)   

y_fit = []
y_ifit = []

#Fit Parameters
# par[0] = c1, par[1] = c2, par[2] = Gamma, par[3] = resonant frequency
parameters = []

#Initial guess for fit parameters
par = [1,2,0.3,500]


#Calls function generator to sweep sine signal and make measurement from the oscillosope simultaneously
function_generator.sweep_meas(cha, sweep_function, sweep_amp, sweep_freq_start, sweep_freq_stop, sweep_duration, sweep_stops, Output, Frequency)

#Fits the output amplitude vs frequency waveform from the oscilloscope
fitter.bipolar_reso(Output, Frequency, par, y_fit, y_ifit, parameters)

mu = 1.6*(10**(-4))          #Mass density of the Copper-Beryllium Wire
omega = parameters[3]        #Resonant Frequency
wire_len = 6                 #Length of the Wire   

tension = 4*mu*(omega*wire_len/(2*np.pi))**2
print(tension)


pylab.plot(Frequency, Output, 'bo', label='Data')
pylab.plot(x, fitter.resonance(x, parameters[0] , parameters[1], parameters[2], parameters[3]), 'r', label='Fit Function')
pylab.legend(loc='upper left')
pylab.title('Frequency Spectrum')
pylab.xlabel('Frequency (Hz)')
pylab.ylabel('Amplitude (V)')
 
pylab.show()


