from itertools import chain
import dwaTools as dwa  #FIXME: make these internal methods???
from enum import IntEnum

# for debugging only
#import matplotlib.pyplot as plt
#import numpy as np

hexBase = 16

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


class DwaDataParser():

    def __init__(self):
        self._makeFrameKeys()
        self._initVars()  # FIXME: rename...
        print(Frame)
        
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
        self.frameKeys[Frame.RUN]["20"] = "DWA_Ctrl"       # ??bit
        self.frameKeys[Frame.RUN]["21"] = "fixedPeriod"    # 24bit
        self.frameKeys[Frame.RUN]["22"] = "stimPeriodMin"  # 24bit
        self.frameKeys[Frame.RUN]["23"] = "stimPeriodMax"  # 24bit
        self.frameKeys[Frame.RUN]["24"] = "stimPeriodStep" # ??bit
        self.frameKeys[Frame.RUN]["26"] = "nCyclesPerFreq" # ??bit
        self.frameKeys[Frame.RUN]["27"] = "adcSamplesPerCycle" # ??bit
        self.frameKeys[Frame.RUN]["28"] = "stimMag"        # 12bit
        self.frameKeys[Frame.RUN]["2A"] = "clientIP_16MSb" # 16bit
        self.frameKeys[Frame.RUN]["2B"] = "clientIP_16LSb" # 16bit
        #
        # Frequency Frame entries
        self.frameKeys[Frame.FREQ]["11"] = "Register_ID_Freq"  #  8bit
        self.frameKeys[Frame.FREQ]["40"] = "freqCounter"       # 16bit
        self.frameKeys[Frame.FREQ]["41"] = "adcSamplesPerFreq" # 16bit
        self.frameKeys[Frame.FREQ]["42"] = "stimPeriod"        # 24bit
        self.frameKeys[Frame.FREQ]["43"] = "samplingPeriod"    # 24bit
        #
        # ADC Data Frame entries
        # N/A
        #

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
            "UDP_Counter": self._parseInfoLineAsInt,
            "Register_ID": self._parseInfoLineAsInt,
            "DWA_Ctrl": self._parseInfoLineAsInt,
            "fixedPeriod": self._parseInfoLineAsInt,
            "stimPeriodMin": self._parseInfoLineAsInt,
            "stimPeriodMax": self._parseInfoLineAsInt,
            "stimPeriodStep": self._parseInfoLineAsInt,
            "nCyclesPerFreq": self._parseInfoLineAsInt,
            "adcSamplesPerCycle": self._parseInfoLineAsInt,
            "stimMag": self._parseInfoLineAsInt,
            "clientIP_16MSb":self._parseRunLineClientIP, 
            "clientIP_16LSb":self._parseRunLineClientIP, 
            #
            # Frequency Frame keys
            "Register_ID_Freq": self._parseInfoLineAsInt,
            "freqCounter": self._parseInfoLineAsInt,
            "adcSamplesPerFreq": self._parseInfoLineAsInt,
            "stimPeriod": self._parseInfoLineAsInt,
            "samplingPeriod": self._parseInfoLineAsInt,
            #"UNHANDLED_LINES": self._parseUnknownInfoLine  # do this if a key is not recognized...
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
            #Frame.FREQ: self._postProcessFreqFrame,
            Frame.ADC_DATA: self._postProcessAdcDataFrame,
            Frame.RUN: self._postProcessRunFrame,
            #Frame.STATUS: self._postProcessStatusFrame,
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

    def _parseUnknownInfoLine(self, infoLine):
        # Fallback parser (for an unidentified key)
        return infoLine

    def _parseRunLineClientIP(self, infoLine):
        return infoLine[-4:]  # last 4 characters, as string

    def _getKey(self, infoLine, frameType):
        key = infoLine[0:2]    # this key may be re-used in a different frame type, can't assume it's unique...
        print("key = [{}]".format(key))
        try:
            uniqueKey = self.frameKeys[frameType][key]
        except KeyError:
            print("KEY ERROR RAISED")
            print("  key [{}] is not defined in frameType [0x{:X} = Frame.{}]".format(key, frameType, Frame(frameType).name))
            uniqueKey = '{}.{}'.format( Frame(frameType).name, key )
            print("  returning uniqueKey={}".format(uniqueKey))
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
        print("frameDict = {}".format(frameDict))

        for line in infoLines:
            #print("line = {}".format(line))
            key, uniqueKey = self._getKey(line, frameType)
            parserFxn = self._infoLineParserSelector.get(uniqueKey, self._parseUnknownInfoLine)
            val = parserFxn(line)
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

    def _parseAdcDataFrame(self, infoLines):
        # ADC Frame differs from other frames
        # in that the entries are not key/val pairs
        # Instead, each information line is a pair of ADC
        # values. Each entry in the pair is the 15 MSb of
        # a 16bit sample.
        frameDict = {}
        frameDict['adcSamples'] = list(chain.from_iterable( (line[:4], line[-4:]) for line in infoLines))
        #print("frameDict = {}".format(frameDict))
        return frameDict
    
    def _parseStatusFrame(self, infoLines):
        pass

    ##################################################
    # Post-processing routines
    # FIXME: convert all "coded" information into human-usable info
    #        e.g. frequencies in Hz, periods in ms,
    #             hash dates into YYYYMMDDTHHMMSS
    def _postProcessRunFrame(self, dd):
        # Construct IP address in the form 'xxx.yyy.zzz.www'
        hexStr = dd['clientIP_16MSb'] + dd['clientIP_16LSb']
        dd['clientIP'] = dwa.hexStrToIpAddressStr(hexStr)
        return dd

    def _postProcessUdpFrame(self, dd):
        dd['Register_ID_hexStr'] = '{:02X}'.format(dd['Register_ID'])
        return dd

    #def _postProcessFreqFrame(self, dd):
    #    return dd
    #

    def _postProcessAdcDataFrame(self, dd):
        # Convert the ADC samples from a hex string
        # to an integer
        # The ADC samples are the 15MSb of a 16-bit value
        # So the hex string must be converted to an integer
        # and then bit-shifted up by 1
        
        key = 'adcSamples'
        dd[key] = [ dwa.adcValOfHexStr(hexStr) for hexStr in dd[key] ]
        #dd[key] = [int(hexStr, hexBase) << 1
        #           for hexStr in dd[key]]

        #dd['register'] = Registers

        
        return dd

    #def _postProcessStatusFrame(self, dd):
    #    return dd


    def parse(self,  udpPayload):

        inHeader = False
        delimIdxs = []  # line numbers of frame delimiters
        for ii, line in enumerate(udpPayload):
            if dwa.isHeaderLine(line):
                delimIdxs.append(ii)
        print("Header lines = ")
        print(delimIdxs)
        nFrames = len(delimIdxs)//2
        print("Number of header frames: {}".format(nFrames))

        self.dwaPayload = {}   # will be a dict of dict. Each entry is a parsed frame

        # Now handle each header frame
        for ii in range(nFrames):
            frameStartIdx = delimIdxs[ii*2]
            frameStartLine = udpPayload[frameStartIdx]
            print("")
            print("frameStartLine = {}".format(frameStartLine))
        
            # get frame type
            frameType = int(udpPayload[frameStartIdx][0], hexBase)
            print("frameType = 0d{} = 0x{:X}".format(frameType, frameType))
        
            # Number of Frame Information lines
            nFrameInfo = int(frameStartLine[4:], hexBase)
            print("nFrameInfo = {}".format(nFrameInfo))
            frameEndIdx = frameStartIdx + nFrameInfo + 1
            
            # FIXME: add an "assert" here if delimiters don't match
            print("frameEndLine = {}".format(udpPayload[frameEndIdx]))
            
            frameParser = self._frameParserSelector[frameType]
            frameDict = frameParser(udpPayload[frameStartIdx+1:frameEndIdx])
        
            print("frameDict = ")
            print(frameDict)
        
            framePostProcFxn = self._framePostProcSelector.get(frameType, None)
            if framePostProcFxn:
                frameDict = framePostProcFxn(frameDict)
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

        print("Ignored lines in the UDP payload = ")
        print(self._ignoredInfoLines)
        self.dwaPayload['ignoredLines'] = self._ignoredInfoLines
        
        # FIXME: Post-process the frame information
        # (e.g. handle header information that is split across
        # multiple lines, like IP addresses.  Also, convert
        # to human-usable values: again, like the IP address
        # which is in hex form)

