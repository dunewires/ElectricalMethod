# FIXME/TODO:
# * in A(f) plot for all channels, use color for lines
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
    GRID = 0     # show all V(t) data
    CHAN = 1     # show V(t) data for a single channel
    AMPLGRID = 2  # show all amp. vs. freq data
    AMPLCHAN = 3  # zoom in on amp vs. freq data
    
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
        # Load the UI (built in Qt Designer)
        uic.loadUi('dwaDaqUI.ui', self)

        # Make handles for widgets in the UI
        self.stack = self.findChild(qtw.QStackedWidget, "stackedWidget")  #FIXME: can you just use self.stackedWidget ???
        self.stack.setStyleSheet("background-color:white")
        self.currentView = View.GRID
        self.stack.setCurrentIndex(self.currentView)

        # Connect slots/signals
        self.btnStart.clicked.connect(self.startRun)
        self.btnQuit.clicked.connect(self.close)
        
        # Configure/label plots
        self.chanViewMain = 0  # which channel to show large for V(t) data
        self.chanViewMainAmpl = 0  # which channel to show large for A(f) data
        self.configurePlots()
        
        # make dummy data to display
        self._makeDummyData()

        # get refs to curves on each plot
        self._makeCurves()
        self._plotDummyGrid()
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

        ###########################################
        # Define list of registers
        # wire registers only
        self.registers = [ddp.Registers.D0, ddp.Registers.D1, ddp.Registers.D2,
                          ddp.Registers.D3, ddp.Registers.D4, ddp.Registers.D5,
                          ddp.Registers.D6, ddp.Registers.D7]
        # inclues wires & run & status registers
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
        #self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) #FIXME: this is not necessary
        
        self.registerOfVal = {}
        for reg in ddp.Registers:
            self.registerOfVal[reg.value] = reg
            
        self.fnOfReg = {}  # file names for output (empty for now)
        self.ampData = {}  # hold amplitude vs. freq data for a scan
        
        # Start listening for UDP data in a Worker thread
        self.execute()
        
    # end of __init__ for class MainWindow

    def configurePlots(self):
        # FIXME: clean this up...
        getattr(self, f'pw_chan_main').setBackground('w')
        getattr(self, f'pw_chan_main').setTitle(self.chanViewMain)
        getattr(self, f'pw_amplchan_main').setBackground('w')
        getattr(self, f'pw_amplchan_main').setTitle(self.chanViewMainAmpl)
        getattr(self, f'pw_amplgrid_all').setBackground('w')
        getattr(self, f'pw_amplgrid_all').setTitle('All')
        for ii in range(8):
            # set background color to white
            # FIXME: clean this up...
            getattr(self, f'pw_grid_{ii}').setBackground('w')
            getattr(self, f'pw_grid_{ii}').setTitle(ii)
            getattr(self, f'pw_chan_{ii}').setBackground('w')
            getattr(self, f'pw_chan_{ii}').setTitle(ii)
            getattr(self, f'pw_amplgrid_{ii}').setBackground('w')
            getattr(self, f'pw_amplgrid_{ii}').setTitle(ii)
            getattr(self, f'pw_amplchan_{ii}').setBackground('w')
            getattr(self, f'pw_amplchan_{ii}').setTitle(ii)

    def printOutput(self, s):
        print("printOutput():")
        print(s)

    def threadComplete(self):
        print("THREAD COMPLETE!")

    def _makeDummyData(self):
        # V(t)
        self.dummyData = {}  
        xx = np.linspace(0, 2*np.pi, 1000)
        for ii in range(9):
            self.dummyData[ii] = {'x':xx[:],
                                  'y':np.sin(xx[:]*(ii+1))
            }
        # Amplitude vs. Freq
        self.dummyDataAmpl = {}
        xx = np.linspace(10, 100, 1000)
        for ii in range(9):
            self.dummyDataAmpl[ii] = {'x':xx[:],
                                      'y':xx[:]*ii+1
            }

    def _makeCurves(self):
        ''' make one curve in each pyqtgraph PlotWidget '''
        # FIXME: merge all curves into self.curves = {}
        # self.curves = {'grid': ... ,   # grid view
        #                'chan': ...     # chan view
        #               }
        # e.g. for channel 5:
        #   self.curves['grid'][5]['V(t)']['data']
        #   self.curves['grid'][5]['V(t)']['fit']
        #   self.curves['grid'][5]['A(f)']['data']
        #   self.curves['grid'][5]['A(f)']['fit']

        # pyqtgraph pen configuration
        fitPen = pg.mkPen(color=(255,0,0), width=3)

        self.curves = {}
        self.curves['grid'] = {}   # grid view V(t) data
        self.curves['chan'] = {}   # channel view V(t) data
        self.curves['ampl'] = {}   # Ampl. vs. Freq
        self.curves['ampl']['all'] = {}   # all plots, single window for Ampl. vs. Freq (grid view)
        self.curvesFit = {}  # FIXME: kluge -- merge w/ self.curves
        self.curvesFit['grid'] = {}
        self.curvesFit['chan'] = {}
        #gridLocations = list(string.ascii_uppercase[0:8]) # ['A', ..., 'H']
        gridLocations = list(range(8))
        for ii, loc in enumerate(gridLocations):
            # V(t) plots
            self.curvesFit['grid'][loc] = getattr(self, f'pw_grid_{loc}').plot([0],[0], pen=fitPen)
            self.curvesFit['chan'][loc] = getattr(self, f'pw_chan_{loc}').plot([0],[0], pen=fitPen)
            self.curves['grid'][loc] = getattr(self, f'pw_grid_{loc}').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=None)
            self.curves['chan'][loc] = getattr(self, f'pw_chan_{loc}').plot([0],[0], symbol='o', symbolSize=2, symbolBrush='k', symbolPen='k', pen=None)
            #
            # A(f) plots (grid view)
            self.curves['ampl'][loc] = getattr(self, f'pw_amplgrid_{loc}').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=None)
            #                plot all A(f) in one of the A(f) windows
            self.curves['ampl']['all'][loc] = getattr(self, f'pw_amplgrid_all').plot([0],[0])
            # A(f) plots (channel view)
            self.curves['ampl'][loc] = getattr(self, f'pw_amplchan_{loc}').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=None)

            
        # add in the main window, too (large view of V(t) for a single channel)
        self.curvesFit['chan']['main'] = getattr(self, f'pw_chan_main').plot([0],[0], pen=fitPen)
        self.curves['chan']['main'] = getattr(self, f'pw_chan_main').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=None)

        # add in the main window, too (large view of A(f) for a single channel)
        self.curves['ampl']['main'] = getattr(self, f'pw_amplchan_main').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=None)

        
    def _plotDummyGrid(self, dummy=False):
        ''' plot data in Grid view '''
        # V(t) data
        keys = sorted(self.curves['grid'])  # keys sorted (0, 1, ..., 7)
        print(keys)
        for ii, kk in enumerate(keys):
            self.curves['grid'][kk].setData(self.dummyData[ii]['x'],
                                            self.dummyData[ii]['y'])
            
        # FIXME: A(f) data (not yet implemented)
            
    def _plotDummyChan(self, chan):
        ''' plot data in channel mode
        the reqested channel is plotted on the big graph. 
        all 8 channels are plotted on the small graphs at top
        '''
        # update the large plot
        # V(t)
        self.curves['chan']['main'].setData(self.dummyData[chan]['x'],
                                            self.dummyData[chan]['y'])
        # A(f)
        self.curves['ampl']['main'].setData(self.dummyDataAmpl[chan]['x'],
                                            self.dummyDataAmpl[chan]['y'])

        # update the 8 small plots
        #locs = list(string.ascii_uppercase[0:8])   # ['A', 'B', ..., 'H']
        for ii in range(8):
            cha = ii
            loc = ii
            self.curves['chan'][loc].setData(self.dummyData[cha]['x'],
                                             self.dummyData[cha]['y'])
            self.curves['ampl'][loc].setData(self.dummyDataAmpl[cha]['x'],
                                             self.dummyDataAmpl[cha]['y'])
                
    def _keyboardShortcuts(self):
        # Show all timeseries data
        self.scGridView = qtw.QShortcut(qtg.QKeySequence("Ctrl+V"), self)
        self.scGridView.activated.connect(self.viewGrid)

        chans = range(8)
        self.chanViewShortcuts = []  # FIXME: no need to save these, just need to connect slot...
        for chan in chans:
            # V(t) data
            self.chanViewShortcuts.append(qtw.QShortcut(qtg.QKeySequence(f'Alt+{chan}'), self))
            self.chanViewShortcuts[-1].activated.connect(partial(self.viewChan, chan))
            # A(f) data
            self.chanViewShortcuts.append(qtw.QShortcut(qtg.QKeySequence(f'Ctrl+{chan}'), self))
            self.chanViewShortcuts[-1].activated.connect(partial(self.viewAmplChan, chan))

        # A(f) data (grid view)
        self.scAmplGridView = qtw.QShortcut(qtg.QKeySequence("Ctrl+F"), self)
        self.scAmplGridView.activated.connect(self.viewAmplGrid)


    @pyqtSlot()
    def startRun(self):
        self.outputText.appendPlainText("CLICKED START")
        self.outputText.update()
        
        print('\n\n======= dwaReset() ===========')
        dwa.dwaReset(verbose=1)

        print('\n\n======= dwaConfig() ===========')
        #dwa.dwaConfig(verbose=0, configFile="dwaConfigWCLab.ini")
        dwa.dwaConfig(verbose=0, configFile="dwaConfigWC.ini")
        #dwa.dwaConfig(verbose=0, configFile="dwaConfigSingleFreq.ini")

        print('\n\n======= dwaStart() ===========')
        dwa.dwaStart(verbose=1)
        
        #print('\n\n======= dwaStat() ===========')
        #dwa.dwaStat(verbose=1)

    #@pyqtSlot()
    #def quitAll(self):

        
    @pyqtSlot()
    def viewGrid(self):
        self.currentView = View.GRID
        self.stack.setCurrentIndex(self.currentView)
        print("page 1")

    @pyqtSlot()
    def viewAmplGrid(self):
        self.currentView = View.AMPLGRID
        self.stack.setCurrentIndex(self.currentView)
        print("page 3")

    @pyqtSlot(int)
    def viewAmplChan(self, chan):
        self.currentView = View.AMPLCHAN
        self.stack.setCurrentIndex(self.currentView)
        print("got here...")
        print("channel = ", chan)

        if self.chanViewMainAmpl != chan:
            x, y = self.curves['ampl'][chan].getData()
            self.curves['ampl']['main'].setData(x, y)
            self.pw_amplchan_main.setTitle(chan)
            self.chanViewMainAmpl = chan
        
    @pyqtSlot(int)
    def viewChan(self, chan):
        self.currentView = View.CHAN
        self.stack.setCurrentIndex(self.currentView)
        print("got here...")
        print("channel = ", chan)

        if self.chanViewMain != chan:
            x, y = self.curves['chan'][chan].getData()
            self.curves['chan']['main'].setData(x, y)
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


    def _clearAmplitudeData(self):
        self.ampData = {}
        for reg in self.registers:
            self.ampData[reg] = {'freq':[],  # stim freq in Hz
                                 'ampl':[] } # amplitude in ADC counts

        #self.registerOfVal = {}
        #for reg in ddp.Registers:
        #    self.registerOfVal[reg.value] = reg
        
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
                    self._clearAmplitudeData()
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
            dt = udpDict[ddp.Frame.FREQ]['adcSamplingPeriod']*1e-8
            tt = np.arange(len(udpDict[ddp.Frame.ADC_DATA]['adcSamples']))*dt

            #################################
            # Update plots
            self.curves['grid'][regId].setData(tt, udpDict[ddp.Frame.ADC_DATA]['adcSamples'])
            self.curves['chan'][regId].setData(tt, udpDict[ddp.Frame.ADC_DATA]['adcSamples'])
            # FIXME: need to update the main window in chan view, too
            if regId == self.chanViewMain:
                self.curves['chan']['main'].setData(tt, udpDict[ddp.Frame.ADC_DATA]['adcSamples'])
            
            # compute the best fit to V(t) and plot (in red)
            (B, C, D, freq_Hz) = dwa.processWaveform(udpDict)
            self.ampData[reg]['freq'].append(freq_Hz)
            self.ampData[reg]['ampl'].append(np.sqrt(B**2+C**2))
            nptsInFit=500
            tfit = np.linspace(tt[0], tt[-1], nptsInFit)
            yfit = B*np.sin(2*np.pi*freq_Hz*tfit) + C*np.cos(2*np.pi*freq_Hz*tfit) + D
            #print(f'   B = {B}')
            #print(f'   C = {C}')
            #print(f'   D = {D}')
            self.curvesFit['grid'][regId].setData(tfit, yfit)
            self.curvesFit['chan'][regId].setData(tfit, yfit)
            if regId == self.chanViewMain:
                self.curvesFit['chan']['main'].setData(tfit, yfit)
            
            self.curves['ampl'][regId].setData(self.ampData[reg]['freq'], self.ampData[reg]['ampl'])
            
            self.curves['ampl']['all'][regId].setData(self.ampData[reg]['freq'], self.ampData[reg]['ampl'])

            
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
        
