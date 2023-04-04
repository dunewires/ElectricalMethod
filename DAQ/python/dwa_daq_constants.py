import os
import platform
from PyQt5 import QtGui as qtg

DWA_CONFIG_FILE = "dwaConfigWC.ini"
DAQ_CONFIG_FILE = 'dwaConfigDAQ.ini'
DAQ_UI_FILE = 'dwaDaqUI.ui'
OUTPUT_DIR_ROOT = '.'
OUTPUT_DIR_SCAN_DATA = os.path.join(OUTPUT_DIR_ROOT, 'scanData', 'raw')
OUTPUT_DIR_PROCESSED_DATA = os.path.join(
    OUTPUT_DIR_ROOT, 'scanData', 'processed')
OUTPUT_DIR_ARCHIVED_DATA = os.path.join(OUTPUT_DIR_ROOT, 'scanData', 'archive')
OUTPUT_DIR_SCAN_DATA_ADVANCED = os.path.join(OUTPUT_DIR_ROOT, 'scanDataAdv')
OUTPUT_DIR_SCAN_STATUS = os.path.join(OUTPUT_DIR_ROOT, 'scanStatus')
SCAN_FREQUENCY_STEP_DEFAULT = 1/8  # Hz
STIM_VIEW_OFFSET = 0
MAX_FREQ = 350  # Hz
UDP_RECV_BUF_SIZE = 1024*2**20  # Bytes (2**20 Bytes is ~1MB)
SYSTEM_PLATFORM = platform.system().upper()
if SYSTEM_PLATFORM == 'DARWIN':
    UDP_RECV_BUF_SIZE = 7*2**20  # Bytes (2**20 Bytes is ~1MB)
N_DWA_CHANS = 8
PUSH_BUTTON_LIST = [1, 2]  # PB0 is deprecated

# DEBUGGING FLAGS
AUTO_CHANGE_TAB = False  # False for debugging
GUI_Y_OFFSET = 0  # FIXME: remove this!

# FIXME: these should go in DwaDataParser.py
SCAN_START = 1
SCAN_END = 0

APA_STAGES_KEYS = ["Dev", "Winding", "PostWinding", "Installation", "Storage"]
APA_STAGES = {}
for stage in APA_STAGES_KEYS:
    stage_short = stage
    scans = [stage]
    if stage == "Dev":
        scans = ["DWA Development"]
    if stage == "Installation":
        scans = ['Installation (Top)', 'Installation (Bottom)']
    APA_STAGES[stage] = {
        'short': stage_short,  # used for referencing UI elements
        # used for labeling scans (and for loading Results table)
        'scan': scans,
        'tension': scans     # used for tension table
    }
APA_STAGES_SHORT = []
APA_STAGES_SCANS = []
APA_STAGES_TENSIONS = []
for key in APA_STAGES_KEYS:
    APA_STAGES_SHORT.append(APA_STAGES[key]['short'])
    for val in APA_STAGES[key]['scan']:
        APA_STAGES_SCANS.append(val)
    for val in APA_STAGES[key]['tension']:
        APA_STAGES_TENSIONS.append(val)

APA_LAYERS = ["G", "U", "V", "X"]
APA_SIDES = ["A", "B"]
MAX_WIRE_SEGMENT = {
    "U": 1151,
    "V": 1151,
    "X": 480,
    "G": 481
}

# FIXME: these should be read from somewhere else (DwaConfigFile)...
DATABASE_FIELDS = ['wireSegments', 'apaChannels', 'measuredBy',
                   'stage', 'apaUuid', 'layer', 'headboardNum', 'side', 'type']

# Recent scan list
SCAN_LIST_DATA_KEYS = ['submitted', 'scanName', 'side', 'layer',
                       'headboardNum', 'measuredBy', 'apaUuid', 'stage']  # 'wireSegments'

TENSION_SPEC = 6.5  # Newtons
TENSION_SPEC_TOL = 1.0
TENSION_SPEC_MIN = TENSION_SPEC-TENSION_SPEC_TOL
TENSION_SPEC_MAX = TENSION_SPEC+TENSION_SPEC_TOL
TENSION_LOW_COLOR = qtg.QColor(219, 120, 120)
TENSION_HIGH_COLOR = qtg.QColor(219, 120, 120)
TENSION_NOT_APPLICABLE_COLOR = qtg.QColor(128, 128, 128)
TENSION_NOT_FOUND_COLOR = qtg.QColor(219, 219, 40)
TENSION_GOOD_COLOR = qtg.QColor(178, 251, 165)

PLOT_UPDATE_TIME_SEC = 0.5

CONTINUITY_SCAN_PARAMS_DEFAULT = {
    'stimFreqMin': 100.0,  # Hz
    'stimFreqMax': 1000.0,  # Hz
    'stimFreqStep': 50.0,  # Hz
    'stimTime': 0.16777216,  # s
    'stimMag': 512       # mV
    #    'stimMag':200 # Hex
}

SCAN_CONFIG_TABLE_HDRS = ['Result', 'Type', 'Layer', 'Status',
                          'Wires', 'Freq Min (Hz)', 'Freq Max (Hz)', 'Step Size (Hz)']
