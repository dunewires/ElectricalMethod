from itertools import chain
import dwaTools as dwa  #FIXME: make these internal methods???
from enum import IntEnum

# for debugging only
#import matplotlib.pyplot as plt
#import numpy as np

hexBase = 16
VERBOSE = 0

class Frame(IntEnum):
    UDP = 0xA
    FREQ = 0xC
    ADC_DATA = 0xD
    RUN = 0xF
    STATUS = 0xE 

class Registers(IntEnum):
    D0 = 0x0     # Data register 0
    D1 = 0x1     # Data register 1
    D2 = 0x2     # ...
    D3 = 0x3     # 
    D4 = 0x4     # 
    D5 = 0x5     # 
    D6 = 0x6     # 
    D7 = 0x7     # Data register 7
    RUN = 0xFF
    STATUS = 0xFE

class ControllerState(IntEnum):
    IDLE = 0
    NOISE_PREP = 1
    NOISE_READ = 2
    STIM_EN = 3
    STIM_PREP = 4
    STIM_RUN = 5
    STIM_READ = 6
    FREQ_END = 7
    END_WAIT = 8

    # From Nathan Felt 2021 June 2
    # 0  idle Waiting for the start of a test
    # 1  noisePrep Prepare to sample noise for mains noise subtraction
    # 2  noiseReadout Sample noise for mains noise subtraction
    # 3  stimEnable Enable stimulus frequency and wait for initial 
    #    stimulus time
    # 4  stimPrep Wait for stimulus frequency to update and check that 
    #    the ADC data buffer is empty
    # 5  stimRun Wait for the specified stimulus time
    # 6  stimReadout Get the stimulated sense wire ADC samples
    # 7  freqScanFinish At the end of the frequency sweep, 
    #    wait for the last UDP data to be sent
    # 8  pktBuildFinish_s Wait for the end of run header to be sent 
    #    before we go to the idle state and wait for another scan

N_PUSH_BUTTONS = 4  # there are 4 push buttons whose status is reported
    
