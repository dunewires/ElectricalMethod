from defCalibration import pathGen, extract_data_json, plot3Ddata, getInterpolation, channelData
import copy
import numpy as np
import sys

dir = str(sys.argv[1])

# making idctionary
class my_dictionary(dict):
    # __init__ function
    def __init__(self):
        self = dict()
    # Function to add key:value
    def add(self, key, value):
        self[key] = value

dataL8 = [[],[],[],[]];
dataf4 = [[],[],[],[]];
dataR8 = [[],[],[],[]];
datal4 = [[],[],[],[]];
data = [dataL8, dataR8, dataf4, datal4]

[pathL8, pathR8, pathf4, pathl4] = pathGen(dir);     # array storing the path to the json file by pathGen('name-of-directory')


# dataL8
boardNum8 = 0;
for board in pathL8:
    for config in board:
        dataL8[boardNum8].append(np.transpose(extract_data_json(config)));
    boardNum8 = boardNum8 +1;
# dataf4
boardNum4 = 0;
for board in pathf4:
    for config in board:
        # first 4 channels
        dataf4[boardNum4].append(np.transpose(extract_data_json(config)[[0,1,2,3,4],:]));
    boardNum4 = boardNum4 +1;
# dataR8
boardNum8 = 0;
for board in pathR8:
    for config in board:
        dataR8[boardNum8].append(np.transpose(extract_data_json(config)));
    boardNum8 = boardNum8 +1;
# datal4
boardNum4 = 0;
for board in pathl4:
    for config in board:
        # last 4 channels
        datal4[boardNum4].append(np.transpose(extract_data_json(config)[[0,5,6,7,8],:]));
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
