import socket
import struct
import binascii
import numpy as np
#import matplotlib.pyplot as plt
from pyqtgraph.Qt import QtGui, QtCore
import pyqtgraph as pg
from pyqtgraph.ptime import time

import dwaTools as dwa

# Receive and plot data in UDP packets transmitted by a broadcasting service

# Set up GUI and plotting environment
app = QtGui.QApplication([])
win = pg.GraphicsWindow(title="UDP Data Receiver")
win.resize(1000, 600)
win.setWindowTitle('realtime graphing in pyqtgraph')
pg.setConfigOptions(antialias=True) # enable antialiasing for prettier plots
 
p1 = win.addPlot(title="Timeseries data")
p2 = win.addPlot(title="Amplitude vs. Frequency")

curve1 = p1.plot(pen='r')  # timeseries data
curve2 = p2.plot(pen='y', symbolBrush=(0,0,200), symbolPen='w', symbol='o', symbolSize=10)  # amplitude vs freq

#pdata = np.array([], dtype=np.float)  # data to plot
pdata = []
ampls = []
freqs = []

# For single set of axes only...
####p = pg.plot()
####p.setWindowTitle('pyqtgraph example')
#####p.setXRange(0, 5, padding=0)
#####p.setYRange(-5, 5, padding=0)
#####p.autoRange(padding=None)
####p.setLabel('bottom', 'x-axis label') #, units='')
####p.showGrid(True, True)
###### p.setDownsampling(auto=True)
###### p.setClipToView(True)
####curve = p.plot()

# Set up UDP connection
serverAddressPort = ("127.0.0.1", 20001)
bufferSize = 1024
sock = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
sock.settimeout(2)    # if no new data comes from server, quit

msgFromClient = "begin"
bytesToSend = str.encode(msgFromClient)
sock.sendto(bytesToSend, serverAddressPort)
msgFromServer = sock.recvfrom(bufferSize)
msg = "Message from Server {}".format(msgFromServer[0])
print(msg)

## Set up for data receive
## For sine-wave dummy data (floats)
#nPer = 10  # MUST MATCH SAME VALUE IN testgui_server.py
#structPackFmtStr = '!{}f'.format(nPer)
#bufferSize = struct.calcsize(structPackFmtStr)

# For DWA data emulator (sending 32 bits, e.g. CAFE805E)
bufferSize = 4  # number of bytes to receive
encoding = 'utf-8'  
# want result to be a string like 'CAFE805E'

lastLine = ''
nRx = 0  # keep track of number of transmissions received
headerDict = {}

def update():
    global curve1, curve2, pdata, ampls, freqs
    global p, sock, data, lastLine, nRx, headerDict

    # NOW READ DATA (data is a byte string, e.g. b'hi\nthere')
    try:
        data, addr = sock.recvfrom(bufferSize)
        nRx += 1
        #print(data)
        #print(type(data))

        ##### For sine wave data
        #vals = struct.unpack(structPackFmtStr, data)  
        #pdata = np.append(pdata, vals) 
        ######

        #### For DWA data
        dataStr = binascii.hexlify(data).decode('utf-8').upper()
        print("{:05d} dataStr = {}".format(nRx, dataStr))
        # parse the data string

        if dataStr.startswith('CAFE'):
            lastLine = dataStr

            # Do analysis on the last dataset (assuming that there was one!)
            # reset the data array
            # FIXME: this means we will miss the last stimulation frequency
            # since there is no 'CAFE' header after it.  Need a way to know
            # when a dataset from a given frequency is completed.
            
            # Update the data set for plotting
            # fit sine-wave to data from last stimulation frequency
            if len(pdata) > 0:
                amplEst = 0.5*(np.max(pdata)-np.min(pdata))  # FIXME: should fit sinewave?
                ampls.append(amplEst) 
                freqs.append(headerDict['STIM_FREQ_HZ'])
                # update plot
                # FIXME: NEED TO UPDATE THE AMPLITUDE VS. FREQUENCY PLOT
                curve2.setData(freqs, ampls)
                app.processEvents() ## force complete redraw for every plot
                #junk = input("frequency complete.. hit key to continue")

            return
            
        
        if lastLine.startswith('CAFE'):

            print("")
            print("Parsing header")
            print("  {}".format(lastLine), end="")
            print("  {}".format(dataStr), end="")
            headerDict = dwa.parseUdpHeader(lastLine, dataStr, verbose=False)
            print(headerDict)
            lastLine = ''

            # erase old timeseries data
            pdata.clear()
            return

        # Parse data
        #print("    {}".format(line), end="")
        pdata += dwa.parseUdpDataLine(dataStr)
        #print(data)
        lastLine = dataStr
        
        #print("vals = ")
        #print("len(vals) = {}".format(len(vals)))
        #print(vals)
        #print("len(pdata) = {}".format(len(pdata)))
    except socket.timeout:
        sock.close()
        print("last pdata = ")
        print(pdata)
        print("min val = {}".format(np.min(pdata)))
        print("max val = {}".format(np.max(pdata)))
        print("n vals  = {}".format(len(pdata)))
        print("no more data")
        junk = input("hit any key to close")
        sys.exit()

    # update plot
    curve1.setData(np.arange(len(pdata)), pdata)
    app.processEvents() ## force complete redraw for every plot
    

timer = QtCore.QTimer()
timer.timeout.connect(update)
timer.start(0)


# Start Qt event loop unless running in interactive mode.
if __name__ == '__main__':
    import sys
    if (sys.flags.interactive != 1) or not hasattr(QtCore, 'PYQT_VERSION'):
        QtGui.QApplication.instance().exec_()