class DwaDataParser():

    def __init__(self):
        self._makeFrameKeys()
        self._initVars()  # FIXME: rename...
        if VERBOSE > 0:
            print(Frame)
        
    #########################
    # Start STATIC methods
    @staticmethod
    def getAllLines(fname):
        f = open(fname, "r")
        # read all data into a list (without newlines)
        # https://stackoverflow.com/questions/12330522/how-to-read-a-file-without-newlines
        data = f.read().splitlines()
        f.close()
        return data

    @staticmethod
    def findUdpPacketStartLines(lines):
        # Find where the UDP packet boundaries are in the file (lines starting with 'AAAA0')
        udpDelimIdxs = []
        for ii, line in enumerate(lines):
            if line.startswith('AAAA0'):
                udpDelimIdxs.append(ii)

        return udpDelimIdxs

    @staticmethod
    def loadUdpPackets(lines, idxs):
        # idxs is the list of UDP packet start indexes returned by findUdpPacketStartLines
        # lines are the lines of a rawData_XX.txt file
        
        # Make a list of lists. Outer level list is one entry per UDP packet
        # inner level of list is one entry per line of that UDP packet
        mylist = [ lines[idxs[ii]:idxs[ii+1]]
                   for ii in range(len(idxs)-1) ]
        mylist.append(lines[idxs[-1]:])
        #for ii in range(len(idxs)-1):
        #    udpData[chan] = [ lines[idxs[ii]:idxs[ii+1]]
        #                      for ii in range(len(idxs)-1) ]
        #    udpData[chan].append(lines[udpDelimIdxs[-1]:])
        return mylist

    
    # End STATIC methods
    #########################

    def _makeFrameKeys(self):
        # create a dict of keys (dict of dict)
        self.frameKeys = {}
        for frameType in Frame:
            self.frameKeys[frameType] = {}
        # FIXME: this initialization should live
        # in an external configuration file
        # WARNING: each value in the dict must be UNIQUE
        #
        # UDP Frame Entries
        self.frameKeys[Frame.UDP]["10"] = "UDP_Counter"    # 16bit
        self.frameKeys[Frame.UDP]["11"] = "Register_ID"    #  8bit
        #
        # Run Frame Entries
        self.frameKeys[Frame.RUN]["77"] = "runStatus"    # 24bit
        self.frameKeys[Frame.RUN]["00"] = "runOdometer"    # ??bit
        self.frameKeys[Frame.RUN]["01"] = "fpgaSerialNumber" # ??bit
        self.frameKeys[Frame.RUN]["02"] = "firmwareIdDate_24MSb" # 24-bit
        self.frameKeys[Frame.RUN]["03"] = "firmwareIdDate_24LSb" # 24-bit
        self.frameKeys[Frame.RUN]["04"] = "firmwareIdHash_16MSb" # 24-bit
        self.frameKeys[Frame.RUN]["05"] = "firmwareIdHash_16LSb" # 24-bit
        #self.frameKeys[Frame.RUN]["20"] = "DWA_Ctrl"       # ??bit
        self.frameKeys[Frame.RUN]["21"] = "stimFreqReq"   # 24bit
        self.frameKeys[Frame.RUN]["22"] = "stimFreqMin"   # 24bit
        self.frameKeys[Frame.RUN]["23"] = "stimFreqMax"   # 24bit
        self.frameKeys[Frame.RUN]["24"] = "stimFreqStep"  # ??bit
        self.frameKeys[Frame.RUN]["26"] = "cyclesPerFreq" # ??bit
        self.frameKeys[Frame.RUN]["27"] = "adcSamplesPerCycle" # ??bit
        self.frameKeys[Frame.RUN]["28"] = "stimMag"        # 12bit
        self.frameKeys[Frame.RUN]["2A"] = "clientIP_16MSb" # 16bit
        self.frameKeys[Frame.RUN]["2B"] = "clientIP_16LSb" # 16bit
        self.frameKeys[Frame.RUN]["2C"] = "stimTime" # ??bit
        self.frameKeys[Frame.RUN]["2D"] = "activeChannels" # ??bit
        #self.frameKeys[Frame.RUN]["2E"] = "relayMask_16MSb" # ??bit
        #self.frameKeys[Frame.RUN]["2F"] = "relayMask_16LSb" # ??bit
        # Digipot settings
        self.frameKeys[Frame.RUN]["30"] = "digipotGainAdc01" # ??bit
        self.frameKeys[Frame.RUN]["31"] = "digipotGainAdc23" # ??bit
        self.frameKeys[Frame.RUN]["32"] = "digipotGainAdc45" # ??bit
        self.frameKeys[Frame.RUN]["33"] = "digipotGainAdc67" # ??bit
        # Mains noise subtraction
        self.frameKeys[Frame.RUN]["34"] = "noiseFreqMin" # 24bit
        self.frameKeys[Frame.RUN]["35"] = "noiseFreqMax" # 24bit
        self.frameKeys[Frame.RUN]["36"] = "noiseFreqStep" # 24bit
        self.frameKeys[Frame.RUN]["37"] = "noiseSamplingPeriod" # 
        self.frameKeys[Frame.RUN]["38"] = "noiseAdcSamplesPerFreq" # 
        self.frameKeys[Frame.RUN]["39"] = "noiseSettlingTime" # 
        # v3 relays
        self.frameKeys[Frame.RUN]["40"] = "relayBusTop0"  # 16bits
        self.frameKeys[Frame.RUN]["41"] = "relayBusTop1"  # 16bits
        self.frameKeys[Frame.RUN]["42"] = "relayBusBot0"  # 16bits
        self.frameKeys[Frame.RUN]["43"] = "relayBusBot1"  # 16bits
        self.frameKeys[Frame.RUN]["44"] = "relayWireTop0"  # 16bits
        self.frameKeys[Frame.RUN]["45"] = "relayWireTop1"  # 16bits
        self.frameKeys[Frame.RUN]["46"] = "relayWireTop2"  # 16bits
        self.frameKeys[Frame.RUN]["47"] = "relayWireTop3"  # 16bits
        self.frameKeys[Frame.RUN]["48"] = "relayWireBot0"  # 16bits
        self.frameKeys[Frame.RUN]["49"] = "relayWireBot1"  # 16bits
        self.frameKeys[Frame.RUN]["4A"] = "relayWireBot2"  # 16bits
        self.frameKeys[Frame.RUN]["4B"] = "relayWireBot3"  # 16bits
        #
        # Frequency Frame entries
        self.frameKeys[Frame.FREQ]["11"] = "Register_ID_Freq"  #  8bit
        self.frameKeys[Frame.FREQ]["40"] = "stimPeriodCounter" # 24bit 
        self.frameKeys[Frame.FREQ]["41"] = "adcSamplesPerFreq" # 24bit
        self.frameKeys[Frame.FREQ]["42"] = "stimPeriodActiveOld"  # 24bit (currently-used stimulus period)
        self.frameKeys[Frame.FREQ]["43"] = "adcSamplingPeriod" # 24bit
        self.frameKeys[Frame.FREQ]["52"] = "stimPeriodActive_MSb"  # 16bit (16MSb of currently-used stimulus period)
        self.frameKeys[Frame.FREQ]["53"] = "stimPeriodActive_LSb"  # 16bit (16LSb of currently-used stimulus period)
        #
        # ADC Data Frame entries
        # N/A
        #
        self.frameKeys[Frame.STATUS]["61"] = "statusTrigger"   # what triggered the STATUS frame transmission (1=timeout, 0=state machine change)
        self.frameKeys[Frame.STATUS]["62"] = "controllerState"
        self.frameKeys[Frame.STATUS]["63"] = "statusErrorBits"
        self.frameKeys[Frame.STATUS]["64"] = "buttonStatus"
        self.frameKeys[Frame.STATUS]["65"] = "hvDisable"
        
        ##################################
        # TO ADD (Frame.RUN)
        #2C000000  # ctrl_stimTime (24-bits, units=??) (coarser than 10ns)
        #2D000000  # activeChannels (channel mask for the active channels (8-bit) 
        #2E000000  # relayMask_16MSb (which relays are active). Valid for v2 only
        #2F000000  # relayMask_16LSb (which relays are active). Valid for v2 only
        
    def _initVars(self):
        self.dwaPayload = {}

        self._ignoredInfoLines = {}
        #for frameType in Frame:
        #    ignoredInfoLines[frameType] = []

        self._initFrameDictSelector = {
            Frame.UDP: self._initUdpFrameDict,
            Frame.RUN: self._initRunFrameDict,
            Frame.FREQ: self._initFreqFrameDict,
            Frame.ADC_DATA: self._initAdcDataFrameDict, # this should never get called
            Frame.STATUS: self._initStatusFrameDict,
        }

        self._infoLineParserSelector = {
            # keys are the Unique keys in self.frameKeys
            # UDP frame
            "UDP_Counter": self._parseInfoLineAsInt,
            "Register_ID": self._parseInfoLineAsInt,
            # RUN frame
            "runStatus": self._parseInfoLineAsInt,
            "runOdometer": self._parseInfoLineAsInt,
            "fpgaSerialNumber": self._parseInfoLineAsInt,
            "firmwareIdDate_24MSb": self._parseInfoLineAsInt,
            "firmwareIdDate_24LSb": self._parseInfoLineAsInt,
            "firmwareIdHash_16MSb": self._parseInfoLineAsInt,
            "firmwareIdHash_16LSb": self._parseInfoLineAsInt,
            "stimFreqReq": self._parseStimFreqLine,
            "stimFreqMin": self._parseStimFreqLine,
            "stimFreqMax": self._parseStimFreqLine,
            "stimFreqStep": self._parseStimFreqLine,
            "cyclesPerFreq": self._parseInfoLineAsInt,
            "adcSamplesPerCycle": self._parseInfoLineAsInt,
            "stimMag": self._parseInfoLineAsInt,
            "clientIP_16MSb": self._parseRunLineClientIP, 
            "clientIP_16LSb": self._parseRunLineClientIP, 
            "stimTime": self._parseInfoLineAsInt,
            # Digipot settings
            "digipotGainAdc01": self._parseDigipotGain,
            "digipotGainAdc23": self._parseDigipotGain,
            "digipotGainAdc45": self._parseDigipotGain,
            "digipotGainAdc67": self._parseDigipotGain,
            # Mains noise subtraction
            "noiseFreqMin": self._parseInfoLineAsInt,
            "noiseFreqMax": self._parseInfoLineAsInt,
            "noiseFreqStep": self._parseInfoLineAsInt,
            "noiseSamplingPeriod": self._parseInfoLineAsInt,
            "noiseAdcSamplesPerFreq": self._parseInfoLineAsInt,
            "noiseSettlingTime": self._parseInfoLineAsInt,
            # v3 relays
            "relayBusTop0": self._parseRelayLine,
            "relayBusTop1": self._parseRelayLine,
            "relayBusBot0": self._parseRelayLine,
            "relayBusBot1": self._parseRelayLine,
            "relayWireTop0": self._parseRelayLine,
            "relayWireTop1": self._parseRelayLine,
            "relayWireTop2": self._parseRelayLine,
            "relayWireTop3": self._parseRelayLine,
            "relayWireBot0": self._parseRelayLine,
            "relayWireBot1": self._parseRelayLine,
            "relayWireBot2": self._parseRelayLine,
            "relayWireBot3": self._parseRelayLine,
            #
            # Frequency Frame keys
            "Register_ID_Freq": self._parseInfoLineAsInt,
            "stimPeriodCounter":self._parseInfoLineAsInt,
            "adcSamplesPerFreq": self._parseInfoLineAsInt,
            "stimPeriodActiveOld": self._parseInfoLineAsInt,
            "adcSamplingPeriod":self._parseInfoLineAsInt,
            "stimPeriodActive_MSb": self._parseInfoLineAsInt,
            "stimPeriodActive_LSb": self._parseInfoLineAsInt,
            # Defunct (FIXME: remove?)
            "DWA_Ctrl": self._parseInfoLineAsInt,
            #"relayMask_16MSb"
            #"relayMask_16LSb"
            #
            # FIXME: need to add
            #"activeChannels"
            # 
            #"UNHANDLED_LINES": self._parseUnknownInfoLine  # do this if a key is not recognized...
            #
            # STATUS frame keys
            "statusTrigger":self._parseInfoLineAsInt,
            "controllerState":self._parseInfoLineAsInt,
            "statusErrorBits":self._parseInfoLineAsBits,
            "buttonStatus":self._parseInfoLineAsBits,
            "hvDisable":self._parseInfoLineAsInt,
        }

        self._frameParserSelector = {
            Frame.UDP: self._parseUdpFrame,
            Frame.RUN: self._parseRunFrame,
            Frame.FREQ: self._parseFreqFrame,
            Frame.ADC_DATA: self._parseAdcDataFrame,
            Frame.STATUS: self._parseStatusFrame,
        }

        self._framePostProcSelector = {
            Frame.UDP: self._postProcessUdpFrame,
            Frame.FREQ: self._postProcessFreqFrame,
            Frame.ADC_DATA: self._postProcessAdcDataFrame,
            Frame.RUN: self._postProcessRunFrame,
            Frame.STATUS: self._postProcessStatusFrame,
        }
        
    def _initGenericDict(self, frameType):
        tmpDict = {}
        for val in self.frameKeys[frameType].values():
            tmpDict[val] = None
        return tmpDict

    def _initUdpFrameDict(self):
        return self._initGenericDict(Frame.UDP)

    def _initRunFrameDict(self):
        return self._initGenericDict(Frame.RUN)

    def _initFreqFrameDict(self):
        return self._initGenericDict(Frame.FREQ)

    def _initAdcDataFrameDict(self):
        print("WARNING:  DIRE... SHOULD NEVER GET HERE")
        dd = {}
        return dd

    def _initStatusFrameDict(self):
        return self._initGenericDict(Frame.STATUS)

    #
    # Generic Parsers
    def _parseInfoLineAsInt(self, infoLine):
        # each character in the info line is a hex char
        # which is 4-bits (a nibble)
        # Assume that everything after the key is an integer
        # e.g. KKIIIIII  (8 hex chars, KK=Key, IIIIII=hex string)
        nBits = 24
        nChars = nBits // 4
        return int(infoLine[-nChars:], hexBase)

    #def parseInfoLineAsInt(infoLine, nBits):
    #    # verify that nBits is a multiple of 4
    #    # since each character in the info line is a hex char
    #    # which is 4-bits (a nibble)
    #    if (nBits % 4) != 0:
    #        print("ERROR ERROR ERROR ERROR: invalid number of bits")
    #        return None
    #    nChars = nBits // 4
    #    return int(infoLine[-nChars:], hexBase)

    def _parseInfoLineAsBits(self, infoLine):
        val = int(infoLine[2:],hexBase)
        errorBitString = f'{val:0>24b}'
        return errorBitString

    def _parseStimFreqLine(self, infoLine):
        # The 16 MSb give the integer portion of the freq in Hz.
        # The 8 LSb give the fractional portion of the freq in 1/256 Hz. 
        # e.g.  0x000460 corresponds to 4.375 Hz (0x0004 --> 4Hz and 0x60 --> 0.375Hz)
        hexBase = 16
        freqHz = int(infoLine[2:6], hexBase) + int(infoLine[6:], hexBase)/256.
        #print(f'\n\n Parsing stimFreqLine: hexkey, freqHz = {infoLine}, {infoLine[2:6]}, {infoLine[6:]}, {freqHz}')
        return freqHz
        
    def _parseUnknownInfoLine(self, infoLine):
        # Fallback parser (for an unidentified key)
        return infoLine

    def _parseRunLineClientIP(self, infoLine):
        return infoLine[-4:]  # last 4 characters, as string

    def _parseDigipotGain(self, infoLine):
        print("FIXME: digipot gain info not correctly parsed yet")
        return -1

    def _parseRelayLine(self, infoLine):
        print("FIXME: v3 relay info lines not correctly parsed yet")
        return -1
    
    def _getKey(self, infoLine, frameType):
        key = infoLine[0:2]    # this key may be re-used in a different frame type, can't assume it's unique...
        if VERBOSE > 0:
            print("key = [{}]".format(key))
        try:
            uniqueKey = self.frameKeys[frameType][key]
        except KeyError:
            print("KEY ERROR RAISED")
            print("  key [{}] is not defined in frameType [0x{:X} = Frame.{}]".format(key, frameType, Frame(frameType).name))
            uniqueKey = '{}.{}'.format( Frame(frameType).name, key )
            print("  returning uniqueKey={}".format(uniqueKey))
        if VERBOSE > 0:
            print("uniqueKey = [{}]".format(uniqueKey))
        return key, uniqueKey

    def _parseGenericFrame(self, infoLines, frameType):
        """Parse a frame that contains only key/val info lines
        For now, this is all frames except ADC Data frames
        """

        # FIXME: add check that the number of
        # information lines in the frame matches the
        # specified number in the frame delimiter line

        frameDict = self._initFrameDictSelector[frameType]()
        if VERBOSE > 0:
            print("frameDict = {}".format(frameDict))

        for line in infoLines:
            if VERBOSE > 0:
                print("line, frameType = {}, {}".format(line, frameType))
            key, uniqueKey = self._getKey(line, frameType)
            if VERBOSE > 0:
                print("key, uniqueKey = {}, {}".format(key, uniqueKey))
            parserFxn = self._infoLineParserSelector.get(uniqueKey, self._parseUnknownInfoLine)
            val = parserFxn(line)
            if VERBOSE > 0:
                print('parserFxn = {}', parserFxn)
            if val is not line: # for unknown key, val==line
                frameDict[uniqueKey] = val
            else:
                self._ignoredInfoLines[uniqueKey] = val

        return frameDict

    def _parseUdpFrame(self, infoLines):
        return self._parseGenericFrame(infoLines, Frame.UDP)
    
    def _parseRunFrame(self, infoLines):
        return self._parseGenericFrame(infoLines, Frame.RUN)
    
    def _parseFreqFrame(self, infoLines):
        return self._parseGenericFrame(infoLines, Frame.FREQ)

    def _parseStatusFrame(self, infoLines):
        #print("\n\n\n STATUS FRAME FOUND!!!!!!")
        return self._parseGenericFrame(infoLines, Frame.STATUS)

    def _parseAdcDataFrame(self, infoLines):
        # ADC Frame differs from other frames
        # in that the entries are not key/val pairs
        # Instead, each information line is a pair of ADC
        # values. Each entry in the pair is the 15 MSb of
        # a 16bit sample.
        frameDict = {}
        frameDict['adcSamples_raw'] = list(chain.from_iterable( (line[:4], line[-4:]) for line in infoLines))
        #print("frameDict = {}".format(frameDict))
        return frameDict

    ##################################################
    # Post-processing routines
    # FIXME: convert all "coded" information into human-usable info
    #        e.g. frequencies in Hz, periods in ms,
    #             hash dates into YYYYMMDDTHHMMSS
    def _postProcessRunFrame(self, dd):
        # Construct IP address in the form 'xxx.yyy.zzz.www'
        hexStr = dd['clientIP_16MSb'] + dd['clientIP_16LSb']
        dd['clientIP'] = dwa.hexStrToIpAddressStr(hexStr)

        # Convert frequencies to Hz
        dd['stimFreqMin_Hz'] = dd['stimFreqMin']
        dd['stimFreqMax_Hz'] = dd['stimFreqMax']
        dd['stimFreqStep_Hz'] = dd['stimFreqStep']
        return dd
                                                                                 
    def _postProcessUdpFrame(self, dd):
        dd['Register_ID_hexStr'] = '{:02X}'.format(dd['Register_ID'])
        return dd

    def _postProcessFreqFrame(self, dd):
        dd['adcSamplingPeriod_sec'] = dd['adcSamplingPeriod']*1e-8

        if 'stimPeriodActive_MSb' in dd:    # Now we use a 78.125ps clock            
            #print("found new stimFreq")
            #print(f"dd['stimPeriodActive_MSb'] = {dd['stimPeriodActive_MSb']}")
            #print(f"dd['stimPeriodActive_LSb'] = {dd['stimPeriodActive_LSb']}")
            # make the period
            # compute the frequency in Hz
            dd['stimPeriodActive'] = (dd['stimPeriodActive_MSb'] << 16) + dd['stimPeriodActive_LSb']
            #dd['stimFreqActive_Hz'] = (1e9/dd['stimPeriodActive'])/2.5 # convert period in 2.5ns to freq in Hz
            dd['stimFreqActive_Hz'] = (1e12/dd['stimPeriodActive'])/78.125 # convert period in 78.125ps to freq in Hz
            #print(f"dd['stimFreqActive_Hz'] = {dd['stimFreqActive_Hz']}")
        else:  # but originally, we used a 10ns clock
            dd['stimFreqActive_Hz'] = 1e8/dd['stimPeriodActiveOld'] # convert period in 10ns to freq in Hz
            
        return dd

    def _postProcessAdcDataFrame(self, dd):
        # Convert the ADC samples from a hex string
        # to an integer
        # The ADC samples are the 15MSb of a 16-bit value
        # So the hex string must be converted to an integer
        # and then bit-shifted up by 1
        
        key = 'adcSamples_raw'
        dd['adcSamples'] = [ dwa.adcValOfHexStr(hexStr) for hexStr in dd[key] ]
        #dd[key] = [int(hexStr, hexBase) << 1
        #           for hexStr in dd[key]]

        #dd['register'] = Registers
        return dd

    def _postProcessStatusFrame(self, dd):
        try:
            #print(dd['controllerState'])
            #print(ControllerState(int(dd['controllerState'])))
            stateStr = str(ControllerState(int(dd['controllerState'])))
            toks = stateStr.split('.')[-1]
            #print(f"toks = {toks}")
            stateStr = stateStr.split('.')[-1]
            dd['controllerStateStr'] = stateStr
        except:
            print(f"error: unrecognized controller state: {dd['controllerState']}")
            dd['controllerStateStr'] = 'UNKNOWN'
        #
        dd['buttonStatusList'] = [ dd['buttonStatus'][-(n+1)] for n in range(N_PUSH_BUTTONS) ]

        # Determine why this status frame was sent
        #   1: timeout
        #   2: state change
        #   4: button change
        #   8: error
        #   So a value of 1010b = 10(decimal) would mean that both an error and state change triggered the push
        
        dd['trgTimeout']      = bool(dd['statusTrigger'] & 0b0001)
        dd['trgStateChange']  = bool(dd['statusTrigger'] & 0b0010)
        dd['trgButtonChange'] = bool(dd['statusTrigger'] & 0b0100)
        dd['trgErrorChange']  = bool(dd['statusTrigger'] & 0b1000)

        return dd


    def parse(self,  udpPayload):
        # FIXME: ensure that lines in udpPayload have no whitespace....

        # if udpPayload is a filename, then read the file into a
        # list of strings
        # if udpPayload is already a list of strings, then just parse it
        if isinstance(udpPayload, str):
            with open(udpPayload) as fh:
                lines = fh.readlines()
            udpPayload = [tok.strip() for tok in lines]
        
        inHeader = False
        delimIdxs = []  # line numbers of frame delimiters
        for ii, line in enumerate(udpPayload):
            if VERBOSE > 0:
                print(line)
            if line.startswith("8"):
                ### FIXME: KLUGE KLUGE!!!!
                print("DwaDataParser.parse(): MAJOR KLUGE NEEDS TO BE REMOVED!")
                print("                       no info line should start with an 8")
                print(line)
                continue
            if dwa.isHeaderLine(line):
                delimIdxs.append(ii)
        if VERBOSE > 0:
            print("Header lines = ")
            print(delimIdxs)
        nFrames = len(delimIdxs)//2
        if VERBOSE > 0:
            print("Number of header frames: {}".format(nFrames))

        self.dwaPayload = {}   # will be a dict of dict. Each entry is a parsed frame

        # Now handle each header frame
        for ii in range(nFrames):
            frameStartIdx = delimIdxs[ii*2]
            frameStartLine = udpPayload[frameStartIdx]
            if VERBOSE > 0:
                print("")
                print("frameStartLine = {}".format(frameStartLine))
        
            # get frame type
            frameType = int(udpPayload[frameStartIdx][0], hexBase)
            if VERBOSE > 0:
                print("frameType = 0d{} = 0x{:X}".format(frameType, frameType))

            # FIXME: kluge b/c we don't specify the number of ADC data lines yet...
            if frameStartLine.startswith('DDDD'):
                frameEndIdx = udpPayload.index('DDDDDDDD', frameStartIdx)
            else:
                # Number of Frame Information lines
                nFrameInfo = int(frameStartLine[4:], hexBase)
                if VERBOSE > 0:
                    print("nFrameInfo = {}".format(nFrameInfo))
                frameEndIdx = frameStartIdx + nFrameInfo + 1
            
            # FIXME: add an "assert" here if delimiters don't match
            if VERBOSE > 0:
                print("frameEndLine = {}".format(udpPayload[frameEndIdx]))
                print("frame = ")
                print(udpPayload[frameStartIdx:frameEndIdx+1])
            frameParser = self._frameParserSelector[frameType]
            # For debugging only
            #if frameStartLine.startswith('DDDD'):
            #    print(f'frameStartIdx = {frameStartIdx}')
            #    print(f'frameEndIdx   = {frameEndIdx}')
            #    print(udpPayload[frameStartIdx+1:frameEndIdx])
                
            frameDict = frameParser(udpPayload[frameStartIdx+1:frameEndIdx])
        
            if VERBOSE > 0:
                print("frameDict = ")
                print(frameDict)
        
            framePostProcFxn = self._framePostProcSelector.get(frameType, None)
            if framePostProcFxn:
                frameDict = framePostProcFxn(frameDict)
            if VERBOSE > 0:
                print("frameDict (postProcessed) = ")
                print(frameDict)
        
            #if frameType == Frame.ADC_DATA:
            #    print("not sure what to do for ADC data yet...")
            #    print("making dummy data...")
            #    ncycles = 4
            #    nsamples = 256
            #    xx = np.linspace(0, 2*np.pi*ncycles, num=nsamples)
            #    yy = 2**14 * np.sin(xx)
            #    #plt.plot(yy, 'r-')
            #    #plt.plot(frameDict['adcSamples'], 'k.')
            #    #plt.savefig('junk.pdf')

            self.dwaPayload[frameType] = frameDict

        if VERBOSE > 0:
            print("Ignored lines in the UDP payload = ")
            print(self._ignoredInfoLines)
        self.dwaPayload['ignoredLines'] = self._ignoredInfoLines
        
        # FIXME: Post-process the frame information
        # (e.g. handle header information that is split across
        # multiple lines, like IP addresses.  Also, convert
        # to human-usable values: again, like the IP address
        # which is in hex form)

    def getFreqData(self, filename):
        """ return all frequencies (in Hz) in this dataset

        This is a post-processing utility function,
        not used during realtime data collection
        """
        with open(filename) as fh:
            lines = fh.readlines()
            lines = [line.strip() for line in lines]

        dout = {}  # output dictionary
            
        delimIdxs = []
        for ii, line in enumerate(lines):
            if dwa.isHeaderLine(line) and line.startswith('CCCC'):
                delimIdxs.append(ii)
        delimIdxs = delimIdxs[::2]   # every other entry is a 'CCCCCCCC' line, ignore those
        #print("Header lines = ")
        #print(delimIdxs)
        #for idx in delimIdxs:
        #    print(lines[idx])
        # Number of Frame Information lines
        for startIdx in delimIdxs:
            nFrameInfo = int(lines[startIdx][4:], hexBase)
            #print("nFrameInfo = {}".format(nFrameInfo))
            endIdx = startIdx + nFrameInfo + 1
            #print(f'startIdx = {startIdx}')
            #print(f'endIdx   = {endIdx}')
            #print(lines[startIdx+1:endIdx])
                
            freqDict = self._parseFreqFrame(lines[startIdx+1:endIdx])
            freqDict = self._postProcessFreqFrame(freqDict)

            keys = freqDict.keys()
            if len(dout) == 0:  # first pass through... init the dict
                for key in keys:
                    dout[key] = []

            for key in keys:
                dout[key].append(freqDict[key])
                    
        return dout

            
    def getAdcData(self, filename):
        """ return a list of lists of ADC data from a file

        the file is in the format as saved by the python DAQ
        This is a post-processing utility function,
        not used during realtime data collection
        """
        with open(filename) as fh:
            lines = fh.readlines()
            lines = [line.strip() for line in lines]

        # list to hold ADC data (will be a list of lists)
        adcData = []

        # look at each ADC data section (delimiters are DDDD5151 and DDDD)
        # extract/convert the ADC data hex strings
        
        # find the ADC delimiters
        ADC_DATA_DELIMITER = 'DDDD5151'
        ids = [ii for ii, xx in enumerate(lines) if xx==ADC_DATA_DELIMITER]
        #print(ids)
        #print(len(ids))

        # Loop over each section and extract/parse/convert the ADC data strings
        for startIdx in ids:
            endIdx = lines.index('DDDDDDDD', startIdx)

            #print(f'startIdx = {startIdx}')
            #print(f'endIdx   = {endIdx}')
            #print(lines[startIdx+1:endIdx])
                
            dd = self._parseAdcDataFrame(lines[startIdx+1:endIdx])
            dd = self._postProcessAdcDataFrame(dd)
            #print(dd)
            adcData.append(dd['adcSamples'])

        return adcData
        

    
