# FIXME/TODO:
# * use tabWidget.currentChanged.connect(self.tabChanged)
#   https://stackoverflow.com/questions/21562485/pyqt-qtabwidget-currentchanged
#   def tabChanged(self, i):
#       print(f"Tab index: {i}")
#   To keep track of the current tab index!
#   And make keyboard shortcuts just change the active tab (then the callback will handle remembering the active tab)
# * self.currentView is not properly coded... both MainView and StimView share indices. Yikes!!!!
# * Event Viewer: plot data accurately -- all freq data on a per-channel basis. Not just freqs that are present for all channels!
# * add a "listen" mode -- no need to connect to a DWA to listen for udp packets (e.g. when replaying data)
# * Update plot title V(t) to show frequency of scan
# * Update plot title to list file root YYYYMMDDTHHMMSS
# * Print GUI software version in title bar
# * When starting a new run, clear all plots (prior to sending TCP/IP data?)
# * "Connect" button that loads the DAQ config file
#   and DAQ Config Filename in "Advanced"
# * New directory for config files config/
# * Can't close window without killing process on linux...
# * Put the client_IP in the DAQ config file
# * should we really log the status frames to file?
# * Update human parsing of frequency (fixed point now...)
# * Status frame parsing/displaying...
# * Should status frame UDP data be logged to file????? (currently it is...)
# * Add axis labels to plots
# * resonance lines could use "span" keyword to draw only the part of the plot that is in the peak
#   e.g. from "baseline" to peak, as well as peak width, as in final example of:
#   https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.find_peaks.html
# * fix the "abort" button. After clicking Start button --> button becomes "Abort Scan".
# * The new register to set an additional stimulus time for the first sample in the run,  stimTimeInitial,
#   is a 24 bit register with the same units as the stimulus time, 2.56us, and is at address 0x2C. 
# * Logging: is generally a mess. many log entries are printed to screen in duplicate...
# * Logging: use RotatingFileHandler for log file, and don't create a new log file each time... ???
# * Use rotatingfilehandler for the udpStream.txt, too!
# * look for dropped UDP packets by monitoring the UDP counter
#   (careful with wraps of the counter, and with STATUS frames)
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
import json

from functools import partial
from enum import Enum, IntEnum
import string

from itertools import chain

import numpy as np
import scipy
from scipy.signal import find_peaks

from PyQt5 import uic
from PyQt5 import QtWidgets as qtw
from PyQt5 import QtGui as qtg
from PyQt5 import QtCore as qtc
from PyQt5.QtCore import pyqtSlot

import pyqtgraph as pg

import dwaTools as dwa
import DwaDataParser as ddp
import DwaConfigFile as dcf
import DwaMicrozed as duz

from SietchConnect import SietchConnect

sys.path.append('./mappings')
import config_generator
import channel_map
import channel_frequencies
import ChannelMapping

DWA_DAQ_VERSION = "X.X.X"
#
DWA_CONFIG_FILE = "dwaConfigWCLab.ini"
DAQ_CONFIG_FILE = 'dwaConfigDAQ.ini'
AMP_DATA_FILE   = "ampData/slowScan.json"
#EVT_VWR_TIMESTAMP = "20210526T222903"
EVT_VWR_TIMESTAMP = "20210617T172635"
DAQ_UI_FILE = 'dwaDaqUI.ui'
OUTPUT_DIR_UDP_DATA = './udpData/'
OUTPUT_DIR_AMP_DATA = './ampData/'        
CLOCK_PERIOD_SEC = 1e8
STIM_VIEW_OFFSET = 0

# FIXME: these should go in DwaDataParser.py
RUN_START = 1
RUN_END = 0

# Attempt to display logged events in a text window in the GUI
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

class State(IntEnum):
    IDLE = 0
    SCAN = 1
    POST_SCAN = 2

class MainView(IntEnum):
    STIMULUS  = 0 # config/V(t)/A(f) [Stimulus view]
    RESFREQ   = 1 # A(f) data and fitting
    TENSION   = 2 # Tension view
    LOG       = 3 # Log-file output    
    EVTVWR    = 4 # Event Viewer tab

class StimView(IntEnum):
    ''' for stackedWidget page indexing '''
    CONFIG   = 0+STIM_VIEW_OFFSET  # Show the configuration parameters
    ADVANCED = 1+STIM_VIEW_OFFSET  # "Advanced" configuration tab
    V_GRID   = 2+STIM_VIEW_OFFSET  # V(t) (grid view)
    V_CHAN   = 3+STIM_VIEW_OFFSET  # V(t) (channel view)
    A_GRID   = 4+STIM_VIEW_OFFSET  # A(f) (grid view)
    A_CHAN   = 5+STIM_VIEW_OFFSET  # A(f) (channel view)

class Shortcut(Enum):
    STIMULUS = "CTRL+S"
    RESFREQ  = "CTRL+R"
    TENSION  = "CTRL+T"
    LOG      = "CTRL+L"
    EVTVWR   = "CTRL+E"
    #
    CONFIG   = "CTRL+C"
    V_GRID   = "CTRL+V"
    A_GRID   = "CTRL+A"
    #
    EVT_NEXT = qtc.Qt.Key_Right
    EVT_PREV = qtc.Qt.Key_Left
    EVT_NEXT10 = qtc.Qt.Key_Up
    EVT_PREV10 = qtc.Qt.Key_Down
    EVT_FIRST = "A"
    EVT_LAST = "E"
    
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
        
# new additions
# From:
# https://stackoverflow.com/questions/51404102/pyqt5-tabwidget-vertical-tab-horizontal-text-alignment-left
#class TabBar(qtw.QTabBar):
#    def tabSizeHint(self, index):
#        s = qtw.QTabBar.tabSizeHint(self, index)
#        s.transpose()
#        return s
#
#    def paintEvent(self, event):
#        painter = qtw.QStylePainter(self)
#        opt = qtw.QStyleOptionTab()
#
#        for i in range(self.count()):
#            self.initStyleOption(opt, i)
#            painter.drawControl(qtw.QStyle.CE_TabBarTabShape, opt)
#            painter.save()
#
#            s = opt.rect.size()
#            s.transpose()
#            r = qtc.QRect(qtc.QPoint(), s)
#            r.moveCenter(opt.rect.center())
#            opt.rect = r
#
#            c = self.tabRect(i).center()
#            painter.translate(c)
#            painter.rotate(90)
#            painter.translate(-c)
#            painter.drawControl(qtw.QStyle.CE_TabBarTabLabel, opt)
#            painter.restore()

class TensionTableModel(qtc.QAbstractTableModel):
    # See: https://www.learnpyqt.com/tutorials/qtableview-modelviews-numpy-pandas/
    def __init__(self, data):
        super(TensionTableModel, self).__init__()
        self._data = data

    def data(self, index, role):
        if role == qtc.Qt.DisplayRole:
            kk = list(sorted(self._data.keys()))[index.column()]
            return self._data[kk][index.row()]

    def rowCount(self, index):
        return len(self._data[list(self._data.keys())[0]])

    def columnCount(self, index):
        # assumes all rows are the same length!
        return len(self._data.keys())

    def headerData(self, section, orientation, role):
        if role == qtc.Qt.DisplayRole:
            if orientation == qtc.Qt.Horizontal:
                return str(sorted(self._data.keys())[section])
            if orientation == qtc.Qt.Vertical:
                return str(section+1)
    
            
