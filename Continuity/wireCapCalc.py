## input -> year 2021 for the scan available now 
import numpy as np
import os
import re
import sys
from defCalibration import extract_data_json, extract_channel
from scipy.optimize import curve_fit
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import axes3d
from matplotlib.colors import ListedColormap
import pickle

scanDir = './CERNscan'
year = str(sys.argv[1])

wireInfo = []

channelNameArr = []
uncalibratedCapArr = []

calibratedChannelArr = []
calibratedCapArr = []

# making idctionary
class my_dictionary(dict):
    # __init__ function
    def __init__(self):
        self = dict()
    # Function to add key:value
    def add(self, key, value):
        self[key] = value

def getWireSegment(num, dirName):
	a = re.search(year, dirName).span()	# find when the time stamp begins
	wireSegments = dirName[num:a[0]-1]		# extracting only the part of ##-##-##- in th string
	wireArr = wireSegments.split("-")			# array with just wire segment number
	return wireArr

def calcGain(ff, CC, scale):
    #return (2 * np.pi * ff * R2 * CC)/np.sqrt(1 + (2 * np.pi * ff * (R1+R2)* CC) ** 2 )
    R1=1e5
    R2=1e6
    return scale*(2*np.pi*ff*R2*CC / np.sqrt(1 + (2*np.pi*ff*(R1+R2)*CC)**2))
    
def returnCap(i, data):
	frequency = data[0]
	amp = data[i+1]
	popt, pcov =  curve_fit(calcGain, frequency, amp, [100*1e-12, 5000])
	return popt[0]


fit = pickle.load(open( "fit.pickle", "rb" ))


for root, subdirectories, files in os.walk(scanDir):	# loop through the CERN directory
	for subdirectory in subdirectories:					# loop through each of the subdirectory

		if subdirectory[5] == '_':						# pick up the wire segment numbers sandwitched by '_', for the case headboard < 10
			wireArr = getWireSegment(6, subdirectory)
			path = scanDir + '/' + subdirectory + '/amplitudeData.json'
			data = extract_data_json(path)				# data (freq)(amp_1)(amp_2)...(amp_4/8)
			channel = extract_channel(path)				# channel name
			for i in range(len(channel)):
				channelNameArr.append(channel[i])
				uncalibratedCapArr.append(returnCap(i,data))
		if subdirectory[6] == '_':						# pick up the wire segment numbers sandwitched by '_', for the case headboard = 10
			wireArr = getWireSegment(7, subdirectory)
			path = scanDir + '/' + subdirectory + '/amplitudeData.json'
			data = extract_data_json(path)				# data (freq)(amp_1)(amp_2)...(amp_4/8)
			channel = extract_channel(path)				# channel name
	
## uncalibratedCapArr is array for uncalibrated capacitance value 

for i in range(len(channelNameArr)):
	if channelNameArr[i] in fit:
		coeff = fit[channelNameArr[i]]
		#print(coeff[0][1])
		calibratedChannelArr.append(channelNameArr[i])
		val = (coeff[0][0] + coeff[0][1]*uncalibratedCapArr[i])*(10**12)
		calibratedCapArr.append(val)
#		print(channelNameArr[i] + '    ' + str(val) + '		' + str(uncalibratedCapArr[i]*(10**12)) + '		 ' + str(coeff[0]))

fig = plt.figure()
xAxis = np.arange(len(calibratedChannelArr))
plt.plot(xAxis, calibratedCapArr, 'o')
plt.xticks(xAxis, calibratedChannelArr, rotation = 'vertical', fontsize=5)
plt.show()


txt_file = open("wireChannelResult.txt", "w")
for i in range(len(calibratedCapArr)):
    name = calibratedChannelArr[i]
    val = str(calibratedCapArr[i])
    txt_file.writelines(name + ' ' + val + 'pF' + '\n')
