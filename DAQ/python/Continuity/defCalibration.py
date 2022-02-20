import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import axes3d
import pandas as pd
import copy
from mpl_toolkits import mplot3d
import scipy as sp
from scipy.interpolate import RBFInterpolator
import json
from scipy.interpolate import Rbf
from channel_map import apa_channel_to_board_channel

# create the array of paths to the json file
def pathGen(dir):
    pathArrL8 =[[],[],[],[]];
    pathArrR8 =[[],[],[],[]];
    pathArrL4 =[[],[],[],[]];
    pathArrR4 =[[],[],[],[]];
    pathArrf = [[],[],[],[]];
    pathArrl = [[],[],[],[]];
    
    capVal = ["47", "100", "150", "220"];
    sides = ["L","R"];
    layerL8 = ["V17","V18","X25","X26","U1","U2"] #8
    layerL4 = ["V33","V34","X41","X42"] #4 l4 l4, f4 f4
    layerR8 = ["V1","V2","X1","X2","U17","U18"]   #8
    layerR4 = ["X17","X18","U33","U34"] #4 l4 l4 f4 f4
    
    boardNum = 0;
    for cap in capVal:                                                  # 47, 100, 150, or 220
        for side in sides:                                              # L or R
            if side == "L":                                             # for the L side, 
                for layer in layerL8:                                   # V17, V18, X25, X26, U1, or U2
                    fileName = '/' + cap + layer + '.json';             # eg. fileName = /47U1.json
                    pathName = dir + '/' + cap + 'L' + fileName;        # eg. pathName = dir(JsonFile)/47L/47U1.json
                    pathArrL8[boardNum].append(pathName);               
                for layer in layerL4:
                    fileName = '/' + cap + layer + '.json';
                    pathName = dir + '/' +cap + 'L' + fileName;
                    pathArrL4[boardNum].append(pathName);

            else:
                for layer in layerR8:
                    fileName = '/' + cap + layer + '.json';
                    pathName = dir + '/' + cap + 'R' + fileName;
                    pathArrR8[boardNum].append(pathName);
                for layer in layerR4:
                    fileName = '/' + cap + layer + '.json';
                    pathName = dir + '/' +cap + 'R' + fileName;
                    pathArrR4[boardNum].append(pathName);

        boardNum = boardNum +1;
    
    pathArrL8 = np.array(pathArrL8)
    pathArrL4 = np.array(pathArrL4)
    pathArrR8 = np.array(pathArrR8)
    pathArrR4 = np.array(pathArrR4)
 
    pathArrf = copy.copy(pathArrR4)
    pathArrl = copy.copy(pathArrL4)
    
    pathArrf[:,0]=pathArrL4[:,2]
    pathArrf[:,1]=pathArrL4[:,3]
    pathArrl[:,2]=pathArrR4[:,0]
    pathArrl[:,3]=pathArrR4[:,1]

    return pathArrL8, pathArrR8, pathArrf, pathArrl

# extract json file's contents at the given path
def extract_data_json1(path):
    data=[];
    data.append([])
    file = open(path,)
    contents = json.load(file)
    # the first channel has the frequency element
    a = len(contents['0']['freq'])
    b = len(contents['4']['freq'])
    data = np.append(data, np.array([contents['0']['freq']]))
    for i in range(8):
        ampData = np.array(contents[str(i)]['ampl'])
        data=np.vstack((data, [ampData]))
    return np.array(data)


# extract json file's contents at the given path
def extract_data_json(path):
    data=[];
    data.append([])
    file = open(path,)
    contents = json.load(file)
    # the first channel has the frequency element
    a = len(contents['0']['freq'])
    b = len(contents['4']['freq'])

    if a != 0 and b != 0:
        data = np.append(data, np.array([contents['0']['freq']]))
        for i in range(8):
            ampData = np.array(contents[str(i)]['ampl'])
            data=np.vstack((data, [ampData]))
    elif a == 0:
        data = np.append(data, np.array([contents['4']['freq']]))
        for i in [4,5,6,7]:
            ampData = np.array(contents[str(i)]['ampl'])
            data=np.vstack((data, [ampData]))
    elif b == 0:
        data = np.append(data, np.array([contents['0']['freq']]))
        for i in [0,1,2,3]:
            ampData = np.array(contents[str(i)]['ampl'])
            data=np.vstack((data, [ampData]))
    return np.array(data)

