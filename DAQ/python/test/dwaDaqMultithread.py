# FIXME/TODO:
# * resetting the time axis fails if a single UDP transmission
#   contains data before and after CAFE (new frequency)
# * "GO" button should be disabled/yellow while run is underway (avoid clicking twice)
# * UDP header will eventually contain status bits as well (currently not used)
# * look for dropped UDP packets by monitoring the UDP counter
#   (careful with wraps of the counter)
# * if there is a dropped UDP packet, how can we well what register it was from?
# * how can we reconstruct the time sample associated with each data point
#   if there are dropped UDP packets?
# * From Sebastien: 4/17/2020
#   Another idea that came from people doing the measurement for
#   protodune was to get a summary of the recent previous wire tension
#   values (maybe something like an overall graph per layer so far in
#   the measurement process). This comes as the tension values are
#   usually similar for close-by wires so it’s been useful in the past
#   to have that to determine where a bad bunch lies.  Similarly,
#   something like a histogram for the layer or for the whole APA
#   would be good at the end of a measurement process.

import traceback, sys
import requests
import time
import socket
import binascii

import numpy as np

from PyQt5 import QtWidgets as qtw
from PyQt5 import QtGui as qtg
from PyQt5 import QtCore as qtc

#from pyqtgraph import PlotWidget, plot
import pyqtgraph as pg

#import dwaGui  ## for GUI made in Qt Creator
import dwaTools as dwa
import DwaDataParser as ddp

class WorkerSignals(qtc.QObject):
    '''
    Defines the signals available from a running worker thread.

    Supported signals are:
    finished
       No data

    error
       'tuple'  (exctype, vaue, traceback.format_exc() )

    result
       'object' data returnd from processing, anything

    progress
       'int' percent complete, from 0-100

    data
       'tuple' of (identifier, data)

    newdata
       'tuple' of (registerID, datax, datay)  where data is a list

    newUdpPayload
       'dict' of data from UDP transmission

    '''
    finished = qtc.pyqtSignal()
    error = qtc.pyqtSignal(tuple)
    result = qtc.pyqtSignal(object)
    progress = qtc.pyqtSignal(int)
    data = qtc.pyqtSignal(tuple)
    newdata = qtc.pyqtSignal(tuple)
    newUdpPayload = qtc.pyqtSignal(dict)
    status = qtc.pyqtSignal(tuple)
    
class Worker(qtc.QRunnable):
    ''' 
    Worker thread

    Inherits from QRunnable to handle worker thread setup, signals and wrap-up

    :param callback: The function callback to run on this worker thread
    :                Supplied args and kwargs will be passed through to 
    :                the runner
    :type callback: function
    :param args: Arguments to paasss to the callback function
    :param kwargs: Keywords to pass to the callback function
    '''

    '''
    :param id: The id for this worker
    :param url: the url to retrieve
    '''
    
    def __init__(self, fn, *args, **kwargs):
        super(Worker, self).__init__()
        # Store constructor arguments (re-used for processing)
        self.fn = fn
        self.args = args
        self.kwargs = kwargs
        self.signals = WorkerSignals()

        # Add the callback to our kwargs, if needed
        # this will be passed on to self.fn so that function
        # has access to the callback
        #kwargs['progress_callback'] = self.signals.progress
        #kwargs['newdata_callback'] = self.signals.newdata
        kwargs['newdata_callback'] = self.signals.newUdpPayload
        
    @qtc.pyqtSlot()
    def run(self):
        '''
        Initialize the runner function with passed args, kwargs.
        '''

        print("Thread start")
        # retrieve args/kwargs here; and fire processing using them
        try:
            result = self.fn(*self.args, **self.kwargs)
            #result = self.fn(
            #    *self.args, **self.kwargs,
            #    status = self.signals.status,
            #    progress = self.signals.progress,
            #)
        except:
            traceback.print_exc()
            exctype, value = sys.exc_info()[:2]
            self.signals.error.emit( (exctype, value, traceback.format_exc()) )
        else:
            self.signals.result.emit(result)  # return the result of the processing
        finally:
            self.signals.finished.emit() # Done
        print("Thread complete")
        

