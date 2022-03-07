# /////////////////////////////////////////////////////////////////
# 
#This is the file that contains the functions for calculating the capacitance 
# A DWA-specific pickle file named 'fit.pickle' is required in the same directory
# 
# The scan data is assumed to have been taken in 2021 (can be set below)
# 
#
# Author:	Shion Kubota
# Date:		02/15/2022
#
# /////////////////////////////////////////////////////////////////

# These variables can be changed
pickled_fit = './Continuity/fit.pickle'			# pickled file for the specific DWA
year = '2022'						# year when theh scan was taken 

import numpy as np
import os
import re
import sys
from defCalibration import extract_data_json, extract_channel, my_dictionary
from scipy.optimize import curve_fit
import pickle
import ntpath


class MyCustomUnpickler(pickle.Unpickler):
    def find_class(self, module, name):
        if module == "__main__":
            module = "defCalibration"
        return super().find_class(module, name)

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


def connectivityTest(json_dir):
#def connectivityTest():
	
	channelNameArr_all = []								# array to store the name of ALL channels in this file
	uncalibratedCapArr_all = []							# array to store the uncalibrated capacitance value of ALL the channels in this file
	channelNameArr = []									# array to store the name of calibrated channels in this file
	uncalibratedCapArr = []								# array to store the uncalibrated capacitance value of calibrated channels in this file
	calibratedCapArr = []								# array to store the calibrated capacitance value in this file
	booleanArr = []										# array to store the pass/fail result from the connectivity test

	#json_dir = "CERNscan/X_B_2_82-84-86-88-90-92-94-96_20211026T090254";

	dir_name = ntpath.basename(json_dir)				# name of the directory where json ampitude file is stored
	#fit = pickle.load(open( pickled_fit, "rb" ))
	#fit = CustomUnpickler(open(pickled_fit, 'rb')).load()

	with open(pickled_fit, 'rb') as f:
		unpickler = MyCustomUnpickler(f)
		fit = unpickler.load()

	path = json_dir + '/amplitudeData.json'
	data = extract_data_json(path)				# data has the format of (freq)(amp_1)(amp_2)...(amp_4/8)
	channel = extract_channel(path)				# channel name ["U1","U2",...]
	for i in range(len(channel)):
		channelNameArr_all.append(channel[i])
		uncalibratedCapArr_all.append(returnCap(i,data))

	for i in range(len(channelNameArr_all)):
		if channelNameArr_all[i] in fit:
			coeff = fit[channelNameArr_all[i]]

		else:
			channelNum = int(str(channelNameArr_all[i])[1:])
			channelName = 'X' + str(channelNum)
			coeff = fit[channelName]

		val = (coeff[0][0] + coeff[0][1]*uncalibratedCapArr_all[i])*(10**12)	
			
		if uncalibratedCapArr_all[i]*(10**12) < 150:
			booleanArr.append(False)
		else:
			booleanArr.append(True)

		channelNameArr.append(channelNameArr_all[i])
		calibratedCapArr.append(val)
		uncalibratedCapArr.append(uncalibratedCapArr_all[i]*(10**12))

	return channelNameArr, booleanArr, uncalibratedCapArr, calibratedCapArr
