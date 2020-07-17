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
 
p1 = win.addPlot(row=0, col=0, title="Timeseries data 1A")
p2 = win.addPlot(row=1, col=0, title="Amp. vs. Freq. 1A")
p3 = win.addPlot(row=0, col=1, title="Timeseries data 1F")
p4 = win.addPlot(row=1, col=1, title="Amp. vs. Freq. 1F")

# Register 1A
curve1 = p1.plot(pen='r')  # timeseries data
curve2 = p2.plot(pen='y', symbolBrush=(0,0,200), symbolPen='w', symbol='o', symbolSize=10)  # amplitude vs freq

# Register 1F
curve3 = p3.plot(pen='r') # timeseries data
curve4 = p4.plot(pen='y', symbolBrush=(0,0,200), symbolPen='w', symbol='o', symbolSize=10) # ampl vs. freq


#pdata = np.array([], dtype=np.float)  # data to plot
pdata1A = []
ampls1A = []
freqs1A = []

pdata1F = []
ampls1F = []
freqs1F = []

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
#bufferSize = 4  # number of bytes to receive
bufferSize = 1024  # number of bytes to receive
encoding = 'utf-8'  
# want result to be a string like 'CAFE805E'

lastLine1A = ''
lastLine1F = ''
nRx = 0  # keep track of number of transmissions received
headerDict1A = {}
headerDict1F = {}

def parseUdpHeader(lines):
    print("parseUdpHeader: ")
    print(lines)
    dd = {}
    dd['reg'] = lines[1][-2:]
    dd['ntx'] = dwa.unsignedIntOfHexString(lines[0][-2:])
    return dd

def update():
    global curve1, curve2, pdata1A, ampls1A, freqs1A, headerDict1A
    global curve3, curve4, pdata1F, ampls1F, freqs1F, headerDict1F
    global p, sock, data, lastLine1A, lastLine1F, nRx

    # NOW READ DATA (data is a byte string, e.g. b'hi\nthere')
    try:
        data, addr = sock.recvfrom(bufferSize)
        nRx += 1
        #print(data)
        #print(type(data))

        ##### For sine wave data
        #vals = struct.unpack(structPackFmtStr, data)  
        #pdata1A = np.append(pdata1A, vals) 
        ######
        
        #### For DWA data
        dataStr = binascii.hexlify(data).decode('utf-8').upper()
        print("{:05d} dataStr = {}".format(nRx, dataStr))
        # parse the data string

        # reformat "data" into 8-character lines
        chunkLength = 8
        dataLines = [dataStr[ii:ii+chunkLength]
                     for ii in range(0, len(dataStr), chunkLength)]
        #print("dataLines = ")
        #print(dataLines)

        udpHeader = [dataLines.pop(0), dataLines.pop(0)]
        print("udpHeader = ")
        print(udpHeader)
        udpHeaderDict = parseUdpHeader(udpHeader)
        print('udpHeaderDict = ')
        print(udpHeaderDict)
        #print("dataLines = ")
        #print(dataLines)

        reg = udpHeaderDict['reg']
        
        for dataLine in dataLines:
        
            if dataLine.startswith('CAFE'):
                if reg == '1A':
                    lastLine1A = dataLine
                elif reg == '1F':
                    lastLine1F = dataLine
    
                # Do analysis on the last dataset (assuming that there was one!)
                # reset the data array
                # FIXME: this means we will miss the last stimulation frequency
                # since there is no 'CAFE' header after it.  Need a way to know
                # when a dataset from a given frequency is completed.
                
                # Update the data set for plotting
                # fit sine-wave to data from last stimulation frequency
                if reg == '1A':
                    if len(pdata1A) > 0:
                        amplEst = 0.5*(np.max(pdata1A)-np.min(pdata1A))  # FIXME: should fit sinewave?
                        ampls1A.append(amplEst) 
                        freqs1A.append(headerDict1A['STIM_FREQ_HZ'])
                        # update plot
                        # FIXME: NEED TO UPDATE THE AMPLITUDE VS. FREQUENCY PLOT
                        curve2.setData(freqs1A, ampls1A)
                        app.processEvents() ## force complete redraw for every plot
                        #junk = input("frequency complete.. hit key to continue")
                elif reg == '1F':
                    if len(pdata1F) > 0:
                        amplEst = 0.5*(np.max(pdata1F)-np.min(pdata1F))  # FIXME: should fit sinewave?
                        ampls1F.append(amplEst) 
                        freqs1F.append(headerDict1F['STIM_FREQ_HZ'])
                        # update plot
                        # FIXME: NEED TO UPDATE THE AMPLITUDE VS. FREQUENCY PLOT
                        curve4.setData(freqs1F, ampls1F)
                        app.processEvents() ## force complete redraw for every plot
                        #junk = input("frequency complete.. hit key to continue")
                        
                return
                
            if reg == '1A':
                if lastLine1A.startswith('CAFE'):
        
                    print("")
                    print("Parsing header")
                    print("  {}".format(lastLine1A), end="")
                    print("  {}".format(dataLine), end="")
                    headerDict1A = dwa.parseUdpHeader(lastLine1A, dataLine, verbose=False)
                    print(headerDict1A)
                    lastLine1A = ''
        
                    # erase old timeseries data
                    pdata1A.clear()
                    return
            elif reg == '1F':
                if lastLine1F.startswith('CAFE'):
        
                    print("")
                    print("Parsing header")
                    print("  {}".format(lastLine1F), end="")
                    print("  {}".format(dataLine), end="")
                    headerDict1F = dwa.parseUdpHeader(lastLine1F, dataLine, verbose=False)
                    print(headerDict1F)
                    lastLine1F = ''
        
                    # erase old timeseries data
                    pdata1F.clear()
                    return
                    
        
            # Parse data
            if reg == '1A':
                #print("    {}".format(line), end="")
                pdata1A += dwa.parseUdpDataLine(dataLine)
                #print(data)
                lastLine1A = dataLine
            elif reg == '1F':
                pdata1F += dwa.parseUdpDataLine(dataLine)
                lastLine1F = dataLine
        
        #print("vals = ")
        #print("len(vals) = {}".format(len(vals)))
        #print(vals)
        #print("len(pdata1A) = {}".format(len(pdata1A)))
    except socket.timeout:
        sock.close()
        print("last pdata1A = ")
        print(pdata1A)
        print("min val = {}".format(np.min(pdata1A)))
        print("max val = {}".format(np.max(pdata1A)))
        print("n vals  = {}".format(len(pdata1A)))
        print("no more data")
        junk = input("hit any key to close")
        sys.exit()

    # update plot
    curve1.setData(np.arange(len(pdata1A)), pdata1A)
    curve3.setData(np.arange(len(pdata1F)), pdata1F)
    app.processEvents() ## force complete redraw for every plot
    

timer = QtCore.QTimer()
timer.timeout.connect(update)
timer.start(0)


# Start Qt event loop unless running in interactive mode.
if __name__ == '__main__':
    import sys
    if (sys.flags.interactive != 1) or not hasattr(QtCore, 'PYQT_VERSION'):
        QtGui.QApplication.instance().exec_()
