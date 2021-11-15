import copy
import sys
import pickle
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
from mpl_toolkits.mplot3d import axes3d
from scipy.optimize import curve_fit
from numpy.polynomial import polynomial as P
from defCalibration import pathGen, extract_data_json, plot3Ddata, getInterpolation
import json



# making idctionary
class my_dictionary(dict):
    # __init__ function
    def __init__(self):
        self = dict()
    # Function to add key:value
    def add(self, key, value):
        self[key] = value

def calcGain(ff, CC, scale):
    #return (2 * np.pi * ff * R2 * CC)/np.sqrt(1 + (2 * np.pi * ff * (R1+R2)* CC) ** 2 )
    R1=1e5
    R2=1e6
    return scale*(2*np.pi*ff*R2*CC / np.sqrt(1 + (2*np.pi*ff*(R1+R2)*CC)**2))
    
    
def fitCapScale(channelNum, capType):
    global formatedData
    cap_ex = formatedData[channelNum][capType][0]
    data_ex = np.array(formatedData[channelNum][capType][1:23])
    ff  = data_ex[:,0]
    popt, pcov =  curve_fit(calcGain, ff, data_ex[:, 1], [cap_ex[0]*1e-12, 5000])
    cap = popt[0]
    scale = popt[1]
    return cap, scale

def plotFitting(channelNum, capType):
    global formatedData
    data_ex = np.array(formatedData[channelNum][capType][1:23])
    cap, scale = fitCapScale(channelNum, capType)
    fig = plt.figure()
    plt.plot(data_ex[:,0], data_ex[:,1], 'o', color = 'black')
    x = np.linspace(20,1000,50)
    ampExp = calcGain(x, cap, scale)
    sumchi = 0;
    for freq in range(len(data_ex[:,0])):
        chi = ((data_ex[freq][1] - calcGain(data_ex[freq][0], cap, scale))**2)/calcGain(data_ex[freq][0], cap, scale)
        sumchi = sumchi + chi;
    plt.plot(x, ampExp, 'r')
    plt.title('47pF fitting,  $\u03A7 ^2$ = ' + str(sumchi))
    
    
    
ffArray = np.linspace(20, 1028.0239, num=22)
capArray = np.array([47*1e-12, 100*1e-12, 150*1e-12, 220*1e-12])

XX = [];
YY = [];
ZZ = [];
data = [];
R1=1e5
R2=1e6


for CC in range(len(capArray)):
    data.append([])
    for ff in ffArray:
        data[CC].append(np.array([capArray[CC], ff, calcGain( ff, capArray[CC], 1)]))
        XX.append(capArray[CC])
        YY.append(ff)
        ZZ.append(calcGain( ff, capArray[CC], 1 ))

data = np.array(data)

#fig1 = plt.figure()
#ax = plt.axes(projection='3d')
#ax.plot3D(data[0][:,0], data[0][:,1], data[0][:,2], 'springgreen');
#ax.plot3D(data[1][:,0], data[1][:,1], data[1][:,2], 'turquoise');
#ax.plot3D(data[2][:,0], data[2][:,1], data[2][:,2], 'cyan');
#ax.plot3D(data[3][:,0], data[3][:,1], data[3][:,2], 'deepskyblue');


jsonData = np.loadtxt("extractFromJson.txt").reshape(128*88, 3)
nameData = []
with open("nameData.txt") as file:
    for line in file:
        line = line.strip() #or some other preprocessing
        nameData.append(line) #storing everything in memory!
        

'''
go through the ff and amp, use
https://iminuit.readthedocs.io/en/stable/index.html
https://docs.scipy.org/doc/scipy/reference/generated/scipy.optimize.least_squares.html
https://stackoverflow.com/questions/12208634/fitting-only-one-parameter-of-a-function-with-many-parameters-in-python
optimize the value of CC and scale

for freq in freqArr:
    popt, pcov =  curvea_fit(lambda CC, scale: calcGain([freq, CC, scale]), fre, amp)
there are 22 data points per capacitor
'''


'''
formatedData = [channel(0-127)][cappacitance(0-3)]([0 = measured cap] or [freq, amp])
'''

formatedData = [];
for dataPoint in range(len(jsonData)):
    if dataPoint % 88 == 0: ## per channel
        formatedData.append([])
    if dataPoint % 22 == 0:  ## per capacitabnce
        formatedData[int(dataPoint/88)].append([])
        formatedData[int(dataPoint/88)][int((dataPoint % 88)/22)].append([jsonData[dataPoint][0]])
    formatedData[int(dataPoint/88)][int((dataPoint % 88)/22)].append([jsonData[dataPoint][1], jsonData[dataPoint][2]])
        

fit_dict = my_dictionary();

channel = 0;

for channel in range(128):
    calculatedCap = [];
    measuredCap= [];
    name = nameData[channel]
    for capType in range(4):
        cap, scale = fitCapScale(channel, capType);
        #print(formatedData[channel][capType][0][0])
        calculatedCap.append(cap);
        measuredCap.append(formatedData[channel][capType][0][0]*1e-12)
    c, stats = P.polyfit(calculatedCap, measuredCap, 1, full = True)
    fit_dict.add(str(name), [c, channel])

    
    fig = plt.figure()
    plt.plot(calculatedCap, measuredCap, 'b')
    plt.plot(calculatedCap, measuredCap, 'o', color = 'b')
    plt.plot(calculatedCap, c[0] + c[1]*np.array(calculatedCap), 'r')
    plt.title('calculated vs measured for channel '+str(name))
    plt.xlabel('calculated capacitance')
    plt.ylabel('measured capacitance')
    #THIS IS THE THING THAT I LOOP THROUGH THING, CLOSE WINDOW, AND NEW THING POPS UP
    plt.show()
    # clear axes and figures
    plt.cla()
    plt.clf()
    plt.close()
    
inde = 0
# write string one by one adding newline
with open('dict.txt', 'w') as my_file:
    for st in fit_dict:
        my_file.write(f'{st}\n')
        inde = inde +1;
print(inde)
     
     
with open('fit.pickle', 'wb') as handle:
    pickle.dump(fit_dict, handle, protocol=pickle.HIGHEST_PROTOCOL)
handle.close()



