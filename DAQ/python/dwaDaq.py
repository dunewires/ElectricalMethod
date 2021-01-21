# FIXME/TODO:
# * Logging: use RotatingFileHandler for log file, and don't create a new log file each time... ???
# * UDP header will eventually contain status bits as well (currently not used)
# * look for dropped UDP packets by monitoring the UDP counter
#   (careful with wraps of the counter)
# * if there is a dropped UDP packet, how can we tell what register it was from?
# * Mapping from register/ADC number to APA wire number...
# * database logging (seitch)
# * From Sebastien: 4/17/2020
#   Another idea that came from people doing the measurement for
#   protodune was to get a summary of the recent previous wire tension
#   values (maybe something like an overall graph per layer so far in
#   the measurement process). This comes as the tension values are
#   usually similar for close-by wires so it’s been useful in the past
#   to have that to determine where a bad bunch lies.  Similarly,
#   something like a histogram for the layer or for the whole APA
#   would be good at the end of a measurement process.

# for logging info:
# https://fangpenlin.com/posts/2012/08/26/good-logging-practice-in-python/

import faulthandler   # helps debug segfaults
faulthandler.enable()

import traceback, sys
import requests
import time
import socket
import binascii
import datetime
import os
import sys
import logging

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
import DwaConfigFile as dcf


#class QtHandler(logging.Handler):
#    """ handle logging events -- display them in a text box in the gui"""
#    def __init__(self):
#        logging.Handler.__init__(self)
#
#    def emit(self, record):
#        print("in EMIT....")
#        msg = self.format(record)
#        self.logTextBox.appendPlainText(msg)
#        #XStream.stdout().write("{}\n".format(record))

        
class View(IntEnum):
    ''' for stackedWidget page indexing '''
    CONFIG = 0    # Show the configuration parameters
    LOG = 1       # Log-file output
    GRID = 2      # V(t) (grid view)
    CHAN = 3      # V(t) (channel view)
    AMPLGRID = 4  # A(f) (grid view)
    AMPLCHAN = 5  # A(f) (channel view)
    TENSIONS = 6  # Wire tensions
    
