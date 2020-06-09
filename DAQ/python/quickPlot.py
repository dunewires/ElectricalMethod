import matplotlib.pyplot as plt
import dwaTools as dwa
import sys
import time
import glob
import os

print("sys.argv = ")
print(sys.argv)

narg = len(sys.argv)
if narg < 2:
    filename = 'mmTest1F.python.txt'
else:
    filename = sys.argv[1]
    
# if filename is a timestamp, then plot *all* registers
try:
    froot = os.path.basename(filename)
    print("froot = [{}]".format(froot))
    junk = time.strptime(froot, "%Y%m%dT%H%M%S")
    print("junk = ")
    print(junk)
    multiRegister = True
except ValueError:
    print('except')
    multiRegister = False

print

if multiRegister:
    filelist = glob.glob('{}*.txt'.format(filename))
    filelist.sort()
    nReg = len(filelist)
    print("filelist")
    print(filelist)

plt.ion()

def isOdd(n):
    return n % 2

def idsOfN(n):
    row = int(n / 2)
    col = isOdd(n)
    return [row, col]

def getRegNameOfFilename(fname):
    # remove extension
    # get last 2 characters
    regName = fname[-6:-4]
    return regName

if multiRegister:
    fig, axs = plt.subplots(4,2)
    axs[0,0].set_title(filename)
    for nn in range(nReg):
        v = dwa.parseUdpDataFile(filelist[nn])
        ids = idsOfN(nn)
        print("ids = ")
        print(ids)
        axs[ids[0], ids[1]].plot(v[0])
        if ids[1] == 1:
            axs[ids[0], ids[1]].yaxis.set_label_position("right")
        regName = getRegNameOfFilename(filelist[nn])
        axs[ids[0], ids[1]].set_ylabel(regName)
        axs[ids[0], ids[1]].set_ylim(-17500, 17500)
        #axs[ids[0], ids[1]].set_xlim(0,1000)

else:
    v = dwa.parseUdpDataFile(filename)
    nv = len(v)
    print("number of datasets: {}".format(nv))
    for iv in range(nv):
        plt.plot(v[iv])

plt.show()
plt.savefig('junk.png')