class MainWindow(qtw.QMainWindow):
    def __init__(self, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)

        self.counter = 0

        #################################################
        ################# START LAYOUT ##################
        #ui = dwaGui.Ui_MainWindow()
        #ui.setupUi(win)
        layout = qtw.QVBoxLayout()
        gl = qtw.QGridLayout()

        self.label = qtw.QLabel("Multi-register GUI")
        self.button = qtw.QPushButton("Acquire")
        self.button.pressed.connect(self.execute)
        self.outputText = qtw.QPlainTextEdit()
        #self.bar = qtw.QProgressBar()
        
        #self.registers = ['18','19','1A','1B','1C','1D','1E','1F']
        # *data* registers (e.g. wire readouts)
        # Fix me: do this programatically -- can loop over with "for item in ddp.Registers:"
        self.registers = [ddp.Registers.D0, ddp.Registers.D1, ddp.Registers.D2,
                          ddp.Registers.D3, ddp.Registers.D4, ddp.Registers.D5,
                          ddp.Registers.D6, ddp.Registers.D7]
        self.pws = {}  # plot widgets
        for reg in self.registers:
            self.pws[reg] = pg.PlotWidget()
            self.pws[reg].setTitle(reg.name)
        #self.pws['1A'] = pg.PlotWidget()
        #self.pws['1F'] = pg.PlotWidget()
        ##self.pw.setBackground('w')
        
        layout.addWidget(self.label)
        layout.addWidget(self.outputText)
        layout.addWidget(self.button)
        #layout.addWidget(self.bar)

        for nreg, reg in enumerate(self.registers):
            row = nreg/3
            col = nreg % 3
            gl.addWidget(self.pws[reg], row, col)
        #layout.addWidget(self.pws['1A'])
        #layout.addWidget(self.pws['1F'])

        gl.addLayout(layout, 2, 2)
        
        w = qtw.QWidget()
        #w.setLayout(layout)
        w.setLayout(gl)

        self.setCentralWidget(w)
        ####################### END LAYOUT ###############
        ##################################################

        
        self.show()

        self.threadpool = qtc.QThreadPool()
        print("Multithreading with maximum %d threads" %
              self.threadpool.maxThreadCount())
        
        #self.timer = qtc.QTimer()
        #self.timer_dt = 50
        #self.timer.setInterval(self.timer_dt)
        #self.timer.timeout.connect(self.recurring_timer)
        #self.timer.start()

        # Create instance of data parser to handle incoming data
        self.dwaDataParser = ddp.DwaDataParser()
        
        # Configuration for the UDP connection
        UDP_IP = ''     # '' is a symbolic name meaning all available interfaces
        UDP_PORT = 6008 # port (set to match the hard-coded value on the FPGA)
        self.udpServerAddressPort = (UDP_IP, UDP_PORT)
        # See this for UDP buffer size limits
        # https://stackoverflow.com/questions/16460261/linux-udp-max-size-of-receive-buffer
        self.udpBufferSize = 1024*4 # max data to be received at once (bytes?)
        self.udpEnc = 'utf-8'  # encoding
        self.udpTimeoutSec = 20
       
        # establish a plot and data for the plot
        self.myx = {}
        self.myy = {}
        self.mycurves = {}
        for reg in self.registers:
            self.myx[reg] = list(np.linspace(0, 2*np.pi, num=100))
            self.myy[reg] = list(np.sin(self.myx[reg]))
            self.mycurves[reg] = self.pws[reg].plot(self.myx[reg], self.myy[reg])

        self.registerOfVal = {}
        for reg in ddp.Registers:
            self.registerOfVal[reg.value] = reg
            
        self.currentRunDict = {}
            
    # end of __init__ for class MainWindow
        
    def printOutput(self, s):
        print(s)

    def threadComplete(self):
        print("THREAD COMPLETE!")

        
    def start_acquisition(self, newdata_callback):
        # initiate a DWA acquisition
        # send configuration
        # start listening for UDP data
        # establish signal/slot for sending data from udp receiver to GUI

        # clear stored data
        for key in self.myx.keys():
            self.myx[key] = []
            self.myy[key] = []

        # Set up UDP connection
        sock = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
        # If the following 2 lines are uncommented, then testing with testgui_server.py
        # fails....
        #sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) #FIXME: necessary?
        #sock.bind( self.udpServerAddressPort ) # is this for servers only????
        sock.settimeout(self.udpTimeoutSec)    # if no new data comes from server, quit

        # During testing, send 'begin' to start the UDP server
        msgFromClient = "begin"
        bytesToSend = str.encode(msgFromClient)
        print('sending message = [{}]'.format(msgFromClient))
        sock.sendto(bytesToSend, self.udpServerAddressPort)
        print("waiting for response")
        msgFromServer = sock.recvfrom(1024)
        msg = "Message from Server {}".format(msgFromServer[0])
        print(msg)
        
        # Code to parse the incoming FPGA data stream

        #nRx = {}      # track number of udp transmissions received
        #for reg in self.registers:
        #    nRx[reg] = 0 
       
        while True:
            try:
                data, addr = sock.recvfrom(self.udpBufferSize)
                print("")
                #print(data)                
                udpDataStr = binascii.hexlify(data).decode(self.udpEnc).upper()
                
                # Break up string into 8-character chunks
                chunkLength = 8
                dataStrings = [udpDataStr[ii:ii+chunkLength]
                             for ii in range(0, len(udpDataStr), chunkLength)]
                print("dataStrings = ")
                print(dataStrings)

                self.dwaDataParser.parse(dataStrings)
                print('\n\n')
                print('self.dwaDataParser.dwaPayload = ')
                print(self.dwaDataParser.dwaPayload)
                newdata_callback.emit(self.dwaDataParser.dwaPayload)
                    
                #reg = udpHeaderDict['reg']  # which register sent this data?
                #nRx[reg] += 1
                #
                #print("{:05d} udpDataStr = {}".format(nRx[reg], udpDataStr))
                #print('udpHeaderDict = ')
                #print(udpHeaderDict)
                ##print("dataStrings = ")
                ##print(dataStrings)
                #
                #print("new_data_x = ")
                #print(new_data_x)
                #print("new_data_y = ")
                #print(new_data_y)
                #data_tup = (reg, new_data_x, new_data_y)
                #newdata_callback.emit(data_tup)
                    
            except socket.timeout:
                print("  UDP Timeout")
                sock.close()
                break
            else:
                pass
            finally:
                pass

    #def process_new_data(self, tup):
    #    # new data arrived from udp receiver
    #    # add it to memory, update plots, trigger analysis if appropriate
    #    print("process_new_data()")
    #    print(tup)
    #    reg = tup[0]
    #    print("new data from register %s" % reg)
    #    self.myx[reg] += tup[1]
    #    self.myy[reg] += tup[2]
    #
    #    # update plot
    #    self.mycurves[reg].setData(self.myx[reg], self.myy[reg])

    def processUdpPayload(self, udpDict):
        # new UDP payload has arrived from DWA.
        # Deal with it (update plots, or status, or ...)
        print('\n\n')
        print("processUdpPayload()")
        print(udpDict)

        self.outputText.appendPlainText(str(udpDict))
                
        kk = udpDict.keys()
        print(kk)

        # Check to see if this is an ADC data transfer:
        if ddp.Frame.ADC_DATA in udpDict:
            self.outputText.appendPlainText("\nFOUND ADC DATA\n")
            # update the relevant plot...
            regId = udpDict[ddp.Frame.FREQ]['Register_ID_Freq']
            reg = self.registerOfVal[regId]
            self.mycurves[reg].setData(udpDict[ddp.Frame.ADC_DATA]['adcSamples'])
        
    def process_new_amplitude(self, tup):
        # a full time-series is complete and processed
        # so now plot the amplitude vs. frequency data
        pass
        
    def execute(self):
        # Pass the function to execute
        worker = Worker(self.start_acquisition)  # could have args/kwargs too..
        worker.signals.result.connect(self.printOutput)
        worker.signals.finished.connect(self.threadComplete)
        worker.signals.newUdpPayload.connect(self.processUdpPayload)
        #worker.signals.newdata.connect(self.process_new_data)
        #worker.signals.progress.connect(self.update_progress)

        # execute
        self.threadpool.start(worker)

    #def update_progress(self, progress):
    #    print("%d%% done" % progress)
    #    self.bar.setValue(progress)

    #def recurring_timer(self):
    #    self.counter += 1
    #    cts_per_second = int(1000/self.timer_dt)
    #    if (self.counter % cts_per_second) == 0:
    #        self.label.setText("Counter: %d" % self.counter)
    #
    #    # update the data plot
    #    dx = self.myx[1]-self.myx[0]
    #    self.myx = self.myx[1:]
    #    self.myx.append(self.myx[-1]+dx)
    #    self.myy = self.myy[1:]
    #    self.myy.append(np.sin(self.myx[-1]))
    #    self.mycurve.setData(self.myx, self.myy)

    #def execute_this_fn(self, progress_callback):
    #    nmax = 5
    #    for n in range(0, nmax):
    #        time.sleep(1)
    #        progress_callback.emit(int(100*float(n)/(nmax-1)))
    #    return "Done."

    #def display_output(self, data):
    #    id, s = data
    #    self.text.appendPlainText("WORKER: %d: %s" % (id, s))

def main():
    app = qtw.QApplication([])
    window = MainWindow()
    app.exec_()

if __name__ == "__main__":
    main()
        