class WorkerSignals(qtc.QObject):
    '''
    Defines the signals available from a running worker thread.

    Supported signals are:
    finished
       No data

    error
       'tuple'  (exctype, vaue, traceback.format_exc() )

    result
       'object' data returned from processing, anything

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
        self.logger = logging.getLogger()
        
        # Add the callback to our kwargs, if needed
        # this will be passed on to self.fn so that function
        # has access to the callback
        #kwargs['progress_callback'] = self.signals.progress
        #kwargs['newdata_callback'] = self.signals.newUdpPayload
        
    @qtc.pyqtSlot()
    def run(self):
        '''
        Initialize the runner function with passed args, kwargs.
        '''

        print("\n\n ======== Worker.run() (thread start) ========== \n\n")
        self.logger.info("Thread start")
        # retrieve args/kwargs here; and fire processing using them
        try:
            result = self.fn(*self.args, **self.kwargs)
            #result = self.fn(
            #    *self.args, **self.kwargs,
            #    status = self.signals.status,
            #    progress = self.signals.progress,
            #)
        except:
            print("\n ======== Worker.run() exception ========== \n")
            traceback.print_exc()
            exctype, value = sys.exc_info()[:2]
            self.signals.error.emit( (exctype, value, traceback.format_exc()) )
        else:
            print("\n\n ======== Worker.run() else ========== \n\n")
            self.signals.result.emit(result)  # return the result of the processing
        finally:
            self.signals.finished.emit() # Done
            print("\n\n ======== Worker.run() finally ========== \n\n")
            self.logger.info("Thread complete")
        

class MainWindow(qtw.QMainWindow):
    def __init__(self, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)

        self._initLogging()

        #################################################
        ################# START LAYOUT ##################
        # Load the UI (built in Qt Designer)
        uic.loadUi('dwaDaqUI.ui', self)
        ####self.logTextBox = QTextEditLogger(self.page_logging)
        self.logTextBox.appendPlainText("log viewing not yet implemented")
        #logging.getLogger().addHandler(self.logTextBox)
        #logging.getLogger().setLevel(logging.INFO)

        #self.logHandler = QtHandler()
        #self.logHandler.setFormatter(logging.Formatter("%(levelname)s:%(message)s"))
        #self.logger.addHandler(self.logHandler)
        
        self.logFilename_val.setText(self.logFilename)  # must come after loadUi() call
        self.logFilenameLog_val.setText(self.logFilename)  

        #self.log_tb.append("logging window...")  # FIXME... how to update...?
        
        # Set defaults...
        self.configFileName.setText("dwaConfigWC.ini")
        self.configFileContents.setReadOnly(True)

        # Make handles for widgets in the UI
        self.stack = self.findChild(qtw.QStackedWidget, "stackedWidget")  #FIXME: can you just use self.stackedWidget ???
        self.stack.setStyleSheet("background-color:white")
        self.currentView = View.CONFIG
        self.stack.setCurrentIndex(self.currentView)

        # Connect slots/signals
        self.btnStart.clicked.connect(self.startRunThread)
        #self.btnQuit.clicked.connect(self.close)
        self.configFileName.returnPressed.connect(self.configFileNameEnter)

        
        # Configure/label plots
        self.chanViewMain = 0  # which channel to show large for V(t) data
        self.chanViewMainAmpl = 0  # which channel to show large for A(f) data
        self.configurePlots()
        
        # make dummy data to display
        self._makeDummyData()

        # get refs to curves on each plot
        self._makeCurves()
        self._plotDummyAmpl()
        self._plotDummyTimeseries()
        #self._plotDummyGrid()
        #self._plotDummyChan()
        self._plotDummyTension()

        # Establish keyboard shortcuts and associated signals/slots
        self._keyboardShortcuts()

        # signals for callback actions
        self.signals = WorkerSignals()

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
        self.threadPool = qtc.QThreadPool()
        logging.info("Multithreading with maximum %d threads" %
              self.threadPool.maxThreadCount())

        ###########################################
        # Create instance of data parser to handle incoming data
        self.dwaDataParser = ddp.DwaDataParser()
        # Create placeholder for a config file parser
        self.dwaConfigFile = None
        
        ###########################################
        # Ensure there is a directory to save UDP data
        self.udpDataDir = './udpData/'
        try:
            logging.info("Checking for UDP Data directory...")
            os.makedirs(self.udpDataDir)
            logging.info("  Directory did not exist... made {}".format(self.udpDataDir))
        except FileExistsError:
            # directory already exists
            logging.warning("  Directory already exists: [{}]".format(self.udpDataDir))

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
        logging.info("making socket")
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
        self.udpListen()
        
    # end of __init__ for class MainWindow


    def _initLogging(self):
        # logging levels (in order of severity): DEBUG, INFO, WARNING, ERROR, CRITICAL
        self.logDir = './logs/'
        try:
            print("Checking for log directory...")
            os.makedirs(self.logDir)
            print("  Directory did not exist... made {}".format(self.logDir))
        except FileExistsError:  # directory already exists
            print("  Directory already exists: [{}]".format(self.logDir))
        # Initiate the logging system
        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(logging.INFO)
        
        self.logFilename = os.path.join(self.logDir,    # e.g. ./logs/20200329T120531.log
                                        datetime.datetime.now().strftime("%Y%m%dT%H%M%S.log") )
        loggingFormatter = logging.Formatter('%(levelname)s:%(name)s:%(message)s')
        #logging.basicConfig(filename=self.logFilename, level=logging.INFO, filemode='w',
        #                    format='%(levelname)s:%(name)s:%(message)s')

        # log output to file (doesn't work in other threads, only in main...)
        fh = logging.FileHandler(self.logFilename)
        fh.setLevel(logging.INFO)
        fh.setFormatter(loggingFormatter)
        self.logger.addHandler(fh)
        
        # log output to terminal
        ch = logging.StreamHandler()
        ch.setLevel(logging.DEBUG)
        ch.setFormatter(loggingFormatter)
        self.logger.addHandler(ch)

        self.logger.info(f'Log created {self.logFilename}')

        
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
        #
        getattr(self, f'pw_tensionsPerWire').setTitle('Tension Per Wire')
        getattr(self, f'pw_tensionsPerWire').setBackground('w')
        getattr(self, f'pw_tensionsPerWire').setLabels(bottom='Wire number', left='Tension [N]', right='')
        
    def printOutput(self, s):
        print("printOutput():")
        print(s)

    def threadComplete(self):
        logging.info("THREAD COMPLETE!")

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

        xx = np.arange(1000)  # wire numbers
        mu = 6.50 # Newtons
        sigma = 0.5 # Newtons
        tt = np.random.normal(mu, sigma, len(xx)) # wire tensions (Newtons)
        self.dummyDataTension = {'x':xx[:],
                                 'y':tt[:]}

            
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
        self.curves['grid'] = {}   # V(t), grid view
        self.curves['chan'] = {}   # V(t), channel view
        self.curves['amplgrid'] = {}   # A(f), grid view
        self.curves['amplgrid']['all'] = {}   # A(f), all channels, single axes (in grid view)
        self.curves['amplchan'] = {}   # A(f), channel view
        self.curves['tension'] = {} # Wire tension plots (multiple figures, all on "tension" page)
        self.curvesFit = {}  # FIXME: kluge -- merge w/ self.curves
        self.curvesFit['grid'] = {} # V(t), grid
        self.curvesFit['chan'] = {} # V(t), chan
        amplAllPlotPens = [pg.mkPen(color=(0,  0, 0)), pg.mkPen(color=(210,105,30)),
                           pg.mkPen(color=(255,0, 0)), pg.mkPen(color=(255,165, 0)),
                           pg.mkPen(color=(255,255,0)), pg.mkPen(color=(0,255,0)),
                           pg.mkPen(color=(0,0,255)), pg.mkPen(color=(148,0,211))]
        for loc in range(8):
            # V(t) plots
            self.curvesFit['grid'][loc] = getattr(self, f'pw_grid_{loc}').plot([0],[0], pen=fitPen)
            self.curvesFit['chan'][loc] = getattr(self, f'pw_chan_{loc}').plot([0],[0], pen=fitPen)
            self.curves['grid'][loc] = getattr(self, f'pw_grid_{loc}').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=None)
            self.curves['chan'][loc] = getattr(self, f'pw_chan_{loc}').plot([0],[0], symbol='o', symbolSize=2, symbolBrush='k', symbolPen='k', pen=None)
            #
            # A(f) plots (grid view)
            self.curves['amplgrid'][loc] = getattr(self, f'pw_amplgrid_{loc}').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=None)
            # A(f), all channels on single axes
            self.curves['amplgrid']['all'][loc] = getattr(self, f'pw_amplgrid_all').plot([0],[0], pen=amplAllPlotPens[loc])
            # A(f) plots (channel view)
            self.curves['amplchan'][loc] = getattr(self, f'pw_amplchan_{loc}').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=None)

            
        # add in the main window, too (large view of V(t) for a single channel)
        self.curvesFit['chan']['main'] = getattr(self, f'pw_chan_main').plot([0],[0], pen=fitPen)
        self.curves['chan']['main'] = getattr(self, f'pw_chan_main').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=None)

        # add in the main window, too (large view of A(f) for a single channel)
        self.curves['amplchan']['main'] = getattr(self, f'pw_amplchan_main').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=None)

        # Tension information
        self.curves['tension']['tensionOfWireNumber'] = getattr(self, f'pw_tensionsPerWire').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=None)
        tensionPen = pg.mkPen(color='#FF0000', width=4, style=qtc.Qt.DashLine)
        tensionLowLimit = pg.InfiniteLine(pos=6.0, angle=0, movable=False, pen=tensionPen)
        tensionHighLimit = pg.InfiniteLine(pos=7.0, angle=0, movable=False, pen=tensionPen)
        self.pw_tensionsPerWire.addItem(tensionLowLimit)
        self.pw_tensionsPerWire.addItem(tensionHighLimit)

        
    def _plotDummyAmpl(self):
        # A(f), chan view, large plot
        self.curves['amplchan']['main'].setData(self.dummyDataAmpl[self.chanViewMainAmpl]['x'],
                                                self.dummyDataAmpl[self.chanViewMainAmpl]['y'])
        for ii in range(8):
            # A(f) data, grid view
            self.curves['amplgrid'][ii].setData(self.dummyDataAmpl[ii]['x'],
                                                self.dummyDataAmpl[ii]['y'])
            # all curves on single axes (lower right plot in grid view)
            self.curves['amplgrid']['all'][ii].setData(self.dummyDataAmpl[ii]['x'],
                                                       self.dummyDataAmpl[ii]['y'])
            # A(f) data, chan view (small plots)
            self.curves['amplchan'][ii].setData(self.dummyDataAmpl[ii]['x'],
                                                self.dummyDataAmpl[ii]['y'])

            
    #def _plotDummyGrid(self, dummy=False):
    #    ''' plot data in Grid view '''
    #    # V(t) data, grid view
    #    keys = sorted(self.curves['grid'])  # keys sorted (0, 1, ..., 7)
    #    print(keys)
    #    for ii, kk in enumerate(keys):
    #        self.curves['grid'][kk].setData(self.dummyData[ii]['x'],
    #                                        self.dummyData[ii]['y'])
            
    def _plotDummyTimeseries(self):
        ''' plot data in channel mode
        all 8 channels are plotted on the small graphs at top
        '''
        # V(t), chan view, large plot
        self.curves['chan']['main'].setData(self.dummyData[self.chanViewMain]['x'],
                                            self.dummyData[self.chanViewMain]['y'])

        # update the 8 small plots
        for ii in range(8):
            self.curves['chan'][ii].setData(self.dummyData[ii]['x'],
                                            self.dummyData[ii]['y'])
            self.curves['grid'][ii].setData(self.dummyData[ii]['x'],
                                            self.dummyData[ii]['y'])


    def _plotDummyTension(self):
        self.curves['tension']['tensionOfWireNumber'].setData(self.dummyDataTension['x'],
                                                              self.dummyDataTension['y'])
            
    def _keyboardShortcuts(self):
        # Show configuration parameters
        self.scConfig = qtw.QShortcut(qtg.QKeySequence("Ctrl+C"), self)
        self.scConfig.activated.connect(self.viewConfig)

        # Show log
        self.scLog = qtw.QShortcut(qtg.QKeySequence("Ctrl+L"), self)
        self.scLog.activated.connect(self.viewLog)

        # V(t) data (grid view)
        self.scGridView = qtw.QShortcut(qtg.QKeySequence("Ctrl+V"), self)
        self.scGridView.activated.connect(self.viewGrid)

        # A(f) data (grid view)
        self.scAmplGridView = qtw.QShortcut(qtg.QKeySequence("Ctrl+F"), self)
        self.scAmplGridView.activated.connect(self.viewAmplGrid)

        # Tension data
        self.scTensionView = qtw.QShortcut(qtg.QKeySequence("Ctrl+T"), self)
        self.scTensionView.activated.connect(self.viewTensions)

        # Show V(t) or A(f) (channel view)
        chans = range(8)
        self.chanViewShortcuts = []  # FIXME: no need to save these, just need to connect slot...
        for chan in chans:
            # V(t)
            self.chanViewShortcuts.append(qtw.QShortcut(qtg.QKeySequence(f'Alt+{chan}'), self))
            self.chanViewShortcuts[-1].activated.connect(partial(self.viewChan, chan))
            # A(f)
            self.chanViewShortcuts.append(qtw.QShortcut(qtg.QKeySequence(f'Ctrl+{chan}'), self))
            self.chanViewShortcuts[-1].activated.connect(partial(self.viewAmplChan, chan))


    def udpListen(self):
        # Pass the function to execute
        worker = Worker(self.startUdpReceiver, newdata_callback=self.signals.newUdpPayload)
        worker.signals.result.connect(self.printOutput)
        worker.signals.finished.connect(self.threadComplete)
        self.signals.newUdpPayload.connect(self.processUdpPayload)
        
        # execute
        self.threadPool.start(worker)

    @pyqtSlot()
    def startRunThread(self):
        # Pass the function to execute
        worker = Worker(self.startRun)  # could pass args/kwargs too..
        #worker.signals.result.connect(self.printOutput)
        #worker.signals.finished.connect(self.threadComplete)

        # execute
        self.threadPool.start(worker)

    def startRun(self):
        #self.outputText.appendPlainText("CLICKED START")
        #self.outputText.update()

        # startRun() is in a thread...  need to get logger?
        logger = logging.getLogger(__name__)
        self.configFile = self.configFileName.text()
        logger.info(f"config file = {self.configFile}")
        #
        ## FIXME: the textbox doesn't update right away...
        ## need to force an update somehow....
        self._loadConfigFile(updateGui=False)

        print("\n\n =================== startRun()\n\n")
        
        verbose = 1
        
        print(f"self.configFile = {self.configFile}")
        # verify that config file can be opened
        try:
            with open(self.configFile) as fh:
                pass
        except:
            logger.error("Could not open config file -- cannot proceed")

        try:
            logger.info('======= dwaReset() ===========')
            dwa.dwaReset(verbose=verbose)
            
            logger.info('======= dwaConfig() ===========')
            #dwa.dwaConfig(verbose=verbose, configFile="dwaConfigWCLab.ini")
            dwa.dwaConfig(verbose=verbose, configFile=self.configFile,
                          doMainsSubtraction=True, v3Relays=True)
            #dwa.dwaConfig(verbose=verbose, configFile="dwaConfigSingleFreq.ini")

            
            logger.info('======= dwaStart() ===========')
            dwa.dwaStart(verbose=verbose)
            logger.info('======= DONE WITH dwaStart() ===========')
            
            #logger.info('\n\n======= dwaStat() ===========')
            #dwa.dwaStat(verbose=verbose)

        except:
            logger.error("DWA run configuration failed")
            

    #@pyqtSlot()
    #def quitAll(self):

   
    @pyqtSlot()
    def configFileNameEnter(self):
        self._loadConfigFile()
        
    @pyqtSlot()
    def viewConfig(self):
        self.currentView = View.CONFIG
        self.stack.setCurrentIndex(self.currentView)
        self.logger.info("View CONFIG")

    @pyqtSlot()
    def viewLog(self):
        self.currentView = View.LOG
        self.stack.setCurrentIndex(self.currentView)
        self.logger.info("View LOG")
        
    @pyqtSlot()
    def viewGrid(self):
        self.currentView = View.GRID
        self.stack.setCurrentIndex(self.currentView)
        self.logger.info("View V(t) GRID")

    @pyqtSlot()
    def viewAmplGrid(self):
        self.currentView = View.AMPLGRID
        self.stack.setCurrentIndex(self.currentView)
        self.logger.info("View A(f) GRID")

    @pyqtSlot(int)
    def viewAmplChan(self, chan):
        self.currentView = View.AMPLCHAN
        self.stack.setCurrentIndex(self.currentView)
        self.logger.info("View A(f) AMPLCHAN.  Channel = {}".format(chan))

        if self.chanViewMainAmpl != chan:
            x, y = self.curves['amplchan'][chan].getData()
            self.curves['amplchan']['main'].setData(x, y)
            self.pw_amplchan_main.setTitle(chan)
            self.chanViewMainAmpl = chan
        
    @pyqtSlot(int)
    def viewChan(self, chan):
        self.currentView = View.CHAN
        self.stack.setCurrentIndex(self.currentView)
        self.logger.info("View V(t) AMPLCHAN.  Channel = {}".format(chan))

        if self.chanViewMain != chan:
            x, y = self.curves['chan'][chan].getData()
            self.curves['chan']['main'].setData(x, y)
            self.pw_chan_main.setTitle(chan)
            self.chanViewMain = chan

    @pyqtSlot()
    def viewTensions(self):
        self.currentView = View.TENSIONS
        self.stack.setCurrentIndex(self.currentView)
        self.logger.info("View Tensions")

    def _loadConfigFile(self, updateGui=True):
        # try to read the requested file
        # if found, display contents
        # if not found, display error message
        configFileToOpen = self.configFileName.text()
        validConfigFilename = False
        try:
            with open(configFileToOpen) as fh:
                pass
            validConfigFilename = True
        except:
            textToDisplay = "Could not open file"
            if updateGui:
                self.configFileContents.setPlainText(textToDisplay)
            else:
                print(textToDisplay)

        # FIXME: should this all go in the try: above?
        if validConfigFilename:
            # read/parse config file
            self.dwaConfigFile = dcf.DwaConfigFile(configFileToOpen)
            textToDisplay = self.dwaConfigFile.getRawText()
            if self.omitComments_cb.isChecked():
                self.logger.info("cutting out commented lines from config file")
                lines = textToDisplay.split('\n')
                lines = [line for line in lines if line.strip()!="" and not line.strip().startswith('#')]
                textToDisplay = '\n'.join(lines)

            # FIXME: need to find a way to update the GUI in a thread that is not main thread....
            # right now, updating the GUI in a thread causes a crash.
            # see: https://stackoverflow.com/questions/10905981/pyqt-qobject-cannot-create-children-for-a-parent-that-is-in-a-different-thread
            # https://stackoverflow.com/questions/3268073/qobject-cannot-create-children-for-a-parent-that-is-in-a-different-thread
            if updateGui:
                self.configFileContents.setPlainText(textToDisplay)

                # update various config file fields in the GUI
                self.freqMin_val.setText(self.dwaConfigFile.config['stimFreqMin_Hz'])
                self.freqMax_val.setText(self.dwaConfigFile.config['stimFreqMax_Hz'])
                self.freqStep_val.setText(self.dwaConfigFile.config['stimFreqStep_Hz'])
                self.stimTime_val.setText(self.dwaConfigFile.config['stimTime'])
                self.cycPerFreq_val.setText(self.dwaConfigFile.config['cyclesPerFreq_dec'])
                self.sampPerCyc_val.setText(self.dwaConfigFile.config['adcSamplesPerCycle_dec'])
                self.clientIP_val.setText(self.dwaConfigFile.config['client_IP'])
            
            
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
        self.logger.info(f"dataStrings = {dataStrings}")
        return dataStrings

    def _logRawUdpTransmissionToFile(self, dataStrings):
        self.logger.info("Data came from:")
        # FIXME: need to deal with this -- the file jsut gets bigger and bigger
        # consider using a rolling log file, or erasing at the start of each GUI launch?
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
        self.logger.info(f"fileroot = {froot}")
        # create new output filenames
        self.fnOfReg = {}  # file names for output. Keys are 2-digit hex string (e.g. '03' or 'FF'). values are filenames
        for reg in self.registers_all:
            self.fnOfReg['{:02X}'.format(reg.value)] = "{}_{:02X}.txt".format(froot, reg.value)
        self.logger.info(f"self.fnOfReg = {self.fnOfReg}")

    def startUdpReceiver(self, newdata_callback):
        # initiate a DWA acquisition
        # send configuration
        # start listening for UDP data
        # establish signal/slot for sending data from udp receiver to GUI
        # FIXME: this is run in a separate thread -- do we need to get logger?
        # logger = logging.getLogger()

        # This is in a separate thread... need to get logger
        logger = logging.getLogger()
        logger.setLevel(logging.INFO)
        logger.info("============= startUdpReceiver() ===============")
        print("\n\n ============= startUdpReceiver() ===============\n\n")
        
        while True:
            try:
                data, addr = self.sock.recvfrom(self.udpBufferSize)
                logger.info("")
                logger.info("bing! data received")
                #logger.info(data)                
                udpDataStr = binascii.hexlify(data).decode(self.udpEnc).upper()
                logger.info(udpDataStr)
                
                # Break up string into a list of 8-character chunks
                dataStrings = self._makeWordList(udpDataStr)

                # Write the raw udp payload to file
                self._logRawUdpTransmissionToFile(dataStrings)

                # FIXME: THIS EVENTUALLY GOES AWAY
                # Currently it's a kluge to handle the case where DWA transmission
                # contains the old-style (and now non-standard) header lines...
                while not dataStrings[0].startswith("AAAA"):
                    logger.info(f"popping udp word: {dataStrings[0]}")
                    dataStrings.pop(0)

                print("post popping")
                print(dataStrings)
                    
                # Parse UDP transmission
                self.dwaDataParser.parse(dataStrings)
                if 'FFFFFFFF' in dataStrings:
                    logger.info('\n\n')
                    logger.info(f'self.dwaDataParser.dwaPayload = {self.dwaDataParser.dwaPayload}')

                # If there is a run frame, this is a new run
                # so need to create new filenames
                if ddp.Frame.RUN in self.dwaDataParser.dwaPayload:
                    logger.info("New run detected... creating new filenames")
                    self._makeOutputFilenames()
                    self._clearAmplitudeData()
                    logger.info(self.fnOfReg)
                
                # write data to file by register
                reg = self.dwaDataParser.dwaPayload[ddp.Frame.UDP]['Register_ID_hexStr']
                logger.info(f"self.fnOfReg: {self.fnOfReg}")
                with open(self.fnOfReg[reg], 'a') as regFH:
                    for item in dataStrings:
                        regFH.write(f'{item}\n')
                    regFH.close()
                
                newdata_callback.emit(self.dwaDataParser.dwaPayload)
                    
            except socket.timeout:
                logger.info("  UDP Timeout")
                self.sock.close()
                break
            else:
                pass
            finally:
                pass

    def processUdpPayload(self, udpDict):
        # new UDP payload has arrived from DWA.
        # Deal with it (update plots, or status, or ...)
        self.logger.info('\n\n')
        self.logger.info("processUdpPayload()")

        kk = udpDict.keys()
        self.logger.info(kk)

        self.outputText.appendPlainText("UDP Counter: {}".format(udpDict[ddp.Frame.UDP]['UDP_Counter']))
        
        # Look for run header frame
        if ddp.Frame.RUN in udpDict:
            self.outputText.appendPlainText("\nFOUND RUN HEADER")
            self.outputText.appendPlainText(str(udpDict))
            # FIXME: TEMPORARY...
            self.logger.info("\n\n\n\nFOUND RUN HEADER")
            # update the frequency information (min, max, step)
            # FIXME: move this to a subroutine...
            self.globalFreqMin_val.setText(f"{udpDict[ddp.Frame.RUN]['stimFreqMin_Hz']:.2f}")
            self.globalFreqMax_val.setText(f"{udpDict[ddp.Frame.RUN]['stimFreqMax_Hz']:.2f}")
            self.globalFreqStep_val.setText(f"{udpDict[ddp.Frame.RUN]['stimFreqStep_Hz']:.2f}")
            
        if ddp.Frame.FREQ in udpDict:
            self.logger.info("FOUND FREQUENCY HEADER")
            self.logger.info(udpDict)
            self.globalFreqActive_val.setText(f"{udpDict[ddp.Frame.FREQ]['stimFreqActive_Hz']:.2f}")
            
        # Check to see if this is an ADC data transfer:
        if ddp.Frame.ADC_DATA in udpDict:
            self.outputText.appendPlainText("\nFOUND ADC DATA\n")
            # update the relevant plot...
            regId = udpDict[ddp.Frame.FREQ]['Register_ID_Freq']
            self.logger.info(f'regId = {regId}')
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

            # Update A(f) plot
            self.curves['amplgrid'][regId].setData(self.ampData[reg]['freq'], self.ampData[reg]['ampl'])
            self.curves['amplgrid']['all'][regId].setData(self.ampData[reg]['freq'], self.ampData[reg]['ampl'])
            self.curves['amplchan'][regId].setData(self.ampData[reg]['freq'], self.ampData[reg]['ampl'])
            if regId == self.chanViewMainAmpl:
                self.curves['amplchan']['main'].setData(self.ampData[reg]['freq'], self.ampData[reg]['ampl'])

            

    def cleanUp(self):
        self.logger.info("App quitting:")
        self.logger.info("   closing UDP connection")
        self.sock.close()
        
        
def main():
    app = qtw.QApplication(sys.argv)
    window = MainWindow()
    app.aboutToQuit.connect(window.cleanUp)
    app.exec_()
    #sys.exit(app.exec_())  # diff btw this and prev. line???

if __name__ == "__main__":
    main()
        
