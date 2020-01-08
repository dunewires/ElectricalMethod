import socket
import struct
import numpy as np
#import matplotlib.pyplot as plt
from pyqtgraph.Qt import QtGui, QtCore
import pyqtgraph as pg
from pyqtgraph.ptime import time

# Receive UDP packets transmitted by a broadcasting service

#msgFromClient = "Hello UDP server"
msgFromClient = "begin"
bytesToSend = str.encode(msgFromClient)
serverAddressPort = ("127.0.0.1", 20001)
bufferSize = 1024

sock = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)

sock.sendto(bytesToSend, serverAddressPort)
msgFromServer = sock.recvfrom(bufferSize)
msg = "Message from Server {}".format(msgFromServer[0])
print(msg)


pdata = np.array([], dtype=np.float)

# NOW READ DATA (data is a byte string, e.g. b'hi\nthere')
encoding = 'utf-8'  # FIXME...
nPer = 10  # MUST MATCH SAME VALUE IN testgui_server.py
structPackFmtStr = '!{}f'.format(nPer)
bufferSize = struct.calcsize(structPackFmtStr)
data, addr = sock.recvfrom(bufferSize)

# create plot window
#fig, ax = plt.subplots()
#plt.ion()
#plt.show()

app = QtGui.QApplication([])
p = pg.plot()
p.setWindowTitle('pyqtgraph example')
#p.setXRange(0, 5, padding=0)
#p.setYRange(-5, 5, padding=0)
p.autoRange(padding=None)
p.setLabel('bottom', 'x-axis label') #, units='')
p.showGrid(True, True)
## p.setDownsampling(auto=True)
## p.setClipToView(True)

curve = p.plot()
def update():
    global curve, pdata, p
    curve.setData(np.arange(len(pdata)), pdata)
    app.processEvents() ## force complete redraw for every plot


timer = QtCore.QTimer()
timer.timeout.connect(update)
timer.start(0)

try:
    while(data):
        print(data)
        print(type(data))
        vals = struct.unpack(structPackFmtStr, data)
        #print("vals = ")
        #print(vals)
        pdata = np.append(pdata, vals)
        print("len(pdata) = {}".format(len(pdata)))
        #plt.plot(pdata)
        #plt.draw()
        #plt.pause(0.001)
        sock.settimeout(2)
        data, addr = sock.recvfrom(bufferSize)
except socket.timeout:
    sock.close()
    print("pdata = ")
    print(pdata)
    print(np.min(pdata))
    print(np.max(pdata))
    print("no more data")
    


# Start Qt event loop unless running in interactive mode.
if __name__ == '__main__':
    import sys
    if (sys.flags.interactive != 1) or not hasattr(QtCore, 'PYQT_VERSION'):
        QtGui.QApplication.instance().exec_()