def extract_channel(path):
    channelArr = [];
    file = open(path,)
    contents = json.load(file)
    # the first channel has the frequency element
    a = len(contents['0']['freq'])
    b = len(contents['4']['freq'])
    layer = contents['layer']

    if a != 0 and b != 0:
        channelNum = contents['apaChannels']
    elif a == 0:
        channelNum = contents['apaChannels'][4:]
    elif b == 0:
        channelNum = contents['apaChannels'][:4]

    for i in channelNum:
        channelArr.append(str(layer + str(apa_channel_to_board_channel(layer,i))))
    return channelArr


# get interpolation of specific channel
def getInterpolation(section, configNum, chanNum, datas):
    # extract channel data, and calculate the title
    data, title = channelData(section,configNum,chanNum, datas)
    # interpolate the data
    P1, P2, P3, func = interpolate3Ddata(data)
    return title, func

# get interpolation of specific channel
def getChannelName(section, configNum, chanNum):

    L8Config = ["V17","V18","X25","X26","U1","U2"]
    R8Config = ["V1","V2","X1","X2","U17","U18"]
    L4Config = ["V33","V34","X17","X18"]
    F4Config = ["X41","X42","U33","U34"]
    
    if (section=="L8"):
        layerStr = (L8Config[configNum])[:1]
        if layerStr == "U":
            channelStr = str(int((L8Config[configNum])[1:]) + chanNum*2)
            title = layerStr + channelStr
        elif layerStr == "V":
            channelNum = int((L8Config[configNum])[1:]) + (7-chanNum)*2
            channelStr = str(channelNum)
            title = layerStr + channelStr
        elif layerStr == "X":
            if int((L8Config[configNum])[1:])%2==0:
                Xlist = [32, 30, 28, 26, 40, 38, 36, 34]
                channelNum = Xlist[chanNum]
                channelStr = str(channelNum)
                title = layerStr + channelStr
            else:
                Xlist = [31, 29, 27, 25, 39, 37, 35, 33]
                channelNum = Xlist[chanNum]
                channelStr = str(channelNum)
                title = layerStr + channelStr

    elif (section=="R8"):
        layerStr = (R8Config[configNum])[:1]
        if layerStr == "U":
            channelStr = str(int((R8Config[configNum])[1:]) + chanNum*2)
            title = layerStr + channelStr
        elif layerStr == "V":
            channelNum = int((R8Config[configNum])[1:]) + (7-chanNum)*2
            channelStr = str(channelNum)
            title = layerStr + channelStr
        elif layerStr == "X":
            channelNum = int((R8Config[configNum])[1:]) + (7-chanNum)*2
            channelStr = str(channelNum)
            title = layerStr + channelStr
            
    elif (section=="F4"):
        layerStr = (F4Config[configNum])[:1]
        if layerStr == "U":
            channelStr = str(int((F4Config[configNum])[1:]) + chanNum*2)
            title = layerStr + channelStr
        elif layerStr == "V":
            channelNum = int((F4Config[configNum])[1:]) + (3-chanNum)*2
            channelStr = str(channelNum)
            title = layerStr + channelStr
        elif layerStr == "X":
            channelNum = int((F4Config[configNum])[1:]) + (3-chanNum)*2
            channelStr = str(channelNum)
            title = layerStr + channelStr
            
    else:
        layerStr = (L4Config[configNum])[:1]
        if layerStr == "U":
            channelStr = str(int((L4Config[configNum])[1:]) + chanNum*2)
            title = layerStr + channelStr
        elif layerStr == "V":
            channelNum = int((L4Config[configNum])[1:]) + (3-chanNum)*2
            channelStr = str(channelNum)
            title = layerStr + channelStr
        elif layerStr == "X":
            channelNum = int((L4Config[configNum])[1:]) + (3-chanNum)*2
            channelStr = str(channelNum)
            title = layerStr + channelStr
            
    return title
    
