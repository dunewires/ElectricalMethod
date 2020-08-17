# FIXME/TODO:
# * in "channel view" mode, have all 8 chans on top, *and* zoom in on one channel
# * estimate amplitude and plot amp vs. frequency
# * run a test with sebastien's real data...
# * UDP header will eventually contain status bits as well (currently not used)
# * look for dropped UDP packets by monitoring the UDP counter
#   (careful with wraps of the counter)
# * if there is a dropped UDP packet, how can we tell what register it was from?
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
import datetime
import os
import sys

from functools import partial
from enum import IntEnum
import string

import numpy as np

from PyQt5 import uic
from PyQt5 import QtWidgets as qtw
from PyQt5 import QtGui as qtg
from PyQt5 import QtCore as qtc
from PyQt5.QtCore import pyqtSlot

#from pyqtgraph import PlotWidget, plot
import pyqtgraph as pg

#import dwaGui  ## for GUI made in Qt Creator
import dwaTools as dwa
import DwaDataParser as ddp

class View(IntEnum):
    ''' for stackedWidget page indexing '''
    GRID = 0
    CHAN = 1

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

    newUdpPayload
       'dict' of data from UDP transmission

    '''
    finished = qtc.pyqtSignal()
    error = qtc.pyqtSignal(tuple)
    result = qtc.pyqtSignal(object)
    progress = qtc.pyqtSignal(int)
    data = qtc.pyqtSignal(tuple)
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

        #################################################
        ################# START LAYOUT ##################
        # FIXME: use Qt Designer instead (to make a .ui file)
        # then load with
        # from PyQt5 import uic
        uic.loadUi('dwaDaqUI.ui', self)
        #ui = dwaGui.Ui_MainWindow()
        #ui.setupUi(win)

        # Make handles for widgets in the UI
        self.stack = self.findChild(qtw.QStackedWidget, "stackedWidget")
        self.stack.setCurrentIndex(View.GRID)

        # make dummy data to display
        self._makeDummyData()

        # get refs to curves on each plot
        self._makeCurves()
        self._plotDummyGrid()
        self.chanViewMain = 0  # which channel is drawn on the big canvas in chan view?
        self._plotDummyChan(self.chanViewMain)

        # Establish keyboard shortcuts and associated signals/slots
        self._keyboardShortcuts()

        ############ Resize and launch GUI in bottom right corner of screen
        # tested on mac & linux (unclear about windows)
        # https://stackoverflow.com/questions/39046059/pyqt-location-of-the-window
        self.resize(1400,800)
        screen = qtg.QDesktopWidget().screenGeometry()
        wgeom = self.geometry()
        x = screen.width() - wgeom.width()
        y = screen.height() - wgeom.height()
        self.move(x, y)
        
        self.show()
        ####################### END LAYOUT ###############
        ##################################################

        self.registers = [ddp.Registers.D0, ddp.Registers.D1, ddp.Registers.D2,
                          ddp.Registers.D3, ddp.Registers.D4, ddp.Registers.D5,
                          ddp.Registers.D6, ddp.Registers.D7]
        self.registers_all = [item for item in ddp.Registers]

        ###########################################
        # Set up multithreading
        self.threadpool = qtc.QThreadPool()
        print("Multithreading with maximum %d threads" %
              self.threadpool.maxThreadCount())

        ###########################################
        # Create instance of data parser to handle incoming data
        self.dwaDataParser = ddp.DwaDataParser()

        ###########################################
        # Ensure there is a directory to save UDP data
        self.udpDataDir = './udpData/'
        try:
            print("Checking for UDP Data directory...")
            os.makedirs(self.udpDataDir)
            print("  Directory did not exist... made {}".format(self.udpDataDir))
        except FileExistsError:
            # directory already exists
            print("  Directory already exists: [{}]".format(self.udpDataDir))
            pass

        ###########################################
        # Configure the UDP connection
        UDP_IP = ''     # '' is a symbolic name meaning all available interfaces
        UDP_PORT = 6008 # port (set to match the hard-coded value on the FPGA)
        self.udpServerAddressPort = (UDP_IP, UDP_PORT)
        # See this for UDP buffer size limits
        # https://stackoverflow.com/questions/16460261/linux-udp-max-size-of-receive-buffer
        self.udpBufferSize = 1024*4 # max data to be received at once (bytes?)
        self.udpEnc = 'utf-8'  # encoding
        self.udpTimeoutSec = 20

        # Set up UDP connection
        print("making socket")
        self.sock = socket.socket(family=socket.AF_INET,  # internet
                                  type=socket.SOCK_DGRAM) # UDP
        self.sock.bind( self.udpServerAddressPort ) # this is required
        #self.sock.settimeout(self.udpTimeoutSec)    # if no new data comes from server, quit
        #sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) #FIXME: this is not necessary
        
        self.registerOfVal = {}
        for reg in ddp.Registers:
            self.registerOfVal[reg.value] = reg
            
        self.fnOfReg = {}  # file names for output (empty for now)

        # Start listening for UDP data in a Worker thread
        self.execute()
        
    # end of __init__ for class MainWindow
        
    def printOutput(self, s):
        print("printOutput():")
        print(s)

    def threadComplete(self):
        print("THREAD COMPLETE!")

    def _makeDummyData(self):
        self.dummyData = {}
        self.xx = np.linspace(0, 2*np.pi, 1000)

        for ii in range(9):
            self.dummyData[ii] = {'x':self.xx[:],
                                  'y':np.sin(self.xx*(ii+1))
                                 }
    def _makeCurves(self):
        ''' make one curve in each pyqtgraph PlotWidget '''
        self.curvesGridView = {}
        #gridLocations = list(string.ascii_uppercase[0:8]) # ['A', ..., 'H']
        gridLocations = list(range(8))
        print(gridLocations)
        for ii, loc in enumerate(gridLocations):
            self.curvesGridView[loc] = getattr(self, f'pw_grid_{loc}').plot([0], [0])

        self.curvesChanView = {}
        for ii, loc in enumerate(gridLocations):
            self.curvesChanView[loc] = getattr(self, f'pw_chan_{loc}').plot([0],[0])
        # add in the main window, too
        self.curvesChanView['main'] = getattr(self, f'pw_chan_main').plot([0],[0])
        
    def _plotDummyGrid(self, dummy=False):
        ''' plot data in Grid view '''
        keys = sorted(self.curvesGridView)  # keys sorted alphabetically ('A', 'B', ...)
        print(keys)
        for ii, kk in enumerate(keys):
            self.curvesGridView[kk].setData(self.dummyData[ii]['x'],
                                            self.dummyData[ii]['y'])
            getattr(self, f'pw_grid_{kk}').setTitle(ii)

    def _plotDummyChan(self, chan):
        ''' plot data in channel mode
        the reqested channel is plotted on the big graph. 
        all 8 channels are plotted on the small graphs at top
        '''
        # update the large plot
        self.curvesChanView['main'].setData(self.dummyData[chan]['x'], self.dummyData[chan]['y'])
        getattr(self, f'pw_chan_main').setTitle(chan)

        # update the 8 small plots
        #locs = list(string.ascii_uppercase[0:8])   # ['A', 'B', ..., 'H']
        locs  = list(range(8))
        chans = list(range(8))
        for ii in range(len(locs)):
            cha = chans[ii]
            loc = locs[ii]
            self.curvesChanView[loc].setData(self.dummyData[cha]['x'], self.dummyData[cha]['y'])
            getattr(self, f'pw_chan_{loc}').setTitle(cha)

                
    def _keyboardShortcuts(self):
        self.scGridView = qtw.QShortcut(qtg.QKeySequence("Ctrl+A"), self)
        self.scGridView.activated.connect(self.viewGrid)
        chans = range(8)
        self.chanViewShortcuts = []
        for chan in chans:
            self.chanViewShortcuts.append(qtw.QShortcut(qtg.QKeySequence(f'Ctrl+{chan}'), self))
            self.chanViewShortcuts[-1].activated.connect(partial(self.viewChan, chan))

        
    @pyqtSlot()
    def viewGrid(self):
        self.stack.setCurrentIndex(View.GRID)
        print("page 1")
        
    @pyqtSlot(int)
    def viewChan(self, chan):
        self.stack.setCurrentIndex(View.CHAN)
        print("got here...")
        print("channel = ", chan)
        #
        # FIXME: no need to do this (if correct channel is already displayed!
        x, y = self.curvesChanView[chan].getData()
        self.curvesChanView['main'].setData(x, y)
        self.pw_chan_main.setTitle(chan)
        self.chanViewMain = chan

    def _makeWordList(self, udpDataStr):
        '''
        Converts a UDP transmission (single string) into a python list

        Each entry in the list is a string representation of a 32-bit hex word 
        

        e.g.
        >>> udpDataStr  = 'AAAA0002100000F1110000FFAAAAAAAA'
        >>> dataStrings = self._makeWordList(udpDataStr)
           ['AAAA0002', '100000F1', '110000FF', 'AAAAAAAA']
        '''
        chunkLength = 8
        dataStrings = [udpDataStr[ii:ii+chunkLength]
                       for ii in range(0, len(udpDataStr), chunkLength)]
        print("dataStrings = ")
        print(dataStrings)
        return dataStrings

    def _logRawUdpTransmissionToFile(self, dataStrings):
        print("Data came from:")
        rawFH = open("udpstream.txt", 'a')
        for item in dataStrings:
            rawFH.write(f'{item}\n')
        rawFH.close()


    def _makeOutputFilenames(self):
        # Generate a unique filename for each register
        # Generate filehandles for each register
        # FIXME: move this to a higher level (only do it once...)
        #def getUniqueFileroot():
        #    return datetime.datetime.now().strftime("data/%Y%m%dT%H%M%S")
        froot = datetime.datetime.now().strftime("%Y%m%dT%H%M%S")
        froot = os.path.join(self.udpDataDir, froot)
        print("fileroot = ", froot)
        # create new output filenames
        self.fnOfReg = {}  # file names for output. Keys are 2-digit hex string (e.g. '03' or 'FF'). values are filenames
        for reg in self.registers_all:
            self.fnOfReg['{:02X}'.format(reg.value)] = "{}_{:02X}.txt".format(froot, reg.value)
        print("self.fnOfReg = ")
        print(self.fnOfReg)

    def startUdpReceiver(self, newdata_callback):
        # initiate a DWA acquisition
        # send configuration
        # start listening for UDP data
        # establish signal/slot for sending data from udp receiver to GUI

        while True:
            try:
                data, addr = self.sock.recvfrom(self.udpBufferSize)
                print("")
                print("bing! data received")
                #print(data)                
                udpDataStr = binascii.hexlify(data).decode(self.udpEnc).upper()
                print(udpDataStr)
                
                # Break up string into a list of 8-character chunks
                dataStrings = self._makeWordList(udpDataStr)

                # Write the raw udp payload to file
                self._logRawUdpTransmissionToFile(dataStrings)

                # FIXME: THIS EVENTUALLY GOES AWAY
                # Currently it's a kluge to handle the case where DWA transmission
                # contains the old-style (and now non-standard) header lines...
                while not dataStrings[0].startswith("AAAA"):
                    print("popping udp word:", dataStrings[0])
                    dataStrings.pop(0)

                # Parse UDP transmission
                self.dwaDataParser.parse(dataStrings)
                if 'FFFFFFFF' in dataStrings:
                    print('\n\n')
                    print('self.dwaDataParser.dwaPayload = ')
                    print(self.dwaDataParser.dwaPayload)

                # If there is a run frame, this is a new run
                # so need to create new filenames
                if ddp.Frame.RUN in self.dwaDataParser.dwaPayload:
                    print("New run detected... creating new filenames")
                    self._makeOutputFilenames()
                    print(self.fnOfReg)
                
                # write data to file by register
                reg = self.dwaDataParser.dwaPayload[ddp.Frame.UDP]['Register_ID_hexStr']
                print("self.fnOfReg: ")
                print(self.fnOfReg)
                with open(self.fnOfReg[reg], 'a') as regFH:
                    for item in dataStrings:
                        regFH.write(f'{item}\n')
                    regFH.close()
                
                newdata_callback.emit(self.dwaDataParser.dwaPayload)
                    
            except socket.timeout:
                print("  UDP Timeout")
                self.sock.close()
                break
            else:
                pass
            finally:
                pass

    def processUdpPayload(self, udpDict):
        # new UDP payload has arrived from DWA.
        # Deal with it (update plots, or status, or ...)
        print('\n\n')
        print("processUdpPayload()")

        kk = udpDict.keys()
        print(kk)

        self.outputText.appendPlainText("UDP Counter: {}".format(udpDict[ddp.Frame.UDP]['UDP_Counter']))
        
        # Look for run header frame
        if ddp.Frame.RUN in udpDict:
            self.outputText.appendPlainText("\nFOUND RUN HEADER")
            self.outputText.appendPlainText(str(udpDict))
                
        # Check to see if this is an ADC data transfer:
        if ddp.Frame.ADC_DATA in udpDict:
            self.outputText.appendPlainText("\nFOUND ADC DATA\n")
            # update the relevant plot...
            regId = udpDict[ddp.Frame.FREQ]['Register_ID_Freq']
            print('regId = ', regId)
            reg = self.registerOfVal[regId]
            #self.mycurves[reg].setData(udpDict[ddp.Frame.ADC_DATA]['adcSamples'])
            # FIXME: check which view is active and only update that one...
            # can use self.stack.currentIndex()
            self.curvesGridView[regId].setData(udpDict[ddp.Frame.ADC_DATA]['adcSamples'])
            self.curvesChanView[regId].setData(udpDict[ddp.Frame.ADC_DATA]['adcSamples'])
            # FIXME: need to update the main window in chan view, too
            
    def process_new_amplitude(self, tup):
        # a full time-series is complete and processed
        # so now plot the amplitude vs. frequency data
        pass
        
    def execute(self):
        # Pass the function to execute
        worker = Worker(self.startUdpReceiver)  # could have args/kwargs too..
        worker.signals.result.connect(self.printOutput)
        worker.signals.finished.connect(self.threadComplete)
        worker.signals.newUdpPayload.connect(self.processUdpPayload)

        # execute
        self.threadpool.start(worker)

    def cleanUp(self):
        print("App quitting:")
        print("   closing UDP connection")
        self.sock.close()
        
        
def main():
    app = qtw.QApplication(sys.argv)
    window = MainWindow()
    app.aboutToQuit.connect(window.cleanUp)
    app.exec_()
    #sys.exit(app.exec_())  # diff btw this and prev. line???

if __name__ == "__main__":
    main()
        
