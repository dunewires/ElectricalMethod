import socket
import struct
import numpy as np
#import matplotlib.pyplot as plt
from pyqtgraph.Qt import QtGui, QtCore
import pyqtgraph as pg
from pyqtgraph.ptime import time

# Receive and plot data in UDP packets transmitted by a broadcasting service

# Set up GUI and plotting environment
app = QtGui.QApplication([])
 
pdata = np.array([], dtype=np.float)  # data to plot

p = pg.plot()
p.setWindowTitle('pyqtgraph example')
#p.setXRange(0, 5, padding=0)
#p.setYRange(-5, 5, padding=0)
#p.autoRange(padding=None)
p.setLabel('bottom', 'x-axis label') #, units='')
p.showGrid(True, True)
## p.setDownsampling(auto=True)
## p.setClipToView(True)

curve = p.plot()

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

# Set up for data receive
nPer = 10  # MUST MATCH SAME VALUE IN testgui_server.py
structPackFmtStr = '!{}f'.format(nPer)
bufferSize = struct.calcsize(structPackFmtStr)


def update():
    global curve, pdata, p, sock, data
    
    # NOW READ DATA (data is a byte string, e.g. b'hi\nthere')
    #encoding = 'utf-8'  # FIXME...
    try:
        data, addr = sock.recvfrom(bufferSize)
        #print(data)
        #print(type(data))
        vals = struct.unpack(structPackFmtStr, data)
        #print("vals = ")
        #print("len(vals) = {}".format(len(vals)))
        #print(vals)
        pdata = np.append(pdata, vals)
        #print("len(pdata) = {}".format(len(pdata)))
    except socket.timeout:
        sock.close()
        print("pdata = ")
        print(pdata)
        print("min val = {}".format(np.min(pdata)))
        print("max val = {}".format(np.max(pdata)))
        print("n vals  = {}".format(len(pdata)))
        print("no more data")
        sys.exit()

    # update plot
    curve.setData(np.arange(len(pdata)), pdata)
    app.processEvents() ## force complete redraw for every plot
    

timer = QtCore.QTimer()
timer.timeout.connect(update)
timer.start(0)


# Start Qt event loop unless running in interactive mode.
if __name__ == '__main__':
    import sys
    if (sys.flags.interactive != 1) or not hasattr(QtCore, 'PYQT_VERSION'):
        QtGui.QApplication.instance().exec_()