# extract channel data, and calculate the title
def channelData(section, configNum, chanNum, datas): #section: L8, R8, f4, or l4
    data = [];
    dataL8, dataR8, dataf4, datal4 = datas[0], datas[1], datas[2],datas[3]
    
    L8Config = ["V17","V18","X25","X26","U1","U2"]
    R8Config = ["V1","V2","X1","X2","U17","U18"]
    L4Config = ["V33","V34","X17","X18"]
    F4Config = ["X41","X42","U33","U34"]
    
    # extract the value from text file (value of capacitance), to get the capacitance values
    cap47a = copy.copy(extract_data_txt(extract_lines("capVal/47.txt")).flatten())
    cap100a = copy.copy(extract_data_txt(extract_lines("capVal/100.txt")).flatten())
    cap150a = copy.copy(extract_data_txt(extract_lines("capVal/150.txt")).flatten())
    cap220a = copy.copy(extract_data_txt(extract_lines("capVal/220.txt")).flatten())
    cap47 = copy.copy(extract_data_txt(extract_lines("capVal/47.txt")).flatten())
    cap100 = copy.copy(extract_data_txt(extract_lines("capVal/100.txt")).flatten())
    cap150 = copy.copy(extract_data_txt(extract_lines("capVal/150.txt")).flatten())
    cap220 = copy.copy(extract_data_txt(extract_lines("capVal/220.txt")).flatten())
    cap47 = np.append(cap47, cap47a)
    cap100 = np.append(cap100, cap100a)
    cap150 = np.append(cap150, cap150a)
    cap220 = np.append(cap220, cap220a)
    
    
    if (section=="L8"):
        sectionAr = dataL8;
        #layerStr = (L8Config[configNum])[:1]
        #channelStr = str(int((L8Config[configNum])[1:]) + chanNum*2)
        #title = layerStr + channelStr
        cap = [L8Dictionary(cap47)[configNum][chanNum],L8Dictionary(cap100)[configNum][chanNum],
               L8Dictionary(cap150)[configNum][chanNum],L8Dictionary(cap220)[configNum][chanNum]]
    elif (section=="R8"):
        sectionAr = dataR8;
        #layerStr = (R8Config[configNum])[:1]
        #channelStr = str(int((R8Config[configNum])[1:]) + chanNum*2)
        #title = layerStr + channelStr
        cap = [R8Dictionary(cap47)[configNum][chanNum],R8Dictionary(cap100)[configNum][chanNum],
               R8Dictionary(cap150)[configNum][chanNum],R8Dictionary(cap220)[configNum][chanNum]]
    elif (section=="F4"):
        sectionAr = dataf4;
        #layerStr = (F4Config[configNum])[:1]
        #channelStr = str(int((F4Config[configNum])[1:]) + chanNum*2)
        #title = layerStr + channelStr
        cap = [F4Dictionary(cap47)[configNum][chanNum],F4Dictionary(cap100)[configNum][chanNum],
               F4Dictionary(cap150)[configNum][chanNum],F4Dictionary(cap220)[configNum][chanNum]]
    else:
        sectionAr = datal4;
        #layerStr = (L4Config[configNum])[:1]
        #channelStr = str(int((L4Config[configNum])[1:]) + chanNum*2)
        #title = layerStr + channelStr
        cap = [L4Dictionary(cap47)[configNum][chanNum],L4Dictionary(cap100)[configNum][chanNum],
               L4Dictionary(cap150)[configNum][chanNum],L4Dictionary(cap220)[configNum][chanNum]]
    
    for i in range(4): # 4 different capacitance values
        for j in range(len(sectionAr[i][configNum])): # 22 different frequency
            # dataPoint = (capacitance value, frequency value, amplitude of the channel)
            dataPoint = np.array([cap[i], sectionAr[i][configNum][j][0], (sectionAr[i][configNum][j][chanNum+1])]);
            data.append(dataPoint);
            nunmPyData = np.array(data)
    
    # return the data of the channel as well as data
    # [pF, Hz, V]
    return nunmPyData, getChannelName(section, configNum, chanNum)






