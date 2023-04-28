"""
Main file for the DWA DAQ software

Authors: Chris Stanford (chris.j.stanford@gmail.com), James Battat (jbattat@wellesley.edu)

How it works:

After opening the GUI, enter the UUID of the APA you are working with and hit Enter/Start.

If you are taking measurements, press the Connect button to connect to the DWA. This will call:
-> _dwaConnect
  -> _udpListen
    -> _startUdpReceiver: Starts a thread that listens for UDP data coming from the FPGA (MicroZed) in the DWA 
    -> _processUdpPayload: Processes incoming UDP data (if any)

Then, Set the desired settings in the config tab, click configure scans, select a scan, and 
press "Start selected scan". This will start the following stack of function calls:

-> _startScanThreadHandler: Checks the selected row of the config table to see if the scan should be run
  -> _startScanThread: Creates a separate thread for the scan so that it doesn't interfere with the GUI
    -> _startScan: Generates and writes the MicroZed config file
      -> _runScan: Loads the MicroZed config file and sends it to the MizcroZed, which starts the scan. The UDP
                   data generated in the scan will be processed by _processUpPayload that is running in another thread

_processUdpPayload is respnsible for handling all the incoming data. What it does varies depending
on the data it receives.



"""

import subprocess
import DwaMicrozed as duz
import DwaConfigFile as dcf
import DwaDataParser as ddp
import dwaTools as dwa
from PyQt5.QtCore import pyqtSlot
from PyQt5 import QtCore as qtc
from PyQt5 import QtGui as qtg
from PyQt5 import QtWidgets as qtw
from PyQt5 import uic
import numpy as np
import pyqtgraph as pg
from enum import Enum, IntEnum
from functools import partial
import functools
import pickle
import ctypes
import shutil
import json
import logging
import os
import datetime
import binascii
import socket
import time
import sys
import traceback
import faulthandler
faulthandler.enable()

sys.path.append('./mappings')
sys.path.append('./database')
sys.path.append('./processing')
sys.path.append('./Continuity')
sys.path.append('../../../dunedb/m2m')

import config_generator
import channel_map
import channel_frequencies
import resonance_fitting
import process_scan
import tension_algorithm
from common import ConnectToAPI, PerformAction
import boombox
from dwa_daq_constants import *

class Scans(IntEnum):
    # SCAN_NUM  = SCAN_CONFIG_TABLE_HDRS.index('Scan #')
    RESULT = SCAN_CONFIG_TABLE_HDRS.index('Result')
    TYPE = SCAN_CONFIG_TABLE_HDRS.index('Type')
    LAYER = SCAN_CONFIG_TABLE_HDRS.index('Layer')
    STATUS = SCAN_CONFIG_TABLE_HDRS.index('Status')
    WIRES = SCAN_CONFIG_TABLE_HDRS.index('Wires')
    FREQ_MIN = SCAN_CONFIG_TABLE_HDRS.index('Freq Min (Hz)')
    FREQ_MAX = SCAN_CONFIG_TABLE_HDRS.index('Freq Max (Hz)')
    FREQ_STEP = SCAN_CONFIG_TABLE_HDRS.index('Step Size (Hz)')

class TensionSaveStatus(IntEnum):
    AUTO = 0
    UNSAVED = 1
    SAVING = 2
    SAVED = 3

# Recent scan list
SCAN_LIST_DATA_KEYS = ['submitted', 'scanName', 'side', 'layer', 'headboardNum',
                       'measuredBy', 'apaUuid', 'stage']  # 'wireSegments'
RESULTS_WIRES_TABLE_HDRS = ['Measurement Time', 'Stage', 'Side', 'Layer', 'Headboard', 'Wire Segment',
                            'Measurement Type', 'Result', 'Uncertainty', 'Submitted', 'Scan ID']

class ResultsWires(IntEnum):
    MSRMT_TIME = RESULTS_WIRES_TABLE_HDRS.index('Measurement Time')
    STAGE = RESULTS_WIRES_TABLE_HDRS.index('Stage')
    SIDE = RESULTS_WIRES_TABLE_HDRS.index('Side')
    LAYER = RESULTS_WIRES_TABLE_HDRS.index('Layer')
    HEADBOARD = RESULTS_WIRES_TABLE_HDRS.index('Headboard')
    WIRE_SEGMENT = RESULTS_WIRES_TABLE_HDRS.index('Wire Segment')
    MSRMT_TYPE = RESULTS_WIRES_TABLE_HDRS.index('Measurement Type')
    RESULT = RESULTS_WIRES_TABLE_HDRS.index('Result')
    CONFIDENCE = RESULTS_WIRES_TABLE_HDRS.index('Uncertainty')
    SUBMITTED = RESULTS_WIRES_TABLE_HDRS.index('Submitted')
    SCAN = RESULTS_WIRES_TABLE_HDRS.index('Scan ID')

RESULTS_SCANS_TABLE_HDRS = ['Measurement Time', 'Stage', 'Side', 'Layer',
                            'Headboard', 'Measurement Type', 'Missing', 'Out of Spec', 'Scan ID']

class ResultsScans(IntEnum):
    MSRMT_TIME = RESULTS_SCANS_TABLE_HDRS.index('Measurement Time')
    STAGE = RESULTS_SCANS_TABLE_HDRS.index('Stage')
    SIDE = RESULTS_SCANS_TABLE_HDRS.index('Side')
    LAYER = RESULTS_SCANS_TABLE_HDRS.index('Layer')
    HEADBOARD = RESULTS_SCANS_TABLE_HDRS.index('Headboard')
    MSRMT_TYPE = RESULTS_SCANS_TABLE_HDRS.index('Measurement Type')
    MISSING = RESULTS_SCANS_TABLE_HDRS.index('Missing')
    OUT_OF_SPEC = RESULTS_SCANS_TABLE_HDRS.index('Out of Spec')
    SCAN = RESULTS_SCANS_TABLE_HDRS.index('Scan ID')

class State(IntEnum):
    IDLE = 0             # Idle Waiting for the start of a test
    NOISE_PREP = 1       # Prepare to sample noise for mains noise subtraction
    NOISE_READOUT = 2    # Sample noise for mains noise subtraction
    STIM_ENABLE = 3      # Enable stimulus frequency and wait for initial stimulus time
    # Wait for stimulus frequency to update and check that the ADC data buffer is empty
    STIM_PREP = 4
    STIM_RUN = 5         # Wait for the specified stimulus time
    STIM_READOUT = 6     # Get the stimulated sense wire ADC samples
    # At the end of the frequency sweep, wait for the last UDP data to be sent
    FREQ_SCAN_FINISH = 7
    # Wait for the end of run header to be sent before we go to the idle state and wait for another scan
    PKT_BUILD_FINISH = 8

class ScanType(IntEnum):
    CUSTOM = 0  # user-defined custom config file
    AUTO = 1   # auto-generated scan list

SCAN_END_MODE_KEYWORD = 'scanEndMode'

class ScanEnd(IntEnum):
    NORMAL = 0  # scan ended normally
    ABORTED = 1  # scan ended because user pushed Abort button

class MainView(IntEnum):
    STIMULUS = 0  # config/V(t)/A(f) [Stimulus view]
    RESULTS = 1  # A(f) data and fitting
    TENSION = 2  # Tension view
    LOG = 3  # Log-file output
    EVTVWR = 4  # Event Viewer tab

class StimView(IntEnum):
    ''' for stackedWidget page indexing '''
    CONFIG = 0+STIM_VIEW_OFFSET  # Show the configuration parameters
    ADVANCED = 1+STIM_VIEW_OFFSET  # "Advanced" configuration tab
    V_GRID = 2+STIM_VIEW_OFFSET  # V(t) (grid view)
    V_CHAN = 3+STIM_VIEW_OFFSET  # V(t) (channel view)
    A_GRID = 4+STIM_VIEW_OFFSET  # A(f) (grid view)
    A_CHAN = 5+STIM_VIEW_OFFSET  # A(f) (channel view)

class ResultsView(IntEnum):
    TABLE_SCANS = 0
    TABLE_WIRES = 1
    RAW = 2
    PROCESSED = 3

class TensionStatus(IntEnum):
    NOT_MEASURED = -1
    NOT_FOUND = -2
    NOT_APPLICABLE = -3
    TOO_SHORT = -4

TAB_ACTIVE_MAIN = MainView.STIMULUS
TAB_ACTIVE_STIM = StimView.CONFIG
TAB_ACTIVE_RESULTS = ResultsView.TABLE_SCANS

class Shortcut(Enum):
    STIMULUS = "CTRL+S"
    RESULTS = "CTRL+R"
    TENSION = "CTRL+T"
    LOG = "CTRL+L"
    EVTVWR = "CTRL+E"
    #
    CONFIG = "CTRL+C"
    V_GRID = "CTRL+V"
    A_GRID = "CTRL+A"
    #
    EVT_NEXT = qtc.Qt.Key_Right
    EVT_PREV = qtc.Qt.Key_Left
    EVT_NEXT10 = qtc.Qt.Key_Up
    EVT_PREV10 = qtc.Qt.Key_Down
    EVT_FIRST = "A"
    EVT_LAST = "E"

class Submitted(IntEnum):
    YES = 0
    NO = 1
    UNKNOWN = 2

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
    starting = qtc.pyqtSignal()
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

    @qtc.pyqtSlot()
    def run(self):
        '''
        Initialize the runner function with passed args, kwargs.
        '''

        print("\n ======== Worker.run() (thread start) ========== \n")
        self.logger.info("Thread start")
        # retrieve args/kwargs here; and fire processing using them
        try:
            self.signals.starting.emit()  # Process is starting
            result = self.fn(*self.args, **self.kwargs)
        except Exception:
            print("\n ======== Worker.run() exception ========== \n")
            traceback.print_exc()
            exctype, value = sys.exc_info()[:2]
            self.signals.error.emit((exctype, value, traceback.format_exc()))
        else:
            print("\n ======== Worker.run() else ========== \n")
            # return the result of the processing
            self.signals.result.emit(result)
        finally:
            self.signals.finished.emit()  # Done
            print("\n ======== Worker.run() finally ========== \n")
            self.logger.info("Thread complete")

class ApaUuidListModel(qtc.QStringListModel):
    def __init__(self, parent=None):
        super(ApaUuidListModel, self).__init__(parent)

class TensionTableModel(qtc.QAbstractTableModel):
    # See: https://www.learnpyqt.com/tutorials/qtableview-modelviews-numpy-pandas/
    def __init__(self, data):
        super(TensionTableModel, self).__init__()
        self._data = data

    def rowCount(self, index):
        return len(self._data[list(self._data.keys())[0]])
    
    def columnCount(self, index):
        # assumes all rows are the same length!
        return len(self._data.keys())
    
    def setData(self, dd):
        self._data = dd

    def data(self, index, role):
        kk = list(sorted(self._data.keys()))[index.column()]
        val = self._data[kk][index.row()]
        if role == qtc.Qt.DisplayRole:
            if val is np.nan:
                return ""
            elif val == TensionStatus.NOT_MEASURED:
                layer = kk[0]
                wire_segment = index.row() + 1
                apa_channel = channel_frequencies.wire_to_apa_channel(
                    layer, wire_segment)
                headboard = channel_map.apa_channel_to_board_number(
                    layer, apa_channel)
                grouping_number = channel_map.get_grouping_number(
                    layer, apa_channel)
                return "Headboard "+str(headboard)+" Tension scan "+str(grouping_number)
            elif val == TensionStatus.NOT_FOUND:
                return "Not found"
            elif val == TensionStatus.NOT_APPLICABLE:
                return "N/A"
            elif val == TensionStatus.TOO_SHORT:
                return "Short wire"
            else:
                return f'{val:.3f}'

        if role == qtc.Qt.BackgroundRole:
            if isinstance(val, str):
                return
            elif val is np.nan:
                return
            elif val == TensionStatus.NOT_MEASURED:
                return
            elif val == TensionStatus.NOT_FOUND:
                return TENSION_NOT_FOUND_COLOR
            elif val == TensionStatus.NOT_APPLICABLE:
                return TENSION_NOT_APPLICABLE_COLOR
            elif val == TensionStatus.TOO_SHORT:
                return TENSION_NOT_APPLICABLE_COLOR
            elif val < TENSION_SPEC_MIN:
                return TENSION_LOW_COLOR
            elif val > TENSION_SPEC_MAX:
                return TENSION_HIGH_COLOR
            else:
                return TENSION_GOOD_COLOR

class SortFilterProxyModel(qtc.QSortFilterProxyModel):
    def __init__(self, *args, **kwargs):
        qtc.QSortFilterProxyModel.__init__(self, *args, **kwargs)
        self.filters = {}

    def setFilterByColumn(self, regex, column):
        self.filters[column] = regex
        self.invalidateFilter()

    def filterAcceptsRow(self, source_row, source_parent):
        for key, regex in self.filters.items():
            ix = self.sourceModel().index(source_row, key, source_parent)
            if ix.isValid():
                text = self.sourceModel().data(ix)
                if regex.indexIn(text) == -1:
                    return False
        return True

class APA_Diagram_Model():
    def __init__(self):
        print("APA_Diagram_Model")
        self.signals = APA_Diagram_Signals()

    def set_stage(self, stage):
        self.apaStage = stage

    def set_layer(self, layer):
        self.apaLayer = layer

    def set_side(self, side):
        self.apaSide = side

    # APA channels, which can have up to three wires, not wires directly
    def setChannels(self, channels):
        self.apaChans = channels
        self.signals.dataChanged.emit()

class APA_Diagram_Signals(qtc.QObject):
    '''
    Defines the signals available from an APA_Diagram_Model
    '''
    dataChanged = qtc.pyqtSignal()

