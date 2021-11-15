from defCalibration import pathGen, extract_data_json, getChannelName
import copy
import numpy as np
import pickle
import sys
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import axes3d
from matplotlib.colors import ListedColormap
import seaborn as sns
import pandas as pd
from scipy.optimize import curve_fit

dir = str(sys.argv[1])


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
    
fit = pickle.load(open( "fit.pickle", "rb" ) )

dataL8 = [];
dataf4 = [];
dataR8 = [];
datal4 = [];
data = [dataL8, dataR8, dataf4, datal4]


layerL8 = ["V17","V18","X25","X26","U1","U2"]
layerR8 = ["V1","V2","X1","X2","U17","U18"]
layerl4 = ["V33","V34","X17","X18"]
layerf4 = ["X41","X42","U33","U34"]


pathL8 = [];
pathR8 = [];
pathf4 = [];
pathl4 = [];

for config in layerL8:
    path = dir + "/" + config + ".json"
    pathL8.append(path)

for config in layerf4:
    path = dir + "/" + config + ".json"
    pathf4.append(path)
    
for config in layerR8:
    path = dir + "/" + config + ".json"
    pathR8.append(path)
    
for config in layerl4:
    path = dir + "/" + config + ".json"
    pathl4.append(path)
   

# dataL8
for config in pathL8:
    dataL8.append(np.transpose(extract_data_json(config)));

# dataf4
for config in pathf4:
    dataf4.append(np.transpose(extract_data_json(config)[[0,1,2,3,4],:]));

# dataR8
for config in pathR8:
    dataR8.append(np.transpose(extract_data_json(config)));

# datal4
for config in pathl4:
    datal4.append(np.transpose(extract_data_json(config)[[0,5,6,7,8],:]));

sectionArray = ['L8','R8','F4','L4'];
L8Config = ["V17","V18","X25","X26","U1","U2"]
R8Config = ["V1","V2","X1","X2","U17","U18"]
L4Config = ["V33","V34","X17","X18"]
F4Config = ["X41","X42","U33","U34"]

frequencyArr = dataL8[0][:,0]
data_dict = my_dictionary();

resultArray = [];

t = [];
m =[];
b = [];

index = 0;
# check for all the section
for section in sectionArray:
    if section == 'L8':
        # 6 different configs in L8
        for config in range(6):
            # 8 different channels in each configuration
            for channel in range(8):
                channelName = getChannelName(section, config, channel)
                amp = dataL8[config][:,channel+1]
                coeff = fit[channelName]
                popt, pcov =  curve_fit(calcGain, frequencyArr, amp, [100*1e-12, 5000])
                fitCap = popt[0]
                capVal = coeff[0][0] + coeff[0][1]*fitCap
                if capVal*1e12 > 360:
                    t.append(float(capVal*1e12));
                elif capVal*1e12 < 310 and capVal*1e12>200:
                    b.append(float(capVal*1e12));
                else:
                    m.append(float(capVal*1e12));
                resultArray.append([channelName, float(capVal*1e12)])
                
    elif section == 'R8':
        # 6 different config in R8
        for config in range(6):
            # 8 different channels in each configuration
            for channel in range(8):
                channelName = getChannelName(section, config, channel)
                amp = dataR8[config][:,channel+1]
                coeff = fit[channelName]
                popt, pcov =  curve_fit(calcGain, frequencyArr, amp, [100*1e-12, 5000])
                fitCap = popt[0]
                capVal = coeff[0][0] + coeff[0][1]*fitCap
                if capVal*1e12 > 360:
                    t.append(float(capVal*1e12));
                elif capVal*1e12 < 310 and capVal*1e12>200:
                    b.append(float(capVal*1e12));
                else:
                    m.append(float(capVal*1e12));
                resultArray.append([channelName, float(capVal*1e12)])
                
    elif section == 'F4':
        # 4 different config in F4
        for config in range(4):
            # 4 different channels in each configuration
            for channel in range(4):
                channelName = getChannelName(section, config, channel)
                amp = dataf4[config][:,channel+1]
                coeff = fit[channelName]
                popt, pcov =  curve_fit(calcGain, frequencyArr, amp, [100*1e-12, 5000])
                fitCap = popt[0]
                capVal = coeff[0][0] + coeff[0][1]*fitCap
                if capVal*1e12 > 360:
                    t.append(float(capVal*1e12));
                elif capVal*1e12 < 310 and capVal*1e12>200:
                    b.append(float(capVal*1e12));
                else:
                    m.append(float(capVal*1e12));
                resultArray.append([channelName, float(capVal*1e12)])
                
    elif section == 'L4':
        # 4 different config in L4
        for config in range(4):
            # 4 different channels in each configuration
            for channel in range(4):
                channelName = getChannelName(section, config, channel)
                amp = datal4[config][:,channel+1]
                coeff = fit[channelName]
                popt, pcov =  curve_fit(calcGain, frequencyArr, amp, [300*1e-12, 5000])
                fitCap = popt[0]
                capVal = coeff[0][0] + coeff[0][1]*fitCap
                if capVal*1e12 > 360:
                    t.append(float(capVal*1e12));
                elif capVal*1e12 < 310 and capVal*1e12>200:
                    b.append(float(capVal*1e12));
                else:
                    m.append(float(capVal*1e12));
                resultArray.append([channelName, float(capVal*1e12)])
                
resultArray1 = np.array(resultArray)[:,1]
resultArray2 = [];
for i in range(len(resultArray1)):
    num =  float(resultArray1[i])
    resultArray2.append(num)
nums = np.arange(128)
nameArr = np.array(resultArray)[:,0]
fig = plt.figure()
plt.plot(nums, resultArray2, 'o')
plt.xticks(nums, nameArr, rotation = 'vertical', fontsize=5)
plt.show()


txt_file = open("result.txt", "w")
for row in resultArray:
    name = row[0]
    val = str(row[1])
    txt_file.writelines(name + ' ' + val + 'pF' + '\n')
txt_file.close()

topMean = np.mean(np.array(t))
middleMean = np.mean(np.array(m))
bottomMean = np.mean(np.array(b))

print(str(topMean) + 'pF, large')
print(str(middleMean) + 'pF, medium')
print(str(bottomMean) + 'pF, small')