# L8 configuration
def L8Dictionary(cap):
    #V17 = [cap[63]+cap[0],cap[1]+cap[2],cap[3]+cap[4],cap[5]+cap[6],
    #       cap[23]+cap[24],cap[25]+cap[26],cap[27]+cap[28],cap[29]+cap[30]];
    V17 = [cap[63]+cap[0],cap[1]+cap[2],cap[3]+cap[4],cap[5]+cap[6],
           cap[24],cap[25]+cap[26],cap[27]+cap[28],cap[29]+cap[30]];
           
    V17 = V17[::-1]
           
    #V18 = [cap[0]+cap[1],cap[2]+cap[3],cap[4]+cap[5],cap[6]+cap[7],
    #       cap[24]+cap[25],cap[26]+cap[27],cap[28]+cap[29],cap[30]+cap[31]];
    V18 = [cap[0]+cap[1],cap[2]+cap[3],cap[4]+cap[5],cap[6],
           cap[24]+cap[25],cap[26]+cap[27],cap[28]+cap[29],cap[30]];
           
    V18 = V18[::-1]
    
    #X25 = [cap[13]+cap[14],cap[11]+cap[12],cap[9]+cap[10],cap[7]+cap[8],
    #       cap[37]+cap[38],cap[35]+cap[36],cap[33]+cap[34],cap[31]+cap[32]];
    X25 = [cap[14],cap[11]+cap[12],cap[9]+cap[10],cap[7]+cap[8],
           cap[38],cap[35]+cap[36],cap[33]+cap[34],cap[31]+cap[32]];
           
    #X26 = [cap[14]+cap[15],cap[12]+cap[13],cap[10]+cap[11],cap[8]+cap[9],
    #       cap[38]+cap[39],cap[36]+cap[37],cap[34]+cap[35],cap[32]+cap[33]];
    X26 = [cap[14]+cap[15],cap[12]+cap[13],cap[10]+cap[11],cap[8],
           cap[38]+cap[39],cap[36]+cap[37],cap[34]+cap[35],cap[32]];
           
    #U1 = [cap[46]+cap[47],cap[44]+cap[45],cap[42]+cap[43],cap[40]+cap[41],
    #      cap[22]+cap[23],cap[20]+cap[21],cap[18]+cap[19],cap[16]+cap[17]];
    U1 = [cap[47],cap[44]+cap[45],cap[42]+cap[43],cap[40]+cap[41],
          cap[23],cap[20]+cap[21],cap[18]+cap[19],cap[16]+cap[17]];
          
    #U2 = [cap[45]+cap[46],cap[43]+cap[44],cap[41]+cap[42],cap[39]+cap[40],
    #      cap[21]+cap[22],cap[19]+cap[20],cap[17]+cap[18],cap[15]+cap[16]];
    U2 = [cap[45]+cap[46],cap[43]+cap[44],cap[41]+cap[42],cap[39],
          cap[21]+cap[22],cap[19]+cap[20],cap[17]+cap[18],cap[15]];
          
    return [V17, V18, X25, X26, U1, U2]

# R8 configuration
def R8Dictionary(cap):
    #V1 = [cap[16]+cap[15],cap[17]+cap[18],cap[19]+cap[20],cap[21]+cap[22],
    #      cap[39]+cap[40],cap[41]+cap[42],cap[43]+cap[44],cap[45]+cap[46]];
    V1 = [cap[16],cap[17]+cap[18],cap[19]+cap[20],cap[21]+cap[22],
          cap[40],cap[41]+cap[42],cap[43]+cap[44],cap[45]+cap[46]];
    V1 = V1[::-1]
    
    #V2 = [cap[16]+cap[17],cap[18]+cap[19],cap[20]+cap[21],cap[22]+cap[23],
    #      cap[40]+cap[41],cap[42]+cap[43],cap[44]+cap[45],cap[46]+cap[47]];
    V2 = [cap[16]+cap[17],cap[18]+cap[19],cap[20]+cap[21],cap[22],
          cap[40]+cap[41],cap[42]+cap[43],cap[44]+cap[45],cap[46]];
    V2 = V2[::-1]
    
    #X1 = [cap[63]+cap[0],cap[1]+cap[2],cap[3]+cap[4],cap[5]+cap[6],
    #      cap[23]+cap[24],cap[25]+cap[26],cap[27]+cap[28],cap[29]+cap[30]]
    X1 = [cap[63]+cap[0],cap[1]+cap[2],cap[3]+cap[4],cap[5]+cap[6],
           cap[24],cap[25]+cap[26],cap[27]+cap[28],cap[29]+cap[30]]
    X1 = X1[::-1]
    
    #X2 = [cap[0]+cap[1],cap[2]+cap[3],cap[4]+cap[5],cap[6]+cap[7],
    #      cap[24]+cap[25],cap[26]+cap[27],cap[28]+cap[29],cap[30]+cap[31]];
    X2 = [cap[0]+cap[1],cap[2]+cap[3],cap[4]+cap[5],cap[6],
           cap[24]+cap[25],cap[26]+cap[27],cap[28]+cap[29],cap[30]];
    X2 = X2[::-1]
    
    #U17 = [cap[62]+cap[63],cap[60]+cap[61],cap[56]+cap[57],cap[58]+cap[59],
    #       cap[38]+cap[39],cap[36]+cap[37],cap[34]+cap[35],cap[32]+cap[33]];
    U17 = [cap[63],cap[60]+cap[61],cap[56]+cap[57],cap[58]+cap[59],
           cap[39],cap[36]+cap[37],cap[34]+cap[35],cap[32]+cap[33]];
          
    #U18 = [cap[61]+cap[62],cap[59]+cap[60],cap[55]+cap[56],cap[57]+cap[58],
    #      cap[37]+cap[38],cap[35]+cap[36],cap[33]+cap[34],cap[31]+cap[32]];
    U18 = [cap[61]+cap[62],cap[59]+cap[60],cap[55]+cap[56],cap[57],
          cap[37]+cap[38],cap[35]+cap[36],cap[33]+cap[34],cap[31]];
          
    return [V1, V2, X1, X2, U17, U18]