class MainWindow(qtw.QMainWindow):
    def __init__(self, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)

        self._initLogging()
        self._configureOutputs()

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
        self.scanCtrlButtons = [self.btnScanCtrl, self.btnScanCtrlAdv]
        self.scanType = None
        self.doContinuity = True
        self.doTension = True
        self.resultsDictFileLocked = False
        self.doContinuityCb.setChecked(
            qtc.Qt.Checked if self.doContinuity else qtc.Qt.Unchecked)
        self.doTensionCb.setChecked(
            qtc.Qt.Checked if self.doTension else qtc.Qt.Unchecked)
        self._scanButtonDisable()
        self._submitResonanceButtonDisable()
        self._setScanButtonAction('START')
        self._setDwaStatusLabel('notConnected')
        self._setPushButtonStatusAll([-1]*4)
        self._setDwaErrorStatus(None)
        self.dwaInfoHeading_label.setStyleSheet("font-weight: bold;")
        self.runStatusHeading_label.setStyleSheet("font-weight: bold;")
        self._channelStatusTableInit()
        self._scanConfigTableInit()
        self._resultsScansTableInit()
        self._resultsWiresTableInit()

        self.heartPixmaps = [qtg.QPixmap(
            'icons/heart1.png'), qtg.QPixmap('icons/heart2.png')]
        self.heartval = 0
        self.udpListening = False
        self.initApaUuidSuggestions()
        self.initAPADiagram()
        self.someTensionsNotFound = False
        self.configLayers = None

        self.fPenColor = [pg.mkPen(color='#d62728', width=4, style=qtc.Qt.SolidLine), pg.mkPen(
            color='#2ca02c', width=4, style=qtc.Qt.SolidLine), pg.mkPen(color='#1f77b4', width=4, style=qtc.Qt.SolidLine)]
        self.fPenColorTemp = [pg.mkPen(color='#d62728', width=1, style=qtc.Qt.DashLine), pg.mkPen(
            color='#2ca02c', width=1, style=qtc.Qt.DashLine), pg.mkPen(color='#1f77b4', width=1, style=qtc.Qt.DashLine)]

        # On connect, don't activate Start Scan buttons until we confirm that DWA is in IDLE state
        self.enableScanButtonTemp = False

        self.logTextBox.appendPlainText("log viewing not yet implemented")

        self.scannedButMissingLabel.setStyleSheet("color : red")
        self.setAutomaticallyLabel.setStyleSheet("color : teal")

        # must come after loadUi() call
        self.logFilename_val.setText(self.logFilename)
        self.logFilenameLog_val.setText(self.logFilename)

        self.configFileName.setText(DWA_CONFIG_FILE)

        # Event viewer tab stuff
        self._configureEventViewer()
        self.evtData = None

        # Make handles for widgets in the UI

        self.currentViewStage = TAB_ACTIVE_MAIN
        self.currentViewStim = TAB_ACTIVE_STIM
        self.currentViewResults = TAB_ACTIVE_RESULTS
        self.updateTabView()
        self.horizontalWidget.setVisible(False)

        self.DATA_TO_PLOT = False

        # testing updating tab labels
        self._setTabTooltips()

        # Connect slots/signals
        self._connectSignalsSlots()

        # Algorithm versions
        self.algoVersionComboBox.addItem("v1")
        self.algoVersionComboBox.addItem("v2")
        self.algoVersionComboBox.activated.connect(self.populate_algo_settings)
        
        self.current_algo_kwargs = {}
        # Tension Tab
        self._configureTensionTab()

        # Configure/label plots
        self.apaChannels = [None]*N_DWA_CHANS
        self.activeRegisters = []
        self._configurePlots()

        # make dummy data to display
        self._makeDummyData()

        # get refs to curves on each plot
        self._makeCurves()
        self._plotDummyAmpl()
        self._plotDummyTimeseries()
        self._plotDummyTension()

        # Establish keyboard shortcuts and associated signals/slots
        self._keyboardShortcuts()

        # self.getAnalysisVersion()

        self._configureGUI()
        self._configureMultithreading()

        ###########################################
        # Create instance of data parser to handle incoming data
        self.dwaDataParser = ddp.DwaDataParser()
        # Create placeholder for a config file parser
        self.dwaConfigFile = None

        self.registerOfVal = {}
        for reg in ddp.Registers:
            self.registerOfVal[reg.value] = reg

        self._configureAmps()
        self._initTimeseriesData()
        self._initPlottingUpdater()

        # Info about current run
        self.stimFreqMin = 0
        self.stimFreqMax = 0
        self.advStimTimeContLineEdit.setText(
            f'{CONTINUITY_SCAN_PARAMS_DEFAULT["stimTime"]:10.9f}')
        self.advStimAmplitudeContLineEdit.setText(
            f'{CONTINUITY_SCAN_PARAMS_DEFAULT["stimMag"]}')

        # For loading saved A(f) data
        self._initResonanceFitLines()
        self._initResonanceExpectedLines()

        # Socket for UDP connection to FPGA
        self.sock = None

        # Start listening for UDP data (different from TCP/IP connection to uzed)
        self._loadDaqConfig()
        if 'verbose' in self.daqConfig:
            self.verbose = int(self.daqConfig['verbose'])
        else:
            self.verbose = 1
        
        self.populate_algo_settings()
        self._udpConnect()

        # If the current git branch is not "stable", we want to display a warning message window.

        # Get the current git branch.
        git_branch = subprocess.check_output(
            ['git', 'rev-parse', '--abbrev-ref', 'HEAD']
        ).decode('utf-8').strip()
        
        # If the current git branch is not "stable", display a warning message.
        if git_branch != 'stable':
            self._show_non_stable_warning(git_branch)

    def _show_non_stable_warning(self, git_branch):
        doc = qtg.QTextDocument()
        msg_html = (
            "<p><strong>You are not working on the `stable` branch.</strong></p>"
            f"<p>The current branch is `{git_branch}`.</p>"
        )
        if git_branch == "master":
            msg_html += (
                "<p>This branch has the very latest development code, "
                "but it may not be stable. </p>"
            )
        msg_html += (
            "<p>If you are using this program in production and do not intend to test new features, "
            "you should switch to the `stable` branch.</p>"
        )
        doc.setHtml(msg_html)
        msg = qtw.QMessageBox()
        msg.setIcon(qtw.QMessageBox.Warning)
        # display the message as rich text
        msg.setTextFormat(qtc.Qt.RichText)
        # set the message text to the HTML document
        msg.setText(doc.toHtml())
        msg.setWindowTitle("Non-Stable Version Warning")
        msg.setStandardButtons(qtw.QMessageBox.Ok)
        msg.exec_()

    def clear_form_layout(self, layout):
        while layout.count():
            child = layout.takeAt(0)
            if child.widget():
                child.widget().deleteLater()
            elif child.layout():
                self.clear_form_layout(child.layout())

    def populate_algo_settings(self):
        version = self.algoVersionComboBox.currentText()
        algorithm = process_scan.get_tension_algorithm(version, 0)

        # The available settings are a dictionary of dictionaries. The keys of the top-level
        # dictionary are the names of the variable names in the algorithm. The values are
        # dictionaries that contain at least the keys "type" and "default". The "type" key
        # contains the type of the variable, and the "default" key contains the default value.
        available_settings = algorithm.get_available_settings()
        # First, we clear out the existing widgets in the form layout.
        self.clear_form_layout(self.algoSettingsFormLayout)

        # We will now populate the algoSettingsFormLayout with widgets for each of the
        # available settings. We will use the type of the variable to determine what type
        # of widget to use.
        for setting_name, setting_info in available_settings.items():
            setting_type = setting_info["type"]
            setting_default = setting_info["default"]
            if setting_type == "float":
                widget = qtw.QDoubleSpinBox()
                if "bounds" in setting_info:
                    widget.setMinimum(setting_info["bounds"][0])
                    widget.setMaximum(setting_info["bounds"][1])
                else:
                    widget.setMinimum(-1000000)
                    widget.setMaximum(1000000)
                widget.setValue(setting_default)
            elif setting_type == "integer":
                widget = qtw.QSpinBox()
                if "bounds" in setting_info:
                    widget.setMinimum(setting_info["bounds"][0])
                    widget.setMaximum(setting_info["bounds"][1])
                else:
                    widget.setMinimum(-1000000)
                    widget.setMaximum(1000000)
                widget.setValue(setting_default)
            elif setting_type == "boolean":
                widget = qtw.QCheckBox()
                widget.setChecked(setting_default)
            elif setting_type == "string":
                widget = qtw.QLineEdit()
                widget.setText(setting_default)
            elif setting_type == "choice":
                widget = qtw.QComboBox()
                for choice in setting_info["choices"]:
                    widget.addItem(choice)
                widget.setCurrentText(setting_default)
            else:
                raise ValueError(f"Unknown setting type: {setting_type}")
            if "label" in setting_info:
                label = setting_info["label"]
            else:
                label = setting_name
            widget.setObjectName(f"algo_setting__{setting_name}")
            if "tooltip" in setting_info:
                widget.setToolTip(setting_info["tooltip"])
            self.algoSettingsFormLayout.addRow(label, widget)
            # connect the valueChanged signal to the _update_current_algo_kwargs function
            if isinstance(widget, qtw.QDoubleSpinBox):
                widget.valueChanged.connect(self._update_current_algo_kwargs)
            elif isinstance(widget, qtw.QSpinBox):
                widget.valueChanged.connect(self._update_current_algo_kwargs)
            elif isinstance(widget, qtw.QCheckBox):
                widget.stateChanged.connect(self._update_current_algo_kwargs)
            elif isinstance(widget, qtw.QLineEdit):
                widget.textChanged.connect(self._update_current_algo_kwargs)
            elif isinstance(widget, qtw.QComboBox):
                widget.currentTextChanged.connect(self._update_current_algo_kwargs)
        self._update_current_algo_kwargs()

    def _update_current_algo_kwargs(self):
        # This function updates the current_algo_kwargs dictionary with the values
        # from the widgets in the algoSettingsFormLayout.
        self.current_algo_kwargs = {}
        for row in range(self.algoSettingsFormLayout.rowCount()):
            form_item = self.algoSettingsFormLayout.itemAt(row, qtw.QFormLayout.FieldRole)
            if form_item is None:
                continue
            widget = form_item.widget()
            setting_name = widget.objectName().split("__")[1]
            if isinstance(widget, qtw.QDoubleSpinBox):
                self.current_algo_kwargs[setting_name] = float(widget.value())
            elif isinstance(widget, qtw.QSpinBox):
                self.current_algo_kwargs[setting_name] = int(widget.value())
            elif isinstance(widget, qtw.QCheckBox):
                self.current_algo_kwargs[setting_name] = widget.isChecked()
            elif isinstance(widget, qtw.QLineEdit):
                self.current_algo_kwargs[setting_name] = widget.text()
            elif isinstance(widget, qtw.QComboBox):
                self.current_algo_kwargs[setting_name] = widget.currentText()
            else:
                raise ValueError(f"Unknown widget type: {type(widget)}")

        if self.verbose > 2:
            print(f"current_algo_kwargs = {self.current_algo_kwargs}")
        self._update_algo_setting_widget_enabled_state()
    
    def _update_algo_setting_widget_enabled_state(self):
        # Update the enabled state of the widgets in the algoSettingsFormLayout.
        # Some settings are only available for certain minimizers such as Differential Evolution.
        # In the case that there are conditions for a setting to be available, the dictionary
        # returned by get_available_settings will contain a key "enabled". The value of
        # this key is a dictionary with the keys of the dictionary being the names of the
        # settings that are enabled/disabled by the setting. The values of the dictionary
        # are the values that the setting must have in order for the setting to be enabled.

        version = self.algoVersionComboBox.currentText()
        algorithm = process_scan.get_tension_algorithm(version, 0)

        available_settings = algorithm.get_available_settings()

        for row in range(self.algoSettingsFormLayout.rowCount()):
            form_item = self.algoSettingsFormLayout.itemAt(row, qtw.QFormLayout.FieldRole)
            if form_item is None:
                continue
            widget = form_item.widget()
            setting_name = widget.objectName().split("__")[1]
            if setting_name in available_settings:
                if "enabled" in available_settings[setting_name]:
                    enabled = True
                    for setting, value in available_settings[setting_name]["enabled"].items():
                        if self.current_algo_kwargs[setting] != value:
                            enabled = False
                            break
                    widget.setEnabled(enabled)
                else:
                    widget.setEnabled(True)
            else:
                widget.setEnabled(False)

    def _setPushButtonStatusAll(self, buttonVals):
        # Set all push button GUI elements
        # buttonVals is a list of integers or bools

        for ii, val in enumerate(buttonVals):
            self._setPushButtonStatus(ii, val)

    def _setDwaErrorStatus(self, errorString):
        # print(f"setDwaErrorStatus: {errorString}")
        if errorString is None:
            color = 'gray'
            label = 'N/A'
        else:
            error = True if '1' in errorString else False
            # print(f"error = {error}")
            if error:
                color = 'red'
                label = f'{format(int(errorString,2),"06X")}'
            else:
                label = 'OK'
                color = 'green'

        borderSize = 3
        style = f"border: {borderSize}px solid {color};"
        # print(f"tyle = {style}")
        # FIXME: add background color: e.g. "background-color green;"
        # FIXME: add a tooltip (mouse hover) that explains the error code...
        self.dwaErrorState_val.setText(label)
        self.dwaErrorState_val.setStyleSheet(style)

    def _setPushButtonStatus(self, buttonId, buttonVal):
        # Set a single push button GUI element
        if buttonId not in PUSH_BUTTON_LIST:
            return

        if buttonVal == '0':
            color = 'gray'
            borderSize = 3
        elif buttonVal == '1':
            color = 'green'
            borderSize = 3
        else:
            color = 'black'
            borderSize = 0
            
        style = f"border: {borderSize}px solid {color};"
        getattr(self, f'dwaPB{buttonId}Status').setStyleSheet(style)

    def initApaUuidSuggestions(self):

        # Get list of known APA UUIDs from disk
        uuids = []
        with os.scandir(OUTPUT_DIR_SCAN_DATA) as it:  # iterator
            for entry in it:
                print(entry)
                if entry.is_dir() and os.path.basename(entry.name).startswith('APA_'):
                    uuids.append(entry.name[4:])
        print(f'uuids: {uuids}')

        # (should update the list of APA UUIDs during the GUI session)

        # Store the UUIDs in the model
        self.apaUuidListModel = ApaUuidListModel()
        self.apaUuidListModel.setStringList(uuids)
        apaUuidAutocompleter = qtw.QCompleter(caseSensitivity=qtc.Qt.CaseInsensitive,
                                              completionMode=qtw.QCompleter.UnfilteredPopupCompletion)
        apaUuidAutocompleter.setModel(self.apaUuidListModel)
        self.configApaUuidLineEdit.setCompleter(apaUuidAutocompleter)

    def updateApaUuidListModel(self):
        # get current list of auto-complete APA UUIDs
        uuids = self.apaUuidListModel.stringList()
        newUuid = self.configApaUuid  # could also use self.configApaUuidLineEdit.text()
        if newUuid not in uuids:         # if the new UUID not already in the list, then add it
            uuids.insert(0, newUuid)
        self.apaUuidListModel.setStringList(uuids)

    def _scanConfigTableInit(self):
        # change scanConfigTable to QTableView
        # Model:
        self.scanConfigTableModel = qtg.QStandardItemModel()
        self.scanConfigTableModel.setHorizontalHeaderLabels(
            SCAN_CONFIG_TABLE_HDRS)
        self.scanConfigTable.setModel(self.scanConfigTableModel)
        self.scanConfigTable.horizontalHeader().sectionResizeMode(
            qtw.QHeaderView.ResizeToContents)
        self.scanConfigTable.setSortingEnabled(False)
        self.scanConfigTable.setSelectionBehavior(
            qtw.QTableView.SelectRows)  # click highlights full row
        self.scanConfigTable.setSelectionMode(
            qtw.QTableView.SingleSelection)  # only select one item at a time
        # self.scanConfigTable.setEditTriggers(qtw.QTableView.NoEditTriggers)
        # self.scanConfigTable.doubleClicked.connect(self.scanConfigTableRowDoubleClicked)
        self.scanConfigTable.selectionModel().selectionChanged.connect(self.setAPADiagram)

    def _resultsScansTableInit(self):
        self.recentScansTableModel = qtg.QStandardItemModel()
        self.recentScansTableModel.setHorizontalHeaderLabels(
            RESULTS_SCANS_TABLE_HDRS)
        self.recentScansFilterProxy = SortFilterProxyModel()
        self.recentScansFilterProxy.setSourceModel(self.recentScansTableModel)
        self.recentScansTableView.setModel(self.recentScansFilterProxy)
        # self.recentScansTableView.resizeColumnsToContents()
        self.recentScansTableView.horizontalHeader().sectionResizeMode(
            qtw.QHeaderView.ResizeToContents)

        self.recentScansTableView.setSortingEnabled(True)
        self.recentScansTableView.setSelectionBehavior(
            qtw.QTableView.SelectRows)
        self.recentScansTableView.setEditTriggers(
            qtw.QTableView.NoEditTriggers)
        self.recentScansTableView.doubleClicked.connect(
            self.recentScansRowDoubleClicked)
        self.recentScansTableView.setSelectionMode(
            qtw.QTableView.SingleSelection)  # only select one item at a time
        # https://doc.qt.io/qt-5/qabstractitemview.html#SelectionMode-enum

    def resultsScansTableLoad(self):
        # Empty the table model...
        self.recentScansTableModel.removeRows(
            0, self.recentScansTableModel.rowCount())

        # Fresh read of JSON file using user-entered APA UUID
        # self.readResultsJSON(make_new=False)

        resultsDict = self.getResultsDict()
        if resultsDict is None:
            return

        self.resultsScansTableUpdate(resultsDict)

    def resultsScansTableUpdate(self, resultsDict):
        # FIXME: need to account for stage....
        # stage = "Installation (Top)" #self.tensionStageComboBox.currentText()
        # scanTable = database_functions.get_scan_table(sietch,self.configApaUuid,stage)
        print("Updating results table")
        if resultsDict is None:
            return

        tstart = time.time()
        self.recentScansTableView.setSortingEnabled(False)

        # Populate the table with JSON data
        # should we sort the entries in the dict before populating the model?
        # i = self.recentWiresTableModel.rowCount()
        allScans = {}
        for stage in APA_STAGES_SCANS:
            if stage not in resultsDict:
                continue
            stageDict = resultsDict[stage]
            for layer in APA_LAYERS:
                for side in APA_SIDES:
                    sideDict = stageDict[layer][side]
                    for wireSegmentStr in sideDict:
                        # Combine tension and continuity scans
                        segmentDict = {
                            **sideDict[wireSegmentStr]["tension"], **sideDict[wireSegmentStr]["continuity"]}
                        for scanId in segmentDict:
                            scanDict = segmentDict[scanId]
                            if stage == 'Installation (Top)' or stage == 'Installation (Bottom)':
                                stage = 'Installation'
                            toks = scanId.split("_")
                            if scanId[0:3] == '202':  # Date appears first in dir name
                                strdatetime = toks[0]
                                headboard = toks[3]
                            else:
                                strdatetime = toks[4]
                                headboard = toks[2]
                            yyyymmdd = f'{strdatetime[0:4]}-{strdatetime[4:6]}-{strdatetime[6:8]}'
                            hhmmss = f'{strdatetime[9:11]}:{strdatetime[11:13]}:{strdatetime[13:]}'
                            displayTime = f'{yyyymmdd} {hhmmss}'
                            # Tension
                            if "tension" in scanDict.keys():
                                tension = scanDict["tension"]
                                missingTension = 0
                                outOfSpec = 0
                                if tension == 'Not Found' or tension == None:
                                    missingTension = 1
                                else:
                                    if tension < TENSION_SPEC_MIN or tension > TENSION_SPEC_MAX:
                                        outOfSpec = 1

                                try:
                                    allScans[scanId]["numScans"] += 1
                                    allScans[scanId]["missingTensions"] += missingTension
                                    allScans[scanId]["outOfSpecs"] += outOfSpec
                                except Exception:
                                    allScans[scanId] = {
                                        "numScans": 1,
                                        "scanId": scanId,
                                        "stage": stage,
                                        "layer": layer,
                                        "side": side,
                                        "headboard": headboard,
                                        "msrmt_time": displayTime,
                                        "msrmt_type": 'Tension',
                                        "missingTensions": missingTension,
                                        "outOfSpecs": outOfSpec
                                    }

        for scanId in allScans:
            scanDict = allScans[scanId]
            items = [None]*len(RESULTS_SCANS_TABLE_HDRS)
            items[ResultsScans.SCAN] = qtg.QStandardItem(scanDict["scanId"])
            items[ResultsScans.STAGE] = qtg.QStandardItem(scanDict["stage"])
            items[ResultsScans.LAYER] = qtg.QStandardItem(scanDict["layer"])
            items[ResultsScans.SIDE] = qtg.QStandardItem(scanDict["side"])
            items[ResultsScans.HEADBOARD] = qtg.QStandardItem(
                scanDict["headboard"])
            items[ResultsScans.MSRMT_TIME] = qtg.QStandardItem(
                scanDict["msrmt_time"])
            items[ResultsScans.MSRMT_TYPE] = qtg.QStandardItem(
                scanDict["msrmt_type"])
            items[ResultsScans.MISSING] = qtg.QStandardItem(
                str(scanDict["missingTensions"]))
            items[ResultsScans.OUT_OF_SPEC] = qtg.QStandardItem(
                str(scanDict["outOfSpecs"]))
            self.recentScansTableModel.appendRow(items)

        print(f"Nrows = {self.recentScansTableModel.rowCount()}")
        print(f"Ncols = {self.recentScansTableModel.columnCount()}")
        self.recentScansTableView.setSortingEnabled(True)

        tend = time.time()
        dt = tend-tstart
        print(f"Populating table took [s] {dt}")

    def _channelStatusTableInit(self):
        self.channelStatusTableModel = qtg.QStandardItemModel()
        self.channelStatusTable.setModel(self.channelStatusTableModel)
        self.channelStatusTable.setSortingEnabled(False)
        self.channelStatusTable.setSelectionMode(
            qtw.QTableView.SingleSelection)  # only select one item at a time

    def _resultsWiresTableInit(self):
        self.recentWiresTableModel = qtg.QStandardItemModel()
        self.recentWiresTableModel.setHorizontalHeaderLabels(
            RESULTS_WIRES_TABLE_HDRS)
        self.recentWiresFilterProxy = SortFilterProxyModel()
        self.recentWiresFilterProxy.setSourceModel(self.recentWiresTableModel)
        self.recentWiresTableView.setModel(self.recentWiresFilterProxy)
        # self.recentWiresTableView.resizeColumnsToContents()
        self.recentWiresTableView.horizontalHeader().sectionResizeMode(
            qtw.QHeaderView.ResizeToContents)

        self.recentWiresTableView.setSortingEnabled(True)
        self.recentWiresTableView.setSelectionBehavior(
            qtw.QTableView.SelectRows)
        self.recentWiresTableView.setEditTriggers(
            qtw.QTableView.NoEditTriggers)
        self.recentWiresTableView.doubleClicked.connect(
            self.recentWiresRowDoubleClicked)
        self.recentWiresTableView.setSelectionMode(
            qtw.QTableView.SingleSelection)  # only select one item at a time
        # https://doc.qt.io/qt-5/qabstractitemview.html#SelectionMode-enum

        # Connect the LineEdit scan list filter boxes to slots
        # Measurement Time filter
        le = self.filterLineEditDate
        le.setPlaceholderText(
            RESULTS_WIRES_TABLE_HDRS[ResultsWires.MSRMT_TIME])
        le.textChanged.connect(lambda text, col=ResultsWires.MSRMT_TIME:
                               self.recentWiresFilterProxy.setFilterByColumn(qtc.QRegExp(text,
                                                                                            qtc.Qt.CaseSensitive,
                                                                                            qtc.QRegExp.FixedString),
                                                                                col))

        # Wire segment filter
        le = getattr(self, f'filterLineEditWireSegment')
        le.setPlaceholderText(
            RESULTS_WIRES_TABLE_HDRS[ResultsWires.WIRE_SEGMENT])
        le.textChanged.connect(lambda text, col=ResultsWires.WIRE_SEGMENT:
                               self.recentWiresFilterProxy.setFilterByColumn(qtc.QRegExp(text,
                                                                                            qtc.Qt.CaseSensitive,
                                                                                            qtc.QRegExp.FixedString),
                                                                                col))
        # Headboard filter
        le = getattr(self, f'filterLineEditHeadboard')
        le.setPlaceholderText(RESULTS_WIRES_TABLE_HDRS[ResultsWires.HEADBOARD])
        le.textChanged.connect(lambda text, col=ResultsWires.HEADBOARD:
                               self.recentWiresFilterProxy.setFilterByColumn(qtc.QRegExp(text+'$'),
                                                                                col))
        for stage in APA_STAGES_SHORT:
            getattr(self, f'filterStage{stage}').stateChanged.connect(
                self.filterStageChanged)
        for layer in APA_LAYERS:
            getattr(self, f'filterCheck{layer}').stateChanged.connect(
                self.filterLayerChanged)
        for side in APA_SIDES:
            getattr(self, f'filterCheck{side}').stateChanged.connect(
                self.filterSideChanged)
        # FIXME: if associated GUI labels change, this breaks
        for mytype in ['Tension', 'Connectivity']:
            getattr(self, f'filterCheckType{mytype}').stateChanged.connect(
                self.filterTypeChanged)
        # FIXME: if associated GUI labels change, this breaks
        for conf in ['High', 'Medium', 'Low', 'None']:
            getattr(self, f'filterCheckConfidence{conf}').stateChanged.connect(
                self.filterConfidenceChanged)
        for subm in ['Manual', 'Auto']:  # FIXME: if associated GUI labels change, this breaks
            getattr(self, f'filterCheckSubmitted{subm}').stateChanged.connect(
                self.filterSubmittedChanged)


    def resultsWiresTableLoad(self):
        # Empty the table model...
        self.recentWiresTableModel.locked = True

        # Remove all rows from the model
        for _ in range(self.recentWiresTableModel.rowCount()):
            self.recentWiresTableModel.removeRow(0)

        # Unlock the model
        self.recentWiresTableModel.locked = False

        # Fresh read of JSON file
        resultsDict = self.getResultsDict()
        if resultsDict is None:
            return

        self.resultsWiresTableUpdate(resultsDict)

    def resultsWiresTableUpdate(self, resultsDict):
        # FIXME: need to account for stage....
        # stage = "Installation (Top)" #self.tensionStageComboBox.currentText()
        # scanTable = database_functions.get_scan_table(sietch,self.configApaUuid,stage)
        print("Updating results table")
        if resultsDict is None:
            return

        tstart = time.time()
        self.recentWiresTableView.setSortingEnabled(False)

        # Populate the table with JSON data
        # should we sort the entries in the dict before populating the model?
        # i = self.recentWiresTableModel.rowCount()

        for stage in APA_STAGES_SCANS:
            if stage not in resultsDict:
                continue
            stageDict = resultsDict[stage]
            for layer in APA_LAYERS:
                for side in APA_SIDES:
                    sideDict = stageDict[layer][side]
                    for wireSegmentStr in sideDict:
                        # Combine tension and continuity scans
                        segmentDict = {
                            **sideDict[wireSegmentStr]["tension"], **sideDict[wireSegmentStr]["continuity"]}
                        for scanId in segmentDict:
                            scanDict = segmentDict[scanId]

                            items = [None]*len(RESULTS_WIRES_TABLE_HDRS)

                            # Stage
                            if stage == 'Installation (Top)' or stage == 'Installation (Bottom)':
                                stage = 'Installation'
                            items[ResultsWires.STAGE] = qtg.QStandardItem(
                                stage)

                            # Wire segment
                            items[ResultsWires.WIRE_SEGMENT] = qtg.QStandardItem(
                                wireSegmentStr)

                            # Layer
                            items[ResultsWires.LAYER] = qtg.QStandardItem(
                                layer)

                            # Side
                            items[ResultsWires.SIDE] = qtg.QStandardItem(
                                channel_map.electrical_side_to_physical_side(side, layer, int(wireSegmentStr)))

                            toks = scanId.split("_")
                            if scanId[0:3] == '202':  # Date appears first in dir name
                                strdatetime = toks[0]
                                headboard = toks[3]
                            else:
                                strdatetime = toks[4]
                                headboard = toks[2]

                            # Headboard
                            items[ResultsWires.HEADBOARD] = qtg.QStandardItem(
                                headboard)

                            # Measurement Time
                            # strdatetime format is YYYYMMDDTHHMMSS
                            yyyymmdd = f'{strdatetime[0:4]}-{strdatetime[4:6]}-{strdatetime[6:8]}'
                            hhmmss = f'{strdatetime[9:11]}:{strdatetime[11:13]}:{strdatetime[13:]}'
                            displayTime = f'{yyyymmdd} {hhmmss}'

                            items[ResultsWires.MSRMT_TIME] = qtg.QStandardItem(
                                displayTime)

                            # Measurement Type
                            items[ResultsWires.MSRMT_TYPE] = qtg.QStandardItem(
                                'Tension')

                            # Scan name
                            items[ResultsWires.SCAN] = qtg.QStandardItem(
                                scanId)
                            # Tension
                            if "tension" in scanDict.keys():
                                tension = scanDict["tension"]
                                if tension == 'Not Found' or tension == None:
                                    resultStr = str(tension)
                                else:
                                    resultStr = str(round(tension, 3))

                                # Status
                                confidenceStr = 'Unknown'
                                if tension == 'Not Found' or tension == None or 'tension_confidence' not in scanDict.keys() or tension <= 0:
                                    pass
                                else:
                                    confidenceStr = str(
                                        round(scanDict["tension_confidence"], 3))

                            elif "continuous" in scanDict.keys():
                                continuous = scanDict["continuous"]
                                resultStr = continuous
                                submitted = 'N/A'

                                # Status
                                confidenceStr = 'N/A'
                            items[ResultsWires.RESULT] = qtg.QStandardItem(
                                resultStr)
                            items[ResultsWires.CONFIDENCE] = qtg.QStandardItem(
                                confidenceStr)

                            try:
                                submitted = scanDict["submitted"]
                            except Exception:
                                submitted = 'N/A'

                            items[ResultsWires.SUBMITTED] = qtg.QStandardItem(
                                submitted)

                            self.recentWiresTableModel.appendRow(items)

        print(f"Nrows = {self.recentWiresTableModel.rowCount()}")
        print(f"Ncols = {self.recentWiresTableModel.columnCount()}")
        self.recentWiresTableView.setSortingEnabled(True)

        tend = time.time()
        dt = tend-tstart
        print(f"Populating table took [s] {dt}")

    def filterStageChanged(self):
        print("filterStateChanged")
        filterString = ''
        for idx, stage in enumerate(APA_STAGES_KEYS):
            stageShort = APA_STAGES[stage]['short']
            if getattr(self, f'filterStage{stageShort}').isChecked():
                val = APA_STAGES[stage]['scan'][0]
                if "Installation" in val:
                    val = "Installation"
                filterString += f'{val}|'
        filterString = filterString.rstrip("|")
        print(filterString)
        self.recentWiresFilterProxy.setFilterByColumn(qtc.QRegExp(
            filterString, qtc.Qt.CaseSensitive), ResultsWires.STAGE)

    def filterLayerChanged(self):
        filterString = ''
        for layer in APA_LAYERS:
            if getattr(self, f'filterCheck{layer}').isChecked():
                filterString += f'{layer}|'
        if len(filterString):
            filterString = filterString[:-1]
        print(filterString)
        self.recentWiresFilterProxy.setFilterByColumn(qtc.QRegExp(
            filterString, qtc.Qt.CaseSensitive), ResultsWires.LAYER)

    def filterSideChanged(self):
        filterString = ''
        for side in APA_SIDES:
            if getattr(self, f'filterCheck{side}').isChecked():
                filterString += f'{side}|'
        if len(filterString):
            filterString = filterString[:-1]
        print(filterString)
        self.recentWiresFilterProxy.setFilterByColumn(
            qtc.QRegExp(filterString, qtc.Qt.CaseSensitive), ResultsWires.SIDE)

    def filterTypeChanged(self):
        filterString = ''
        for type in ['Tension', 'Connectivity']:
            if getattr(self, f'filterCheckType{type}').isChecked():
                filterString += f'{type}|'
        if len(filterString):
            filterString = filterString[:-1]
        print(filterString)
        self.recentWiresFilterProxy.setFilterByColumn(qtc.QRegExp(
            filterString, qtc.Qt.CaseSensitive), ResultsWires.MSRMT_TYPE)

    def filterConfidenceChanged(self):
        filterString = ''
        for conf in ['High', 'Medium', 'Low', 'None']:
            if getattr(self, f'filterCheckConfidence{conf}').isChecked():
                filterString += f'{conf}|'
        if len(filterString):
            filterString = filterString[:-1]
        print(filterString)
        self.recentWiresFilterProxy.setFilterByColumn(qtc.QRegExp(
            filterString, qtc.Qt.CaseSensitive), ResultsWires.CONFIDENCE)

    def filterSubmittedChanged(self):
        filterString = ''
        for subm in ['Manual', 'Auto']:
            if getattr(self, f'filterCheckSubmitted{subm}').isChecked():
                filterString += f'{subm}|'
        if len(filterString):
            filterString = filterString[:-1]
        print(filterString)
        self.recentWiresFilterProxy.setFilterByColumn(qtc.QRegExp(
            filterString, qtc.Qt.CaseSensitive), ResultsWires.SUBMITTED)

    def recentWiresRowDoubleClicked(self, mi):
        print(f"double-clicked row: {mi.row()}")
        print(f"double-clicked col: {mi.column()}")
        self.loadResultsWire()

    def recentScansRowDoubleClicked(self, mi):
        print(f"double-clicked row: {mi.row()}")
        print(f"double-clicked col: {mi.column()}")
        self.loadResultsScan()

    def _initPlottingUpdater(self):
        self.plottingTimer = qtc.QTimer()
        self.plottingTimer.timeout.connect(self._updatePlots)
        self.plottingTimer.setInterval(
            int(PLOT_UPDATE_TIME_SEC*1000))  # millseconds
        self.plottingTimer.start()

    def _initTimeseriesData(self):
        self.adcData = {}
        for reg in self.registers:
            self.adcData[reg] = {}

    def initAPADiagram(self):
        # APA Diagram / schematic
        self.apaDiagramModel = APA_Diagram_Model()
        self.apaDiagramModel.set_stage('')
        self.apaDiagramModel.set_layer('')
        self.apaDiagramModel.set_side('')
        self.apaDiagramModel.setChannels([])
        self.APA_Diagram_View.setModel(self.apaDiagramModel)

    def _configureAmps(self):
        # hold amplitude vs. freq data for a scan (and metadata)
        self.ampData = {}
        self.resonantFreqs = {}
        self.expectedFreqs = {}

    def _configureOutputs(self):

        ###########################################
        # Ensure there is a directory to save automated scan data
        self.scanDataDir = OUTPUT_DIR_SCAN_DATA
        logging.info(f"Checking for Scan Data directory {self.scanDataDir}...")
        try:
            os.makedirs(self.scanDataDir)
            logging.info(
                "  Directory did not exist... made {}".format(self.scanDataDir))
        except FileExistsError:
            # directory already exists
            logging.warning(
                "  Directory already exists: [{}]".format(self.scanDataDir))

        ###########################################
        # Ensure there is a directory to save advanced scan data
        self.scanDataDirAdv = OUTPUT_DIR_SCAN_DATA_ADVANCED
        logging.info(
            f"Checking for Advanced Scan Data Data directory {self.scanDataDirAdv}...")
        try:
            os.makedirs(self.scanDataDirAdv)
            logging.info("  Directory did not exist... made {}".format(
                self.scanDataDirAdv))
            print("  Directory did not exist...made {}".format(self.scanDataDirAdv))
        except FileExistsError:
            logging.warning(
                "  Directory already exists: [{}]".format(self.scanDataDirAdv))

        # Ensure there is a directory to save Scan Status data
        self.scanStatusDir = OUTPUT_DIR_SCAN_STATUS
        logging.info(
            f"Checking for Scan Status directory {self.scanStatusDir}...")
        try:
            os.makedirs(self.scanStatusDir)
            logging.info("  Directory did not exist... made {}".format(
                self.scanStatusDir))
            print("  Directory did not exist...made {}".format(self.scanStatusDir))
        except FileExistsError:
            logging.warning(
                "  Directory already exists: [{}]".format(self.scanStatusDir))

        ###########################################
        # Ensure there is a directory to save archived scan data
        self.archivedDataDir = OUTPUT_DIR_ARCHIVED_DATA
        logging.info(
            f"Checking for Archived Data directory {self.archivedDataDir}...")
        try:
            os.makedirs(self.archivedDataDir)
            logging.info("  Directory did not exist... made {}".format(
                self.archivedDataDir))
        except FileExistsError:
            # directory already exists
            logging.warning(
                "  Directory already exists: [{}]".format(self.archivedDataDir))

        self.fnOfReg = {}  # file names for output (empty for now)

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
        # Get platform:
        # platform.system()
        # Returns the system/OS name, such as 'Linux', 'Darwin', 'Java', 'Windows'. An empty string is returned if the value cannot be determined.
        # SYSTEM_PLATFORM   = platform.system().upper()
        # psys = platform.system().upper()
        print(f"platform.system() = {SYSTEM_PLATFORM}")

        if SYSTEM_PLATFORM == 'WINDOWS':
            pass
            # self.showMaximized()
        else:
            # Resize and launch GUI in bottom right corner of screen
            # tested on mac & linux (unclear about windows)
            # https://stackoverflow.com/questions/39046059/pyqt-location-of-the-window
            # FIXME: QDesktopWidget() is deprecated... see:
            # https://stackoverflow.com/questions/55227303/qt-qdesktopwidget-is-deprecated-what-should-i-use-instead
            self.resize(1400, 800)
            screen = qtw.QDesktopWidget().screenGeometry()
            wgeom = self.geometry()
            x = screen.width() - wgeom.width()
            y = screen.height() - wgeom.height()
            self.move(x, y-GUI_Y_OFFSET)

        # set the background color of the main window
        # self.setStyleSheet("background-color: white;")
        # set the border style
        # self.setStyleSheet("border : 1px solid black;")

        self.show()

    def _configureTensionTab(self):
        for stage in APA_STAGES_TENSIONS:
            self.tensionStageComboBox.addItem(stage)

    def _connectSignalsSlots(self):
        self.tabWidgetStages.currentChanged.connect(self.tabChangedStage)
        self.tabWidgetStim.currentChanged.connect(self.tabChangedStim)
        # Top level
        self.configApaUuidLineEdit.returnPressed.connect(self.apaUuidChanged)
        self.btnLoadApaUuid.clicked.connect(self.apaUuidChanged)
        #
        self.btnDwaConnect.clicked.connect(self._dwaConnect)
        self.configFileName.returnPressed.connect(self.configFileNameEnter)
        self.pb_scanDataLoad.clicked.connect(self.loadArbitraryScanData)
        self.pb_scanDataSelectedLoad.clicked.connect(self.loadResultsScan)
        for reg in self.registers:
            for seg in range(3):
                getattr(self, f'le_resfreq_val_{reg}_{seg}').editingFinished.connect(
                    self._resFreqUserInputText)

        # Resonance Tab
        self.btnRemoveAndArchive.clicked.connect(self.removeAndArchive)
        self.btnSaveTensions.clicked.connect(partial(self.saveTensions, None))
        self.btnSaveAndLoadNext.clicked.connect(self.saveTensionsAndLoadNext)

        for i in range(8):
            getattr(self, f'saveTension_{i}').clicked.connect(partial(self.saveTensions, i))
            getattr(self, f'nominalTension_{i}').clicked.connect(partial(self.nominalTensionsThread, i))
            
        # Tensions tab
        self.btnLoadTensions.clicked.connect(self.loadTensionsThread)
        self.btnSubmitTensionsSelected.clicked.connect(
            self.submitTensionsSelected)
        self.tensionLayerSelectionComboBox.currentIndexChanged.connect(
            self.submitTensionsFormChanged)
        self.tensionLayerSelectionComboBox.currentIndexChanged.connect(
            self.submitTensionsFormChanged)

        # Config Tab
        self.doContinuityCb.stateChanged.connect(self._doContinuityChanged)
        self.doTensionCb.stateChanged.connect(self._doTensionChanged)
        self.btnConfigureScans.clicked.connect(self.configureScans)
        for stage in APA_STAGES_SCANS:
            self.configStageComboBox.addItem(stage)
            # if stage == "Installation":
            #    self.configStageComboBox.addItem(stage+" (Top)")
            #    self.configStageComboBox.addItem(stage+" (Bottom)")
            # else:
            #    self.configStageComboBox.addItem(stage)
        for layer in APA_LAYERS:
            self.configLayerComboBox.addItem(layer)
            self.tensionLayerSelectionComboBox.addItem(layer)
        for side in APA_SIDES:
            self.tensionSideSelectionComboBox.addItem(side)
        self.configLayerComboBox.addItem("XVU")
        self.configLayerComboBox.addItem("XV")
        self.configLayerComboBox.addItem("XU")
        self.configLayerComboBox.addItem("VU")

        self.configFlexComboBox.addItem("Away from APA")
        self.configFlexComboBox.addItem("Toward APA")

        self.connectLabel.setStyleSheet("color : red")
        self.connectLabel.setText("DWA is not connected")
        self.configureLabel.setStyleSheet("color : red")
        self.configureLabel.setText("Please configure a scan")

        self.configure = ""
        self.connectedToUzed = ""
        self.idle = False  # FIXME: need this?

    def _configureEventViewer(self):
        # self.evtVwr_runName_val.setText(EVT_VWR_TIMESTAMP)
        # self.evtVwr_runName_val.returnPressed.connect(self.loadEventDataViaName)
        self.evtVwr_openScan_pb.clicked.connect(
            self._loadEventDataViaFileBrowser)
        self.evtVwrPlotsGLW.setBackground('w')
        self.evtVwrPlots = []
        chanNum = 0
        for irow in range(3):
            for icol in range(3):
                if chanNum < N_DWA_CHANS:
                    self.evtVwrPlots.append(self.evtVwrPlotsGLW.addPlot())
                    plotTitle = f'V(t) Chan {chanNum}'
                    self.evtVwrPlots[-1].setTitle(plotTitle)
                else:
                    # A(f) data for all channels
                    self.evtVwrPlots.append(self.evtVwrPlotsGLW.addPlot())
                chanNum += 1
            self.evtVwrPlotsGLW.nextRow()

    def _udpConnect(self):
        ###########################################
        # Configure the UDP connection
        UDP_IP = ''     # '' is a symbolic name meaning all available interfaces
        UDP_PORT = 6008  # port (set to match the hard-coded value on the FPGA)
        self.udpServerAddressPort = (UDP_IP, UDP_PORT)
        # See this for UDP buffer size limits
        # https://stackoverflow.com/questions/16460261/linux-udp-max-size-of-receive-buffer
        self.udpBufferSize = 1024*4  # max data to be received at once (bytes?)
        self.udpEnc = 'utf-8'  # encoding

        # Set up UDP connection
        if self.sock is not None:
            print("closing socket")
            self.sock.close()
            self.sock = None

        logging.info("making socket")
        self.sock = socket.socket(family=socket.AF_INET,  # internet
                                  type=socket.SOCK_DGRAM)  # UDP
        #
        udpbuffsize = self.sock.getsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF)
        print(f"Initial UDP recv buffer size [bytes]: {udpbuffsize}")
        # increase the buffer size
        self.sock.setsockopt(
            socket.SOL_SOCKET, socket.SO_RCVBUF, UDP_RECV_BUF_SIZE)
        udpbuffsize = self.sock.getsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF)
        print(f"New UDP recv buffer size [bytes]:     {udpbuffsize}")
        #
        self.sock.bind(self.udpServerAddressPort)  # this is required on OSX...
        # self.sock.settimeout(self.udpTimeoutSec)    # if no new data comes from server, quit
        # self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) #FIXME: this is not necessary

        # Start listening for UDP data in a Worker thread
        # self.udpListen()

    @pyqtSlot()
    def _dwaConnect(self):
        # Collect/parse DAQ-related configuration parameters
        # FIXME --- need to read/parse .ini file...

        if not self.udpListening:
            self._udpListen()

        self._loadDaqConfig()

        # Set up connection to Microzed
        if 'DWA_IP' not in self.daqConfig:
            print("Error: Cannot connect to DWA... DWA_IP not specified in DAQ config file")
            return
        else:
            self.uz = duz.DwaMicrozed(ip=self.daqConfig['DWA_IP'])

        # Set up STATUS frame cadence
        self.uz.setStatusFramePeriod(self.daqConfig['statusPeriod'])

        # Set up Client IP address
        if 'client_IP' in self.daqConfig and self.daqConfig['client_IP'] is not None:
            if self.verbose > 0: print(f"Setting client_IP to {self.daqConfig['client_IP']}")
            self.uz.setUdpAddress(self.daqConfig['client_IP'])

        self.clientIp_val.setText(self.daqConfig['client_IP'])
        self.dwaIp_val.setText(self.daqConfig['DWA_IP'])

        if 'guiUpdatePeriodSec' in self.daqConfig:
            if self.verbose > 0: print(f"Updating GUI update rate to {self.daqConfig['guiUpdatePeriodSec']}")
            self.plottingTimer.setInterval(
                int(float(self.daqConfig['guiUpdatePeriodSec'])*1000))
            self.plottingTimer.start()

        # Try reading date code from uzed as a way to confirm connection
        try:
            # Read date code (0x13)
            out = self.uz.readValue('00000013')  # Firmware date code (YYMMDD)
            dateCodeYYMMDD = '{:06X}'.format(out[-1])
            if self.verbose > 0: print(f"Firmware date code [YYMMDD] = {dateCodeYYMMDD}")
            self.connectedToUzed = True
        except Exception:
            self.connectedToUzed = False
            print("Error: Could not connect to the MicroZed...")

        if self.connectedToUzed:
            self.btnDwaConnect.setText("Re-connect")
            self._setDwaStatusLabel('connected')
            self.dwaFirmwareDate_val.setText(dateCodeYYMMDD)
            self.enableScanButtonTemp = True
            self.connectLabel.setText("")
            self._scanButtonEnable()

        # out = self.uz.readValue('00000012')  # Firmware date code (HHMMSS)
        # print(f"Firmware date code [HHMMSS] = {hex(out[-1])}")

        # Read status frame period (0x35)
        out = self.uz.readValue('00000035')
        print(f"Read-back status frame period: {out}")
        statusFramePeriod_str = '{:.1f} s'.format(out[-1]*2.56e-6)
        self.statusFramePeriod_val.setText(statusFramePeriod_str)

        # Read DWA serial number
        # out = self.uz.readValue('00000030') #0x30 is the reg addr for the hardware serial #
        # 0x39 is the reg addr for the user-specified serial #
        out = self.uz.readValue('00000039')
        # print(f"Read-back serial number = {out[-1]}")
        print(f"Read-back serial number = {out}")
        dwaSerialNumber_str = '{:06X}'.format(out[-1])
        print(f"dwaSerialNumber_str = {dwaSerialNumber_str}")
        self.dwaSerialNumber_val.setText(dwaSerialNumber_str)

        # Read DWA MAC address
        outLSB = self.uz.readValue('0000003C')
        outMSB = self.uz.readValue('0000003B')
        print(f"Read-back MAC = {outMSB}, {outLSB}")
        mac = f'{outMSB[-1]:06X}{outLSB[-1]:06X}'
        # insert : every 2 characters
        dwaMac_str = ':'.join(mac[ii:ii+2] for ii in range(0, len(mac), 2))
        print(f"dwaMac_str = {dwaMac_str}")
        self.dwaMacAddress_val.setText(dwaMac_str)

        # Can get MAC address:
        # Register Ox3B is the MSBs
        # Register Ox3C is the LSBs

    def _initResonanceFitLines(self):
        self.resFitLines = {'raw': {},  # hold instances of InfiniteLines for both
                            'proc': {},  # raw and processed A(f) plots
                            'procDebug': {}  # for debugging
                            }
        for reg in self.registers:
            self.resFitLines['raw'][reg] = []
            self.resFitLines['proc'][reg] = []
            self.resFitLines['procDebug'][reg] = []

    def _initResonanceExpectedLines(self):
        self.resExpLines = {'raw': {},  # hold instances of InfiniteLines that indicate expected resonance positions
                            # for both raw and processed A(f) plots
                            'proc': {},
                            'procDebug': {}  # for debugging
                            }
        for reg in self.registers:
            self.resExpLines['raw'][reg] = []
            self.resExpLines['proc'][reg] = []
            self.resExpLines['procDebug'][reg] = []

    def _setTabTooltips(self):
        self.tabWidgetStages.setTabToolTip(
            MainView.STIMULUS, Shortcut.STIMULUS.value)
        self.tabWidgetStages.setTabToolTip(
            MainView.RESULTS, Shortcut.RESULTS.value)
        self.tabWidgetStages.setTabToolTip(
            MainView.TENSION, Shortcut.TENSION.value)
        self.tabWidgetStages.setTabToolTip(MainView.LOG, Shortcut.LOG.value)
        self.tabWidgetStages.setTabToolTip(
            MainView.EVTVWR, Shortcut.EVTVWR.value)
        #
        self.tabWidgetStim.setTabToolTip(
            StimView.CONFIG, Shortcut.CONFIG.value)
        self.tabWidgetStim.setTabToolTip(
            StimView.V_GRID, Shortcut.V_GRID.value)
        self.tabWidgetStim.setTabToolTip(
            StimView.A_GRID, Shortcut.A_GRID.value)

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
        # self.logger.setLevel(logging.INFO)
        self.logger.setLevel(logging.CRITICAL)

        self.logFilename = os.path.join(self.logDir,    # e.g. ./logs/20200329T120531.log
                                        datetime.datetime.now().strftime("%Y%m%dT%H%M%S.log"))
        loggingFormatter = logging.Formatter(
            '%(levelname)s:%(name)s:%(message)s')
        # logging.basicConfig(filename=self.logFilename, level=logging.INFO, filemode='w',
        #                    format='%(levelname)s:%(name)s:%(message)s')

        # log output to file (doesn't work in other threads, only in main...)
        fh = logging.FileHandler(self.logFilename)
        # fh.setLevel(logging.INFO)
        fh.setLevel(logging.CRITICAL)
        fh.setFormatter(loggingFormatter)
        self.logger.addHandler(fh)

        # log output to terminal
        ch = logging.StreamHandler()
        # ch.setLevel(logging.DEBUG)
        ch.setLevel(logging.CRITICAL)
        ch.setFormatter(loggingFormatter)
        # self.logger.addHandler(ch)

        self.logger.info(f'Log created {self.logFilename}')

    def scanConfigTableAddRow(self, rd, row, scanType='Tension', layer=None, useAdvanced=False):
        # scanType: 'Tension' or 'Continuity'
        # useAdvanced: boolean (for use advanced parameters)
        # print(f'rd = {rd}')

        if scanType not in ['Tension', 'Continuity']:
            print(f"ERROR: scanType not recognized: {scanType}")
            print("returning...")
            return

        # FIXME: add check on layer keyword value
        if layer is None:
            print("ERROR: must specify layer")
            return

        # Result type
        item = qtg.QStandardItem()
        # ty = 'Tension' if scanType == 'tension' else 'Continuity'
        item.setData("No results yet", qtc.Qt.DisplayRole)
        item.setTextAlignment(qtc.Qt.AlignLeft)
        self.scanConfigTableModel.setItem(row, Scans.RESULT, item)

        # Scan type
        item = qtg.QStandardItem()
        # ty = 'Tension' if scanType == 'tension' else 'Continuity'
        ty = scanType
        item.setData(ty, qtc.Qt.DisplayRole)
        item.setTextAlignment(qtc.Qt.AlignLeft)
        self.scanConfigTableModel.setItem(row, Scans.TYPE, item)

        # Layer
        item = qtg.QStandardItem()
        # ty = 'Tension' if scanType == 'tension' else 'Continuity'
        item.setData(layer, qtc.Qt.DisplayRole)
        item.setTextAlignment(qtc.Qt.AlignLeft)
        self.scanConfigTableModel.setItem(row, Scans.LAYER, item)

        # Status type
        item = qtg.QStandardItem()
        # item.setData(ScanConfigStatusString[ScanConfigStatus.PENDING], qtc.Qt.DisplayRole)
        item.setData('Pending', qtc.Qt.DisplayRole)
        item.setTextAlignment(qtc.Qt.AlignLeft)
        self.scanConfigTableModel.setItem(row, Scans.STATUS, item)

        # Wire numbers
        wires = rd['wireSegments']
        wires.sort(key=int)
        # print(f'wires = {wires}')
        item = qtg.QStandardItem()
        item.setData(str(wires), qtc.Qt.DisplayRole)
        item.setTextAlignment(qtc.Qt.AlignRight)
        self.scanConfigTableModel.setItem(row, Scans.WIRES, item)

        # Determine values
        # Frequency minimum, max, step
        if scanType == 'Tension':
            freqMin = float(rd['range'][0])
            freqMax = float(rd['range'][1])
            freqStep = SCAN_FREQUENCY_STEP_DEFAULT
            if useAdvanced:
                advFreqMin = self.advFreqMinLineEdit.text().strip()
                if advFreqMin != "":
                    # FIXME: this can cause crash if non-numeric entry...
                    freqMin = float(advFreqMin)

                advFreqMax = self.advFreqMaxLineEdit.text().strip()
                if advFreqMax != "":
                    # FIXME: this can cause crash if non-numeric entry...
                    freqMax = float(advFreqMax)

                advFss = self.advFssLineEdit.text().strip()
                if advFss != "":
                    # FIXME: this can cause crash if non-numeric entry...
                    freqStep = float(advFss)

        elif scanType == 'Continuity':
            freqMin = CONTINUITY_SCAN_PARAMS_DEFAULT['stimFreqMin']
            freqMax = CONTINUITY_SCAN_PARAMS_DEFAULT['stimFreqMax']
            freqStep = CONTINUITY_SCAN_PARAMS_DEFAULT['stimFreqStep']
            if useAdvanced:
                advFreqMin = self.advFreqMinContLineEdit.text().strip()
                if advFreqMin != "":
                    # FIXME: this can cause crash if non-numeric entry...
                    freqMin = float(advFreqMin)

                advFreqMax = self.advFreqMaxContLineEdit.text().strip()
                if advFreqMax != "":
                    # FIXME: this can cause crash if non-numeric entry...
                    freqMax = float(advFreqMax)

                advFss = self.advFssContLineEdit.text().strip()
                if advFss != "":
                    # FIXME: this can cause crash if non-numeric entry...
                    freqStep = float(advFss)

        # Populate table
        # Freq min
        item = qtg.QStandardItem()
        item.setData(freqMin, qtc.Qt.DisplayRole)
        item.setTextAlignment(qtc.Qt.AlignHCenter)
        self.scanConfigTableModel.setItem(row, Scans.FREQ_MIN, item)
        self.scanConfigTable.resizeColumnsToContents()
        # Freq max
        item = qtg.QStandardItem()
        item.setData(freqMax, qtc.Qt.DisplayRole)
        item.setTextAlignment(qtc.Qt.AlignHCenter)
        self.scanConfigTableModel.setItem(row, Scans.FREQ_MAX, item)
        self.scanConfigTable.resizeColumnsToContents()
        # Freq step
        item = qtg.QStandardItem()
        item.setData(freqStep, qtc.Qt.DisplayRole)
        item.setTextAlignment(qtc.Qt.AlignHCenter)
        self.scanConfigTableModel.setItem(row, Scans.FREQ_STEP, item)
        self.scanConfigTable.resizeColumnsToContents()

    def configureScans(self):
        self.scanConfigTableModel.removeRows(
            0, self.scanConfigTableModel.rowCount())
        self.configLayers = list(self.configLayerComboBox.currentText())
        self.configApaSide = self.SideComboBox.currentText()
        self.configStage = self.configStageComboBox.currentText()
        self.configHeadboard = self.configHeadboardSpinBox.value()
        useAdvancedParamsRes = not self.advDisableResParamCb.isChecked()
        useAdvancedParamsCont = not self.advDisableContParamCb.isChecked()

        self.range_data_list = []
        self.skipChannels = []

        row = 0
        for configLayer in self.configLayers:
            channelGroups = channel_map.channel_groupings(
                configLayer, self.configHeadboard)
            for channels in channelGroups:
                range_data = channel_frequencies.get_range_data_for_channels(
                    configLayer, channels, MAX_FREQ)
                rd = range_data[0]

                # Skip channels that use the bottom board
                # usesBottom = False
                # for apaChan in channels:
                #     _, hw_map = channel_map.get_hardware_map(self.flexDirection, configLayer, apaChan)
                #     if hw_map[0] == "B":
                #         usesBottom = True
                #         break
                # if usesBottom: continue

                if self.doContinuity:
                    # advanced params?
                    self.scanConfigTableAddRow(
                        rd, row, scanType='Continuity', useAdvanced=useAdvancedParamsCont, layer=configLayer)
                    self.range_data_list.append(rd)
                    row += 1

                if self.doTension:
                    self.scanConfigTableAddRow(
                        rd, row, scanType='Tension', useAdvanced=useAdvancedParamsRes, layer=configLayer)
                    self.range_data_list.append(rd)
                    row += 1

        # Select the first row
        self.scanConfigTable.selectRow(0)
        self.configureLabel.setText("")
        self.configure = True
        self._scanButtonEnable()

        # Update Missing Channels
        self.updateMissingChannels()

    def updateMissingChannels(self):
        resultsDict = self.getResultsDict()
        row = 0
        if not self.configLayers:
            return

        for layer in self.configLayers:
            channelGroups = channel_map.channel_groupings(
                layer, self.configHeadboard)
            for subChannelGroup in channelGroups:
                for channel in subChannelGroup:

                    segments, _ = channel_frequencies.get_expected_resonances(
                        layer, channel, MAX_FREQ)
                    status = "unscanned"
                    for s, segment in enumerate(segments):
                        tensionDict = resultsDict[self.configStage][layer][self.configApaSide][str(
                            segment).zfill(5)]["tension"]
                        for _, scan in tensionDict.items():
                            try:
                                if float(scan["tension"]) > 0:
                                    if status != "confirmed":
                                        status = "unconfirmed"
                                    if scan["submitted"] == "Manual":
                                        status = "confirmed"
                                if float(scan["tension"]) <= 0:
                                    if status != "confirmed":
                                        status = "missing"
                            except Exception:
                                if status != "confirmed":
                                    status = "missing"
                                pass

                        if status != "confirmed":
                            item = qtg.QStandardItem()
                            item.setData(layer + " " + str(segment),
                                         qtc.Qt.DisplayRole)
                            item.setTextAlignment(qtc.Qt.AlignLeft)
                            self.channelStatusTableModel.setItem(row, s, item)
                            statusColor = "white"
                            if status == "unconfirmed":
                                statusColor = "teal"
                            elif status == "missing":
                                statusColor = "red"
                            self.channelStatusTableModel.item(
                                row, s).setBackground(qtg.QColor(statusColor))

                    if status != "confirmed":
                        row += 1

    def setAPADiagram(self):
        if self.scanConfigTable.selectedIndexes():
            row = self.scanConfigTable.selectedIndexes()[0].row()
        else:
            row = 0

        rd = self.range_data_list[row]

        self.apaDiagramModel.set_stage(self.configStageComboBox.currentText())
        self.apaDiagramModel.set_layer(
            self.scanConfigTableModel.item(row,  Scans.LAYER).text())
        self.apaDiagramModel.set_side(self.SideComboBox.currentText())
        self.apaDiagramModel.setChannels(rd["apaChannels"])

        self.APA_Diagram_View.setModel(self.apaDiagramModel)

    def _setWidgetProperties(self, widgetName: str, chanNum: int, chanType: str) -> None:
        widget = getattr(self, widgetName)
        widget.setBackground('w')
        widget.setTitle(f'DWA Chan: {chanNum} APA Chan: {chanType}')

    def _configurePlots(self):
        self.chanViewMain = 0  # which channel to show large for V(t) data
        self.chanViewMainAmpl = 0  # which channel to show large for A(f) data

        # Configure main plots
        self._setWidgetProperties('pw_chan_main', self.chanViewMain, 'N/A')
        self._setWidgetProperties('pw_amplchan_main', self.chanViewMainAmpl, 'N/A')
        self._setWidgetProperties('pw_amplgrid_all', 0, 'N/A')
        getattr(self, f'pw_amplgrid_all').setTitle('All')

        # Configure resonance plots
        self.resonanceRawPlots = []
        self.resonanceProcessedPlots = []

        # Configure DWA and APA plots
        for ii in range(N_DWA_CHANS):
            self._setWidgetProperties(f'pw_grid_{ii}', ii, 'N/A')
            self._setWidgetProperties(f'pw_chan_{ii}', ii, 'N/A')
            self._setWidgetProperties(f'pw_amplgrid_{ii}', ii, 'N/A')
            self._setWidgetProperties(f'pw_amplchan_{ii}', ii, 'N/A')
            self._setWidgetProperties(f'config_amplgrid_{ii}', ii, 'N/A')
            self.resonanceRawPlots.append(getattr(self, f'rawgrid_{ii}'))
            self._setWidgetProperties(f'rawgrid_{ii}', ii, 'N/A')
            self.resonanceProcessedPlots.append(getattr(self, f'proccesedgrid_{ii}'))
            self._setWidgetProperties(f'proccesedgrid_{ii}', ii, 'N/A')

        self._configureTensionPlots()

    def _configureTensionPlots(self):
        # Tension tab
        self.tensionGLW.clear()  # TODO: This doesn't seem to work
        self.tensionGLW.setBackground('w')
        self.tensionPlots = {}

        # scatter plot of y=Tension, x=Wire number, one plot per layer per side
        self.tensionPlots['tensionOfWireNumber'] = {}
        for icol, layer in enumerate(APA_LAYERS):
            self.tensionPlots['tensionOfWireNumber'][layer] = {}
            for irow, side in enumerate(APA_SIDES):
                labels = None
                if (irow == 1 and icol == 0):
                    labels = {'left': 'Tension [N]', 'bottom': 'Wire number'}
                self.tensionPlots['tensionOfWireNumber'][layer][side] = \
                    self.tensionGLW.addPlot(row=irow, col=icol, title=f'{layer}{side}', labels=labels)
                self.tensionPlots['tensionOfWireNumber'][layer][side].addItem(
                    pg.LinearRegionItem(values=[TENSION_SPEC_MIN, TENSION_SPEC_MAX], orientation='horizontal', movable=False))
                self.tensionPlots['tensionOfWireNumber'][layer][side].setYRange(3, 10)

    def _printOutput(self, s):
        print("printOutput():")
        print(s)

    def _threadComplete(self):
        logging.info("THREAD COMPLETE!")

    def _saveTensionsThreadComplete(self):
        print("saveTensionsThread complete!")

    def _nominalTensionsThreadComplete(self):
        print("nominalTensionsThread complete!")

    def _loadTensionsThreadComplete(self):
        print("loadTensionsThread complete!")

    def _makeDummyData(self):
        # V(t)
        self.dummyData = {}
        xx = np.linspace(0, 2*np.pi, 32)
        for ii in range(9):
            self.dummyData[ii] = {'x': xx[:],
                                  'y': np.sin(xx[:]*(ii+1))
                                  }
        # Amplitude vs. Freq
        self.dummyDataAmpl = {}
        xx = np.linspace(10, 100, 30)
        for ii in range(9):
            self.dummyDataAmpl[ii] = {'x': xx[:],
                                      'y': xx[:]*ii+1
                                      }

        xx = np.arange(200)  # wire numbers

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
        fitPen = pg.mkPen(color=(255, 0, 0), width=3)

        self.curves = {}
        self.curves['grid'] = {}   # V(t), grid view
        self.curves['chan'] = {}   # V(t), channel view
        self.curves['amplgrid'] = {}   # A(f), grid view
        # A(f), all channels, single axes (in grid view)
        self.curves['amplgrid']['all'] = {}
        self.curves['configamplgrid'] = {}   # A(f), grid view
        # A(f), all channels, single axes (in grid view)
        self.curves['configamplgrid']['all'] = {}
        self.curves['amplchan'] = {}   # A(f), channel view
        # self.curves['resfreqfit'] = {}   # Fitting f0 values to A(f)
        self.curves['resRawFit'] = {}    # Raw A(f) data on Resonance tab
        self.curves['resProcFit'] = {}   # Processed A(f) data on Resonance tab
        # Wire tension plots (multiple figures, all on "tension" page)
        self.curves['tension'] = {}
        self.curves['evtVwr'] = {'V(t)': {}, 'A(f)': {}}  # V(t) and A(f)
        self.curvesFit = {}  # FIXME: kluge -- merge w/ self.curves
        self.curvesFit['evtVwr'] = {'V(t)': {}}  # V(t)
        self.curvesFit['grid'] = {}  # V(t), grid
        self.curvesFit['chan'] = {}  # V(t), chan
        amplAllPlotColors = ['#2a1636', '#541e4e', '#841e5a', '#b41658',
                             '#dd2c45', '#f06043', '#f5946b', '#f6c19f']
        amplAllPlotPens = [pg.mkPen(color=col) for col in amplAllPlotColors]
        vtAllPlotColors = amplAllPlotColors[:]

        for pen in amplAllPlotPens:
            pen.setWidth(3)
        amplPlotPen = pg.mkPen(color=(0, 0, 0), style=qtc.Qt.DotLine, width=1)
        for loc in range(N_DWA_CHANS):
            #
            # V(t) plots
            self.curvesFit['grid'][loc] = getattr(
                self, f'pw_grid_{loc}').plot([], pen=fitPen)
            self.curvesFit['chan'][loc] = getattr(
                self, f'pw_chan_{loc}').plot([], pen=fitPen)
            self.curves['grid'][loc] = getattr(self, f'pw_grid_{loc}').plot([], symbol='o', symbolSize=4,
                                                                            symbolBrush=vtAllPlotColors[loc],
                                                                            symbolPen=vtAllPlotColors[loc],
                                                                            pen=None)
            self.curves['chan'][loc] = getattr(self, f'pw_chan_{loc}').plot([], symbol='o', symbolSize=4,
                                                                            symbolBrush=vtAllPlotColors[loc],
                                                                            symbolPen=vtAllPlotColors[loc],
                                                                            pen=None)
            #
            # A(f) plots (grid view)
            self.curves['amplgrid'][loc] = getattr(self, f'pw_amplgrid_{loc}').plot([], symbol='o', symbolSize=2,
                                                                                    symbolBrush=amplAllPlotColors[loc],
                                                                                    symbolPen=amplAllPlotColors[loc],
                                                                                    pen=amplAllPlotPens[loc])
            self.curves['configamplgrid'][loc] = getattr(self, f'config_amplgrid_{loc}').plot([], symbol='o', symbolSize=2,
                                                                                              symbolBrush=amplAllPlotColors[loc],
                                                                                              symbolPen=amplAllPlotColors[loc],
                                                                                              pen=amplAllPlotPens[loc])

            # A(f), all channels on single axes
            self.curves['amplgrid']['all'][loc] = getattr(
                self, f'pw_amplgrid_all').plot([], pen=amplAllPlotPens[loc])
            # A(f) plots (channel view)
            self.curves['amplchan'][loc] = getattr(self, f'pw_amplchan_{loc}').plot(
                [], symbol='o', symbolSize=2, symbolBrush='k', symbolPen='k', pen=amplPlotPen)
            # Fitting f0 to A(f) plots
            self.curves['resRawFit'][loc] = self.resonanceRawPlots[loc].plot(
                [], symbol='o', symbolSize=2, symbolBrush='k', symbolPen='k', pen=amplPlotPen)
            self.curves['resProcFit'][loc] = self.resonanceProcessedPlots[loc].plot(
                [], symbol='o', symbolSize=2, symbolBrush='k', symbolPen='k', pen=amplPlotPen)

        # add in the main window, too (large view of V(t) for a single channel)
        self.curvesFit['chan']['main'] = getattr(
            self, f'pw_chan_main').plot([], pen=fitPen)
        self.curves['chan']['main'] = getattr(self, f'pw_chan_main').plot(
            [], symbol='o', symbolSize=4, symbolBrush='k', symbolPen='k', pen=None)

        # add in the main window, too (large view of A(f) for a single channel)
        self.curves['amplchan']['main'] = getattr(self, f'pw_amplchan_main').plot(
            [], symbol='o', symbolSize=3, symbolBrush='k', symbolPen='k', pen=amplPlotPen)

        # Tension
        self.curves['tension']['tensionOfWireNumber'] = {}
        tensionSymbolBrush = pg.mkBrush('r')
        tensionSymbolPen = pg.mkPen(width=1, color=qtg.QColor('gray'))
        tensionSymbolSize = 5
        for layer in APA_LAYERS:
            self.curves['tension']['tensionOfWireNumber'][layer] = {}
            for side in APA_SIDES:
                self.curves['tension']['tensionOfWireNumber'][layer][side] = self.tensionPlots['tensionOfWireNumber'][layer][side].plot(
                    [], pen=None, symbolBrush=tensionSymbolBrush, symbolPen=tensionSymbolPen, symbolSize=tensionSymbolSize)
        # [layer+side] = pg.ScatterPlotItem(pen=tensionPen, symbol='o', size=1)

        # Tension information
        # self.curves['tension']['tensionOfWireNumber'] = self.tensionPlots['tensionOfWireNumber'].plot([], symbol='o', symbolSize=2, symbolBrush='k', symbolPen='k', pen=None)

        # Event Viewer plots
        for loc in range(N_DWA_CHANS):
            self.curvesFit['evtVwr']['V(t)'][loc] = self.evtVwrPlots[loc].plot(
                [], pen=amplAllPlotPens[loc])
            self.curves['evtVwr']['V(t)'][loc] = self.evtVwrPlots[loc].plot([], symbol='o', symbolSize=3, symbolBrush='k',
                                                                            symbolPen='k', pen=None)  # , pen=evtVwrPlotPenVolt)
        self.evtVwrPlots[6].setLabel("bottom", "Time [s]")
        self.evtVwrPlots[7].setLabel("bottom", "Time [s]")
        self.evtVwrPlots[8].setLabel("bottom", "Frequency [Hz]")
        # In the 9th plot, put all A(f) data
        for chan in range(N_DWA_CHANS):
            self.curves['evtVwr']['A(f)'][chan] = self.evtVwrPlots[-1].plot([], pen=amplAllPlotPens[chan], symbol='o',
                                                                            symbolSize=2, symbolBrush=amplAllPlotPens[chan].color(), symbolPen=amplAllPlotPens[chan].color())
        # Add a vertical line showing the current frequency
        f0Pen = pg.mkPen(color='#000000', width=2, style=qtc.Qt.DashLine)
        self.curves['evtVwr']['A(f)']['marker'] = self.evtVwrPlots[-1].addLine(
            x=0, movable=True, pen=f0Pen)
        self.curves['evtVwr']['A(f)']['marker'].sigPositionChangeFinished.connect(
            self._evtVwrF0LineMoved)

    def _plotDummyAmpl(self):
        # A(f), chan view, large plot
        self.curves['amplchan']['main'].setData(self.dummyDataAmpl[self.chanViewMainAmpl]['x'],
                                                self.dummyDataAmpl[self.chanViewMainAmpl]['y'])
        for ii in range(N_DWA_CHANS):
            # A(f) data, grid view
            self.curves['amplgrid'][ii].setData(self.dummyDataAmpl[ii]['x'],
                                                self.dummyDataAmpl[ii]['y'])
            # all curves on single axes (lower right plot in grid view)
            self.curves['amplgrid']['all'][ii].setData(self.dummyDataAmpl[ii]['x'],
                                                       self.dummyDataAmpl[ii]['y'])
            # A(f) data, grid view
            self.curves['configamplgrid'][ii].setData(self.dummyDataAmpl[ii]['x'],
                                                      self.dummyDataAmpl[ii]['y'])
            # A(f) data, chan view (small plots)
            self.curves['amplchan'][ii].setData(self.dummyDataAmpl[ii]['x'],
                                                self.dummyDataAmpl[ii]['y'])

    def _plotDummyTimeseries(self):
        ''' plot data in channel mode
        all 8 channels are plotted on the small graphs at top
        '''
        # V(t), chan view, large plot
        self.curves['chan']['main'].setData(self.dummyData[self.chanViewMain]['x'],
                                            self.dummyData[self.chanViewMain]['y'])

        # update the 8 small plots
        for ii in range(N_DWA_CHANS):
            self.curves['chan'][ii].setData(self.dummyData[ii]['x'],
                                            self.dummyData[ii]['y'])
            self.curves['grid'][ii].setData(self.dummyData[ii]['x'],
                                            self.dummyData[ii]['y'])

    def _plotDummyTension(self):
        pass
        # for layer in APA_LAYERS:
        #    for side in APA_SIDES:
        #        self.curves['tension']['tensionOfWireNumber'][layer][side].setData(self.dummyDataTension['x'],
        #                                                                           self.dummyDataTension['y'])

    def _keyboardShortcuts(self):
        print("Setting up keyboard shortcuts")
        # Stimulus Screen
        self.scStimulusView = qtw.QShortcut(
            qtg.QKeySequence(Shortcut.STIMULUS.value), self)
        self.scStimulusView.activated.connect(self.viewStimulus)

        # Results of resonant frequency fit
        self.scResFreqFitView = qtw.QShortcut(
            qtg.QKeySequence(Shortcut.RESULTS.value), self)
        self.scResFreqFitView.activated.connect(self.viewResults)

        # Tension data
        self.scTensionView = qtw.QShortcut(
            qtg.QKeySequence(Shortcut.TENSION.value), self)
        self.scTensionView.activated.connect(self.viewTensions)

        # Show log
        self.scLog = qtw.QShortcut(qtg.QKeySequence(Shortcut.LOG.value), self)
        self.scLog.activated.connect(self.viewLog)

        # Show event viewer
        self.scEvtVwr = qtw.QShortcut(
            qtg.QKeySequence(Shortcut.EVTVWR.value), self)
        self.scEvtVwr.activated.connect(self.viewEvtVwr)

        # Show configuration parameters
        self.scConfig = qtw.QShortcut(
            qtg.QKeySequence(Shortcut.CONFIG.value), self)
        self.scConfig.activated.connect(self.viewConfig)

        # V(t) data (grid view)
        self.scGridView = qtw.QShortcut(
            qtg.QKeySequence(Shortcut.V_GRID.value), self)
        self.scGridView.activated.connect(self.viewGrid)

        # A(f) data (grid view)
        self.scAmplGridView = qtw.QShortcut(
            qtg.QKeySequence(Shortcut.A_GRID.value), self)
        self.scAmplGridView.activated.connect(self.viewAmplGrid)

        # Show V(t) or A(f) (channel view)
        # FIXME: move these to "Shortucut" ENUM?
        chans = range(N_DWA_CHANS)
        # FIXME: no need to save these, just need to connect slot...
        self.chanViewShortcuts = []
        for chan in chans:
            # V(t)
            self.chanViewShortcuts.append(qtw.QShortcut(
                qtg.QKeySequence(f'Alt+{chan}'), self))
            self.chanViewShortcuts[-1].activated.connect(
                partial(self.viewChan, chan))
            # A(f)
            self.chanViewShortcuts.append(qtw.QShortcut(
                qtg.QKeySequence(f'Ctrl+{chan}'), self))
            self.chanViewShortcuts[-1].activated.connect(
                partial(self.viewAmplChan, chan))

        # Event Viewer shortcuts
        self.scEvtVwrNext = qtw.QShortcut(
            qtg.QKeySequence(Shortcut.EVT_NEXT.value), self)
        self.scEvtVwrNext.activated.connect(partial(self._evtVwrChange, 1))
        self.scEvtVwrPrev = qtw.QShortcut(
            qtg.QKeySequence(Shortcut.EVT_PREV.value), self)
        self.scEvtVwrPrev.activated.connect(partial(self._evtVwrChange, -1))
        self.scEvtVwrNext10 = qtw.QShortcut(
            qtg.QKeySequence(Shortcut.EVT_NEXT10.value), self)
        self.scEvtVwrNext10.activated.connect(partial(self._evtVwrChange, 10))
        self.scEvtVwrPrev10 = qtw.QShortcut(
            qtg.QKeySequence(Shortcut.EVT_PREV10.value), self)
        self.scEvtVwrPrev10.activated.connect(partial(self._evtVwrChange, -10))
        self.scEvtVwrLast = qtw.QShortcut(
            qtg.QKeySequence(Shortcut.EVT_LAST.value), self)
        self.scEvtVwrLast.activated.connect(
            partial(self._evtVwrChange, 100000000))
        self.scEvtVwrFirst = qtw.QShortcut(
            qtg.QKeySequence(Shortcut.EVT_FIRST.value), self)
        self.scEvtVwrFirst.activated.connect(
            partial(self._evtVwrChange, -100000000))

    @pyqtSlot()
    def _evtVwrChange(self, step=None):
        # print('\n\n\n')
        # print(f"step by {step}")

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
        # print('\n\n\n')
        self._evtVwrUpdatePlots()

    def _evtVwrUpdatePlots(self, plotAmpl=False):
        # print("updating plots...")
        ifrq = self.evtData['freqIdx']
        for ichan in range(N_DWA_CHANS):
            plotTitle = (
                f"V(t) Chan {ichan} Freq: {self.evtData['freqCurrent']:.3f} Hz  Ampl: {self.evtData['A(f)'][ichan][ifrq]:.2f}")
            self.evtVwrPlots[ichan].setTitle(plotTitle)
            if self.evtData['V(t)'][ichan][ifrq] is not None:
                self.curves['evtVwr']['V(t)'][ichan].setData(self.evtData['V(t)_time'][ichan][ifrq],
                                                             self.evtData['V(t)'][ichan][ifrq])
                self.curvesFit['evtVwr']['V(t)'][ichan].setData(self.evtData['V(t)_fit_time'][ichan][ifrq],
                                                                self.evtData['V(t)_fit'][ichan][ifrq])
            else:
                self.curves['evtVwr']['V(t)'][ichan].setData([])
                self.curvesFit['evtVwr']['V(t)'][ichan].setData([])

        # update the amplitude plots in the 9th window
        self.curves['evtVwr']['A(f)']['marker'].setValue(
            self.evtData['freqUnion'][ifrq])
        # Kluge -- no need to redraw this... just redraw
        if plotAmpl:
            for ichan in range(N_DWA_CHANS):
                self.curves['evtVwr']['A(f)'][ichan].setData(
                    self.evtData['freqUnion'], self.evtData['A(f)'][ichan])

    def _udpListen(self):
        # Pass the function to execute
        worker = Worker(self._startUdpReceiver,
                        newdata_callback=self.signals.newUdpPayload)
        worker.signals.result.connect(self._printOutput)
        worker.signals.finished.connect(self._threadComplete)
        self.signals.newUdpPayload.connect(self._processUdpPayload)

        # execute
        self.threadPool.start(worker)

    def _loadDaqConfig(self):
        self.daqConfigFile = dcf.DwaConfigFile(
            DAQ_CONFIG_FILE)  # , sections=['DAQ'])
        self.daqConfig = self.daqConfigFile.getConfigDict(section='DAQ')

    @pyqtSlot()
    def _abortScan(self):
        print("User has requested a soft abort of this run...")
        print("... this is not yet tested")
        self.ampData[SCAN_END_MODE_KEYWORD] = ScanEnd.ABORTED
        self.uz.abort()

    def _setDwaStatusLabel(self, state):
        # state can be 'connected', 'configuring', 'notConnected'
        if state == 'connected':
            text = 'Connected'
            color = 'green'
        elif state == 'configuring':
            text = 'Configuring...'
            color = 'orange'
        elif state == 'notConnected':
            text = 'Not Connected'
            color = 'red'

        self.dwaConnected_label.setText(text)
        self.dwaConnected_label.setStyleSheet(f"color: {color}")

    ###############################################################
    # Auto Scan Thread
    def _startScanThreadStarting(self):
        self._scanButtonDisable()
        self.btnScanCtrl.setStyleSheet("background-color : orange")
        self.btnScanCtrl.setText("Configuring DWA...")
        self._setDwaStatusLabel('configuring')

    def _startScanThreadComplete(self):
        self._setDwaStatusLabel('connected')
        self._setScanButtonAction('ABORT')
        self._scanButtonEnable(force=True)
        print("startScanThread complete!")

    def _startNextScanIfRequested(self):
        print("Checking if next scan should start automatically...")
        runAllScans = self.scanCtrlRunAll.isChecked()
        if not runAllScans:
            print('"Run all scans" box is not checked... no more scans to run')
            return

        # If the selected row is already marked "Done" then stop
        # FIXME: May need better logic here, depending on desired behaviour...
        # currently, after last row is scanned, selection is set to the top row
        statusText = self.scanConfigTableModel.item(
            self.scanConfigRowToScan, Scans.STATUS).text()
        if statusText == 'Done':
            print("final scan has completed...")
            boombox.BoomBox('sounds/completed.wav').play()
        else:
            print("auto-starting next scan...")
            self._startScanThread()

    def _loadLastScanIfRequested(self):
        # Don't load next scan if unsaved tensions exist
        unsavedTensions = self.tensionSaveStatus in [TensionSaveStatus.SAVED, TensionSaveStatus.SAVING]
        if unsavedTensions:
            return

        autoLoad = self.checkAutoLoad.isChecked()
        if autoLoad:
            self.doubleClickedSegment = None
            self.loadResultsFile(self.scanId)
            # Switch focus to the plot tab
            self.currentViewResults = ResultsView.PROCESSED
            self.viewResults()

    @pyqtSlot()
    def _startScanThreadHandler(self):
        # Launch either one scan or all scans
        print('startScanThreadHandler')

        # Get the selected row of the scan config table. Start with that scan
        indices = self.scanConfigTable.selectedIndexes()
        # Only one row can be selected at a time, so get the row from the first cell
        self.scanConfigRowToScan = indices[0].row()
        print(f'row to scan: {self.scanConfigRowToScan}')

        # Check to see if status is "Done" for all rows
        self.autoScansRemain = False
        for row in range(self.scanConfigTableModel.rowCount()):
            statusText = self.scanConfigTableModel.item(
                row, Scans.STATUS).text()
            if statusText != 'Done':
                self.autoScansRemain = True
                break
        print(f"self.autoScansRemain = {self.autoScansRemain}")

        self._startScanThread()

    def _startScanThread(self):
        print("User has requested a new AUTO scan (DWA is IDLE)")
        self.scanType = ScanType.AUTO

        # Pass the function to execute
        worker = Worker(self._startScan)  # could pass args/kwargs too..
        # worker.signals.result.connect(self.printOutput)
        worker.signals.finished.connect(self._startScanThreadComplete)
        worker.signals.starting.connect(self._startScanThreadStarting)

        # execute
        self.threadPool.start(worker)

    ###############################################################
    # Advanced Scan Thread
    def startScanAdvThreadStarting(self):
        print("startScanAdvThread starting!")
        self._scanButtonDisable()
        self.btnScanCtrlAdv.setStyleSheet("background-color : orange")
        self.btnScanCtrlAdv.setText("Configuring DWA...")

    def startScanAdvThreadComplete(self):
        print("startScanAdvThread complete!")
        self._setScanButtonAction('ABORT')
        self._scanButtonEnable(force=True)

    @pyqtSlot()
    def _startScanAdvThread(self):

        print("User has requested a new CUSTOM scan (DWA is IDLE)")
        self.scanType = ScanType.CUSTOM

        # Pass the function to execute
        worker = Worker(self.startScanAdv)  # could pass args/kwargs too..
        # worker.signals.result.connect(self.printOutput)
        worker.signals.finished.connect(self.startScanAdvThreadComplete)
        worker.signals.starting.connect(self.startScanAdvThreadStarting)

        # execute
        self.threadPool.start(worker)

    @pyqtSlot()
    def saveTensionsThread(self):

        # Pass the function to execute
        worker = Worker(self.saveTensions)  # could pass args/kwargs too..
        # worker.signals.result.connect(self.printOutput)
        worker.signals.finished.connect(self._saveTensionsThreadComplete)

        # execute
        self.threadPool.start(worker)

    @pyqtSlot()
    def nominalTensionsThread(self):

        # Pass the function to execute
        worker = Worker(self.nominalTensions)  # could pass args/kwargs too..
        # worker.signals.result.connect(self.printOutput)
        worker.signals.finished.connect(self._nominalTensionsThreadComplete)

        # execute
        self.threadPool.start(worker)

    @pyqtSlot()
    def loadTensionsThread(self):

        # Pass the function to execute
        worker = Worker(self.loadTensions)  # could pass args/kwargs too..
        # worker.signals.result.connect(self.printOutput)
        worker.signals.finished.connect(self._loadTensionsThreadComplete)

        # execute
        self.threadPool.start(worker)

    @pyqtSlot()
    def saveTensionsThread(self, selectedDwaChan=None):

        # Pass the function to execute
        # could pass args/kwargs too..
        worker = Worker(self.saveTensions, selectedDwaChan)
        # worker.signals.result.connect(self.printOutput)
        worker.signals.finished.connect(self._saveTensionsThreadComplete)

        # execute
        self.threadPool.start(worker)

    @pyqtSlot()
    def nominalTensionsThread(self, selectedDwaChan=None):

        # Pass the function to execute
        # could pass args/kwargs too..
        worker = Worker(self.nominalTensions, selectedDwaChan)
        # worker.signals.result.connect(self.printOutput)
        worker.signals.finished.connect(self._nominalTensionsThreadComplete)

        # execute
        self.threadPool.start(worker)

    def loadNextUncomfirmed(self):
        for row in range(self.recentWiresFilterProxy.rowCount()):
            submitted = self.recentWiresFilterProxy.index(
                row, ResultsWires.SUBMITTED).data()
            scanId = self.recentWiresFilterProxy.index(
                row, ResultsWires.SCAN).data()
            if submitted != "Manual" and os.path.isdir(os.path.join(self.apaSubdir, scanId)):
                print("loading", os.path.join(self.apaSubdir, scanId))
                self.loadResultsWire(row)
                break

    def saveTensionsAndLoadNext(self):
        self.saveTensions()
        self.loadNextUncomfirmed()

    def disableRelaysThreadComplete(self):
        print("disableRelaysThreadComplete")
        self._setScanButtonAction('START')
        self._scanButtonEnable(force=True)
        self._startNextScanIfRequested()
        self._loadLastScanIfRequested()

    def setTensionSaveStatus(self, status):
        self.tensionSaveStatus = status
        if status == TensionSaveStatus.AUTO:
            self.labelTensionSaveStatus.setText("Tensions set by algorithm")
            self.labelTensionSaveStatus.setStyleSheet("color : teal")
        elif status == TensionSaveStatus.UNSAVED:
            self.labelTensionSaveStatus.setText("Tensions have not been saved")
            self.labelTensionSaveStatus.setStyleSheet("color : red")
        elif status == TensionSaveStatus.SAVING:
            self.labelTensionSaveStatus.setText("Saving tensions...")
        elif status == TensionSaveStatus.SAVED:
            self.labelTensionSaveStatus.setText("Tensions saved!")
            self.labelTensionSaveStatus.setStyleSheet("color : green")

    def disableRelaysThreadStarting(self):
        self.btnScanCtrl.setStyleSheet("background-color : orange")
        self.btnScanCtrl.setText("Disabling relays...")
        self.btnScanCtrlAdv.setStyleSheet("background-color : orange")
        self.btnScanCtrlAdv.setText("Disabling relays...")

    def disableRelays(self):
        # Break all relay connections to let charge bleed off of wires
        self.uz.disableAllRelays()

    def _disableRelaysThread(self):
        # Pass the function to execute
        worker = Worker(self.disableRelays)
        worker.signals.finished.connect(self.disableRelaysThreadComplete)
        worker.signals.starting.connect(self.disableRelaysThreadStarting)

        # execute
        self.threadPool.start(worker)

    def _startScan(self):
        # need to create dictionaries in this thread to actually update inputs and files

        # What kind of scan is this (resonance or continuity)?
        row = self.scanConfigRowToScan
        scanType = self.scanConfigTableModel.item(row, Scans.TYPE).text()
        # 'Res' or 'Cont'
        if scanType not in ['Tension', 'Continuity']:
            print(f"ERROR: unrecognized scan type: {scanType}")
            print(f"       expected 'Res' or 'Cont'")
            print(f"       returning...")
            return

        self.configMeasuredBy = self.measuredByLineEdit.text()
        self.configStage = self.configStageComboBox.currentText()
        self.configApaUuid = self.configApaUuidLineEdit.text().strip()
        self.configLayer = self.scanConfigTableModel.item(
            row,  Scans.LAYER).text()  # self.configLayerComboBox.currentText()
        self.configHeadboard = self.configHeadboardSpinBox.value()
        self.configApaSide = self.SideComboBox.currentText()
        self.flexDirection = self.configFlexComboBox.currentText()
        is_flex_direction_away_from_APA = True
        if self.flexDirection == "Toward APA":
            is_flex_direction_away_from_APA = False

        self.updateApaUuidListModel()

        useAdvParamsRes = not self.advDisableResParamCb.isChecked()
        useAdvParamsCont = not self.advDisableContParamCb.isChecked()
        useAdv = useAdvParamsRes or useAdvParamsCont

        # Get values from scan config table (may be overwritten by advanced parameters later)
        freqMin = float(self.scanConfigTableModel.item(
            row,  Scans.FREQ_MIN).text())
        freqMax = float(self.scanConfigTableModel.item(
            row,  Scans.FREQ_MAX).text())
        freqStep = float(self.scanConfigTableModel.item(
            row, Scans.FREQ_STEP).text())

        if scanType == 'Tension':
            advStimTime = self.advStimTimeLineEdit.text().strip()  # Stimulation time
            advInitDelay = self.advInitDelayLineEdit.text().strip()  # Init delay
            advStimAmplitude = self.advStimAmplitudeLineEdit.text().strip()  # Amplitude
            advDigipotAmplitude = self.advDigipotAmplitudeLineEdit.text().strip()  # Digipot amplitude
        elif scanType == 'Continuity':
            advStimTime = self.advStimTimeContLineEdit.text().strip()  # Stimulation time
            advInitDelay = self.advInitDelayContLineEdit.text().strip()  # Init delay
            advStimAmplitude = self.advStimAmplitudeContLineEdit.text().strip()  # Amplitude
            # Digipot amplitude
            advDigipotAmplitude = self.advDigipotAmplitudeContLineEdit.text().strip()

        # TODO: Make sure inputs can be safely converted to floats
        # TODO: Grab default values if undefined
        if advStimTime:
            advStimTime = float(advStimTime)
        if advInitDelay:
            advInitDelay = float(advInitDelay)
        # if advStimAmplitude: advStimAmplitude = '{int(advStimAmplitude):03X}'
        if advStimAmplitude:
            advStimAmplitude = int(advStimAmplitude)
        if advDigipotAmplitude:
            advDigipotAmplitude = int(advDigipotAmplitude)

        rd = self.range_data_list[row]
        # need to impliment list of all -1 for channels not being used
        # this makes it so for a single scan it just lists the one apa channel used, and then sorts all apa channels for an all wire scan

        self.wires = rd["wireSegments"]
        self.wires.sort(key=int)
        channels = rd["apaChannels"]
        # sorting apa channels list to follow increasing order of dwa channels
        dwaChannels = range(8)
        self.apaChannels = [None]*len(dwaChannels)
        for apaChannel in channels:
            dwaChannel = channel_map.apa_channel_to_dwa_channel(self.configLayer, apaChannel,
                                                                is_flex_direction_away_from_APA)
            self.apaChannels[dwaChannel] = apaChannel

        self.activeRegisters = [ii for ii in range(
            len(self.apaChannels)) if self.apaChannels[ii]]  # Which DWA channels have data?

        self.wires.sort(key=int)  # redundant?

        fpgaConfig = config_generator.configure_default()

        # print(f"self.configLayer, channels = {self.configLayer}, {channels}")
        # print(f"  type(channels) = {type(channels)}")

        # TODO: This chould change based on fixed freq or freq sweep
        fpgaConfig.update(config_generator.configure_run_type())
        fpgaConfig.update(config_generator.configure_fixed_frequency())

        if useAdv:
            if advInitDelay:
                if advStimTime:
                    fpgaConfig.update(config_generator.configure_wait_times(
                        advInitDelay, advStimTime))
                else:
                    fpgaConfig.update(
                        config_generator.configure_wait_times(advInitDelay))
            elif advStimTime:
                fpgaConfig.update(
                    config_generator.configure_wait_times(stim_time=advStimTime))

            if advStimAmplitude and advDigipotAmplitude:
                fpgaConfig.update(config_generator.configure_gains(
                    stim_freq_max=freqMax, stim_mag=advStimAmplitude, digipot=advDigipotAmplitude))
            elif advStimAmplitude:
                fpgaConfig.update(config_generator.configure_gains(
                    stim_freq_max=freqMax, stim_mag=advStimAmplitude))
            elif advDigipotAmplitude:
                fpgaConfig.update(config_generator.configure_gains(
                    stim_freq_max=freqMax, digipot=advDigipotAmplitude))

        # TODO: Should this be configurable?
        fpgaConfig.update(config_generator.configure_sampling())
        fpgaConfig.update(config_generator.configure_relays(
            self.configLayer, channels, is_flex_direction_away_from_APA, self.skipChannels))
        print(f'\n\nAfter Relays:\n  fpgaConfig: {fpgaConfig}')

        # FIXME: should these keys match DATABASE_FIELDS?
        dataConfig = {"apaChannels": self.apaChannels, "wireSegments": self.wires,
                      "measuredBy": self.configMeasuredBy, "stage": self.configStage,
                      "apaUuid": self.configApaUuid,
                      "layer": self.configLayer, "headboardNum": self.configHeadboard,
                      "side": self.configApaSide, "type": scanType
                      }

        self._loadDaqConfig()

        # self.combinedConfig = {"FPGA": fpgaConfig, "DATABASE": dataConfig, "DAQ": self.daqConfig}

        fpgaConfig.update(config_generator.configure_scan_frequencies(
            freqMin, freqMax, stim_freq_step=freqStep))
        fpgaConfig.update(
            config_generator.configure_noise_subtraction(freqMin, freqMax))

        self.combinedConfig = {"FPGA": fpgaConfig,
                               "DATABASE": dataConfig, "DAQ": self.daqConfig}

        print(self.combinedConfig)

        self.makeScanOutputDir(scanType)
        config_generator.write_config(
            self.combinedConfig, 'dwaConfig.ini', self.scanRunDataDir)  # self.configFileDir
        self.configFile = os.path.join(self.scanRunDataDir, "dwaConfig.ini")

        self._runScan()

    def makeScanOutputDir(self, scanType):
        scanRunSubDir = "APA_"+str(self.configApaUuid)
        dataDir = os.path.join(self.scanDataDir, scanRunSubDir)
        try:
            os.makedirs(dataDir)
            logging.info("  Directory did not exist...made {}".format(dataDir))
            print("  Directory did not exist...made {}".format(dataDir))
        except FileExistsError:
            logging.warning("  Directory already exists: [{}]".format(dataDir))

        self.timeString = datetime.datetime.now().strftime("%Y%m%dT%H%M%S")
        # above makes the scan directory for auto scans, below gives the final scan directory its name

        scanTypeLabel = ''
        if scanType == 'Tension':
            scanTypeLabel = 'T'
        if scanType == 'Continuity':
            scanTypeLabel = 'C'
        wires = "-".join([str(w) for w in self.wires])
        self.scanId = self.timeString + "_" + self.configLayer + "_" + self.configApaSide + \
            "_" + str(self.configHeadboard) + "_" + \
            str(wires) + "_" + scanTypeLabel
        self.scanRunDataDir = os.path.join(dataDir, self.scanId)
        os.makedirs(self.scanRunDataDir)

    def startScanAdv(self):
        self.configFile = self.configFileName.text()

        apaUuid = self.configApaUuidLineEdit.text().strip()
        timestamp = datetime.datetime.now().strftime("%Y%m%dT%H%M%S")
        subdirs = []

        # if there is text in the ApaUuid section then save scan data in:
        #    scanData/APA_[UUID]/[configname]_TIMESTAMP
        # otherwise save scan in:
        #    scanDataAdv/[configname]_TIMESTAMP
        if apaUuid != "":
            print(f"FOUND CONTENT IN APA UUID FIELD: {apaUuid}")
            subdirs.append(self.scanDataDir)  # scanData/
            subdirs.append(f"APA_{apaUuid}")
        else:
            print(f"NO CONTENT IN APA UUID FIELD -- making up a directory name")
            subdirs.append(self.scanDataDirAdv)  # scanDataAdv/

        configFileBase = os.path.splitext(os.path.basename(self.configFile))[0]
        print(f"CONFIG FILE BASE = {configFileBase}")
        subdirs.append(f"{configFileBase}_{timestamp}")

        self.scanRunDataDir = os.path.join(*subdirs)
        print(f"Making directory: {self.scanRunDataDir}")
        os.makedirs(self.scanRunDataDir, exist_ok=True)
        # copy the config file into the scan output directory
        shutil.copy(self.configFile, os.path.join(
            self.scanRunDataDir, 'dwaConfig.ini'))

        self._runScan()

    def _setScanMetadata(self):
        # FIXME: rename... really this is used to set metadata in the A(f) .json file
        # During the resonance analysis those values are used to determine if data should
        # be written to database.

        # apaUuid = self.configApaUuidLineEdit.text()
        # print(f"apaUuid: {apaUuid}")

        dbConfig = self.dwaConfigFile.getConfigDict(section='DATABASE')
        if dbConfig:
            print("[DATABASE] section present in config file")
            print(f"[DATABASE] SECTION: {dbConfig}")
        else:
            print("[DATABASE] section not present in config file")

        # If the config file has a valid [DATABASE] section, then user wants to write to the db
        # If you get this far, then the [DATABASE] section has already been validated, so
        # just need to check if [DATABASE] exists in the config...
        # FIXME: does the UUID need to be a "valid"/real DUNE UUID?

        # Pull info from the [DATABASE] section of the config file and pass that along to the A(f) .json file
        for field in DATABASE_FIELDS:
            self.ampData[field] = dbConfig[field] if dbConfig else None

        print(f'self.ampData = {self.ampData}')

    def _runScan(self):

        # Update text in table to indicate that scan is running
        self.scanConfigTableModel.item(
            self.scanConfigRowToScan, Scans.STATUS).setText('Running')

        # runScan() is in a thread...  need to get logger?
        logger = logging.getLogger(__name__)
        logger.info(self.configFile)
        logger.info(f"config file = {self.configFile}")
        #
        # FIXME: the textbox doesn't update right away...
        # need to force an update somehow....
        self._loadConfigFile(updateGui=False)

        print("\n\n =================== runScan()\n\n")
        print(f"self.configFile = {self.configFile}")
        # verify that config file can be opened (DEFUNCT: this is done in _loadConfigFile()
        # try:
        #    with open(self.configFile) as fh:
        #        pass
        # except:
        #    self.logger.error("Could not open config file -- cannot proceed")

        try:
            self.logger.info('======= dwaReset() ===========')
            if self.verbose > 0: print('======= dwaReset() ===========')
            self.uz.reset()
        except Exception:
            self.logger.error("DWA reset failed")

        try:
            self.logger.info('======= dwa disable HV ===========')
            if self.verbose > 0: print('======= dwa disable HV ===========')
            self.uz.hvDisable()
            time.sleep(0.5)  # sleep to let HV drain
        except Exception:
            self.logger.error("DWA hvDisable failed")

        try:
            self.logger.info('======= dwaConfig() ===========')
            if self.verbose > 0: print('======= dwaConfig() ===========')
            # single TCP/IP call -- many reg writes
            self.uz.scanConfigMulti(self.dwaConfigFile.config['FPGA'])
            # self.uz.scanConfig(self.dwaConfigFile.config['FPGA']) # many TCP/IP calls -- one reg write per call
        except Exception:
            self.logger.error("DWA run configuration failed")

        try:
            time.sleep(0.5)
            self.logger.info('======= dwa enable HV ===========')
            if self.verbose > 0: print('======= dwa enable HV ===========')
            self.uz.hvEnable()
            time.sleep(0.5)  # sleep to let HV ramp up
        except Exception:
            self.logger.error("DWA hvEnable failed")

        try:
            self.logger.info('======= dwaStart() ===========')
            if self.verbose > 0: print('======= dwaStart() ===========')
            self.uz.start()
            self.logger.info('======= DONE WITH dwaStart() ===========')
            # logger.info('\n\n======= dwaStat() ===========')
            # self.uz.stat()
        except Exception:
            self.logger.error("DWA run start failed")

    # @pyqtSlot()
    # def quitAll(self):

    @pyqtSlot()
    def tabChangedStage(self):
        self.currentViewStage = self.tabWidgetStages.currentIndex()
        if self.verbose > 0:
            print(
                f"tabWidgetStage changed... self.currentViewStage = {self.currentViewStage}")

    @pyqtSlot()
    def tabChangedStim(self):
        self.currentViewStim = self.tabWidgetStim.currentIndex()
        if self.verbose > 0:
            print(
                f"tabWidgetStim changed... self.currentViewStim = {self.currentViewStim}")

    @pyqtSlot()
    def apaUuidChanged(self):
        print("uuid enter pressed")
        # Save the user-entered UUID
        val = self.configApaUuidLineEdit.text().strip()
        if val == "":
            return

        self.configApaUuid = val
        self.apaSubdir = os.path.join(
            OUTPUT_DIR_SCAN_DATA, f'APA_{self.configApaUuid}')
        print(f"self.configApaUuid = [{self.configApaUuid}]")

        self.horizontalWidget.setVisible(True)
        self.widgetUuid.setEnabled(False)
        # Load the results table using the specified UUID
        self.resultsScansTableLoad()
        self.resultsWiresTableLoad()
        # Load tension tab
        self.loadTensions()

    @pyqtSlot()
    def configFileNameEnter(self):
        self.configFile = self.configFileName.text()
        self._loadConfigFile()

    def loadResultsScan(self, row=None):
        #
        if row == None:
            index = self.recentScansTableView.currentIndex()
            row = index.row()
        col = ResultsScans.SCAN
        # G_A_1_1-3-5-7-9-11-13-15_20211022T093618
        scanId = self.recentScansFilterProxy.index(row, col).data()
        self.doubleClickedSegment = int(self.recentWiresFilterProxy.index(
            row, ResultsWires.WIRE_SEGMENT).data())

        self.loadResultsFile(scanId)

    def loadResultsWire(self, row=None):
        #
        if row == None:
            index = self.recentWiresTableView.currentIndex()
            row = index.row()
        col = ResultsWires.SCAN
        # G_A_1_1-3-5-7-9-11-13-15_20211022T093618
        scanId = self.recentWiresFilterProxy.index(row, col).data()
        self.doubleClickedSegment = int(self.recentWiresFilterProxy.index(
            row, ResultsWires.WIRE_SEGMENT).data())
        self.loadResultsFile(scanId)

    def loadResultsFile(self, scanId):

        scanFile = os.path.join(self.apaSubdir, scanId, 'amplitudeData.json')
        self.loadSavedScanData(scanFile)

        # Switch focus to the plot tab
        self.currentViewResults = ResultsView.PROCESSED
        self.viewResults()

    def newResultsDict(self):
        return process_scan.new_results_dict(APA_STAGES_SCANS, APA_LAYERS,
                                             APA_SIDES, MAX_WIRE_SEGMENT)

    def getResultsDict(self):
        print('self.getResultsDict():')

        self.getApaUuid()
        result = None

        if self.resultsDictFileLocked:
            print("Results file is currently being loaded. Will try again.")
            time.sleep(1)
            return self.getResultsDict()

        if self.configApaUuid is None:
            print("\n\n\nERROR ERROR ERROR ERROR: apaUuid is None!!!!!\n\n\n")
            return None

        try:  # load the existing JSON file if it exists
            filename = os.path.join(
                OUTPUT_DIR_PROCESSED_DATA, f'{self.configApaUuid}.json')
            with open(filename, "r") as fh:
                self.resultsDictFileLocked = True
                result = json.load(fh)
        except Exception:  # otherwise, create one
            print(
                f"Could not find JSON results file for APA UUID: {self.configApaUuid}. Creating a new dict.")
            result = self.newResultsDict()

        self.resultsDictFileLocked = False
        return result

    def writeResultsDict(self, resultsDict):
        if self.resultsDictFileLocked:
            alert = qtw.QMessageBox()
            alert.setIcon(qtw.QMessageBox.Information)
            alert.setText(
                "Attempted to save tension data while file was in use!")
            alert.setWindowTitle("Alert")
            alert.setStandardButtons(qtw.QMessageBox.Ok)
            alert.exec_()

        if not self.configApaUuid:
            return

        # save scan analysis results to JSON file
        outfile = os.path.join(OUTPUT_DIR_PROCESSED_DATA,
                               f'{self.configApaUuid}.json')
        print(f'Writing processed scan results to {outfile}')
        with open(outfile, 'w') as f:
            self.resultsDictFileLocked = True
            json.dump(resultsDict, f, indent=4, sort_keys=True)

        self.resultsDictFileLocked = False

    def getApaUuid(self):
        print('self.getApaUuid()')
        val = self.configApaUuidLineEdit.text().strip()
        print(f'val = {val}')
        self.configApaUuid = val if val is not None else None
        print(f'self.configApaUuid = {self.configApaUuid}')

    def loadArbitraryScanData(self):
        # WARNING: only a single JSON file is written, with APA UUID as filename
        # so if user loads data from multiple APA UUIDs then data can be lost or mis-classified (wrong UUID)
        # also, there is no provision to keep track of stage that scan was taken...
        print('loadArbitraryScanData:')

        # open a file selection dialog for user to input a scan filename
        file_dialog = qtw.QFileDialog()
        file_dialog.setFileMode(qtw.QFileDialog.DirectoryOnly)
        file_dialog.setOption(qtw.QFileDialog.DontUseNativeDialog, True)
        file_view = file_dialog.findChild(qtw.QListView, 'listView')

        # to make it possible to select multiple directories:
        if file_view:
            file_view.setSelectionMode(qtw.QAbstractItemView.MultiSelection)
        f_tree_view = file_dialog.findChild(qtw.QTreeView)
        if f_tree_view:
            f_tree_view.setSelectionMode(qtw.QAbstractItemView.MultiSelection)

        scanDirectories = []
        if file_dialog.exec():
            paths = file_dialog.selectedFiles()
            print(paths)
            scanDirectories = paths

        # Figure out what APA UUID has been selected
        # If more than one, throw an error!
        apaUuids = []
        scansToProcess = []
        for sd in scanDirectories:
            if sd:  # validate the selected filename (require .json?)
                print(sd)
                toks = os.path.normpath(sd).split(os.path.sep)
                if (toks[-2][0:4] != 'APA_'):
                    continue
                uuid = toks[-2][4:]  # remove "APA_" from start
                apaUuids.append(uuid)
                scansToProcess.append(sd)

        uniqueApaUuids = set(apaUuids)
        if len(uniqueApaUuids) > 1:
            print(
                "ERROR: scans from more than one APA UUID have been chosen. Aborting analyis")
            print(uniqueApaUuids)
            return
        else:
            print("Proceeding with analysis of scans from APA UUID:")
            print(f"{uniqueApaUuids}")
            self.configApaUuid = list(uniqueApaUuids)[0]
            # Update the UUID text field in the GUI
            self.configApaUuidLineEdit.setText(self.configApaUuid)

        # Prepare dictionary to hold results of scan analysis
        resultsDict = self.getResultsDict()

        # process each scan
        for scan in scansToProcess:
            process_scan.process_scan(
                resultsDict, scan, MAX_FREQ, self._getAlgorithmVersion(), **self.current_algo_kwargs)

        # save scan analysis results to JSON file
        self.writeResultsDict(resultsDict)

        # update the results table
        self.resultsWiresTableLoad()

    def loadSavedScanData(self, filename):
        print("loadSavedScanData", filename)
        self._initSavedAmpDataPlots()
        self._clearResonanceFitLines()
        self._clearResonanceExpectedLines()
        self._loadSavedAmpData(filename)
        self._configureResonancePlots()
        self.runResonanceAnalysis()
        self._addResonanceExpectedLines()
        self.setTensionSaveStatus(TensionSaveStatus.AUTO)

    @pyqtSlot()
    def _resFreqUserInputText(self):

        # FIXME: add check for which channel's textbox this came from
        # and only update the f0 values and GUI display for that associated channel
        for reg in self.registers:
            if reg.value not in self.activeRegistersS:
                continue
            for seg in range(3):
                if seg < len(self.resonantFreqs[reg.value]):
                    try:
                        tensionInput = float(
                            getattr(self, f'le_resfreq_val_{reg}_{seg}').text())
                        currentFreqs = np.array(
                            self.expectedFreqs[reg.value][seg])
                        newFreqs = currentFreqs * \
                            np.sqrt(tensionInput/TENSION_SPEC)
                        self.resonantFreqs[reg.value][seg] = newFreqs.tolist()
                        self.currentTensions[reg.value][seg] = tensionInput
                    except Exception:
                        print(self.resonantFreqs[reg.value])
                        self.resonantFreqs[reg.value][seg] = []

        self.resFreqUpdateDisplay(chan=None)

    def NominalLineClicked(self, dwaChan, seg):
        print(f"Nominal Line Clicked {dwaChan} {seg}")
        getattr(self, f'le_resfreq_val_{dwaChan}_{seg}').setText(
            str(TENSION_SPEC))
        self._resFreqUserInputText()

    def _f0LineClicked(self, infLine, clickEvt):
        # evt is an InfiniteLine and an event (sigClicked sent by InfiniteLine)

        print("f0Line clicked")
        # print(f"pyqtgraph version {pg.__version__}")
        print(f"infLine   = {infLine}")
        print(f"clickEvt  = {clickEvt}")

        if clickEvt.modifiers() == qtc.Qt.ControlModifier:
            print("CTRL held down")
            self._f0LineRemove(infLine)

    def _f0LineRemove(self, infLine):
        print(f"removing InfiniteLine {infLine} at f={infLine.value()}")
        source = self._getInfLineSource(
            infLine, self.resFitLines)  # 'proc' or 'raw'
        # print(f"Before: {self.resFitLines['proc']}")
        keys = self.resFitLines[source].keys()
        for kk in keys:
            if infLine in self.resFitLines[source][kk]:
                # remove infline from the correct list
                self.resFitLines[source][kk].remove(infLine)
                break
        # print(f"After: {self.resFitLines['proc']}")
        # print(f"infLine was in register {kk}")
        if source == 'proc':
            print("removing from proc")
            self.resonanceProcessedPlots[kk].removeItem(infLine)
        elif source == 'raw':
            print("removing from raw")
            self.resonanceRawPlots[kk].removeItem(infLine)
        else:
            print("error: could not find the plot that owns {infLine}")
            print("cannot remove line from the plot...")
        del infLine

        self._updateResFreqsFromLineLocations(source)
        self.resFreqUpdateDisplay(chan=None)  # update GUI

    # @pyqtSlot()
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
        # Update plots
        self._evtVwrUpdatePlots(plotAmpl=False)

    # @pyqtSlot()
    def _expectedLineMoved(self, evt):
        # evt is an InfiniteLine instance (sigDragged event from InfiniteLine)

        print("Line moved")

        source, c, s, l = self._getInfLineSource(evt, self.resExpLines)

        movedLine = self.resExpLines[source][c][s][l]
        newValue = movedLine.value()
        oldValue = self.expectedFreqs[c][s][l]
        # self.resonantFreqs[c][s] + newValue - oldValue
        self.resonantFreqs[c][s] = [
            (newValue/oldValue)*x for x in self.expectedFreqs[c][s]]
        self._clearResonanceExpectedLines()
        self.resFreqUpdateDisplay(chan=None)
        self._addResonanceExpectedLines()

    def _f0LineMoved(self, evt):
        # evt is an InfiniteLine instance (sigDragged event from InfiniteLine)

        print("f0Line moved")
        source, c, s, l = self._getInfLineSource(evt, self.resFitLines)
        self._updateResFreqsFromLineLocations(source, c, s, l)
        self.resFreqUpdateDisplay(chan=None)  # update GUI

    def _getInfLineSource(self, infLine, resLines):
        # Figure out which plot the line drag was in
        # Flatten the list of InfiniteLines and match to source of signal
        for source in ['raw', 'proc']:
            for c in self.activeRegistersS:
                chanLines = resLines[source][c]
                for s, segLines in enumerate(chanLines):
                    for l, line in enumerate(segLines):
                        if line == infLine:
                            return source, c, s, l

        return None, None, None, None

    def _updateResFreqsFromLineLocations(self, source, c, s, l):
        # source is either 'proc' or 'raw'
        movedLine = self.resFitLines[source][c][s][l]
        newValue = movedLine.value()
        oldValue = self.resonantFreqs[c][s][l]
        # self.resonantFreqs[c][s] + newValue - oldValue
        self.resonantFreqs[c][s] = [
            (newValue/oldValue)*x for x in self.resonantFreqs[c][s]]
        self.resFreqUpdateDisplay(chan=None)

    @pyqtSlot()
    def viewStimulus(self):
        self.currentViewStage = MainView.STIMULUS
        self.updateTabView()
        self.logger.info("View Stimulus")

    @pyqtSlot()
    def viewResults(self):
        self.currentViewStage = MainView.RESULTS
        self.updateTabView()
        self.logger.info("View Resonant Frequencies")

    @pyqtSlot()
    def viewTensions(self):
        self.currentViewStage = MainView.TENSION
        self.updateTabView()
        self.logger.info("View Tensions")

    @pyqtSlot()
    def viewLog(self):
        self.currentViewStage = MainView.LOG
        self.updateTabView()
        self.logger.info("View LOG")

    @pyqtSlot()
    def viewEvtVwr(self):
        self.currentViewStage = MainView.EVTVWR
        self.updateTabView()
        self.logger.info("View EVENT VIEWER")

    @pyqtSlot()
    def viewConfig(self):
        self.currentViewStage = MainView.STIMULUS
        self.currentViewStim = StimView.CONFIG
        self.updateTabView()
        self.logger.info("View CONFIG")
        print("view config")

    def updateTabView(self):
        self.tabWidgetStages.setCurrentIndex(self.currentViewStage)
        if self.currentViewStage == MainView.STIMULUS:
            self.tabWidgetStim.setCurrentIndex(self.currentViewStim)
        elif self.currentViewStage == MainView.RESULTS:
            self.tabWidgetResults.setCurrentIndex(self.currentViewResults)

    @pyqtSlot()
    def viewGrid(self):
        self.currentViewStage = MainView.STIMULUS
        self.currentViewStim = StimView.V_GRID
        self.updateTabView()
        self.logger.info("View V(t) GRID")

    @pyqtSlot()
    def viewAmplGrid(self):
        self.currentViewStage = MainView.STIMULUS
        self.currentViewStim = StimView.A_GRID
        self.updateTabView()
        self.logger.info("View A(f) GRID")

    @pyqtSlot(int)
    def viewAmplChan(self, chan):
        self.currentViewStage = MainView.STIMULUS
        self.currentViewStim = StimView.A_CHAN
        self.updateTabView()
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
        self.logger.info("View V(t) A_CHAN.  Channel = {}".format(chan))

        if self.chanViewMain != chan:
            x, y = self.curves['chan'][chan].getData()
            self.curves['chan']['main'].setData(x, y)
            self.pw_chan_main.setTitle(chan)
            self.chanViewMain = chan

    @pyqtSlot()
    def _saveAmplitudeData(self):
        if ("fnOfAmpData" in self.__dict__):
            # add metadata to ampData before writing to file (this could also be done earlier)
            # FIXME: grab these values from user input
            print("\n\nsaveAmplitudeData()")
            # print(self.ampData)
            with open(self.fnOfAmpData, 'w') as outfile:
                json.dump(self.ampData, outfile)
            print(f"Saved as {self.fnOfAmpData}")
            self.logger.info(f"Saved as {self.fnOfAmpData}")
        else:
            self.logger.info(f"No run to save.")

    @pyqtSlot()
    def loadTensions(self):
        # Get results dict
        resultsDict = self.getResultsDict()
        # Get stage
        stage = self.tensionStageComboBox.currentText()
        print(f'Loading tesions for {stage}')
        # Build dictionary and table
        self.tensionData = {}
        for layer in APA_LAYERS:
            for side in APA_SIDES:
                self.tensionData[layer+side] = [-1]*MAX_WIRE_SEGMENT['U']
                # Label non-existant channels
                for i in range(MAX_WIRE_SEGMENT[layer], MAX_WIRE_SEGMENT['U']):
                    self.tensionData[layer +
                                     side][i] = TensionStatus.NOT_APPLICABLE

        self.tensionTableModel = TensionTableModel(self.tensionData)
        self.tensionTableView.setModel(self.tensionTableModel)
        # self.tensionTableView.resizeColumnsToContents()
        self.tensionTableView.resizeRowsToContents()
        # self._configureTensionPlots()
        for stage in APA_STAGES:
            for layer in APA_LAYERS:
                try:
                    layerData = resultsDict[stage][layer]
                except KeyError:
                    print(f'Data for stage {stage} and layer {layer} not found.')
                    continue
                for side in APA_SIDES:
                    wireSegmentStrs = layerData[side]
                    for wireSegmentStr in wireSegmentStrs:
                        if int(wireSegmentStr) <= 0:
                            continue
                        segmentLength = channel_frequencies.length_of_wire_segment(
                            layer, int(wireSegmentStr))
                        wireSegDict = wireSegmentStrs[wireSegmentStr]
                        tensionDict = wireSegDict["tension"]
                        tension = TensionStatus.NOT_MEASURED
                        if len(tensionDict.keys()) > 0:
                            scanIds = tensionDict.keys()
                            sortedScanIds = sorted(scanIds)
                            latestScanId = sortedScanIds[-1]
                            latestScan = tensionDict[latestScanId]
                            tension = latestScan["tension"]
                            if tension == 'Not Found':
                                tension = TensionStatus.NOT_FOUND
                        elif segmentLength != None and segmentLength < 500:
                            tension = TensionStatus.TOO_SHORT
                        physicalSide = channel_map.electrical_side_to_physical_side(
                            side, layer, int(wireSegmentStr))
                        self.tensionData[layer +
                                         physicalSide][int(wireSegmentStr)-1] = tension

                    # Create the scatter plot and add it to the view
                    scatter = pg.ScatterPlotItem(pen=pg.mkPen(
                        width=5, color='darkgreen'), symbol='o', size=1)
                    self.tensionPlots['tensionOfWireNumber'][layer][side].addItem(
                        scatter)
                    pos = [{'pos': [i, self.tensionData[layer+side][i]]}
                           for i in range(len(self.tensionData[layer+side]))]
                    scatter.setData(pos)

    def nominalTensions(self, selectedDwaChan=None):
        for seg in range(3):
            lineEdit = getattr(self, f'le_resfreq_val_{selectedDwaChan}_{seg}')
            if lineEdit.isEnabled():
                lineEdit.setText(str(TENSION_SPEC))
        self._resFreqUserInputText()

    def archiveScan(self, scanId):
        scanRunSubDir = "APA_"+str(self.configApaUuid)
        archiveDir = os.path.join(self.archivedDataDir, scanRunSubDir)
        try:
            os.makedirs(archiveDir)
            logging.info(
                "  Directory did not exist...made {}".format(archiveDir))
            print("  Directory did not exist...made {}".format(archiveDir))
        except FileExistsError:
            logging.warning(
                "  Directory already exists: [{}]".format(archiveDir))

        try:
            oldScan = os.path.join(OUTPUT_DIR_SCAN_DATA, scanRunSubDir, scanId)
            newScanDir = os.path.join(OUTPUT_DIR_ARCHIVED_DATA, scanRunSubDir)
            shutil.move(oldScan, newScanDir)
        except:
            logging.warning(
                "  Scan directory failed to move to archive {}".format(scanId))

    def removeAndArchive(self):
        apaUuid = self.configApaUuid
        stage = self.ampDataS['stage']
        layer = self.ampDataS['layer']
        side = self.ampDataS['side']
        scanId = self.loadedScanId
        fullResultsDict = self.getResultsDict()

        for dwaChan in range(N_DWA_CHANS):
            if dwaChan in self.activeRegistersS:
                apaChan = self.ampDataS['apaChannels'][dwaChan]
                f = self.ampDataS[dwaChan]['freq']
                maxFreq = np.min([np.max(f), MAX_FREQ])
                segments, _ = channel_frequencies.get_expected_resonances(
                    layer, apaChan, maxFreq)
                for seg in range(3):
                    if seg < len(segments):
                        wireSeg = segments[seg]
                        fullResultsDict[stage][layer][side][str(
                            wireSeg).zfill(5)]["tension"].pop(scanId, None)
        # save scan analysis results to JSON file
        self.writeResultsDict(fullResultsDict)

        self.archiveScan(scanId)
        self.resultsScansTableLoad()
        self.resultsWiresTableLoad()
        self.loadNextUncomfirmed()

    @pyqtSlot()
    def saveTensions(self, selectedDwaChan=None):
        # TODO: Fix this so that it writes to file in scanData/processed/ instead of database
        self.setTensionSaveStatus(TensionSaveStatus.SAVING)
        qtc.QCoreApplication.processEvents()
        # Load sietch credentials
        # sietch = SietchConnect("sietch.creds")
        apaUuid = self.configApaUuid
        stage = self.ampDataS['stage']
        layer = self.ampDataS['layer']
        side = self.ampDataS['side']
        note = self.submitResonanceNoteLineEdit.text()
        scanId = self.loadedScanId

        fullResultsDict = self.getResultsDict()
        scanResultsDict = self.newResultsDict()

        for dwaChan in range(N_DWA_CHANS):
            if selectedDwaChan != None and dwaChan != selectedDwaChan:
                continue
            if dwaChan in self.activeRegistersS:
                apaChan = self.ampDataS['apaChannels'][dwaChan]
                f = self.ampDataS[dwaChan]['freq']
                maxFreq = np.min([np.max(f), MAX_FREQ])
                segments, _ = channel_frequencies.get_expected_resonances(
                    layer, apaChan, maxFreq)
                for seg in range(3):
                    if seg < len(segments):
                        wireSeg = segments[seg]
                        print("writing seg", dwaChan, seg,
                              self.currentTensions[dwaChan][seg])
                        print(
                            f"stage, layer, side, wireSeg, scanId: {stage}, {layer}, {side}, {wireSeg}, {scanId}")
                        strWireSeg = str(wireSeg).zfill(5)
                        if strWireSeg not in fullResultsDict[stage][layer][side].keys():
                            fullResultsDict[stage][layer][side][strWireSeg] = {
                                "continuity": {}, "tension": {}}
                        if strWireSeg not in scanResultsDict[stage][layer][side].keys():
                            scanResultsDict[stage][layer][side][strWireSeg] = {
                                "continuity": {}, "tension": {}}
                        fullResultsDict[stage][layer][side][strWireSeg]["tension"][scanId] = {
                            'tension': self.currentTensions[dwaChan][seg], 'tension_confidence': 0., 'submitted': 'Manual'}
                        scanResultsDict[stage][layer][side][strWireSeg]["tension"][scanId] = {
                            'tension': self.currentTensions[dwaChan][seg], 'tension_confidence': 0., 'submitted': 'Manual'}

        # save scan analysis results to JSON file
        outfile = os.path.join(OUTPUT_DIR_PROCESSED_DATA, f'{apaUuid}.json')
        print(f'writing processed scan results to {outfile}')
        with open(outfile, 'w') as f:
            json.dump(fullResultsDict, f, indent=4, sort_keys=True)

        self.setTensionSaveStatus(TensionSaveStatus.SAVED)
        self.resultsWiresTableLoad()
        self.updateMissingChannels()

    def submitTensionsSelected(self):
        # Set up a connection to the database API and get the connection request headers
        # This must be done at the beginning of this main script function, but ONLY ONCE
        connection, headers = ConnectToAPI()
        ########################################

        # Performing a new action requires three pieces of information to be pre-defined:
        #   - the action's type form ID (a string, for which a corresponding type form must already exist in the DB)
        #   - the UUID of the component on which the action is being performed (which must already exist in the DB)
        #   - the action data (a Python dictionary, corresponding to the data to be entered into the type form)
        layer = self.tensionLayerSelectionComboBox.currentText()
        side = self.tensionSideSelectionComboBox.currentText()
        tensions = self.tensionData[layer+side]
        actionTypeFormID = 'APALayerTensionMeasurement'
        componentUUID = self.configApaUuid.split('_')[0]
        actionData = {
            'name': 'M2M Action',
            'actionPerformedAfterFormsCleanup': True,
            'wireLayer': layer,
            'apaSide': side.lower(),
            'tensionArray': tensions,
            'segmentIdArray': list(range(len(tensions)))
        }
        # Call the action performance function, which takes the action type form ID, component UUID and action data as its first three arguments
        # The last two arguments must ALWAYS be 'connection' and 'headers' respectively
        # If successful, the function returns the ID of the performed action (if not, an error message is automatically displayed)

        id = PerformAction(actionTypeFormID, componentUUID,
                           actionData, connection, headers)
        print(f"Database submission performed with response: {id}")
        if id:
            self.labelSubmitTensionsStatus.setText("Submission successful!")
            self.labelSubmitTensionsStatus.setStyleSheet("color : green")
        else:
            self.labelSubmitTensionsStatus.setText("Submission failed!")
            self.labelSubmitTensionsStatus.setStyleSheet("color : red")

        # Once all actions have been performed and submitted, close the connection to the database API
        connection.close()

    def submitTensionsFormChanged(self):
        self.labelSubmitTensionsStatus.setText("Unsubmitted")
        self.labelSubmitTensionsStatus.setStyleSheet("color : black")

    def _loadEventDataViaFileBrowser(self):
        # options = qtw.QFileDialog.Options()
        # options |= qtw.QFileDialog.DontUseNativeDialog
        # scanDir, _ = qtw.QFileDialog.getOpenFileName(self,"QFileDialog.getOpenFileName()",
        # "","All Files (*);;JSON Files (*.json)",
        #                                                  options=options)
        scanDir = qtw.QFileDialog.getExistingDirectory(
            self, "Select directory")
        print("scanDir = {scanDir}")

        validScanDir = True
        if not scanDir:  # fixme: better check for valid scan
            validScanDir = False
        if not validScanDir:
            print("invalid directory: ignoring request to load event data")
            print(scanDir)
            return

        wireDataFilenames = [
            f'rawData_{nn:02d}.txt' for nn in range(N_DWA_CHANS)]
        wireDataFilenames = [os.path.join(scanDir, ff)
                             for ff in wireDataFilenames]
        runHeaderFile = os.path.join(scanDir, f'rawData_FF.txt')

        print("Replaying data from the following files: ")
        print(f"  runHeaderFile = {runHeaderFile}")
        for ff in wireDataFilenames:
            print(f"                  {ff}")

        # Open/parse all files in memory
        udpData = {}
        udpData['FF'] = self._getAllLines(runHeaderFile)

        for chan in range(N_DWA_CHANS):
            # Read the full file into memory
            lines = self._getAllLines(wireDataFilenames[chan])
            # Find where the UDP packet boundaries are in the file (lines starting with 'AAAA0')
            # FIXME: replace with DwaDataParser static method findUdpPacketStartLines(lines)
            udpDelimIdxs = []
            for ii, line in enumerate(lines):
                if line.startswith('AAAA0'):
                    udpDelimIdxs.append(ii)
            # Make a list of lists. Outer level list is one entry per UDP packet
            # inner level of list is one entry per line of that UDP packet
            for ii in range(len(udpDelimIdxs)-1):
                udpData[chan] = [lines[udpDelimIdxs[ii]:udpDelimIdxs[ii+1]]
                                 for ii in range(len(udpDelimIdxs)-1)]
                udpData[chan].append(lines[udpDelimIdxs[-1]:])

        # In principle, all channels should have data at all frequencies. But in practice
        # some data could be lost. So need to have a list of frequencies for each channel
        # and keep track of current frequency for each channel separately
        self.evtData = {'freq': {}, 'periodInt': {},
                        'V(t)': {}, 'V(t)_time': {}, 'A(f)': {}, 'V(t)_fit': {}, 'V(t)_fit_time': {},
                        'freqCurrent': 0, 'freqIdx': 0,
                        }
        tmpData = {'freq': {},
                   'V(t)': {},
                   'stimPeriod_int': {},
                   'dt': {}
                   }

        for ii in range(N_DWA_CHANS):
            tmpData['dt'][ii] = []              # list for each channel
            tmpData['freq'][ii] = []            # list for each channel
            # list of lists for each channel
            tmpData['V(t)'][ii] = []
            tmpData['stimPeriod_int'][ii] = []  # list for each channel
            #
            # Y-axis data
            # list of lists for each channel
            self.evtData['V(t)'][ii] = []
            # list of lists for each channel
            self.evtData['V(t)_fit'][ii] = []
            self.evtData['A(f)'][ii] = []          # list for each channel
            #
            # X-axis data
            # single list (valid for all channels)
            self.evtData['freq'] = []
            self.evtData['V(t)_time'][ii] = []     # list for each frequency
            self.evtData['V(t)_fit_time'][ii] = []  # list for each frequency

        # First pass through the data -- gather V(t) and frequency information
        udpCounterList = []
        self.evtDataParser = ddp.DwaDataParser()

        for ichan in range(N_DWA_CHANS):
            nfreqs = len(udpData[ichan])
            for ifreq in range(nfreqs):
                self.evtDataParser.parse(udpData[ichan][ifreq])
                udpCounterList.append(
                    self.evtDataParser.dwaPayload[ddp.Frame.UDP]['UDP_Counter'])

                # extract the V(t) and stim period data for each channel
                tmpData['V(t)'][ichan].append(
                    self.evtDataParser.dwaPayload[ddp.Frame.ADC_DATA]['adcSamples'])
                tmpData['stimPeriod_int'][ichan].append(
                    self.evtDataParser.dwaPayload[ddp.Frame.FREQ]['stimPeriodActive'])
                tmpData['freq'][ichan].append(
                    self.evtDataParser.dwaPayload[ddp.Frame.FREQ]['stimFreqActive_Hz'])
                tmpData['dt'][ichan].append(
                    self.evtDataParser.dwaPayload[ddp.Frame.FREQ]['adcSamplingPeriod']*1e-8)

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
        # reverse the sort
        self.evtData['stimPeriodUnion'] = self.evtData['stimPeriodUnion'][::-1]
        # print(self.evtData['periodUnion'])
        # self.evtData['freqUnion'] = CLOCK_PERIOD_SEC/self.evtData['stimPeriodUnion']
        # convert period in 78.125ps to freq in Hz
        self.evtData['freqUnion'] = (
            1e12/self.evtData['stimPeriodUnion'])/78.125
        # print(self.evtData['freqUnion'])

        # Second pass through the data -- align individual channel data with the master frequency list
        # indexed in a consistent way across channel (all channels share a single frequency array)
        # Missing data is represented by None instead of a list of data
        nptsInFit = 500
        for ifrq, period in enumerate(self.evtData['stimPeriodUnion']):
            for ichan in range(N_DWA_CHANS):
                if period in tmpData['stimPeriod_int'][ichan]:
                    idx = tmpData['stimPeriod_int'][ichan].index(period)
                    dt = tmpData['dt'][ichan][idx]
                    vt = tmpData['V(t)'][ichan][idx]
                    tt = np.arange(len(vt))*dt
                    # Fit the V(t) data
                    (B, C, D, freq_Hz) = dwa.fitSinusoidToTimeseries(
                        vt, dt, tmpData['freq'][ichan][idx])
                    amp = np.sqrt(B**2+C**2)
                    tfit = np.linspace(tt[0], tt[-1], nptsInFit)
                    yfit = B*np.sin(2*np.pi*freq_Hz*tfit) + C * \
                        np.cos(2*np.pi*freq_Hz*tfit) + D
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
        # for ichan in range(N_DWA_CHANS):
        self.evtData['freqIdx'] = 0
        self.evtData['freqCurrent'] = self.evtData['freqUnion'][self.evtData['freqIdx']]
        self._evtVwrUpdatePlots(plotAmpl=True)

        # print("Payload -------------------")
        # print(self.evtDataParser.dwaPayload)
        # print(self.evtData['freq'])
        # print(self.evtData)
        self._findMissingUdpCounters(udpCounterList)

    def _findMissingUdpCounters(self, udpCtrs):
        udpCtrs.sort()
        missingVals = [x for x in range(0, udpCtrs[-1]+1) if x not in udpCtrs]
        print(f"Missing UDP packets: {missingVals}")
        print(
            f"(may also be missing a packet with value larger than {udpCtrs[-1]})")

    # FIXME: move this to DwaDataParser as a static method
    def _getAllLines(self, fname):
        f = open(fname, "r")
        # read all data into a list (without newlines)
        # https://stackoverflow.com/questions/12330522/how-to-read-a-file-without-newlines
        data = f.read().splitlines()
        f.close()
        return data

    def _initSavedAmpDataPlots(self):
        print("_initSavedAmpDataPlots()")
        # for reg in self.registers:
        for reg in range(N_DWA_CHANS):
            self.curves['resRawFit'][reg].setData([])
            self.curves['resProcFit'][reg].setData([])

    def _loadSavedAmpData(self, ampFilename):
        print(f"ampFilename = {ampFilename}")
        self.ampDataActiveLabel.setText(f'Current: {ampFilename}')
        # read in the json file
        # FIXME: add check that the filename exists...
        with open(ampFilename, "r") as fh:
            data = json.load(fh)

        toks = os.path.normpath(ampFilename).split(os.path.sep)
        self.loadedScanId = toks[-2]
        print('Setting scan id to.................. ', self.loadedScanId)

        self.activeRegistersS = []
        for reg in self.registers:
            if len(data[str(reg.value)]['freq']) > 0:
                self.activeRegistersS.append(reg.value)

        # print(f"Active registers for the saved data is: {self.activeRegistersS}")

        self.ampDataS = {}  # "S" = "Saved"
        # for reg in self.registers:
        for chan in self.activeRegistersS:
            # self.ampDataS[reg.value] = {'freq':data[str(reg.value)]['freq'],  # stim freq in Hz
            #                            'ampl':data[str(reg.value)]['ampl'] } # amplitude in ADC counts
            # self.curves['resRawFit'][reg].setData(self.ampDataS[reg.value]['freq'],
            #                                      self.ampDataS[reg.value]['ampl'])
            self.ampDataS[chan] = {'freq': data[str(chan)]['freq'],  # stim freq in Hz
                                   'ampl': data[str(chan)]['ampl']}  # amplitude in ADC counts
            self.curves['resRawFit'][chan].setData(self.ampDataS[chan]['freq'],
                                                   self.ampDataS[chan]['ampl'])

        # Get the Metadata
        for field in DATABASE_FIELDS:
            try:
                self.ampDataS[field] = data[field]
            except:
                self.ampDataS[field] = "Unknown"
        # KLUGE: may want a different test here
        okToLogToDb = False if self.ampDataS['apaUuid'] is None else True
        print(f'okToLogToDb = {okToLogToDb}')
        print(f"self.ampDataS['apaUuid'] = {self.ampDataS['apaUuid']}")
        if okToLogToDb:
            self._submitResonanceButtonEnable()
        else:
            self._submitResonanceButtonDisable()

    def _loadConfigFile(self, updateGui=True):
        # updateGui function no longer works with left column  and original textbox removed
        # try to read the requested file
        # if found, display contents
        # if not found, display error message

        print("=== _loadConfigFile ===")

        # FIXME: should probably pass scan type information to _loadConfigFile...
        if self.currentViewStim == StimView.ADVANCED:
            self.configFile = self.configFileName.text()
        elif self.currentViewStim == StimView.CONFIG:
            self.configFile = os.path.join(
                self.scanRunDataDir, "dwaConfig.ini")

        print(f"   self.configFile = {self.configFile}")
        validConfigFilename = False
        try:
            with open(self.configFile) as fh:
                pass
            validConfigFilename = True
        except:
            textToDisplay = "Could not open file"
            if updateGui:
                self.configFileContents.setPlainText(textToDisplay)
            else:
                print(textToDisplay)

        if not validConfigFilename:
            return

        # read/parse config file
        # self.dwaConfigFile = dcf.DwaConfigFile(self.configFile, sections=['FPGA'])
        self.dwaConfigFile = dcf.DwaConfigFile(self.configFile)

        # FIXME: need to find a way to update the GUI in a thread that is not main thread....
        # right now, updating the GUI in a thread causes a crash.
        # see: https://stackoverflow.com/questions/10905981/pyqt-qobject-cannot-create-children-for-a-parent-that-is-in-a-different-thread
        # https://stackoverflow.com/questions/3268073/qobject-cannot-create-children-for-a-parent-that-is-in-a-different-thread
        if updateGui:
            textToDisplay = self.dwaConfigFile.getRawText()
            if self.omitComments_cb.isChecked():
                self.logger.info(
                    "cutting out commented lines from config file")
                lines = textToDisplay.split('\n')
                lines = [line for line in lines if line.strip(
                ) != "" and not line.strip().startswith('#')]
                textToDisplay = '\n'.join(lines)
            self.configFileContents.setPlainText(textToDisplay)

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

    def _clearResonanceFitLines(self):

        for reg in self.registers:
            # print(f"self.resFitLines['proc'][{reg}] = ")
            # print(self.resFitLines['proc'][reg])
            for segments in self.resFitLines['raw'][reg]:
                for line in segments:
                    self.resonanceRawPlots[reg].removeItem(line)
            for segments in self.resFitLines['proc'][reg]:
                for line in segments:
                    self.resonanceProcessedPlots[reg].removeItem(line)

        self._initResonanceFitLines()

    def _clearResonanceExpectedLines(self):
        print("Clearing expected resonance lines from the resonance plots")
        for reg in self.registers:
            # if reg.value == selectedChan or reg == None:
            for segments in self.resExpLines['proc'][reg]:
                for line in segments:
                    self.resonanceProcessedPlots[reg].removeItem(line)
            for segments in self.resExpLines['raw'][reg]:
                for line in segments:
                    self.resonanceRawPlots[reg].removeItem(line)
            for segments in self.resExpLines['procDebug'][reg]:
                for line in segments:
                    self.resonanceProcessedPlots[reg].removeItem(line)
        self._initResonanceExpectedLines()

    def _clearTimeseriesData(self):
        plotTypes = ['grid', 'chan']
        for ptype in plotTypes:
            for reg in self.registers:
                regId = reg
                self.curves[ptype][regId].setData([])
                self.curvesFit[ptype][regId].setData([])
        self.curves['chan']['main'].setData([])
        self.curvesFit['chan']['main'].setData([])

    def _clearAmplitudeData(self):
        # self.resonantFreqs = {}  # FIXME: this should not go here... should happen when A(f) data is loaded...
        # FIXME: shouldn't really reset the dict like this...
        self.ampData = {}
        self.ampData[SCAN_END_MODE_KEYWORD] = ScanEnd.NORMAL
        for reg in self.registers:
            self.ampData[reg] = {'freq': [],  # stim freq in Hz
                                 'ampl': []}  # amplitude in ADC counts
            # self.resonantFreqs[reg.value] = None   # a list of f0 values for each wire
            # self.expectedFreqs[reg.value] = None

        # Clear amplitude plots
        plotTypes = ['amplchan', 'amplgrid', 'configamplgrid']
        for ptype in plotTypes:
            for reg in self.registers:
                regId = reg
                self.curves[ptype][regId].setData([])
                self.curves['amplgrid']['all'][reg].setData([])
        self.curves['amplchan']['main'].setData([])

    def _configureAmplitudePlots(self):
        # Set x-ranges for frequency plots so pyqtgraph does not have to autoscale
        # runFreqMin = self.dwaDataParser.dwaPayload[ddp.Frame.RUN]['stimFreqMin_Hz']
        # runFreqMax = self.dwaDataParser.dwaPayload[ddp.Frame.RUN]['stimFreqMax_Hz']
        plotTypes = ['pw_amplgrid', 'pw_amplchan', 'config_amplgrid']
        for ptype in plotTypes:
            for ii in range(N_DWA_CHANS):
                try:
                    apaChan = self.apaChannels[ii]
                except Exception:
                    continue
                # getattr(self, f'pw_{ptype}_{ii}').setXRange(runFreqMin, runFreqMax)
                getattr(self, f'{ptype}_{ii}').setXRange(
                    self.stimFreqMin, self.stimFreqMax)
                _, hw_map = channel_map.get_hardware_map(
                    self.flexDirection, self.ampData['layer'], apaChan)
                getattr(self, f'{ptype}_{ii}').setTitle("{}-{} {} ({})".format(
                    self.ampData['layer'], self.ampData['side'], apaChan, '-'.join(hw_map)))
        self.pw_amplgrid_all.setXRange(self.stimFreqMin, self.stimFreqMax)
        self.pw_amplchan_main.setXRange(self.stimFreqMin, self.stimFreqMax)
        # self.pw_amplgrid_all.setXRange(runFreqMin, runFreqMax)
        # self.pw_amplchan_main.setXRange(runFreqMin, runFreqMax)

        # self.registerOfVal = {}
        # for reg in ddp.Registers:
        #    self.registerOfVal[reg.value] = reg

    def _configureResonancePlots(self):
        for index in range(N_DWA_CHANS):
            self.resonanceRawPlots[index].setTitle(
                f'DWA Chan: {index} APA Chan: N/A')
            self.resonanceProcessedPlots[index].setTitle(
                f'DWA Chan: {index} APA Chan: N/A')
            # getattr(self, f'proccesedgrid_{index}').setTitle(f'DWA Chan: {index} APA Chan: N/A')
            for seg in range(3):
                getattr(self, f'lab_resfreq_{index}_{seg}').setText('None')
                getattr(self, f'le_resfreq_val_{index}_{seg}').setText('')
                getattr(self, f'le_resfreq_val_{index}_{seg}').setEnabled(
                    False)
                getattr(self, f'le_resfreq_val_{index}_{seg}').setStyleSheet(
                    "QLineEdit {background-color: white;}")
            if index in self.activeRegistersS:
                apaChan = self.ampDataS['apaChannels'][index]
                apaLayer = self.ampDataS['layer']
                apaSide = self.ampDataS['side']
                self.resonanceRawPlots[index].setTitle(
                    f'DWA Chan: {index} APA Chan: {apaLayer}{apaSide}{apaChan}')
                self.resonanceProcessedPlots[index].setTitle(
                    f'DWA Chan: {index} APA Chan: {apaLayer}{apaSide}{apaChan}')
                f = self.ampDataS[index]['freq']
                maxFreq = np.min([np.max(f), MAX_FREQ])
                segments, _ = channel_frequencies.get_expected_resonances(
                    apaLayer, apaChan, maxFreq)
                for seg in range(3):
                    if seg < len(segments):
                        wireSeg = segments[seg]
                        if (wireSeg == self.doubleClickedSegment):
                            getattr(self, f'le_resfreq_val_{index}_{seg}').setStyleSheet(
                                "QLineEdit {background-color: pink;}")
                        getattr(self, f'lab_resfreq_{index}_{seg}').setText(
                            f'{apaLayer}{apaSide}{wireSeg}')
                        getattr(self, f'le_resfreq_val_{index}_{seg}').setEnabled(
                            True)

    def _makeOutputFilenames(self):
        # Generate a unique filename for each register
        # Generate filehandles for each register
        # FIXME: move this to a higher level (only do it once...)
        froot = os.path.join(self.scanRunDataDir, "rawData")
        self.logger.info(f"fileroot = {froot}")
        # create new output filenames
        # file names for output. Keys are 2-digit hex string (e.g. '03' or 'FF'). values are filenames
        self.fnOfReg = {}
        # self.fnOfReg['FF'] = "{}_{:02X}.txt".format(froot, 'FF')
        for reg in self.registers_all:
            self.fnOfReg['{:02X}'.format(reg.value)] = "{}_{:02X}.txt".format(
                froot, reg.value)
        self.logger.info(f"self.fnOfReg = {self.fnOfReg}")
        self.fnOfAmpData = os.path.join(
            self.scanRunDataDir, "amplitudeData.json")
        # self.run = self.scanRunDataDir
        print(f"self.fnOfAmpData = {self.fnOfAmpData}")
        self.logger.info(f"self.fnOfAmpData = {self.fnOfAmpData}")

    def _startUdpReceiver(self, newdata_callback):
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
        if self.verbose > 0: print("\n\n ============= startUdpReceiver() ===============\n\n")

        if self.udpListening:
            return

        while True:
            try:
                self.udpListening = True
                data, _addr = self.sock.recvfrom(self.udpBufferSize)
                if self.verbose > 3:
                    logger.info("")
                    logger.info("bing! data received")
                # logger.info(data)
                udpDataStr = binascii.hexlify(data).decode(self.udpEnc).upper()
                if self.verbose > 3:
                    logger.info(udpDataStr)

                # Break up string into a list of 8-character chunks
                dataStrings = self._makeWordList(udpDataStr)

                # Write the raw udp payload to file
                self._logRawUdpTransmissionToFile(dataStrings)

                if self.verbose > 3:
                    print("dataStrings = ")
                    print(dataStrings)

                # Parse UDP transmission
                self.dwaDataParser.parse(dataStrings)
                if 'FFFFFFFF' in dataStrings:
                    if self.verbose > 3:
                        logger.info('\n\n')
                        logger.info(
                            f'self.dwaDataParser.dwaPayload = {self.dwaDataParser.dwaPayload}')

                # FIXME: this should go into processUdpPayload() !!!
                # Since this is happening in a separate thread from the GUI
                # you cannot edit/modify GUI elements here...
                # If there is a run frame with no '77' key, or if this is a run start frame
                # then this is a new run, so need to clear plots and create new filenames
                if ddp.Frame.RUN in self.dwaDataParser.dwaPayload:
                    self.oldDataFormat = False
                    if self.dwaDataParser.dwaPayload[ddp.Frame.RUN]['runStatus'] == None:
                        self.oldDataFormat = True
                    if self.dwaDataParser.dwaPayload[ddp.Frame.RUN]['runStatus'] == SCAN_START or \
                       self.oldDataFormat:
                        if self.verbose > 0: 
                            print("New run detected... creating new filenames")
                            print("runStatus = ")
                            print(self.dwaDataParser.dwaPayload[ddp.Frame.RUN]['runStatus'])
                            print(f'self.oldDataFormat = {self.oldDataFormat}')
                        if self.verbose > 3:
                            logger.info(
                                "New run detected... creating new filenames")
                        self._makeOutputFilenames()
                        # self._clearAmplitudeData()  # cannot go here (in non-GUI thread)
                        if self.verbose > 3:
                            logger.info(self.fnOfReg)

                # write data to file by register
                reg = self.dwaDataParser.dwaPayload[ddp.Frame.UDP]['Register_ID_hexStr']
                # Don't write status frames to disk
                statusFrameReg = '{:02X}'.format(ddp.Registers.STATUS)
                if reg != statusFrameReg:
                    if self.verbose > 3:
                        print(f"reg = {reg}")
                        # print(f"self.fnOfReg: {self.fnOfReg}")
                        # logger.info(f"self.fnOfReg: {self.fnOfReg}")
                    with open(self.fnOfReg[reg], 'a') as regFH:
                        for item in dataStrings:
                            regFH.write(f'{item}\n')
                        regFH.close()

                newdata_callback.emit(self.dwaDataParser.dwaPayload)

            except socket.timeout:
                if self.verbose > 3:
                    logger.info("  UDP Timeout")
                self.sock.close()
                self.udpListening = False
                break
            else:
                self.udpListening = False
            finally:
                self.udpListening = False

    def _processUdpPayload(self, udpDict):
        # new UDP payload has arrived from DWA.
        # Deal with it (update plots, or status, or ...)
        self.logger.info('\n\n')
        self.logger.info("processUdpPayload()")

        kk = udpDict.keys()
        self.logger.info(kk)

        self.outputText.appendPlainText("UDP Counter: {}".format(
            udpDict[ddp.Frame.UDP]['UDP_Counter']))

        # Look for run header frame
        if ddp.Frame.RUN in udpDict:   # Assumes this is start of a new scan
            self.outputText.appendPlainText("\nFOUND RUN HEADER")
            self.outputText.appendPlainText(str(udpDict))

            # if start of run, set up GUI scan parameters
            if udpDict[ddp.Frame.RUN]['runStatus'] == SCAN_START:
                # FIXME: TEMPORARY...
                self.logger.info("\n\n\n\nFOUND RUN HEADER")
                # update the frequency information (min, max, step)
                # FIXME: move this to a subroutine...
                self.stimFreqMin = udpDict[ddp.Frame.RUN]['stimFreqMin_Hz']
                self.stimFreqMax = udpDict[ddp.Frame.RUN]['stimFreqMax_Hz']
                self.stimFreqStep = udpDict[ddp.Frame.RUN]['stimFreqStep_Hz']
                self._formatRunStatusIndicators(state='fresh')
                self.globalFreqMin_val.setText(f"{self.stimFreqMin:.3f}")
                self.globalFreqMax_val.setText(f"{self.stimFreqMax:.3f}")
                self.globalFreqStep_val.setText(f"{self.stimFreqStep:.4f}")
                self.globalFreqActive_val.setText(f"--")

                self._clearTimeseriesData()
                self._clearAmplitudeData()
                self._setScanMetadata()    # must come after clearAmplitudeData
                self._configureAmplitudePlots()  # must come after setScanMetadata()

                print("\n\nSCAN START")

            # if end of scan...
            elif udpDict[ddp.Frame.RUN]['runStatus'] == SCAN_END:
                print("\nSCAN IS DONE")
                boombox.BoomBox('sounds/scanFinished.wav').play()

                self._saveAmplitudeData()  # do this first to avoid data loss

                self._formatRunStatusIndicators(state='stale')

                # FIXME: shouldn't really change button state or controller state via
                # RUN end frame. Should only do this from STATUS frame...
                self._scanButtonDisable()
                self._setScanButtonAction('START')

                self._disableRelaysThread()

                self._updatePlots(force_all=True)
                self._wrapUpStimulusScan()

                # if the scan is auto, then when it finishes and the scan is over this
                # finds what row was scanned and updates the status for that row
                # this also selects the next row
                if self.scanType == ScanType.AUTO:  # One scan of a set is done

                    row = self.scanConfigRowToScan
                    self.scanConfigTableModel.item(
                        row, Scans.STATUS).setText('Done')

                    if row == self.scanConfigTableModel.rowCount()-1:
                        self.scanConfigRowToScan = 0
                    else:
                        self.scanConfigRowToScan += 1
                    self.scanConfigTable.selectRow(self.scanConfigRowToScan)

                self.scanType = None

            else:
                print("ERROR: unknown value of runStatus:")
                print(udpDict[ddp.Frame.RUN])
                print(udpDict[ddp.Frame.RUN]['runStatus'])

        # Look for frequency header
        if ddp.Frame.FREQ in udpDict:
            self.logger.info("FOUND FREQUENCY HEADER")
            self.logger.info(udpDict)
            self.globalFreqActive_val.setText(
                f"{udpDict[ddp.Frame.FREQ]['stimFreqActive_Hz']:.4f}")

        # Check to see if this is an ADC data transfer:
        if ddp.Frame.ADC_DATA in udpDict:
            self.outputText.appendPlainText("\nFOUND ADC DATA\n")

            # update the relevant plot...
            regId = udpDict[ddp.Frame.FREQ]['Register_ID_Freq']
            self.logger.info(f'regId = {regId}')
            reg = self.registerOfVal[regId]

            # If this DWA channel does not correspond to an actual wire, then don't update plots in the GUI
            if (self.scanType == ScanType.AUTO) and (self.apaChannels[regId] is None):
                return

            # self.mycurves[reg].setData(udpDict[ddp.Frame.ADC_DATA]['adcSamples'])
            dt = udpDict[ddp.Frame.FREQ]['adcSamplingPeriod']*1e-8
            # FIXME: list copy issue?
            self.adcData[reg]['ADC'] = udpDict[ddp.Frame.ADC_DATA]['adcSamples']
            self.adcData[reg]['time'] = np.arange(
                len(self.adcData[reg]['ADC']))*dt
            self.adcData[reg]['freq'] = udpDict[ddp.Frame.FREQ]['stimFreqActive_Hz']

            # Update plots
            self.DATA_TO_PLOT = True

            # compute the best fit to V(t) and plot (in red)
            (B, C, D, freq_Hz) = dwa.processWaveform(udpDict)
            self.ampData[reg]['freq'].append(freq_Hz)
            self.ampData[reg]['ampl'].append(np.sqrt(B**2+C**2))
            nptsInFit = 500
            tmin, tmax = self.adcData[reg]['time'][0], self.adcData[reg]['time'][-1]
            self.adcData[reg]['tfit'] = np.linspace(tmin, tmax, nptsInFit)
            self.adcData[reg]['ADCfit'] = B*np.sin(2*np.pi*freq_Hz*self.adcData[reg]['tfit']) + C*np.cos(
                2*np.pi*freq_Hz*self.adcData[reg]['tfit']) + D

        # Look for STATUS frame
        if ddp.Frame.STATUS in udpDict:
            if self.verbose > 1:
                self.outputText.appendPlainText("\nFOUND STATUS FRAME:")
                self.outputText.appendPlainText(str(udpDict[ddp.Frame.STATUS]))
                print(f"\n FOUND STATUS FRAME {datetime.datetime.now()}")
                print(udpDict[ddp.Frame.STATUS])

            # some status frames should be logged...
            # see DwaDataParser.py for details
            # e.g. 'trgTimeout', 'trgStateChange', 'trgButtonChange', 'trgErrorChange'
            if udpDict[ddp.Frame.STATUS]['trgButtonChange']:
                self._logDwaButtonStatus(
                    ''.join(udpDict[ddp.Frame.STATUS]['buttonStatusList']))
            if udpDict[ddp.Frame.STATUS]['trgErrorChange']:
                self._logDwaErrorStatus(
                    udpDict[ddp.Frame.STATUS]['statusErrorBits'])

            self.updateErrorStatusInGui(
                udpDict[ddp.Frame.STATUS]['statusErrorBits'])

            # update heart logo
            self._updateHeartbeatLogo()

            self.dwaControllerState = udpDict[ddp.Frame.STATUS]['controllerState']

            if self.enableScanButtonTemp and (self.dwaControllerState == State.IDLE):
                self.enableScanButtonTemp = False
                self._scanButtonEnable()

            self.dwaControllerState_val.setText(
                f"{udpDict[ddp.Frame.STATUS]['controllerStateStr']}")
            # KLUGE: we may not get status frames for all states...
            self.idle = False
            if udpDict[ddp.Frame.STATUS]['controllerStateStr'] == "IDLE":
                self.idle = True
                # self._scanButtonEnable()

            else:
                pass

            self.statusErrors_val.setText(
                f"{udpDict[ddp.Frame.STATUS]['statusErrorBits']}")

            # Display the status of the push buttons
            self.buttonStatus_val.setText(
                f"{udpDict[ddp.Frame.STATUS]['buttonStatus']}")
            self._setPushButtonStatusAll(
                udpDict[ddp.Frame.STATUS]['buttonStatusList'])

    def updateErrorStatusInGui(self, errorBitsString):
        # print("updateErrorStatusInGui()")
        # print(f'errorBitsString = {errorBitsString}')
        # statusErrorBits looks like this: '000000000000000000000000'
        # not yet sure of the mapping...
        self._setDwaErrorStatus(errorBitsString)

    def _logDwaButtonStatus(self, msg):
        timestamp = datetime.datetime.now().strftime("%Y-%m-%dT%H:%M:%S")
        fout = self._getScanStatusFilename()
        with open(fout, 'a') as ff:
            ff.write(f'btn0 {timestamp} {msg}\n')
            # e.g. btn0 2019-01-14T20:01:46 0010

    def _logDwaErrorStatus(self, msg):
        timestamp = datetime.datetime.now().strftime("%Y-%m-%dT%H:%M:%S")
        fout = self._getScanStatusFilename()
        with open(fout, 'a') as ff:
            ff.write(f'err0 {timestamp} {msg}\n')
            # e.g. err0 2019-01-14T20:01:46 0010

    def _getScanStatusFilename(self):
        fname = datetime.datetime.now().strftime("%Y%m%d.status")
        fname = os.path.join(self.scanStatusDir, fname)
        return fname

    def _formatRunStatusIndicators(self, state=None):
        if state.upper() == 'STALE':
            color = 'gray'
        elif state.upper() == 'FRESH':
            color = 'black'

        self.globalFreqMin_val.setStyleSheet(f"color: {color}")
        self.globalFreqMax_val.setStyleSheet(f"color: {color}")
        self.globalFreqStep_val.setStyleSheet(f"color: {color}")
        self.globalFreqActive_val.setStyleSheet(f"color: {color}")

    def _updatePlotsVGrid(self):
        # for reg in self.registers:
        for reg in self.activeRegisters:
            self.curves['grid'][reg].setData(self.adcData[reg]['time'],
                                             self.adcData[reg]['ADC'])
            self.curvesFit['grid'][reg].setData(self.adcData[reg]['tfit'],
                                                self.adcData[reg]['ADCfit'])

    def _updatePlotsVChan(self):
        # for reg in self.registers:
        for reg in self.activeRegisters:
            self.curves['chan'][reg].setData(self.adcData[reg]['time'],
                                             self.adcData[reg]['ADC'])
            self.curvesFit['chan'][reg].setData(self.adcData[reg]['tfit'],
                                                self.adcData[reg]['ADCfit'])
        # Update the main window too
        self.curves['chan']['main'].setData(self.adcData[self.chanViewMain]['time'],
                                            self.adcData[self.chanViewMain]['ADC'])
        self.curvesFit['chan']['main'].setData(self.adcData[self.chanViewMain]['tfit'],
                                               self.adcData[self.chanViewMain]['ADCfit'])

    def _updatePlotsAmpGrid(self):
        for reg in self.activeRegisters:
            # for reg in self.registers:
            self.curves['amplgrid'][reg].setData(
                self.ampData[reg]['freq'], self.ampData[reg]['ampl'])
            self.curves['configamplgrid'][reg].setData(
                self.ampData[reg]['freq'], self.ampData[reg]['ampl'])

    def _updatePlotsAmpChan(self):
        for reg in self.activeRegisters:
            # for reg in self.registers:
            self.curves['amplchan'][reg].setData(
                self.ampData[reg]['freq'], self.ampData[reg]['ampl'])
        # Update the main window too
        self.curves['amplchan']['main'].setData(
            self.ampData[self.chanViewMainAmpl]['freq'], self.ampData[self.chanViewMainAmpl]['ampl'])

    def _updatePlots(self, force_all=False):

        if force_all:
            self._updatePlotsVGrid()
            self._updatePlotsVChan()
            self._updatePlotsAmpGrid()
            self._updatePlotsAmpChan()
            return

        if not self.DATA_TO_PLOT:
            return

        if self.currentViewStage == MainView.STIMULUS:
            if self.currentViewStim == StimView.V_GRID:
                self._updatePlotsVGrid()
            elif self.currentViewStim == StimView.V_CHAN:
                self._updatePlotsVChan()
            elif self.currentViewStim == StimView.A_GRID or self.currentViewStim == StimView.CONFIG:
                self._updatePlotsAmpGrid()
            elif self.currentViewStim == StimView.A_CHAN:
                self._updatePlotsAmpChan()

        self.DATA_TO_PLOT = False

    def _updateHeartbeatLogo(self):
        self.heartval = (self.heartval+1) % len(self.heartPixmaps)
        self.heartbeat_val.setPixmap(self.heartPixmaps[self.heartval])
        self.heartbeat_val.resize(self.heartPixmaps[self.heartval].width(),
                                  self.heartPixmaps[self.heartval].height())
        # self.heartbeat_val.setText(f"{self.heartval}")

    def _doContinuityChanged(self):
        # self.doContinuity = True if self.doContinuityCb.checkState() == qtc.Qt.Checked else False
        self.doContinuity = self.doContinuityCb.isChecked()
        # print(f"clicked check box: state = {self.doContinuityCb.checkState()}")
        # print(f"is unchecked:      {self.doContinuity == qtc.Qt.Unchecked}")
        # print(f"is   checked:      {self.doContinuity == qtc.Qt.Checked}")
        print(f"self.doContinuity: {self.doContinuity}")

    def _doTensionChanged(self):
        self.doTension = self.doTensionCb.isChecked()
        print(f"self.doTension: {self.doTension}")

    def _setScanButtonAction(self, state=None):
        ''' change the functionality of the scan buttons (start scan vs. abort scan) '''
        # state can be 'START' or 'ABORT'
        validStates = ['START', 'ABORT']
        state = state.upper()
        if state not in validStates:
            return

        if state == 'START':
            for scb in self.scanCtrlButtons:
                # this makes it so buton/row color are the same
                scb.setStyleSheet("background-color : rgb(3,205,0)")
                if scb == self.btnScanCtrl:
                    scb.setText("Start selected scan")
                else:
                    scb.setText("Start scan")
        elif state == 'ABORT':
            for scb in self.scanCtrlButtons:
                scb.setStyleSheet("background-color : red")
                scb.setText("Abort Scan")
        else:
            print("HUH? should never get here...")
            return

        for scb in self.scanCtrlButtons:
            scb.repaint()

        self._scanButtonConnect(state)

    def _scanButtonConnect(self, state):
        try:
            self.btnScanCtrl.clicked.disconnect()
            self.btnScanCtrlAdv.clicked.disconnect()
        except Exception:
            pass

        if state == 'START':
            # self.btnScanCtrl.clicked.connect(self.startScanThread)
            self.btnScanCtrl.clicked.connect(self._startScanThreadHandler)
            self.btnScanCtrlAdv.clicked.connect(self._startScanAdvThread)
        elif state == 'ABORT':
            self.btnScanCtrl.clicked.connect(self._abortScan)
            self.btnScanCtrlAdv.clicked.connect(self._abortScan)

    def _submitResonanceButtonDisable(self):
        self.btnSaveTensions.setEnabled(False)

    def _submitResonanceButtonEnable(self):
        self.btnSaveTensions.setEnabled(True)

    def _scanButtonDisable(self):
        # self._scanButtonEnable(state=False)
        self.btnScanCtrl.setEnabled(False)
        self.btnScanCtrlAdv.setEnabled(False)

    def _scanButtonEnable(self, force=False):
        if force or (self.connectedToUzed and self.idle and self.configure):
            print(
                f"number of table rows = {self.scanConfigTableModel.rowCount()}")
            if self.scanConfigTableModel.rowCount() > 0:
                self.btnScanCtrl.setEnabled(True)
        if force or (self.connectedToUzed and self.idle):
            self.btnScanCtrlAdv.setEnabled(True)

    def _wrapUpStimulusScan(self):
        # Set the active tab to be RESONANCE
        if AUTO_CHANGE_TAB:
            self.currentViewStage = MainView.RESULTS
            self.tabWidgetStages.setCurrentIndex(self.currentViewStage)

        # Process the scan and update the results table

        fullResultsDict = self.getResultsDict()
        scanResultsDict = self.newResultsDict()
        dirName = os.path.dirname(self.fnOfAmpData)
        scanType, apaChannels, results = process_scan.process_scan(
            scanResultsDict, os.path.dirname(self.fnOfAmpData), MAX_FREQ, self.verbose, **self.current_algo_kwargs)
        for apaChannel, result in zip(apaChannels, results):
            if result == "bridged":
                if self.skipChannels:
                    self.skipChannels.append(apaChannel)
                else:
                    self.skipChannels = [apaChannel]

        # self.someTensionsNotFound = self.checkForMissingTensions(self.fnOfAmpData, fullResultsDict)
        # Compute number of bad channels
        numBadChannels = 0
        for segmentTensions in results:
            if not segmentTensions:
                continue
            for tension in segmentTensions:
                if tension == -1:
                    numBadChannels += 1
                    break

        # Color the results box of the scan on the config page
        self.scanConfigTableModel.item(self.scanConfigRowToScan, Scans.RESULT).setText(
            f"{numBadChannels} bad channel(s)")
        resultColor = qtg.QColor("green")  # green
        if numBadChannels >= 4:
            resultColor = qtg.QColor("red")
        elif numBadChannels >= 1:
            resultColor = qtg.QColor("yellow")
        self.scanConfigTableModel.item(
            self.scanConfigRowToScan, Scans.RESULT).setBackground(resultColor)

        # save scan analysis results to JSON file
        self.writeResultsDict(fullResultsDict)

        # Update the results table
        self.resultsWiresTableUpdate(scanResultsDict)

        # Update Missing Channels
        self.updateMissingChannels()

    def runResonanceAnalysis(self):
        # get A(f) data for each channel
        # run peakfinding -- assumes that peak finding parameters are already set
        # overlay f0 locations on A(f) plots
        # loop over each register

        # FIXME: this function should be farmed out to dwaTools, or somewhere else...
        #        need only pass the self.ampDataS and self.resFitParams dictionaries

        print("Running Resonance Analysis")
        self.resFreqRunFit()
        self.resFreqUpdateDisplay(chan=None)

    def resFreqRunFit(self):
        # Run proccess_channel on each channel and set the expectedFreqs and resonantFreqs variables
        for reg in self.registers:
            self.resonantFreqs[reg.value] = None
            if reg.value not in self.activeRegistersS:
                continue

            layer = self.ampDataS['layer']
            apa_channel = self.ampDataS['apaChannels'][reg]
            if not apa_channel:
                print(f"DWA Chan {reg.value}: No channel")
                continue

            freq_arr = np.array(self.ampDataS[reg]['freq'])
            ampl_arr = np.array(self.ampDataS[reg]['ampl'])
            max_freq = np.min([np.max(freq_arr), MAX_FREQ])
            segments, expected_resonances = channel_frequencies.get_expected_resonances(
                layer, apa_channel, max_freq)
            self.resonantFreqs[reg.value] = [[] for _ in segments]
            algo = process_scan.get_tension_algorithm(self._getAlgorithmVersion(), self.verbose)
            bsub = algo.cumsum_and_baseline_subtracted(freq_arr, ampl_arr)

            self.curves['resProcFit'][reg].setData(
                self.ampDataS[reg]['freq'], bsub)
            segments, opt_res_arr, _, _ = algo.process_channel(
                layer, apa_channel, freq_arr, ampl_arr, MAX_FREQ, **self.current_algo_kwargs)
            self.expectedFreqs[reg.value] = expected_resonances
            self.resonantFreqs[reg.value] = list(opt_res_arr)
    
    def _getAlgorithmVersion(self):
        return self.algoVersionComboBox.currentText()

    def _addResonanceExpectedLines(self):
        # Place expected fit lines at nominal tension frequencies
        for chan in self.activeRegistersS:
            for seg, ff in enumerate(self.expectedFreqs[chan]):
                tempLinesProc = []
                for _, f in enumerate(ff):
                    # If there is a defined tension, then the expected tensions are not draggable
                    if self.currentTensions[chan][seg] and self.currentTensions[chan][seg] > 0:
                        tempLinesProc.append(self.resonanceProcessedPlots[chan].addLine(
                            x=f, movable=False, pen=self.fPenColorTemp[seg]))
                    else:
                        tempLinesProc.append(self.resonanceProcessedPlots[chan].addLine(
                            x=f, movable=True, pen=self.fPenColorTemp[seg], hoverPen=self.fPenColor[seg]))
                    tempLinesProc[-1].sigPositionChangeFinished.connect(
                        self._expectedLineMoved)
                    tempLinesProc[-1].sigClicked.connect(
                        functools.partial(self.NominalLineClicked, chan, seg))

                self.resExpLines['proc'][chan].append(tempLinesProc)

    def resFreqUpdateDisplay(self, chan=None):
        """ 
        FIXME: if chan=None, update all channels, otherwise, 
        only update the indicated channels...
        """

        # Remove any existing InfiniteLines from A(f) plots and reset dict
        self._clearResonanceFitLines()
        # self._clearResonanceExpectedLines()
        self.setTensionSaveStatus(TensionSaveStatus.UNSAVED)
        self.currentTensions = {}

        for chan in self.activeRegistersS:
            # chan = reg.value
            # print(f'in update: {chan}: {self.resonantFreqs[chan]}')
            self.currentTensions[chan] = [None for _ in range(3)]
            if self.resonantFreqs[chan] is None:
                continue
            for seg, measured in enumerate(self.resonantFreqs[chan]):
                if len(measured) == 0:
                    self.currentTensions[chan][seg] = -1
                else:
                    minMeasured = np.min(measured)
                    minExpected = np.min(self.expectedFreqs[chan][seg])
                    self.currentTensions[chan][seg] = TENSION_SPEC * \
                        (minMeasured/minExpected)**2
            for seg in range(3):
                if self.currentTensions[chan][seg] == None:
                    getattr(self, f'le_resfreq_val_{chan}_{seg}').setEnabled(
                        False)
                    getattr(self, f'le_resfreq_val_{chan}_{seg}').setText('')
                else:
                    getattr(self, f'le_resfreq_val_{chan}_{seg}').setEnabled(
                        True)

                    if self.currentTensions[chan][seg] == -1:
                        getattr(
                            self, f'le_resfreq_val_{chan}_{seg}').setText("")
                    else:
                        apaChan = self.ampDataS['apaChannels'][chan]
                        apaLayer = self.ampDataS['layer']
                        segments, _ = channel_frequencies.get_expected_resonances(
                            apaLayer, apaChan, MAX_FREQ)
                        wireSeg = segments[seg]
                        tension = round(self.currentTensions[chan][seg], 2)
                        getattr(self, f'le_resfreq_val_{chan}_{seg}').setText(
                            str(tension))
                        if wireSeg != self.doubleClickedSegment:
                            if (np.abs(tension - TENSION_SPEC) > 2*TENSION_SPEC_TOL):
                                getattr(self, f'le_resfreq_val_{chan}_{seg}').setStyleSheet(
                                    "QLineEdit {background-color: rgb(255, 227, 180);}")
                            elif (np.abs(tension - TENSION_SPEC) > TENSION_SPEC_TOL):
                                getattr(self, f'le_resfreq_val_{chan}_{seg}').setStyleSheet(
                                    "QLineEdit {background-color: rgb(255, 255, 240);}")
                            else:
                                getattr(self, f'le_resfreq_val_{chan}_{seg}').setStyleSheet(
                                    "QLineEdit {background-color: white;}")

            # Create/display new InfiniteLine instance for each resonant freq
            for ii, ff in enumerate(self.resonantFreqs[chan]):

                segmentLinesRaw = []
                segmentLinesProc = []
                for seg, f in enumerate(ff):

                    segmentLinesProc.append(self.resonanceProcessedPlots[chan].addLine(
                        x=f, movable=True, pen=self.fPenColor[ii], hoverPen=pg.mkPen(color='#d6d600', width=4, style=qtc.Qt.SolidLine)))
                    segmentLinesProc[-1].sigClicked.connect(
                        self._f0LineClicked)
                    segmentLinesProc[-1].sigPositionChangeFinished.connect(
                        self._f0LineMoved)
                    segmentLinesRaw.append(self.resonanceRawPlots[chan].addLine(
                        x=f, movable=True, pen=self.fPenColor[ii], hoverPen=pg.mkPen(color='#d6d600', width=4, style=qtc.Qt.SolidLine)))
                    segmentLinesRaw[-1].sigClicked.connect(self._f0LineClicked)
                    segmentLinesRaw[-1].sigPositionChangeFinished.connect(
                        self._f0LineMoved)

                self.resFitLines['proc'][chan].append(segmentLinesProc)
                self.resFitLines['raw'][chan].append(segmentLinesRaw)

    def cleanUp(self):
        self.logger.info("App quitting:")
        self.logger.info("   closing UDP connection")
        self.sock.close()


if __name__ == "__main__":
    app = qtw.QApplication(sys.argv)

    app.setWindowIcon(qtg.QIcon('icons/app.png'))
    if SYSTEM_PLATFORM == 'WINDOWS':
        myappid = u'org.dune.dwa.v3'  # arbitrary string
        ctypes.windll.shell32.SetCurrentProcessExplicitAppUserModelID(myappid)

    pg.setConfigOptions(antialias=False)

    win = MainWindow()
    win.setWindowTitle(f"DWA: Digital Wire Analyzer")
    app.aboutToQuit.connect(win.cleanUp)
    app.exec_()
    # sys.exit(app.exec_())  # diff btw this and prev. line???