class MainWindow(qtw.QMainWindow):
    def __init__(self, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)

        self._initLogging()

        ###########################################
        # Define list of registers
        # wire registers only
        self.registers = [ddp.Registers.D0, ddp.Registers.D1, ddp.Registers.D2,
                          ddp.Registers.D3, ddp.Registers.D4, ddp.Registers.D5,
                          ddp.Registers.D6, ddp.Registers.D7]
        # inclues wires & run & status registers
        self.registers_all = [item for item in ddp.Registers]  

        # Load the UI (built in Qt Designer)
        uic.loadUi(DAQ_UI_FILE, self)
        self.configFileContents.setReadOnly(True)
        self.btnScanCtrl.setEnabled(False)

        # adapt the tabs...
        # see https://stackoverflow.com/questions/51404102/pyqt5-tabwidget-vertical-tab-horizontal-text-alignment-left
        #self.tabWidget.setTabBar(TabBar(self.tabWidget))
        #self.tabWidget.setTabPosition(self.tabWidget.West)
        #self.tabWidget.insertTab(0, self.tab_config, "Config")
        #self.tabWidget.insertTab(1, self.tab_tension, "Tension")
        #self.pushButton_reach.clicked.connect(self.display)
        
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

        self.configFileName.setText(DWA_CONFIG_FILE)
        self.ampDataFilename.setText(AMP_DATA_FILE)

        # Event viewer tab stuff
        self._configureEventViewer()
        self.evtData = None
        
        # Make handles for widgets in the UI
        #self.stack = self.findChild(qtw.QStackedWidget, "stackedWidget")  #FIXME: can you just use self.stackedWidget ???
        #self.stack.setStyleSheet("background-color:white")
        
        # self.tabWidgetStage is the main set of tabs showing each stage in the process
        # self.tabWidgetStim is the set of tabs under the stimulus tab
        self.currentViewStage = MainView.STIMULUS
        self.tabWidgetStages.setCurrentIndex(self.currentViewStage)
        self.currentViewStim = StimView.CONFIG
        self.tabWidgetStim.setCurrentIndex(self.currentViewStim)
        
        # testing updating tab labels
        self._setTabTooltips()
        
        # Connect slots/signals
        self._connectSignalsSlots()
        
        # Tension Tab
        self._configureTensions()

        # Configure/label plots
        self._configurePlots()
        
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

        self._configureGUI()
        self._configureMultithreading()

        ###########################################
        # Create instance of data parser to handle incoming data
        self.dwaDataParser = ddp.DwaDataParser()
        # Create placeholder for a config file parser
        self.dwaConfigFile = None

        self._configureOutputs()

        self.registerOfVal = {}
        for reg in ddp.Registers:
            self.registerOfVal[reg.value] = reg

        self._configureAmps()
        
        # Info about current run
        self.stimFreqMin = 0
        self.stimFreqMax = 0
        self.state = State.IDLE

        # Socket for UDP connection to FPGA    
        self.sock = None

        # Start listening for UDP data (different from TCP/IP connection to uzed)
        self.verbose = 1
        self.udpConnect()

        
    # end of __init__ for class MainWindow

    def _configureAmps(self):
        self.ampData = {}  # hold amplitude vs. freq data for a scan
        self.resonantFreqs = {}
        for reg in self.registers:
            self.ampData[reg.value] = {'freq':[], 'ampl':[]}
            self.resonantFreqs[reg.value] = []   # a list of f0 values for each wire
        self._initResonanceFitLines()
        
        # Set A(f) peak detection parameters
        self.resFitParams = {}
        self.resFitParams['preprocess'] = {'detrend':True}  # detrend: subtract a line from A(f) before processing?
        self.resFitParams['find_peaks'] = {'bkgPoly':2, 'width':5, 'prominence':(5.0,None)}
        # FIXME: replace this with a Model/View approach
        self.resFitPreDetrend.blockSignals(True)
        self.resFitPreDetrend.setChecked(self.resFitParams['preprocess']['detrend'])
        self.resFitPreDetrend.blockSignals(False)
        self.resFitBkgPoly.setText(str(self.resFitParams['find_peaks']['bkgPoly']))
        print(f"str(self.resFitParams['find_peaks']['width']) = {str(self.resFitParams['find_peaks']['width'])}")
        self.resFitWidth.setText(str(self.resFitParams['find_peaks']['width']))
        self.resFitProminence.setText(str(self.resFitParams['find_peaks']['prominence']))

        # KLUGE for now...
        self.resFitParamsOut = {}
        for reg in self.registers:
            chan = reg.value
            self.resFitParamsOut[chan] = {'peaks':[], 'properties':{}}

    def _configureOutputs(self):

        ###########################################
        # Ensure there is a directory to save UDP data
        self.udpDataDir = OUTPUT_DIR_UDP_DATA
        try:
            logging.info("Checking for UDP Data directory...")
            os.makedirs(self.udpDataDir)
            logging.info("  Directory did not exist... made {}".format(self.udpDataDir))
        except FileExistsError:
            # directory already exists
            logging.warning("  Directory already exists: [{}]".format(self.udpDataDir))        
        
        ###########################################
        # Ensure there is a directory to save amplitude data
        self.ampDataDir = OUTPUT_DIR_AMP_DATA
        try:
            logging.info("Checking for Amplitude Data directory...")
            os.makedirs(self.ampDataDir)
            logging.info("  Directory did not exist... made {}".format(self.ampDataDir))
        except FileExistsError:
            # directory already exists
            logging.warning("  Directory already exists: [{}]".format(self.ampDataDir))

        self.fnOfReg = {}  # file names for output (empty for now)
        self._makeOutputFilenames()
        

            
    def _configureMultithreading(self):
        # signals for callback actions
        self.signals = WorkerSignals()
      
        ###########################################
        # Set up multithreading
        self.threadPool = qtc.QThreadPool()
        self.threadPool.setMaxThreadCount(32)
        logging.info("Multithreading with maximum %d threads" %
              self.threadPool.maxThreadCount())
        print("Multithreading with maximum %d threads" %
              self.threadPool.maxThreadCount())

    def _configureGUI(self):
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

    def _configureTensions(self):
        self.tensionStageComboBox.addItem("Pre-production")
        self.tensionStageComboBox.addItem("Production")
        self.tensionStageComboBox.addItem("Commissioning")
        self.tensionData = {
            'XA':[0]*960,
            'XB':[0]*960,
            'UA':[0]*960,
            'UB':[0]*960,
            'VA':[0]*960,
            'VB':[0]*960,
            'GA':[0]*960,
            'GB':[0]*960,
        }
        

    
    def _connectSignalsSlots(self):
        self.tabWidgetStages.currentChanged.connect(self.tabChangedStage)
        self.tabWidgetStim.currentChanged.connect(self.tabChangedStim)
        self.btnDwaConnect.clicked.connect(self.dwaConnect)
        self.btnScanCtrl.clicked.connect(self.startRunThread)
        #self.btnSaveAmpl.clicked.connect(self.saveAmplitudeData)
        #self.btnQuit.clicked.connect(self.close)
        self.configFileName.returnPressed.connect(self.configFileNameEnter)
        self.ampDataFilename.returnPressed.connect(self.ampDataFilenameEnter)
        self.pb_ampDataLoad.clicked.connect(self.ampDataFilenameEnter)
        for reg in self.registers:
            getattr(self, f'le_resfreq_val_{reg}').returnPressed.connect(self._resFreqUserInputText)
        self.resFitPreDetrend.stateChanged.connect(self.resFitParameterUpdate)
        self.resFitBkgPoly.returnPressed.connect(self.resFitParameterUpdate)
        self.resFitWidth.returnPressed.connect(self.resFitParameterUpdate)
        self.resFitProminence.returnPressed.connect(self.resFitParameterUpdate)
        #
        #self.statusFramePeriod_val.returnPressed.connect(self.setStatusFramePeriod)
        # Resonance Tab
        self.btnSubmitResonances.clicked.connect(self.submitResonances)
        # Tensions tab
        self.btnLoadTensions.clicked.connect(self.loadTensions)
        # Config Tab
        self.btnConfigureScans.clicked.connect(self.configureScans)
        self.configStageComboBox.addItem("Pre-production")
        self.configStageComboBox.addItem("Production")
        self.configStageComboBox.addItem("Commissioning")
        self.configLayerComboBox.addItem("G")
        self.configLayerComboBox.addItem("U")
        self.configLayerComboBox.addItem("V")
        self.configLayerComboBox.addItem("X")

        
    def _configureEventViewer(self):
        self.evtVwr_runName_val.setText(EVT_VWR_TIMESTAMP)
        self.evtVwr_runName_val.returnPressed.connect(self.loadEventData)
        self.evtVwrPlotsGLW.setBackground('w')
        self.evtVwrPlots = []
        chanNum = 0
        for irow in range(3):
            for icol in range(3):
                if chanNum < 8:
                    self.evtVwrPlots.append(self.evtVwrPlotsGLW.addPlot())
                    plotTitle = f'V(t) Chan {chanNum}'
                    self.evtVwrPlots[-1].setTitle(plotTitle)
                else:
                    # A(f) data for all channels
                    self.evtVwrPlots.append(self.evtVwrPlotsGLW.addPlot())                    
                chanNum += 1
            self.evtVwrPlotsGLW.nextRow()

    def udpConnect(self):
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
        if self.sock is not None:
            print("closing socket")
            self.sock.close()
            self.sock = None
            
        logging.info("making socket")
        self.sock = socket.socket(family=socket.AF_INET,  # internet
                                  type=socket.SOCK_DGRAM) # UDP
        self.sock.bind( self.udpServerAddressPort ) # this is required
        #self.sock.settimeout(self.udpTimeoutSec)    # if no new data comes from server, quit
        #self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) #FIXME: this is not necessary
        
        # Start listening for UDP data in a Worker thread
        self.udpListen()

    @pyqtSlot()
    def dwaConnect(self):
        # Collect/parse DAQ-related configuration parameters
        # FIXME --- need to read/parse .ini file...
        self._loadDaqConfig()

        # Set up connection to Microzed
        self.uz = duz.DwaMicrozed(ip=self.daqConfig['DWA_IP'])
        self.uz.setVerbose(self.daqConfig['verbose'])
        self.verbose = int(self.daqConfig['verbose'])
        # Set up STATUS frame cadence
        self.uz.setStatusFramePeriod(self.daqConfig['statusPeriod'])

        self.btnDwaConnect.setText("Re-connect")
        self.btnScanCtrl.setStyleSheet("background-color : green")  # button is green when scan is inactive, red when active
        self.btnScanCtrl.setEnabled(True)
        
        
    def _initResonanceFitLines(self):
        self.resFitLines = {'raw':{},  # hold instances of InfiniteLines for both
                            'proc':{},  # raw and processed A(f) plots
                            'procDebug':{} # for debugging
                            }  
        for reg in self.registers:
            self.resFitLines['raw'][reg] = []
            self.resFitLines['proc'][reg] = []
            self.resFitLines['procDebug'][reg] = []
            
    def _setTabTooltips(self):
        self.tabWidgetStages.setTabToolTip(MainView.STIMULUS, Shortcut.STIMULUS.value)
        self.tabWidgetStages.setTabToolTip(MainView.RESFREQ, Shortcut.RESFREQ.value)
        self.tabWidgetStages.setTabToolTip(MainView.TENSION, Shortcut.TENSION.value)
        self.tabWidgetStages.setTabToolTip(MainView.LOG, Shortcut.LOG.value)
        self.tabWidgetStages.setTabToolTip(MainView.EVTVWR, Shortcut.EVTVWR.value)
        #
        self.tabWidgetStim.setTabToolTip(StimView.CONFIG, Shortcut.CONFIG.value)
        self.tabWidgetStim.setTabToolTip(StimView.V_GRID, Shortcut.V_GRID.value)
        self.tabWidgetStim.setTabToolTip(StimView.A_GRID, Shortcut.A_GRID.value)

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
        #self.logger.setLevel(logging.INFO)
        self.logger.setLevel(logging.CRITICAL)
        
        self.logFilename = os.path.join(self.logDir,    # e.g. ./logs/20200329T120531.log
                                        datetime.datetime.now().strftime("%Y%m%dT%H%M%S.log") )
        loggingFormatter = logging.Formatter('%(levelname)s:%(name)s:%(message)s')
        #logging.basicConfig(filename=self.logFilename, level=logging.INFO, filemode='w',
        #                    format='%(levelname)s:%(name)s:%(message)s')

        # log output to file (doesn't work in other threads, only in main...)
        fh = logging.FileHandler(self.logFilename)
        #fh.setLevel(logging.INFO)
        fh.setLevel(logging.CRITICAL)
        fh.setFormatter(loggingFormatter)
        self.logger.addHandler(fh)
        
        # log output to terminal
        ch = logging.StreamHandler()
        #ch.setLevel(logging.DEBUG)
        ch.setLevel(logging.CRITICAL)
        ch.setFormatter(loggingFormatter)
        #self.logger.addHandler(ch)

        self.logger.info(f'Log created {self.logFilename}')

    #def configureScans(self):
        #measuredBy = self.measuredByLineEdit.text()
        # configStage = self.configStageComboBox.currentText()
        # configApaUuid = self.configApaUuid.text()
        # configLayer = self.configLayerComboBox.currentText()
        # configHeadboard = self.configHeadboardSpinBox.value()
        # channelGroups = []
        # scanListText = ""
        # scanNum = 1
        # for i in range(5):
        #     startChan = (configHeadboard-1)*40 + i*8 + 1
        #     channels = range(startChan, startChan+8)
        #     rangeData = ChannelMapping.get_range_data_for_channels(configLayer, channels)
        #     for obj in rangeData:
        #         scanListText = scanListText + srt(scanNum) + ". " + ", ".join(obj["wires"]) + "("+obj["range"][0]+", "+ obj["range"][1] + ")\n"
        #         scanNum = scanNum + 1

        #     logging.info("Resonances")
        #     logging.info(resonances)
        
        # logging.info("Configuring scans")
        # logging.info(measuredBy)
        # logging.info(configStage)
        # logging.info(configHeadboard)
        # logging.info(configHeadboard*2)
        # logging.info(channelGroups)
        # self.configScanListTextEdit.setPlainText(scanListText)
    def hexString(self, val):
        return str(hex(int(val))).upper()[2:].zfill(8)

    def configureScans(self):
        self.measuredBy = self.measuredByLineEdit.text()
        self.configStage = self.configStageComboBox.currentText()
        self.configApaUuid = self.configApaUuid.text()
        self.configLayer = self.configLayerComboBox.currentText()
        self.configHeadboard = self.configHeadboardSpinBox.value()
        self.SideComboBox = self.SideComboBox.currentText()

        advFss = self.advFssLineEdit.text() # Freq step size
        advStimTime = self.advStimTimeLineEdit.text() # Stimulation time
        advInitDelay = self.advInitDelayLineEdit.text() # Init delay
        advAmplitude = self.advAmplitudeLineEdit.text() # Amplitude

        # TODO: Make sure inputs can be safely converted to floats
        # TODO: Grab default values if undefined
        if advFss: advFss = float(advFss)
        else: advFss = 0
        if advStimTime: advStimTime = float(advStimTime)
        else: advStimTime = 0
        if advInitDelay: advInitDelay = float(advInitDelay)
        else: advInitDelay = 0.
        if advAmplitude: advAmplitude = float(advAmplitude)
        else: advAmplitude = 0.



        channelGroups = channel_map.channel_groupings(self.configLayer, self.configHeadboard)
        scanListText = ""
        scanNum = 1
        for channels in channelGroups:

            range_data = channel_frequencies.get_range_data_for_channels(self.configLayer, channels)

            logging.info("channels")
            logging.info(channels)
            for rd in range_data:
                logging.info("rd")
                logging.info(rd)
                wires = rd["wires"]
                freqMin = float(rd["range"][0])
                freqMax = float(rd["range"][1])
                logging.info("freqMin")
                logging.info(freqMin*16)
                wires.sort(key = int)
                scanListText = scanListText + str(scanNum) + "." + ", ".join(wires) + " (" + str(freqMin) + ", " + str(freqMax) + ")\n"
                # XYZ

                #defaultConfig = dcf.DwaConfigFile("dwaConfig.ini")
                

                fpgaConfig = config_generator.configure_default()
                fpgaConfig.update(config_generator.configure_scan_frequencies(freqMin, freqMax, stim_freq_step=advFss))
                fpgaConfig.update(config_generator.configure_relays(self.configLayer,channels))

                fpgaConfig.update(config_generator.configure_ip_addresses()) # TODO: Make configurable
                fpgaConfig.update(config_generator.configure_run_type()) # TODO: This chould change based on fixed freq or freq sweep
                fpgaConfig.update(config_generator.configure_fixed_frequency())
                fpgaConfig.update(config_generator.configure_scan_frequencies(freqMin, freqMax, stim_freq_step=advFss))
                logging.info("advInitDelay")
                logging.info(advInitDelay)
                logging.info("advStimTime")
                logging.info(advStimTime)
                fpgaConfig.update(config_generator.configure_wait_times(advInitDelay, advStimTime))
                fpgaConfig.update(config_generator.configure_gains(stim_freq_max=freqMax, stim_mag=0xBB8, digipot=0x7766554433221100)) # TODO: Should stim_mag and digipot be configurable?
                fpgaConfig.update(config_generator.configure_sampling()) # TODO: Should this be configurable?
                fpgaConfig.update(config_generator.configure_relays(self.configLayer,channels))
                fpgaConfig.update(config_generator.configure_noise_subtraction(freqMin, freqMax))
                
                logging.info("fpgaConfig")
                logging.info(fpgaConfig)

                dataConfig = {"channels": channels, "wires": wires, "measuredBy": self.measuredBy, "stage": self.configStage, "apaUuid": self.configApaUuid, 
                "layer": self.configLayer, "headboardNum": self.configHeadboard, "side": self.SideComboBox}

                combinedConfig = {"FPGA": fpgaConfig, "Database": dataConfig}
                config_generator.write_config(combinedConfig, 'dwaConfig_'+str(scanNum)+'.ini')

                # with open('dwaConfig_'+str(scanNum)+'.ini', 'w') as configfile:
                #     configfile.write("[FPGA]\n")
                #     configfile.write("auto               = 00000001  # 0 is fixed frequency\n")
                #     configfile.write("stimFreqReq        = 00000C80  # [1/16 Hz] Fixed frequency:\n")
                #     configfile.write("stimFreqMin        = "+self.hexString(freqMin*16)+"  # [1/16 Hz]\n")
                #     configfile.write("stimFreqMax        = "+self.hexString(freqMax*16)+"  # [1/16 Hz]\n")
                #     configfile.write("stimFreqStep       = "+self.hexString(advFss*16)+"  # [1/16 Hz]\n")
                #     configfile.write("stimTime           = "+self.hexString(advStimTime*1e5)+" # units? (maybe 10us)\n")
                #     configfile.write("stimMag            = "+self.hexString(advAmplitude)+"  # 12-bit DAC:\n")
                #     configfile.write("cyclesPerFreq      = 00000002  # \n")
                #     configfile.write("adcSamplesPerCycle = 00000010  # \n")
                #     configfile.write("digipot            = 2222222222222222\n")
                #     configfile.write("relayMask          = 00000000  # relay 32 is 0x1:\n")
                #     configfile.write("coilDrive          = 00000000 \n")
                #     configfile.write("stimTimeInitial    = 00100000\n")
                #     configfile.write("client_IP = 8cf77b61 # James's home (DHCP...): 108.49.52.252\n")
                #     configfile.write("relayWireTop = 0000000000000000 # 64-bit  top3top2top1top0\n")
                #     configfile.write("relayWireBot = 00FF0000FF000080 # 64-bit  bot3bot2bot1bot0\n")
                #     configfile.write("relayBusTop  = 00000000         # 32-bit  top1top0\n")
                #     configfile.write("relayBusBot  = AAAAAAAA         # 32-bit  bot1bot0\n")
                #     configfile.write("noiseFreqMin           = 00000340  # [1/16Hz]  55 Hz\n")
                #     configfile.write("noiseFreqMax           = 00000340  # [1/16Hz]  65 Hz\n")
                #     configfile.write("noiseFreqStep          = 00000010  # [1/16Hz]   1 Hz\n")
                #     configfile.write("noiseSettlingTime      = 00001000  # [2.56 us]  00001000 ~ 10ms\n")
                #     configfile.write("noiseAdcSamplesPerFreq = 00000100  # [unitless] (256 samples) limited to 256\n")
                #     configfile.write("noiseSamplingPeriod    = 0000CB73  # [10ns]   32 samp/cycle @ 60 Hz\n")
                
                scanNum = scanNum + 1
        
        self.configNextScanComboBox.clear()
        for i in range(1, scanNum):
            self.configNextScanComboBox.addItem(str(i))
        
        logging.info("Configuring scans")
        logging.info(self.measuredBy)
        logging.info(self.configStage)
        logging.info(self.configHeadboard)
        logging.info(self.configHeadboard*2)


        logging.info(channelGroups)
        self.configScanListTextEdit.setPlainText(scanListText)


        
    def _configurePlots(self):
        self.chanViewMain = 0  # which channel to show large for V(t) data
        self.chanViewMainAmpl = 0  # which channel to show large for A(f) data
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
            #getattr(self, f'pw_resfreqfit_{ii}').setBackground('w')
            #getattr(self, f'pw_resfreqfit_{ii}').setTitle(ii)

        # Resonance Tab, raw A(f) plots (will also show f0 lines)
        self.resonanceRawDataGLW.setBackground('w')        # "GLW" = GraphicsLayoutWidget
        self.resonanceProcessedDataGLW.setBackground('w')

        self.resonanceRawPlots = []
        self.resonanceProcessedPlots = []
        chanNum = 0
        for irow in range(4):
            for icol in range(2):
                self.resonanceRawPlots.append(self.resonanceRawDataGLW.addPlot())
                self.resonanceRawPlots[-1].setTitle(f'A(f) raw Chan {chanNum}')
                self.resonanceProcessedPlots.append(self.resonanceProcessedDataGLW.addPlot())
                self.resonanceProcessedPlots[-1].setTitle(f'A(f) proc. Chan {chanNum}')
                chanNum += 1
            self.resonanceRawDataGLW.nextRow()
            self.resonanceProcessedDataGLW.nextRow()

        # Tension tab
        self.tensionGLW.setBackground('w')
        self.tensionPlots = {}
        for layer in ["G","U","V","X"]:
            self.tensionPlots[layer] = {}
            for side in ["A", "B"]:
                self.tensionPlots[layer][side] = (self.tensionGLW.addPlot())
                self.tensionPlots[layer][side].setTitle(f'Layer {layer} Side {side}')
            self.tensionGLW.nextRow()

        #self.tensionPlots = {}
        #self.tensionPlots['tensionOfWireNumber'] = self.tensionGLW.addPlot(title="Tensions", labels={'left':"Tension [N]", 'bottom':"Wire number"})
        # logging.warning("self.tensionData[GA]")
        # logging.warning(self.tensionData["GA"])
        # # tensionSpecRegion = pg.LinearRegionItem(values=self.tensionData["GA"], orientation=1,  movable=False) # 1=horizontal, 0=vert.

        # # Create the scatter plot and add it to the view
        # scatter = pg.ScatterPlotItem(pen=pg.mkPen(width=5, color='r'), symbol='o', size=1)
        # self.tensionPlots['tensionOfWireNumber'].addItem(scatter)
        # pos = [{'pos': [i,self.tensionData["GA"][i]]} for i in range(960)]
        # scatter.setData(pos)
        # self.tensionPlots['tensionOfWireNumber'].addItem(scatter)
            
        
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
        self.curves['resfreqfit'] = {}   # Fitting f0 values to A(f)
        self.curves['resRawFit'] = {}    # Raw A(f) data on Resonance tab
        self.curves['resProcFit'] = {}   # Processed A(f) data on Resonance tab
        self.curves['tension'] = {} # Wire tension plots (multiple figures, all on "tension" page)
        self.curves['evtVwr'] = {'V(t)':{}, 'A(f)':{}} # V(t) and A(f)
        self.curvesFit = {}  # FIXME: kluge -- merge w/ self.curves
        self.curvesFit['evtVwr'] = {'V(t)':{}} # V(t) 
        self.curvesFit['grid'] = {} # V(t), grid
        self.curvesFit['chan'] = {} # V(t), chan
        #amplAllPlotPens = [pg.mkPen(color=(0,  0, 0)), pg.mkPen(color=(210,105,30)),
        #                   pg.mkPen(color=(255,0, 0)), pg.mkPen(color=(255,165, 0)),
        #                   pg.mkPen(color=(255,255,0)), pg.mkPen(color=(0,255,0)),
        #                   pg.mkPen(color=(0,0,255)), pg.mkPen(color=(148,0,211))]
        amplAllPlotPens = [pg.mkPen(color='#2a1636'), pg.mkPen(color='#541e4e'),
                           pg.mkPen(color='#841e5a'), pg.mkPen(color='#b41658'),
                           pg.mkPen(color='#dd2c45'), pg.mkPen(color='#f06043'),
                           pg.mkPen(color='#f5946b'), pg.mkPen(color='#f6c19f')]
        for pen in amplAllPlotPens:
            pen.setWidth(3)
        amplPlotPen = pg.mkPen(color=(0,0,0), style=qtc.Qt.DotLine, width=1)
        for loc in range(8):
            # V(t) plots
            self.curvesFit['grid'][loc] = getattr(self, f'pw_grid_{loc}').plot([0],[0], pen=fitPen)
            self.curvesFit['chan'][loc] = getattr(self, f'pw_chan_{loc}').plot([0],[0], pen=fitPen)
            self.curves['grid'][loc] = getattr(self, f'pw_grid_{loc}').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=None)
            self.curves['chan'][loc] = getattr(self, f'pw_chan_{loc}').plot([0],[0], symbol='o', symbolSize=2, symbolBrush='k', symbolPen='k', pen=None)
            #
            # A(f) plots (grid view)
            self.curves['amplgrid'][loc] = getattr(self, f'pw_amplgrid_{loc}').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=amplPlotPen)
            # A(f), all channels on single axes
            self.curves['amplgrid']['all'][loc] = getattr(self, f'pw_amplgrid_all').plot([0],[0], pen=amplAllPlotPens[loc])
            # A(f) plots (channel view)
            self.curves['amplchan'][loc] = getattr(self, f'pw_amplchan_{loc}').plot([0],[0], symbol='o', symbolSize=2, symbolBrush='k', symbolPen='k', pen=amplPlotPen)
            # Fitting f0 to A(f) plots
            self.curves['resRawFit'][loc] = self.resonanceRawPlots[loc].plot([0],[0], symbol='o', symbolSize=2, symbolBrush='k', symbolPen='k', pen=amplPlotPen)
            self.curves['resProcFit'][loc] = self.resonanceProcessedPlots[loc].plot([0],[0], symbol='o', symbolSize=2, symbolBrush='k', symbolPen='k', pen=amplPlotPen)
            
        # add in the main window, too (large view of V(t) for a single channel)
        self.curvesFit['chan']['main'] = getattr(self, f'pw_chan_main').plot([0],[0], pen=fitPen)
        self.curves['chan']['main'] = getattr(self, f'pw_chan_main').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=None)

        # add in the main window, too (large view of A(f) for a single channel)
        self.curves['amplchan']['main'] = getattr(self, f'pw_amplchan_main').plot([0],[0], symbol='o', symbolSize=5, symbolBrush='k', symbolPen='k', pen=amplPlotPen)

        # Tension
        #self.curves['tension']['TofWireNum'] = {}
        #tensionPen = pg.mkPen(width=5, color='r')
        #for layer in ["G","U","V","X"]:
        #    for side in ["A","B"]:
        #        self.curves['tension']['TofWireNum'][layer+side] = pg.ScatterPlotItem(pen=tensionPen, symbol='o', size=1)
        
        ### Tension information
        ###self.curves['tension']['tensionOfWireNumber'] = self.tensionPlots['tensionOfWireNumber'].plot([0],[0], symbol='o', symbolSize=2, symbolBrush='k', symbolPen='k', pen=None)

        # Event Viewer plots
        evtVwrPlotPenVolt = pg.mkPen(color=(0,0,0), style=qtc.Qt.DotLine, width=1)
        evtVwrPlotPenAmpl = pg.mkPen(color=(0,0,0), style=qtc.Qt.DotLine, width=1)
        for loc in range(8):
            self.curvesFit['evtVwr']['V(t)'][loc] = self.evtVwrPlots[loc].plot([0],[0], pen=amplAllPlotPens[loc])
            self.curves['evtVwr']['V(t)'][loc] = self.evtVwrPlots[loc].plot([0],[0], symbol='o', symbolSize=3, symbolBrush='k',
                                                                            symbolPen='k', pen=None)#, pen=evtVwrPlotPenVolt)
        self.evtVwrPlots[6].setLabel("bottom", "Time [s]")
        self.evtVwrPlots[7].setLabel("bottom", "Time [s]")
        self.evtVwrPlots[8].setLabel("bottom", "Frequency [Hz]")
        # In the 9th plot, put all A(f) data
        for chan in range(8):
            self.curves['evtVwr']['A(f)'][chan] = self.evtVwrPlots[-1].plot([0], [0], pen=amplAllPlotPens[chan], symbol='o', symbolSize=2, symbolBrush=amplAllPlotPens[chan].color(), symbolPen=amplAllPlotPens[chan].color())
        # Add a vertical line showing the current frequency
        f0Pen = pg.mkPen(color='#000000', width=2, style=qtc.Qt.DashLine)
        self.curves['evtVwr']['A(f)']['marker'] = self.evtVwrPlots[-1].addLine(x=0, movable=True, pen=f0Pen)
        self.curves['evtVwr']['A(f)']['marker'].sigPositionChangeFinished.connect(self._evtVwrF0LineMoved)
        
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
        pass
        #self.curves['tension']['tensionOfWireNumber'].setData(self.dummyDataTension['x'],
                                                              #self.dummyDataTension['y'])
            
    def _keyboardShortcuts(self):
        print("Setting up keyboard shortcuts")
        # Stimulus Screen
        self.scStimulusView = qtw.QShortcut(qtg.QKeySequence(Shortcut.STIMULUS.value), self)
        self.scStimulusView.activated.connect(self.viewStimulus)

        # Resonant frequency fit
        self.scResFreqFitView = qtw.QShortcut(qtg.QKeySequence(Shortcut.RESFREQ.value), self)
        self.scResFreqFitView.activated.connect(self.viewResFreqFit)

        # Tension data
        self.scTensionView = qtw.QShortcut(qtg.QKeySequence(Shortcut.TENSION.value), self)
        self.scTensionView.activated.connect(self.viewTensions)

        # Show log
        self.scLog = qtw.QShortcut(qtg.QKeySequence(Shortcut.LOG.value), self)
        self.scLog.activated.connect(self.viewLog)

        # Show event viewer
        self.scEvtVwr = qtw.QShortcut(qtg.QKeySequence(Shortcut.EVTVWR.value), self)
        self.scEvtVwr.activated.connect(self.viewEvtVwr)

        # Show configuration parameters
        self.scConfig = qtw.QShortcut(qtg.QKeySequence(Shortcut.CONFIG.value), self)
        self.scConfig.activated.connect(self.viewConfig)

        # V(t) data (grid view)
        self.scGridView = qtw.QShortcut(qtg.QKeySequence(Shortcut.V_GRID.value), self)
        self.scGridView.activated.connect(self.viewGrid)

        # A(f) data (grid view)
        self.scAmplGridView = qtw.QShortcut(qtg.QKeySequence(Shortcut.A_GRID.value), self)
        self.scAmplGridView.activated.connect(self.viewAmplGrid)
        
        # Show V(t) or A(f) (channel view)
        # FIXME: move these to "Shortucut" ENUM?
        chans = range(8)
        self.chanViewShortcuts = []  # FIXME: no need to save these, just need to connect slot...
        for chan in chans:
            # V(t)
            self.chanViewShortcuts.append(qtw.QShortcut(qtg.QKeySequence(f'Alt+{chan}'), self))
            self.chanViewShortcuts[-1].activated.connect(partial(self.viewChan, chan))
            # A(f)
            self.chanViewShortcuts.append(qtw.QShortcut(qtg.QKeySequence(f'Ctrl+{chan}'), self))
            self.chanViewShortcuts[-1].activated.connect(partial(self.viewAmplChan, chan))

        # Event Viewer shortcuts
        self.scEvtVwrNext = qtw.QShortcut(qtg.QKeySequence(Shortcut.EVT_NEXT.value), self)
        self.scEvtVwrNext.activated.connect(partial(self.evtVwrChange, 1))
        self.scEvtVwrPrev = qtw.QShortcut(qtg.QKeySequence(Shortcut.EVT_PREV.value), self)
        self.scEvtVwrPrev.activated.connect(partial(self.evtVwrChange, -1))
        self.scEvtVwrNext10 = qtw.QShortcut(qtg.QKeySequence(Shortcut.EVT_NEXT10.value), self)
        self.scEvtVwrNext10.activated.connect(partial(self.evtVwrChange, 10))
        self.scEvtVwrPrev10 = qtw.QShortcut(qtg.QKeySequence(Shortcut.EVT_PREV10.value), self)
        self.scEvtVwrPrev10.activated.connect(partial(self.evtVwrChange, -10))
        self.scEvtVwrLast = qtw.QShortcut(qtg.QKeySequence(Shortcut.EVT_LAST.value), self)
        self.scEvtVwrLast.activated.connect(partial(self.evtVwrChange, 100000000))
        self.scEvtVwrFirst = qtw.QShortcut(qtg.QKeySequence(Shortcut.EVT_FIRST.value), self)
        self.scEvtVwrFirst.activated.connect(partial(self.evtVwrChange, -100000000))

        
    #@pyqtSlot()
    #def setStatusFramePeriod(self):
    #    # Set up STATUS frame cadence
    #    try:
    #        statusFramePeriod_sec = float(self.statusFramePeriod_val.text())
    #        print(f'statusFramePeriod_sec = {statusFramePeriod_sec}')
    #    except:
    #        print("invalid value for status frame period (must be float)")
    #        return
    #
    #    self.daqConfig['statusPeriodSec'] = statusFramePeriod_sec
    #    self.daqConfig['statusPeriod'] = f"{int(float(self.daqConfig['statusPeriodSec']) / 2.56e-6):08X}"
    #    self.uz.setStatusFramePeriod(self.daqConfig['statusPeriod'])
        
    @pyqtSlot()
    def evtVwrChange(self, step=None):
        print('\n\n\n')
        print(f"step by {step}")

        if self.evtData is None:
            print("No EVENT VIEWER data yet available")
            return
        
        nfreq = len(self.evtData['freqUnion'])
        idx = self.evtData['freqIdx'] + step
        if idx < 0:
            idx = 0
        if idx >= nfreq:
            idx = nfreq-1
        self.evtData['freqIdx'] = idx
        self.evtData['freqCurrent'] = self.evtData['freqUnion'][self.evtData['freqIdx']] 
        print('\n\n\n')
        self.evtVwrUpdatePlots()
        
    def evtVwrUpdatePlots(self, plotAmpl=False):
        #print("updating plots...")
        ifrq = self.evtData['freqIdx']
        for ichan in range(8):
            plotTitle = (f"V(t) Chan {ichan} Freq: {self.evtData['freqCurrent']:.3f} Hz  Ampl: {self.evtData['A(f)'][ichan][ifrq]:.2f}")
            self.evtVwrPlots[ichan].setTitle(plotTitle)
            if self.evtData['V(t)'][ichan][ifrq] is not None:
                self.curves['evtVwr']['V(t)'][ichan].setData(self.evtData['V(t)_time'][ichan][ifrq],
                                                             self.evtData['V(t)'][ichan][ifrq])
                self.curvesFit['evtVwr']['V(t)'][ichan].setData(self.evtData['V(t)_fit_time'][ichan][ifrq],
                                                                self.evtData['V(t)_fit'][ichan][ifrq])
            else:
                self.curves['evtVwr']['V(t)'][ichan].setData([0],[0])
                self.curvesFit['evtVwr']['V(t)'][ichan].setData([0],[0])
            
        # update the amplitude plots in the 9th window
        self.curves['evtVwr']['A(f)']['marker'].setValue(self.evtData['freqUnion'][ifrq])
        # Kluge -- no need to redraw this... just redraw
        if plotAmpl:
            for ichan in range(8):
                self.curves['evtVwr']['A(f)'][ichan].setData(self.evtData['freqUnion'], self.evtData['A(f)'][ichan])

                
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

        if self.state == State.IDLE:
            print("User has requested a new scan")
            # Change the button to "Abort Scan" (and change color, too)
            self.btnScanCtrl.setStyleSheet("background-color : red")
            self.btnScanCtrl.setText("Abort Scan")
            self.state = State.SCAN
            
            # Pass the function to execute
            worker = Worker(self.startRun)  # could pass args/kwargs too..
            #worker.signals.result.connect(self.printOutput)
            #worker.signals.finished.connect(self.threadComplete)

            # execute
            self.threadPool.start(worker)

        elif self.state == State.SCAN:
            # Change the button to "Abort Scan" (and change color, too)
            print("User has requested a soft abort of this run...")
            print("... this is not yet tested")
            self.uz.abort()
            
    def startRun(self):
        #self.outputText.appendPlainText("CLICKED START")
        #self.outputText.update()

        #import os.path #getting the right directory
        #os.chdir('config/')

        # startRun() is in a thread...  need to get logger?
        logger = logging.getLogger(__name__)
        self.configFile = self.configFileName.text()
        # If configFile is blank, use the generated one
        if not self.configFile:
            if self.configNextScanComboBox.currentText():
                self.configFile = "dwaConfig_"+self.configNextScanComboBox.currentText()+".ini"
            else:
                # If no generated one was found, use the default one
                self.configFile = "dwaConfig.ini"
        logger.info(self.configFile)
        logger.info(f"config file = {self.configFile}")
        #
        ## FIXME: the textbox doesn't update right away...
        ## need to force an update somehow....
        self._loadConfigFile(updateGui=False)

        print("\n\n =================== startRun()\n\n")
        
        print(f"self.configFile = {self.configFile}")
        # verify that config file can be opened
        try:
            with open(self.configFile) as fh:
                pass
        except:
            self.logger.error("Could not open config file -- cannot proceed")

        try:
            self.logger.info('======= dwaReset() ===========')
            self.uz.reset()
        except:
            self.logger.error("DWA reset failed")
            
        try:
            self.logger.info('======= dwaConfig() ===========')
            self.uz.config(self.dwaConfigFile.config['FPGA'])
        except:
            self.logger.error("DWA run configuration failed")
            
        try:
            self.logger.info('======= dwaStart() ===========')
            self.uz.start()
            self.logger.info('======= DONE WITH dwaStart() ===========')
            
            #logger.info('\n\n======= dwaStat() ===========')
            #self.uz.stat()

        except:
            self.logger.error("DWA run start failed")
            

    #@pyqtSlot()
    #def quitAll(self):

    @pyqtSlot()
    def tabChangedStage(self):
        self.currentViewStage = self.tabWidgetStages.currentIndex()
        print(f"tabWidgetStage changed... self.currentViewStage = {self.currentViewStage}")

    @pyqtSlot()
    def tabChangedStim(self):
        self.currentViewStim = self.tabWidgetStim.currentIndex()
        print(f"tabWidgetStim changed... self.currentViewStim = {self.currentViewStim}")
        

    @pyqtSlot()
    def resFitParameterUpdate(self):

        # Should we detrend the A(f) data first?
        self.resFitParams['preprocess']['detrend'] = self.resFitPreDetrend.isChecked()

        # polynomial order for background subtraction (after integrating)
        try:
            print(f'self.resFitBkgPoly.text() = {self.resFitBkgPoly.text()}')
            self.resFitParams['find_peaks']['bkgPoly'] = int(self.resFitBkgPoly.text())
        except:
            print('failed')
            self.resFitParams['find_peaks']['bkgPoly'] = 2

        # peak width parameter
        print(f'self.resFitWidth.text() = {self.resFitWidth.text()}')
        entryStr = self.resFitWidth.text().strip()
        toks = [x.strip() for x in entryStr.split(",")]
        print(f'peak width toks = {toks}')
        self.resFitParams['find_peaks']['width'] = [None, None]
        for ii, tok in enumerate(toks):
            try:
                self.resFitParams['find_peaks']['width'][ii] = int(tok)
            except:
                print(f"invalid entry resFit width: {tok} in {entryStr}")

        # prominence parameter
        print(f'self.resFitProminence.text() = {self.resFitProminence.text()}')
        entryStr = self.resFitProminence.text().strip()
        # Get rid of any parentheses
        entryStr = entryStr.replace("(","")
        entryStr = entryStr.replace(")","")
        toks = [x.strip() for x in entryStr.split(",")]
        print(f'prominence toks = {toks}')
        self.resFitParams['find_peaks']['prominence'] = [None, None]
        for ii, tok in enumerate(toks):
            if tok.upper() == 'NONE':
                continue
            try:
                self.resFitParams['find_peaks']['prominence'][ii] = float(tok)
            except:
                print(f"invalid entry resFit prominence: {tok} in {entryStr}")

        # Print params and refit
        print(f'self.resFitParams = {self.resFitParams}')
        self.postScanAnalysis()

    @pyqtSlot()
    def configFileNameEnter(self):
        self._loadConfigFile()

    @pyqtSlot()
    def ampDataFilenameEnter(self):
        self.doResonanceAnalysis()

    @pyqtSlot()
    def _resFreqUserInputText(self):
        for reg in self.registers:
            print(getattr(self, f'le_resfreq_val_{reg}').text())

        # FIXME: add check for which channel's textbox this came from
        # and only update the f0 values and GUI display for that associated channel
        # FIXME: add check to guard against failed parse
        for reg in self.registers:
            fString = getattr(self, f'le_resfreq_val_{reg}').text()
            toks = fString.split(',')
            self.resonantFreqs[reg.value] = [ float(tok) for tok in toks ]
        self._updateResonantFreqDisplay(chan=None)

    @pyqtSlot()
    def _f0LineClicked(self):
        print("f0Line clicked")
        print(f"pyqtgraph version {pg.__version__}")
        #print(ev)
        #print(f"line = {line}")
        #print(f"ev   = {ev}")
        #if ev.button() == qtc.Qt.RightButton:
        #    print('right button!')
            #if self.raiseContextMenu(ev):
            #    ev.accept()
        #else:
        #    print("not right button...")

    #def raiseContextMenu(self, ev):
    #    menu = self.getContextMenus()
    #    
    #    # Let the scene add on to the end of our context menu
    #    # (this is optional)
    #    menu = self.scene().addParentContextMenus(self, menu, ev)
    #    
    #    pos = ev.screenPos()
    #    menu.popup(QtCore.QPoint(pos.x(), pos.y()))
    #    return True

    @pyqtSlot()
    def _evtVwrF0LineMoved(self):
        print("\n\n\nevtVwr f0 Line moved")
        fDragged = self.curves['evtVwr']['A(f)']['marker'].value()
        # Get the current frequency
        # get index into freq that is closest to fDragged

        if self.evtData is None:
            print("Event Data not loaded yet")
            self.curves['evtVwr']['A(f)']['marker'].setValue(0)
            return

        # Find closest frequency
        diffs = np.abs(np.array(self.evtData['freqUnion'])-fDragged)
        dfMin = np.min(diffs)
        idx = np.where(diffs == dfMin)[0][0]            
        # Update values
        f0 = self.evtData['freqUnion'][idx]
        self.evtData['freqIdx'] = idx
        self.evtData['freqCurrent'] = f0
        ## Update plots
        self.evtVwrUpdatePlots(plotAmpl=False)
        
    @pyqtSlot()
    def _f0LineMoved(self):
        print("f0Line moved")

        # Figure out which plot the line drag was in
        # Flatten the list of InfiniteLines and match to source of signal
        rawLines = list(chain(*self.resFitLines['raw'].values()))
        procLines = list(chain(*self.resFitLines['proc'].values()))
        #rawLines = [x for v in self.resFitLines['raw'].values() for x in v]
        #procLines = [x for v in self.resFitLines['proc'].values() for x in v]
        if self.sender() in rawLines:
            source = 'raw'
        elif self.sender() in procLines:
            source = 'proc'
        else:
            print("ERROR: unknown source of signal: {self.sender}")
            return
        print(f"_f0LineMoved(): sender is from {source}")
            
        # loop over all channels. Get locations of lines
        for reg in self.registers:
            self.resonantFreqs[reg.value] = []  # start w/ empty list
            for infLine in self.resFitLines[source][reg]: # re-create resFreq list
                self.resonantFreqs[reg.value].append(infLine.value())
        
        # update GUI
        self._updateResonantFreqDisplay(chan=None)

        
    @pyqtSlot()
    def viewStimulus(self):
        self.currentViewStage = MainView.STIMULUS
        self.updateTabView()
        #self.tabWidgetStages.setCurrentIndex(self.currentViewStage)
        self.logger.info("View Stimulus")

    @pyqtSlot()
    def viewResFreqFit(self):
        self.currentViewStage = MainView.RESFREQ
        self.updateTabView()
        #self.tabWidgetStages.setCurrentIndex(self.currentViewStage)
        self.logger.info("View Resonant Frequencies")
            
    @pyqtSlot()
    def viewTensions(self):
        self.currentViewStage = MainView.TENSION
        self.updateTabView()
        #self.tabWidgetStages.setCurrentIndex(self.currentViewStage)
        self.logger.info("View Tensions")

    @pyqtSlot()
    def viewLog(self):
        self.currentViewStage = MainView.LOG
        self.updateTabView()
        #self.tabWidgetStages.setCurrentIndex(self.currentViewStage)
        self.logger.info("View LOG")
        
    @pyqtSlot()
    def viewEvtVwr(self):
        self.currentViewStage = MainView.EVTVWR
        self.updateTabView()
        #self.tabWidgetStages.setCurrentIndex(self.currentViewStage)
        self.logger.info("View EVENT VIEWER")
        
    @pyqtSlot()
    def viewConfig(self):
        self.currentViewStage = MainView.STIMULUS
        self.currentViewStim = StimView.CONFIG
        self.updateTabView()
        #self.tabWidgetStages.setCurrentIndex(self.currentViewStage)
        #self.tabWidget.setCurrentIndex(self.currentViewStim)
        self.logger.info("View CONFIG")
        print("view config")

    def updateTabView(self):
        self.tabWidgetStages.setCurrentIndex(self.currentViewStage)
        self.tabWidgetStim.setCurrentIndex(self.currentViewStim)
        
    @pyqtSlot()
    def viewGrid(self):
        self.currentViewStage = MainView.STIMULUS
        self.currentViewStim = StimView.V_GRID
        self.updateTabView()
        #self.tabWidgetStages.setCurrentIndex(MainView.STIMULUS)
        #self.tabWidget.setCurrentIndex(self.currentView % STIM_VIEW_OFFSET)
        self.logger.info("View V(t) GRID")

    @pyqtSlot()
    def viewAmplGrid(self):
        self.currentViewStage = MainView.STIMULUS
        self.currentViewStim = StimView.A_GRID
        self.updateTabView()
        #self.tabWidgetStages.setCurrentIndex(MainView.STIMULUS)
        #self.tabWidget.setCurrentIndex(self.currentView % STIM_VIEW_OFFSET)
        self.logger.info("View A(f) GRID")

    @pyqtSlot(int)
    def viewAmplChan(self, chan):
        self.currentViewStage = MainView.STIMULUS
        self.currentViewStim = StimView.A_CHAN
        self.updateTabView()
        #self.tabWidgetStages.setCurrentIndex(MainView.STIMULUS)
        #self.tabWidget.setCurrentIndex(self.currentView % STIM_VIEW_OFFSET)
        self.logger.info("View A(f) A_CHAN.  Channel = {}".format(chan))

        if self.chanViewMainAmpl != chan:
            x, y = self.curves['amplchan'][chan].getData()
            self.curves['amplchan']['main'].setData(x, y)
            self.pw_amplchan_main.setTitle(chan)
            self.chanViewMainAmpl = chan
        
    @pyqtSlot(int)
    def viewChan(self, chan):
        self.currentViewStage = MainView.STIMULUS
        self.currentViewStim = StimView.V_CHAN
        self.updateTabView()
        #self.tabWidgetStages.setCurrentIndex(MainView.STIMULUS)
        #self.tabWidget.setCurrentIndex(self.currentView % STIM_VIEW_OFFSET)
        self.logger.info("View V(t) A_CHAN.  Channel = {}".format(chan))

        if self.chanViewMain != chan:
            x, y = self.curves['chan'][chan].getData()
            self.curves['chan']['main'].setData(x, y)
            self.pw_chan_main.setTitle(chan)
            self.chanViewMain = chan


    @pyqtSlot()
    def saveAmplitudeData(self):
        if ("fnOfAmpData" in self.__dict__):
            # add metadata to ampData before writing to file (this could also be done earlier)
            # FIXME: grab these values from user input
            self.ampData["dwa_num"] = ""
            self.ampData["headboard_num"] = ""
            self.ampData["layer"] = ""
            self.ampData["user"] = ""
            self.ampData["location"] = ""
            self.ampData["stage"] = ""
            with open(self.fnOfAmpData, 'w') as outfile:
                json.dump(self.ampData, outfile)
            self.logger.info(f"Saved as {self.fnOfAmpData}") 
        else:
            self.logger.info(f"No run to save.") 

    @pyqtSlot()
    def loadTensions(self):
        # Load sietch credentials #FIXME still using James's credentials
        sietch = SietchConnect("sietch.creds")
        # Get APA UUID from text box
        pointerTableApaUuid = self.pointerTableApaUuid.text()
        # Get most recent pointer table for this layer
        mostRecentPointerTableLookup = ""
        try:
            mostRecentPointerTableLookup = sietch.api("/search/test?limit=1", {
                "formId": "wire_tension_pointer", 
                "componentUuid": pointerTableApaUuid,
                # "layer": layer
            })
        except:
            # No pointer table found for UUID
            self.configFileContents.setPlainText("Invalid UUID")
        

        if mostRecentPointerTableLookup:
            # logging.warning("mostRecentPointerTableLookup")
            # logging.warning(json.dumps(mostRecentPointerTableLookup,indent=2))
            # Get database id for this pointer table
            mostRecentPointerTableDBid = mostRecentPointerTableLookup[0]["_id"]
            # logging.warning("APA Uuid:")
            # logging.warning(pointerTableApaUuid)
            # Get table from database
            pointerTable = sietch.api("/test/"+mostRecentPointerTableDBid)
            # Lookup table found, loop over layers
            wirePointersAllLayers = pointerTable["data"]["wires"]
            for layer in ["G", "U", "V", "X"]:
                if layer in wirePointersAllLayers.keys():
                    wirePointersForLayer = wirePointersAllLayers[layer]
                else:
                    logging.warning("No pointer table found for layer "+layer+".")
                    continue      

                for side in ["A", "B"]:          
                    # logging.warning("wirePointersForLayer")
                    # logging.warning(json.dumps(wirePointersForLayer,indent=2))
                    # Separate the A and B sides
                    pointers = wirePointersForLayer[side]
                    # logging.warning("pointers")
                    # logging.warning(json.dumps(pointers,indent=2))
                    # Get list of database ids for the individual wire measurements
                    recordIds = [x["testId"] for x in pointers]
                    # logging.warning("recordIds")
                    # logging.warning(recordIds)
                    # Get database entries for the individual wire resonance measurements
                    resonanceEntries = sietch.api("/test/getBulk",recordIds) #[allResonanceEntries[x] for x in recordIds]
                    # logging.warning("resonanceEntries")
                    # logging.warning(json.dumps(resonanceEntries,indent=2))
                    # Extract the list of resonances from the database entries
                    resonances = [entry["data"]["wires"][str(i)] for i,entry in enumerate(resonanceEntries)]
                    # logging.warning("resonances")
                    # logging.warning(resonances)
                    # Compute the tension and save it to the table.
                    # FIXME: currently this is done is a very dumb way with no logic to which resonances get picked (just uses the first resonance).
                    for i, res in enumerate(resonances):
                        if len(res)>0:
                            self.tensionData[layer+side][i] = 4*1.16e-4*1.15**2*res[0]**2/3.2

                        
                    # FIXME: this should only happen once -- in _makeCurves()
                    # Create the scatter plot and add it to the view
                    scatter = pg.ScatterPlotItem(pen=pg.mkPen(width=5, color='r'), symbol='o', size=1)
                    self.tensionPlots[layer][side].addItem(scatter)
                    pos = [{'pos': [i,self.tensionData[layer+side][i]]} for i in range(len(self.tensionData[layer+side]))]
                    scatter.setData(pos)
                    #self.curves['tension']['TofWireNum'][layer+side].setData(pos)

        self.tensionTableModel = TensionTableModel(self.tensionData)
        self.tensionTableView.setModel(self.tensionTableModel)
        self.tensionTableView.resizeColumnsToContents()
        self.tensionTableView.resizeRowsToContents()

        #self.tensionPlots['tensionOfWireNumber'].addItem(scatter)
    @pyqtSlot()
    def submitResonances(self):
        # Load sietch credentials #FIXME still using James's credentials
        sietch = SietchConnect("sietch.creds")
        for ch in [1, 2, 3, 4]: # Loop over wire numbers in scan
            resonance_result = {
                "componentUuid":"b9fe4600-706c-11eb-93b0-6183ed4cabef",
                "formId": "wire_resonance_measurement",
                "formName": "Wire Resonance Measurement",
                "data": {
                    "versionDaq": "1.1",
                    "dwaUuid": "1",
                    "versionFirmware": "1.1",
                    "site": "Harvard",
                    "measuredBy": self.measuredBy,
                    "productionStage": "[dropdown]",
                    "side": "A",
                    "layer": "V",
                    "wires": {
                    },
                    "channel": {
                        str(ch): [73.5, 84.6]
                    },
                    "saveAsDraft": True,
                    "submit": True
                },
            }
            dbid = sietch.api('/test',resonance_result)


    @pyqtSlot()
    def loadEventData(self):

        scanId = self.evtVwr_runName_val.text()
        print(f'scanId = {scanId}')

        fileroot = 'udpData/'

        nChan = 8
        wireDataFilenames = [ f'{scanId}_{nn:02d}.txt' for nn in range(nChan) ]
        wireDataFilenames = [ os.path.join(fileroot, ff) for ff in wireDataFilenames ]
        runHeaderFile = os.path.join(fileroot, f'{scanId}_FF.txt')

        print("Replaying data from the following files: ")
        print(f"  runHeaderFile = {runHeaderFile}")
        for ff in wireDataFilenames:
            print(f"                  {ff}")

        # Open/parse all files in memory
        udpData = {}
        udpData['FF'] = self._getAllLines(runHeaderFile)

        for chan in range(nChan):
            # Read the full file into memory
            lines = self._getAllLines(wireDataFilenames[chan])
            # Find where the UDP packet boundaries are in the file (lines starting with 'AAAA0')
            udpDelimIdxs = []
            for ii, line in enumerate(lines):
                if line.startswith('AAAA0'):
                    udpDelimIdxs.append(ii)
            # Make a list of lists. Outer level list is one entry per UDP packet
            # inner level of list is one entry per line of that UDP packet
            for ii in range(len(udpDelimIdxs)-1):
                udpData[chan] = [ lines[udpDelimIdxs[ii]:udpDelimIdxs[ii+1]]
                                  for ii in range(len(udpDelimIdxs)-1) ]
                udpData[chan].append(lines[udpDelimIdxs[-1]:])

        # In principle, all channels should have data at all frequencies. But in practice
        # some data could be lost. So need to have a list of frequencies for each channel
        # and keep track of current frequency for each channel separately
        self.evtData = { 'freq':{}, 'periodInt':{},
                         'V(t)':{}, 'V(t)_time':{}, 'A(f)':{}, 'V(t)_fit':{}, 'V(t)_fit_time':{},
                         'freqCurrent':0, 'freqIdx':0,
                        }
        tmpData = { 'freq':{},
                    'V(t)':{},
                    'stimPeriod_int':{},
                    'dt':{}
                   }
        
        for ii in range(nChan):
            tmpData['dt'][ii] = []              # list for each channel
            tmpData['freq'][ii] = []            # list for each channel
            tmpData['V(t)'][ii] = []            # list of lists for each channel
            tmpData['stimPeriod_int'][ii] = []  # list for each channel
            #
            # Y-axis data
            self.evtData['V(t)'][ii] = []          # list of lists for each channel
            self.evtData['V(t)_fit'][ii] = []      # list of lists for each channel
            self.evtData['A(f)'][ii] = []          # list for each channel
            #
            # X-axis data
            self.evtData['freq'] = []              # single list (valid for all channels)
            self.evtData['V(t)_time'][ii] = []     # list for each frequency
            self.evtData['V(t)_fit_time'][ii] = [] # list for each frequency

        # First pass through the data -- gather V(t) and frequency information
        udpCounterList = []
        self.evtDataParser = ddp.DwaDataParser()
        for ichan in range(nChan):
            nfreqs = len(udpData[ichan])
            for ifreq in range(nfreqs):
                self.evtDataParser.parse(udpData[ichan][ifreq])
                udpCounterList.append(self.evtDataParser.dwaPayload[ddp.Frame.UDP]['UDP_Counter'])
                
                # extract the V(t) and stim period data for each channel
                tmpData['V(t)'][ichan].append(self.evtDataParser.dwaPayload[ddp.Frame.ADC_DATA]['adcSamples'])
                tmpData['stimPeriod_int'][ichan].append(self.evtDataParser.dwaPayload[ddp.Frame.FREQ]['stimPeriodActive'])
                tmpData['freq'][ichan].append(self.evtDataParser.dwaPayload[ddp.Frame.FREQ]['stimFreqActive_Hz'])
                tmpData['dt'][ichan].append(self.evtDataParser.dwaPayload[ddp.Frame.FREQ]['adcSamplingPeriod']*1e-8)
                
        # Come up with a master list of frequencies (if data is dropped, then not all channels will have all frequencies)
        self.evtData['stimPeriodUnion'] = np.array(list(set().union(tmpData['stimPeriod_int'][0],
                                                                    tmpData['stimPeriod_int'][1],
                                                                    tmpData['stimPeriod_int'][2],
                                                                    tmpData['stimPeriod_int'][3],
                                                                    tmpData['stimPeriod_int'][4],
                                                                    tmpData['stimPeriod_int'][5],
                                                                    tmpData['stimPeriod_int'][6],
                                                                    tmpData['stimPeriod_int'][7]
                                                                    )
                                                        )
                                                   )
        self.evtData['stimPeriodUnion'].sort()
        self.evtData['stimPeriodUnion'] = self.evtData['stimPeriodUnion'][::-1]  # reverse the sort
        #print(self.evtData['periodUnion'])
        self.evtData['freqUnion'] = CLOCK_PERIOD_SEC/self.evtData['stimPeriodUnion']
        #print(self.evtData['freqUnion'])
        
        # Second pass through the data -- align individual channel data with the master frequency list
        # indexed in a consistent way across channel (all channels share a single frequency array)
        # Missing data is represented by None instead of a list of data
        nptsInFit=500
        for ifrq, period in enumerate(self.evtData['stimPeriodUnion']):
            for ichan in range(nChan):
                if period in tmpData['stimPeriod_int'][ichan]:
                    idx = tmpData['stimPeriod_int'][ichan].index(period)
                    dt = tmpData['dt'][ichan][idx]
                    vt = tmpData['V(t)'][ichan][idx]
                    tt = np.arange(len(vt))*dt
                    # Fit the V(t) data
                    (B, C, D, freq_Hz) = dwa.fitSinusoidToTimeseries(vt, dt, tmpData['freq'][ichan][idx])
                    amp = np.sqrt(B**2+C**2)
                    tfit = np.linspace(tt[0], tt[-1], nptsInFit)
                    yfit = B*np.sin(2*np.pi*freq_Hz*tfit) + C*np.cos(2*np.pi*freq_Hz*tfit) + D
                else:  # data from this frequency is absent for this channel
                    vt = None
                    tt = None
                    amp = np.nan
                    tfit = None
                    yfit = None
                    
                self.evtData['V(t)'][ichan].append(vt)
                self.evtData['V(t)_time'][ichan].append(tt)
                self.evtData['A(f)'][ichan].append(amp)
                self.evtData['V(t)_fit_time'][ichan].append(tfit)
                self.evtData['V(t)_fit'][ichan].append(yfit)

        # Update the A(f) and V(t) plots
        for ichan in range(nChan):
            self.evtData['freqIdx'] = 0
            self.evtData['freqCurrent'] = self.evtData['freqUnion'][self.evtData['freqIdx']] 
        self.evtVwrUpdatePlots(plotAmpl=True)
            
        #print("Payload -------------------")
        #print(self.evtDataParser.dwaPayload)
        #print(self.evtData['freq'])
        #print(self.evtData)
        self._findMissingUdpCounters(udpCounterList)

    def _findMissingUdpCounters(self, udpCtrs):
        udpCtrs.sort()
        missingVals = [x for x in range(0,udpCtrs[-1]+1) if x not in udpCtrs]
        print(f"Missing UDP packets: {missingVals}")
        print(f"(may also be missing a packet with value larger than {udpCtrs[-1]})")

        
        
    def _getAllLines(self, fname):
        f = open(fname, "r")
        # read all data into a list (without newlines)
        # https://stackoverflow.com/questions/12330522/how-to-read-a-file-without-newlines
        data = f.read().splitlines()
        f.close()
        return data



    def _writeAmplitudesToFile(self):
        # write out the A(f) data for this frequency to a file
        fh = open(self.fnOfAmpData.replace('.json', '.txt'), 'w')
        for ii in range(len(self.ampData[0]['freq'])):
            outstr = f"{self.ampData[0]['freq'][ii]:8.4f} "
            for reg in range(8):
                outstr += f"{self.ampData[reg]['ampl'][ii]:8.4f} "
            outstr += "\n"
            fh.write(outstr)
        fh.close()


    def doResonanceAnalysis(self):
        self._loadAmpData()
        self.resFitParameterUpdate() # this also runs the fit (postScanAnalysis)
        #self.postScanAnalysis()
        
    def _loadAmpData(self):
        ampFilename = self.ampDataFilename.text()
        print(f"ampFilename = {ampFilename}")
        self.ampDataActiveLabel.setText(ampFilename)
        # read in the json file
        # FIXME: add check that the filename exists...
        with open(ampFilename, "r") as fh:
            data = json.load(fh)
        for reg in self.registers:
            print(data[str(reg.value)]['freq'])
            self.ampData[reg.value]['freq'] = data[str(reg.value)]['freq']
            self.ampData[reg.value]['ampl'] = data[str(reg.value)]['ampl']
            self.curves['resRawFit'][reg].setData(self.ampData[reg.value]['freq'],
                                                  self.ampData[reg.value]['ampl'])
        
    def _loadConfigFile(self, updateGui=True):
        # try to read the requested file
        # if found, display contents
        # if not found, display error message
        
        if not self.configFileName.text():
            configFileToOpen = "dwaConfig_"+self.configNextScanComboBox.currentText()+".ini"
        else:
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
            self.dwaConfigFile = dcf.DwaConfigFile(configFileToOpen, sections=['FPGA'])
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
                self.freqMin_val.setText(self.dwaConfigFile.config['FPGA']['stimFreqMin_Hz'])
                self.freqMax_val.setText(self.dwaConfigFile.config['FPGA']['stimFreqMax_Hz'])
                self.freqStep_val.setText(self.dwaConfigFile.config['FPGA']['stimFreqStep_Hz'])
                self.stimTime_val.setText(self.dwaConfigFile.config['FPGA']['stimTime_s'])
                self.cycPerFreq_val.setText(self.dwaConfigFile.config['FPGA']['cyclesPerFreq_dec'])
                self.sampPerCyc_val.setText(self.dwaConfigFile.config['FPGA']['adcSamplesPerCycle_dec'])
                self.clientIP_val.setText(self.dwaConfigFile.config['FPGA']['client_IP'])
            
    def _loadDaqConfig(self):
        self.daqConfigFile = dcf.DwaConfigFile(DAQ_CONFIG_FILE, sections=['DAQ'])
        self.daqConfig = self.daqConfigFile.getConfigDict(section='DAQ')

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

    def _clearResonanceFits(self):
        print("Clearing fit lines from the resonance plots")

        for reg in self.registers:
            #print(f"self.resFitLines['proc'][{reg}] = ")
            #print(self.resFitLines['proc'][reg])
            for infLine in self.resFitLines['proc'][reg]:
                self.resonanceProcessedPlots[reg].removeItem(infLine)
            for infLine in self.resFitLines['raw'][reg]:
                self.resonanceRawPlots[reg].removeItem(infLine)
            for line in self.resFitLines['procDebug'][reg]:
                self.resonanceProcessedPlots[reg].removeItem(line)

        self._initResonanceFitLines()

                
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
        print("_makeOutputFilenames()")
        timestring = datetime.datetime.now().strftime("%Y%m%dT%H%M%S")
        froot = os.path.join(self.udpDataDir, timestring)
        self.logger.info(f"fileroot = {froot}")
        # create new output filenames
        self.fnOfReg = {}  # file names for output. Keys are 2-digit hex string (e.g. '03' or 'FF'). values are filenames
        #self.fnOfReg['FF'] = "{}_{:02X}.txt".format(froot, 'FF')
        for reg in self.registers_all:
            self.fnOfReg['{:02X}'.format(reg.value)] = "{}_{:02X}.txt".format(froot, reg.value)
        self.logger.info(f"self.fnOfReg = {self.fnOfReg}")
        self.fnOfAmpData = os.path.join(self.ampDataDir, "DWANUM_HEADBOARDNUM_LAYER_"+timestring+".json") # FIXME: get the DWANUM HEADBOARDNUM and LAYER from user input
        self.logger.info(f"self.fnOfAmpData = {self.fnOfAmpData}") 

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
                if self.verbose > 0:
                    logger.info("")
                    logger.info("bing! data received")
                #logger.info(data)                
                udpDataStr = binascii.hexlify(data).decode(self.udpEnc).upper()
                if self.verbose > 0:
                    logger.info(udpDataStr)
                
                # Break up string into a list of 8-character chunks
                dataStrings = self._makeWordList(udpDataStr)

                # Write the raw udp payload to file
                self._logRawUdpTransmissionToFile(dataStrings)

                # FIXME: THIS EVENTUALLY GOES AWAY
                # Currently it's a kluge to handle the case where DWA transmission
                # contains the old-style (and now non-standard) header lines...
                while not dataStrings[0].startswith("AAAA"):
                    if self.verbose > 0:
                        logger.info(f"popping udp word: {dataStrings[0]}")
                    dataStrings.pop(0)

                if self.verbose > 0:
                    print("post popping")
                    print(dataStrings)
                    
                # Parse UDP transmission
                self.dwaDataParser.parse(dataStrings)
                if 'FFFFFFFF' in dataStrings:
                    if self.verbose > 0:
                        logger.info('\n\n')
                        logger.info(f'self.dwaDataParser.dwaPayload = {self.dwaDataParser.dwaPayload}')

                # FIXME: this should go into processUdpPayload() !!!
                # If there is a run frame with no '77' key, or if this is a run start frame
                # then this is a new run, so need to clear plots and create new filenames
                if ddp.Frame.RUN in self.dwaDataParser.dwaPayload:
                    self.oldDataFormat = False
                    if self.dwaDataParser.dwaPayload[ddp.Frame.RUN]['runStatus'] == None:
                        self.oldDataFormat = True
                    if self.dwaDataParser.dwaPayload[ddp.Frame.RUN]['runStatus'] == RUN_START or \
                       self.oldDataFormat:
                        print("New run detected... creating new filenames")
                        print("runStatus = ")
                        print(self.dwaDataParser.dwaPayload[ddp.Frame.RUN]['runStatus'])
                        print(f'self.oldDataFormat = {self.oldDataFormat}')
                        if self.verbose > 0:
                            logger.info("New run detected... creating new filenames")
                        self._makeOutputFilenames()
                        self._clearAmplitudeData()
                        self._clearResonanceFits()
                        if self.verbose > 0:
                            logger.info(self.fnOfReg)
                
                # write data to file by register
                reg = self.dwaDataParser.dwaPayload[ddp.Frame.UDP]['Register_ID_hexStr']
                if self.verbose > 0:
                    print(f"reg = {reg}")
                    print(f"self.fnOfReg: {self.fnOfReg}")
                    logger.info(f"self.fnOfReg: {self.fnOfReg}")
                with open(self.fnOfReg[reg], 'a') as regFH:
                    for item in dataStrings:
                        regFH.write(f'{item}\n')
                    regFH.close()
                
                newdata_callback.emit(self.dwaDataParser.dwaPayload)
                    
            except socket.timeout:
                if self.verbose > 0:
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
        if ddp.Frame.RUN in udpDict:   # Assumes this is start of a new scan
            self.outputText.appendPlainText("\nFOUND RUN HEADER")
            self.outputText.appendPlainText(str(udpDict))


            # if start of run, set up GUI scan parameters
            if udpDict[ddp.Frame.RUN]['runStatus'] == RUN_START:
                # FIXME: TEMPORARY...
                self.logger.info("\n\n\n\nFOUND RUN HEADER")
                # update the frequency information (min, max, step)
                # FIXME: move this to a subroutine...
                self.stimFreqMin  = udpDict[ddp.Frame.RUN]['stimFreqMin_Hz']
                self.stimFreqMax  = udpDict[ddp.Frame.RUN]['stimFreqMax_Hz']
                self.stimFreqStep = udpDict[ddp.Frame.RUN]['stimFreqStep_Hz']
                self.globalFreqMin_val.setText(f"{udpDict[ddp.Frame.RUN]['stimFreqMin_Hz']:.2f}")
                self.globalFreqMax_val.setText(f"{udpDict[ddp.Frame.RUN]['stimFreqMax_Hz']:.2f}")
                self.globalFreqStep_val.setText(f"{udpDict[ddp.Frame.RUN]['stimFreqStep_Hz']:.4f}")
                
            elif udpDict[ddp.Frame.RUN]['runStatus'] == RUN_END:
                print("\n\n\n\n\n\n\n SCAN IS DONE!!!")
                self.btnScanCtrl.setStyleSheet("background-color : green")
                self.btnScanCtrl.setText("Start Scan")
                self.state = State.IDLE
                self._writeAmplitudesToFile()
                self.saveAmplitudeData()
                self.postScanAnalysis()
                
            else:
                 print("ERROR: unknown value of runStatus:")   
                 print(udpDict[ddp.Frame.RUN])
                 print(udpDict[ddp.Frame.RUN]['runStatus'])
            
            
        # Look for frequency header
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
            dt = udpDict[ddp.Frame.FREQ]['adcSamplingPeriod']*1e-8
            tt = np.arange(len(udpDict[ddp.Frame.ADC_DATA]['adcSamples']))*dt

            #################################
            # Update plots
            if self.currentViewStage == MainView.STIMULUS and self.currentViewStim == StimView.V_GRID:
                self.curves['grid'][regId].setData(tt, udpDict[ddp.Frame.ADC_DATA]['adcSamples'])
            if self.currentViewStage == MainView.STIMULUS and self.currentViewStim == StimView.V_CHAN:
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
            if self.currentViewStage == MainView.STIMULUS and self.currentViewStim == StimView.V_GRID:
                self.curvesFit['grid'][regId].setData(tfit, yfit)
            if self.currentViewStage == MainView.STIMULUS and self.currentViewStim == StimView.V_CHAN:
                self.curvesFit['chan'][regId].setData(tfit, yfit)
                if regId == self.chanViewMain:
                    self.curvesFit['chan']['main'].setData(tfit, yfit)

            # Update A(f) plot
            if self.currentViewStage == MainView.RESFREQ:
                self.curves['resRawFit'][regId].setData(self.ampData[reg]['freq'], self.ampData[reg]['ampl'])

            if self.currentViewStage == MainView.STIMULUS and self.currentViewStim == StimView.A_GRID:
                self.curves['amplgrid'][regId].setData(self.ampData[reg]['freq'], self.ampData[reg]['ampl'])
                self.curves['amplgrid']['all'][regId].setData(self.ampData[reg]['freq'], self.ampData[reg]['ampl'])
            if self.currentViewStage == MainView.STIMULUS and self.currentViewStim == StimView.A_CHAN:
                self.curves['amplchan'][regId].setData(self.ampData[reg]['freq'], self.ampData[reg]['ampl'])
                if regId == self.chanViewMainAmpl:
                    self.curves['amplchan']['main'].setData(self.ampData[reg]['freq'], self.ampData[reg]['ampl'])

        # Look for STATUS frame
        if ddp.Frame.STATUS in udpDict:
            self.outputText.appendPlainText("\nFOUND STATUS FRAME:")
            self.outputText.appendPlainText(str(udpDict[ddp.Frame.STATUS]))
            print(f"\n\n\n FOUND STATUS FRAME {datetime.datetime.now()}")
            print(udpDict[ddp.Frame.STATUS])
            self.dwaControllerState_val.setText(f"{udpDict[ddp.Frame.STATUS]['controllerStateStr']}")
            self.statusErrors_val.setText(f"{udpDict[ddp.Frame.STATUS]['statusErrorBits']}")
            self.buttonStatus_val.setText(f"{udpDict[ddp.Frame.STATUS]['buttonStatus']}")

    def postScanAnalysis(self):
        # get A(f) data for each channel
        # run peakfinding
        # overlay f0 locations on A(f) plots
        # loop over each register

        print("postScanAnalysis():")
        for reg in self.registers:
            #print(f'reg       = {reg}')
            #print(f'reg.value = {reg.value}')
            chan = reg.value
            if len(self.ampData[reg]['freq']) == 0:  # maybe a register has no data?
                continue
            #peakIds, _ = find_peaks(np.cumsum(self.ampData[reg]['ampl']))

            # Make a copy of the data to work with
            dataToFit = self.ampData[reg]['ampl'][:]
            
            # subtract a line first?
            if self.resFitParams['preprocess']['detrend']:
                # remove linear fit
                if self.verbose > 0:
                    print("detrending")
                dataToFit -= dwa.baseline(self.ampData[reg]['freq'], dataToFit, polyDeg=1)
                # FIXME: REMOVE!!!!
                #print(f"\n\n reg = {reg}")
                #print(dataToFit)
                #self.curves['amplchan'][reg].setData(self.ampData[reg]['freq'], dataToFit)
                #if (reg == 0):
                #    self.curves['amplchan']['main'].setData(self.ampData[reg]['freq'], dataToFit)
            
            # Cumulative sum, remove baseline, plot, fit peaks, annotate plot
            # Vertical shift to start the y-values at zero
            dataToFit -= np.min(dataToFit)
            dataToFit  = scipy.integrate.cumtrapz(dataToFit, x=self.ampData[reg]['freq'], initial=0)
            dataToFit -= dwa.baseline(self.ampData[reg]['freq'], dataToFit,
                                      polyDeg=self.resFitParams['find_peaks']['bkgPoly'])

            # plot fxn that is used for peakfinding
            if self.currentViewStage == MainView.RESFREQ:
                self.curves['resProcFit'][reg].setData(self.ampData[reg]['freq'], dataToFit)
            
            # FIXME: set width based on frequency, not hard-coded number of samples!
            peakIds, properties = find_peaks(dataToFit,
                                             prominence=self.resFitParams['find_peaks']['prominence'],
                                             width=self.resFitParams['find_peaks']['width']
                                             )
            self.resFitParamsOut[chan]['peaks'] = peakIds
            self.resFitParamsOut[chan]['properties'] = properties
            # FIXME: could add interpolation for better precision

            # update the label:
            peakFreqs = [ self.ampData[reg]['freq'][id] for id in peakIds ]

            # Store the resonant *frequencies* and then update the GUI based on that
            self.resonantFreqs[reg.value] = peakFreqs[:]
            
        self._updateResonantFreqDisplay(chan=None)

        
    def _updateResonantFreqDisplay(self, chan=None):
        """ 
        FIXME: if chan=None, update all channels, otherwise, 
        only update the indicated channels...
        """

        # Remove any existing InfiniteLines from A(f) plots and reset dict
        self._clearResonanceFits()
                
        # FIXME: move pen definition to __init__ (self.f0pen)
        f0Pen = pg.mkPen(color='#FF0000', width=4, style=qtc.Qt.DashLine)

        debug = True
        
        for reg in self.registers:
            chan = reg.value
            print(f'in update: {chan}: {self.resonantFreqs[chan]}')
            labelStr = ', '.join([f'{ff:.2f}' for ff in self.resonantFreqs[chan]])
            getattr(self, f'le_resfreq_val_{reg}').setText(labelStr)
            
            fitx, fity = self.curves['resProcFit'][chan].getData()

            # Create/display new InfiniteLine instance for each resonant freq
            for ii, ff in enumerate(self.resonantFreqs[chan]):
                # Plot vertical line from peak down to "baseline"
                # And horizontal line showing width of fitted peak
                # as in last example here:
                # https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.find_peaks.html
                #try:
                #    ymax = fity[self.resFitParamsOut[chan]['peaks'][ii]]
                #    ymin = ymax - self.resFitParamsOut[chan]['properties']['prominences'][ii]
                #    print(f'ymin, ymax = {ymin}, {ymax}')
                #except:
                #    print("\n\n\nERROR!!!!!!!!!\n\n\n")

                if (debug):
                    print(f"Chan, Freq = {chan}, {ii}, {ff}")
                    ymax = fity[self.resFitParamsOut[chan]['peaks'][ii]]
                    ymin = ymax - self.resFitParamsOut[chan]['properties']['prominences'][ii]
                    xmin = fitx[int(np.floor(self.resFitParamsOut[chan]['properties']['left_ips'][ii]))]
                    xmax = fitx[int(np.ceil(self.resFitParamsOut[chan]['properties']['right_ips'][ii]))] 
                    ywidth = self.resFitParamsOut[chan]['properties']['width_heights'][ii]
                    print(f'ymin, ymax = {ymin}, {ymax}')
                    print("")
                    self.resFitLines['procDebug'][reg].append( self.resonanceProcessedPlots[reg].plot(x=[ff,ff], y=[ymin,ymax]))
                    self.resFitLines['procDebug'][reg].append( self.resonanceProcessedPlots[reg].plot(x=[xmin, xmax], y=[ywidth,ywidth]))

                
                self.resFitLines['proc'][reg].append( self.resonanceProcessedPlots[reg].addLine(x=ff, movable=True, pen=f0Pen) )
                # FIXME: should the next 2 lines really be commented out?
                #self.resFitLines['proc'][reg][-1].sigClicked.connect(self._f0LineClicked)
                #self.resFitLines['proc'][reg][-1].sigPositionChangeFinished.connect(self._f0LineMoved)
                self.resFitLines['raw'][reg].append( self.resonanceRawPlots[reg].addLine(x=ff, movable=True, pen=f0Pen) )
                self.resFitLines['raw'][reg][-1].sigClicked.connect(self._f0LineClicked)
                self.resFitLines['raw'][reg][-1].sigPositionChangeFinished.connect(self._f0LineMoved)
                
    def cleanUp(self):
        self.logger.info("App quitting:")
        self.logger.info("   closing UDP connection")
        self.sock.close()
        
        
def main():
    app = qtw.QApplication(sys.argv)
    win = MainWindow()
    win.setWindowTitle(f"DWA: DUNE Wire Analyzer v. {DWA_DAQ_VERSION}")
    app.aboutToQuit.connect(win.cleanUp)
    app.exec_()
    #sys.exit(app.exec_())  # diff btw this and prev. line???

if __name__ == "__main__":
    main()
        