# F4 configuration
def F4Dictionary(cap):
    #X41 = [cap[55]+cap[56],cap[57]+cap[58],
    #        cap[59]+cap[60],cap[61]+cap[62]];
    X41 = [cap[56],cap[57]+cap[58],
            cap[59]+cap[60],cap[61]+cap[62]];
    X41 = X41[::-1]
    
    #X42 = [cap[56]+cap[57],cap[58]+cap[59],
    #       cap[60]+cap[61],cap[62]+cap[63]];
    X42 = [cap[56]+cap[57],cap[58]+cap[59],
           cap[60]+cap[61],cap[62]+cap[63]];
    X42 = X42[::-1]
    
    #U33 = [cap[14]+cap[15],cap[12]+cap[13],
    #       cap[10]+cap[11],cap[8]+cap[9]];
    U33 = [cap[15],cap[12]+cap[13],
           cap[10]+cap[11],cap[8]+cap[9]];
    #U34 = [cap[13]+cap[14],cap[11]+cap[12],
    #       cap[9]+cap[10],cap[7]+cap[8]];
    U34 = [cap[13]+cap[14],cap[11]+cap[12],
           cap[9]+cap[10],cap[7]];
    return [X41, X42, U33, U34]
    
# L4 configuration
def L4Dictionary(cap):
    V33 = [cap[47]+cap[48],cap[49]+cap[50],
           cap[51]+cap[52],cap[53]+cap[54]];
    V33 = V33[::-1]
    
    V34 = [cap[48]+cap[49],cap[50]+cap[51],
           cap[52]+cap[53],cap[54]+cap[55]];
    V34 = V34[::-1]
    
    X17 = [cap[47]+cap[48],cap[49]+cap[50],
           cap[51]+cap[52],cap[53]+cap[54]];
    X17 = X17[::-1]
    
    X18 = [cap[48]+cap[49],cap[50]+cap[51],
           cap[52]+cap[53],cap[54]+cap[55]];
    X18 = X18[::-1]
    return [V33, V34, X17, X18]
    

# actually interpolation
def interpolate3Ddata(data):
    # Data for three-dimensional scattered points
    x=data[:,2]/100
    y=data[:,1]
    z=data[:,0]
    x_grid = np.linspace(0, x[len(x)-1], 5*len(x))
    y_grid = np.linspace(0, y[len(x)-1], 5*len(y))
    B1, B2 = np.meshgrid(x_grid, y_grid, indexing='xy')
    Z = np.zeros((x.size, z.size))
    spline =sp.interpolate.Rbf(x,y,z,function='multiquadric',epsilon = 1, smooth = 1)
    Z = spline(B1, B2)
    return B1, B2, Z, spline


def plot3Ddata(section, configNum, chanNum, datas):
    data, title = channelData(section,configNum,chanNum, datas)
    fig = plt.figure(figsize=(10,6),num=title)
    ax = axes3d.Axes3D(fig)
    
    P1, P2, P3, func = interpolate3Ddata(data)
    
    ax.set_zlabel('capacitance (pF)')
    ax.set_ylabel('frequency (Hz)')
    ax.set_xlabel('amplitude ($10^{-1}$ kV)')
    ax.plot_wireframe(P1, P2, P3)
    ax.plot_surface(P1, P2, P3,alpha=0.2)
    #plot_3d(P1, P2, P3)
    ax.scatter3D(x,y,z, c='r')
    
    plt.show()


def capReturn(section, configNum, chanNum, freq, amp, datas):
    data, title = channelData(section,configNum,chanNum, datas)

    x, y, z, func = interpolate3Ddata(data)
    
    return float(func(amp/100, freq))



## converting the frequency vs amplitiude into numpy array
def extract_data_txt(lines):
    linenum = 0;
    listdata=[];

    for line in lines:
        listdata.append([])
        for val in line.split():
            val=float(val);
            (listdata[linenum]).append(val)
        linenum = linenum+1;
    
    data = np.asarray(listdata, dtype=np.float32);
    return data
    
    
## data extraction
def extract_lines(path):
    file = open(path, 'r')
    lines = file.read().splitlines()
    file.close()
    return lines

class my_dictionary(dict):
    # __init__ function
    def __init__(self):
        self = dict()
    # Function to add key:value
    def add(self, key, value):
        self[key] = value

