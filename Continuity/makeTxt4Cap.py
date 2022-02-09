### This file will take JsonFiles dir and can be run by

### python makeTxt4Cap.py JsonFiles2

### JsonFile should include the scans with calibration board (47pF, 100pF, 150pF, 220pF)
### Structure of the subdirectory should be 

### JsonFiles -- 47L/47R/100L/100R/150L/150R/220L/220R
### each of L directory should include 10 configuration scans (U1, U2, V17, V18, V33, V34, X25, X26, X41, X42)
### each of R directory should include 10 configuration scans (U17, U18, U33, U34, V1, V2, X1, X2, X17, X18)

### Example is includedd in the github in ElectricalMethod/Continuity/JsonFiles2


from defCalibration import pathGen, extract_data_json1, plot3Ddata, getInterpolation, channelData
import copy
import numpy as np
import sys

# JsonFile directory name should be the argument 
dir = str(sys.argv[1])

# making idctionary
class my_dictionary(dict):
    # __init__ function
    def __init__(self):
        self = dict()
    # Function to add key:value
    def add(self, key, value):
        self[key] = value

# data will be stored in those array
dataL8 = [[],[],[],[]];
dataf4 = [[],[],[],[]];
dataR8 = [[],[],[],[]];
datal4 = [[],[],[],[]];
data = [dataL8, dataR8, dataf4, datal4]

[pathL8, pathR8, pathf4, pathl4] = pathGen(dir);     # array storing the path to the json file by pathGen('name-of-directory')

# pathArrL8 = 47V17, 47V18, 47X25, 47X26, 4U1, 47U2, 100V17, ..., 200U1, 200U2
# pathArrR8 = 47V1, 47V2, 47X1, 47X2, 47U17, 47U18, 100V1, ..., 200U17, 200U18
# pathArrf4 = 47X41, 47X42, 47U33, 47U34, 100X41, ..., 220U33, 220U34
# pathArrl4 = 47V33, 47V34, 47X17, 47X18, 100V33, ..., 220X17, 220X18

# dataL8
boardNum8 = 0;
for board in pathL8:            # 47/100/150/220
    for config in board:        # V17, V18,... config = eg. 47V17.json/ 47V18.json ...
        dataL8[boardNum8].append(np.transpose(extract_data_json1(config)));
    boardNum8 = boardNum8 +1;
# dataf4
boardNum4 = 0;
for board in pathf4:
    for config in board:
        # first 4 channels
        dataf4[boardNum4].append(np.transpose(extract_data_json1(config)[[0,1,2,3,4],:]));
        #dataf4[boardNum4].append(np.transpose(extract_data_json(config)));
    boardNum4 = boardNum4 +1;
# dataR8
boardNum8 = 0;
for board in pathR8:
    for config in board:
        dataR8[boardNum8].append(np.transpose(extract_data_json1(config)));
    boardNum8 = boardNum8 +1;
# datal4
boardNum4 = 0;
for board in pathl4:
    for config in board:
        # last 4 channels
        datal4[boardNum4].append(np.transpose(extract_data_json1(config)[[0,5,6,7,8],:]));
        #datal4[boardNum4].append(np.transpose(extract_data_json(config)));
    boardNum4 = boardNum4 +1;



sectionArray = ['L8','R8','F4','L4'];
L8Config = ["V17","V18","X25","X26","U1","U2"]
R8Config = ["V1","V2","X1","X2","U17","U18"]
L4Config = ["V33","V34","X17","X18"]
F4Config = ["X41","X42","U33","U34"]

bigData = [];
nameArr = []

# check for all the section
for section in sectionArray:
    if section == 'L8':
        # 6 different configs in L8
        for config in range(6):
            # 8 different channels in each configuration
            for channel in range(8):
                contents, channelName = channelData(section, config, channel, data)
                nameArr.append(channelName)
                bigData.append(contents)

    elif section == 'R8':
        # 6 different config in R8
        for config in range(6):
            # 8 different channels in each configuration
            for channel in range(8):
                contents, channelName = channelData(section, config, channel, data)
                nameArr.append(channelName)
                bigData.append(contents)

    elif section == 'F4':
        # 4 different config in F4
        for config in range(4):
            # 4 different channels in each configuration
            for channel in range(4):
                contents, channelName = channelData(section, config, channel, data)
                nameArr.append(channelName)
                bigData.append(contents)

    elif section == 'L4':
        # 4 different config in L4
        for config in range(4):
            # 4 different channels in each configuration
            for channel in range(4):
                contents, channelName = channelData(section, config, channel, data)
                nameArr.append(channelName)
                bigData.append(contents)
             
bigData = np.array(bigData)
nameArr = np.array(nameArr)
#print(nameArr)

txt_file = open("extractFromJson.txt", "w")
for row in bigData:
    np.savetxt(txt_file, row)

txt_file2 = open("nameData.txt", "w")
for row in nameArr:
    txt_file2.writelines(row + '\n')
txt_file2.close()
