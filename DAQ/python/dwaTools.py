# Collection of functions for python interface to DUNE Wire Analyzer (DWA)
# 
# Created by James Battat
# 2019 December 17

import sys
import os, errno
import socket
import time
import struct
import binascii
import json, configparser
import numpy as np


def findFreq(yy):
    return 100

def findAmplitude(yy):
    return 0.5*( yy.max()-yy.min() )

def splitFile(filename):
    ''' split a UDP file that has multiple frequencies
    into separate files, one per frequency'''
    with open(filename) as fh:
        lines = fh.readlines()
    lines = [line.strip() for line in lines]

    # FIX the "C" header bug
    lines = ["CCCC0005" if line == "CCCC0006" else line for line in lines]
    
    # find indices of lines that are 'DDDDDDDD' (and of ADC data)
    idxs = [ii+1 for ii, val in enumerate(lines) if val == 'DDDDDDDD']
    
    size = len(lines)
    freqs = [lines[i: j] for i, j in zip([0] + idxs, idxs+([size] if idxs[-1] != size else []))]

    print(len(freqs))
    
    for ii, freq in enumerate(freqs):
        ff = filename.replace('.txt', f'_{ii:04}.txt')
        print(ff)
        with open(ff, 'w') as fh:
            for line in freq:
                fh.write(line+'\n')

#def registerNames():
#    return ['18', '19', '1A', '1B', '1C', '1D', '1E', '1F']

# From 
# https://stackoverflow.com/questions/6727875/hex-string-to-signed-int-in-python-3-2
def twos_complement(hexstr, bits):
    """Convert a hexadecimal string to a signed integer.

    Args:
        hexstr (str): hexidecimal string to be converted
        bits (int): number of bits in hexstr (one char in hexstr is 4 bits)
    
    Returns:
        value (int): signed decimal value corresponding to hexstr

    Example:
        twos_complement('FFCA', 16) returns -54
        twos_complement('FFCA', 20) returns 126250 (equivalent to '0FFCA')

    Explanation of the algorithm via an example:
    * In binary, with 16 bits, decimal 1 is 'b0000 0000 0000 0001'
    * Bit-shift by 16-1 places to get 'b1000 0000 0000 0000'
    * Bit-wise AND with the input value to check if 
      most significant bit is on (which indicates a negative number).
    * If MSB is on, then we must subtract 2**16
    * e.g. hexstr='FFCA' is unsigned int value 65482 is b1111 1111 1100 1010
      The MSB is a one, so this should really represent a negative number
      We then subtract 2**16 = 65536 from 65482 to get the signed integer -54
    """
    base = 16
    value = int(hexstr, base)   # returns unsigned integer from zero to maxval
    #                           # where maxval is (2**base)-1
    if value & (1 << (bits-1)): # A MSB of one indicates dec value is negative
        value -= 1 << bits
    return value

def signedIntOfUnsignedInt(v, bits):
    """ convert an unsigned int to a signed int (2s complement) 
    """
    if v & (1 << (bits-1)):
        v -= 1 << bits
    return v

def unsignedIntOfSignedInt(v, bits):
    """ convert a signed int (2s complement) to an unsigned int
    """
    if v < 0:
        v += (1 << bits)
    return v

def unsignedIntOfHexString(hexstr):
    """ convert a hex string into an unsigned integer
    """
    base = 16
    return int(hexstr, base)

def hexStrOfAdcVal(v):
    """Create a hex string from an ADC value
    Converts a 16-bit signed integer (2s complement) to a hex string
    * first, bit shift right by one (16bit --> 15 bit)
    * then convert this 15bit number to a hex string
    Args:
        v (signed int): 16-bit ADC value (an integer from -32768 to 32767, inclusive)
    Returns:
        hexStr (str): string representation of the 15bit ADC value, in hex

    Example:
        >>> hexStrOfAdcVal(-2123)
        >>> '7BDA'
        >>> hexStrOfAdcVal(2123)
        >>> '0425'
    """
    v = unsignedIntOfSignedInt(v, 16)
    v = v >> 1
    return '{:04X}'.format(v)
    
def adcValOfHexStr(hs):
    # assumes:
    # * hex string represents the 15 MSb of the ADC value
    # * ADC value will be a signed integer
    # hs = "hex string" e.g. '7BDA'
    hexBase = 16
    v = int(hs, hexBase)
    v = v << 1
    v = signedIntOfUnsignedInt(v, 16)
    return v


def hexStrOfSignedInt(signedInt, strLen=4):
    """Convert a signed integer to a hex string using two's complement

    Args:
        signedInt (int): integer to be converted to hex string
        strLen (int): desired length of output hex string
    
    Returns:
        hexStr (str): hex string corresponding to signedInt

    Example:
        hexStrOfSignedInt(-54) returns 'FFCA'
        hexStrOfSignedInt(54) returns  '0036'
        hexStrOfSignedInt(-54, strLen=6) returns '00FFCA'

    Explanation of the algorithm via an example:
    * if the int is positive, just find the hex representation of that integer
    * if the int is negative, add 2**16 and then find the hex representation
    * FIXME: this *assumes* a 16-bit
    
    See twos_complement() to go the other direction
    """
    # FIXME: this *assumes* 16-bit values (a 4-character hex string)
    bits = 16
    if signedInt < 0:
        signedInt += (1 << bits)
    fmtStr = '{{:0{}x}}'.format(strLen)
    hexStr = fmtStr.format(signedInt).upper()
    return hexStr

def makeAdcDataLine(adc1=None, adc2=None, bitsToDrop=1):

    if adc1 is None:
        print("ERROR: must provide at least one ADC value")
        return "..ERROR."

    bits = 16
    
    if adc1 < 0:
        adc1 += (1 << bits)   # twos-complement
    adc1 = adc1 >> bitsToDrop # bit shift right

    if adc2 is None:
        adc2 = 0

    if adc2 < 0:
        adc2 += (1 << bits)
    adc2 = adc2 >> bitsToDrop

    # create and return the hex string
    return '{:04x}{:04x}'.format(adc1, adc2).upper()


def genDummyAdcData(nsamples, ncycles, phase=0):
    ''' make dummy adc data
    ADC samples are 15-bit (15MSb of the 16-bit ADC value)
    2 ADC samples per output line
    output lines are hex strings
    '''
    if nsamples % 2:  # ensure that nsamples is even
        nsamples += 1

    xx = np.linspace(0, 2*np.pi*ncycles, num=nsamples)
    pp = 2*np.pi*phase/8.0
    yy = 2**14 * np.sin(xx - pp)
    yy = yy.astype(np.int)

    #print(yy)
    # convert to hex strings
    yy = [hexStrOfAdcVal(y) for y in yy]

    # merge every pair
    yy = [a+b for a,b in zip(yy[0::2], yy[1::2])]
    return yy

def hexStrOfAdc15Bit(adc):
    """Make hex string from 15MSb of a 16-bit ADC value """
    # assumes that the adc value represents a signed integer
    bits = 16
    
    if adc < 0:
        adc += (1 << bits)   # twos-complement
    adc = adc >> 1 # drop the LSb
    return '{:04x}'.format(adc).upper()
    
def intOfAdcHexStr15Bit(hexStr):
    bits = 15
    signedInt = twos_complement(hexStr, bits)     # convert hexStr to an integer
    signedInt = signedInt << 1  # bit shift left by one bit
    return signedInt


def isHeaderLine(testStr):
    """Check if string is a header frame delimiter string (MSb=1) 

    testStr is a header if the MSb is 1
    we check this by converting the first character in the hex string
    to a 4-bit integer and check if the MSb of that integer is 1

    e.g. if first character is 0xA then that is 0b1010
    we then bit-shift 3 right to get 0b0001 which is "True"
    but if the first character were 0x7, then that is 0b0111
    we then bit-shift 3 right to get 0b0000 which is "False"

    e.g. 
    testStr = 'A13F' is a header line since 0xA = 0b1010 (MSb is 1)
    testStr =  '81B' is a header line since 0x8 = 0b1000 (MSb is 1)
    testStr = '7AF2' is not a header  since 0x7 = 0b0111 (MSb is 0)
    """
    hexChar = testStr[0]   # take first character of the string
    base = 16 # hexadecimal
    return int(hexChar, base) >> 3  # convert to an integer and bit-shift 3 right

def parseUdpDataFile(ff='mmTest1F.python.txt'):
    with open(ff, 'r') as fh:
        lines = fh.readlines()
    #fh.close()

    pdata = []  # voltage [for v(t)]  for a single run
    vdata = []  # voltage [for v(t)] a list of lists (one list per run)

    lastLine = ''
    for line in lines:

        if line.startswith('CAFE'):
            # Update the data set for plotting
            # fit sine-wave to data from last stimulation frequency
            if len(pdata) > 0:
                vdata.append(pdata[:])  # add last run to the list
                
            lastLine = line
            continue

        if lastLine.startswith('CAFE'):
            print("Parsing header")
            print("  {}".format(lastLine), end="")
            print("  {}".format(line), end="")
            headerDict = parseUdpHeader(lastLine, line, verbose=False)
            print(headerDict)
            lastLine = ''
            pdata.clear()  # ready for new data
            continue 
               
        pdata += parseUdpDataLine(line)
        lastLine = line

    # after all is said and done, append the final run 
    vdata.append(pdata[:])
    return vdata

def parseUdpDataLine(line, verbose=False):
    line = line.strip()
    data1 = line[0:4]
    data2 = line[4:]
    if verbose:
        print('data1, data2 = [{}], [{}]'.format(data1, data2))
    bits = 16  # bits per ADC sample  'FFCA' is 16 bits (4 bits per hexstring character)
    return [twos_complement(data1, bits), twos_complement(data2, bits)]

def parseUdpHeader(hdr1, hdr2, verbose=False):
    # this function is mis-named... it does NOT parse the UDP header
    # it parses the 2-line header of the data stream
    return parseDwaDataHeader(hdr1, hdr2, verbose=verbose)

def parseDwaDataHeader(hdr1, hdr2, verbose=False):
    """Parse the two-line data header in the DWA UDP stream

    Args:
        hdr1 (str): 8-character string from the DWA data stream
        hdr2 (str): same (second line of a 2-line header)
    
    Returns:
        headerDict (dict): parsed DWA data header

    Example:
    #   >>> parseUdpHeader('CAFE802F', '89738000')
    #   {'STIM_PERIOD_NS': 1949310, 'STIM_FREQ_HZ': 513.0020366180853, 'DT_us': 2.0}
    """

    # FIXME: add checks for fixed elements of the header
    # FIXME: e.g. hdr1 must start with 'CAFE'
    # FIXME: in fact the '8' after CAFE is also constant
    # FIXME: and the '8' that starts hdr2 is also constant

    # Get rid of leading/trailing whitespace
    hdr1 = hdr1.strip()
    hdr2 = hdr2.strip()
    if verbose:
        print("  hdr1 = [{}]".format(hdr1))
        print("  hdr2 = [{}]".format(hdr2))
    

    # Dictionary to hold the parsed header information
    headerDict = {}

    # Decode the simulus period
    #
    # From Nathan: This is a 24 bit number where the MS 12 bits are in
    # the second 16 bit header word and the LS 12 bits are in the
    # third 16 bit header word. the MS 4 bits of these header words
    # will be set to a constant 0x8 and the LS 12 bits represent the
    # stimulus frequency. I think the units of this number is 10ns
    # but will need to check the code to be sure
    stimFreq_ms12 = hdr1[5:]
    stimFreq_ls12 = hdr2[1:4]
    stimFreq_hexstr = stimFreq_ms12+stimFreq_ls12  # e.g. '05EFF1'
    if verbose:
        print("  stimFreq_ms12 = [{}]".format(stimFreq_ms12))
        print("  stimFreq_ls12 = [{}]".format(stimFreq_ls12))
        print("  stimFreq      = [{}]".format(stimFreq_hexstr))
    base16 = 16  # hexidecimal is base 16
    stimFreq_int = int(stimFreq_hexstr, base16)  # period in units of 10ns
    stimPeriod_ns = stimFreq_int * 10  # period in ns
    stimFreq_Hz = 1./(stimPeriod_ns*1e-9)  # freq in Hz
    headerDict['STIM_PERIOD_NS'] = stimPeriod_ns  # period in nanosec
    headerDict['STIM_FREQ_HZ'] = stimFreq_Hz      # freq in Hz 

    # Decode the ADC sampling period 
    #
    # From Nathan: This is a 15 bit number contained in the fourth 16
    # bit header word. The MS bit of this header word is a constant 1
    # and the LS 15 bits are the ADC sampling period. The sample
    # period tells you how many samples are skipped in order to keep
    # roughly the same number of cycles for each frequency. e.g. if
    # the number is 2, every third sample is kept.
    # 
    # This will tell you the sampling rate and allow you to scale the
    # sine fit. This is a 15 bit number and the 16th bit in the word
    # is always a '1' since it is part of the header.
    # 
    # The sampling period is fixed by the XADC and I think it is 2us
    # but will need to verify. This will soon change when we are
    # fully transitioned to the DWA 2 and have more control of the ADC
    # sampling.
    adcSampPer_str = hdr2[4:]
    # bit-wise AND with a mask
    mask = 0b0111111111111111  # 16-bit mask to kill the MSB
    nAdcSampSkip = int(adcSampPer_str, base16) & mask
    adcSampPer_us = 2.0
    if verbose:
        print("  adcSampPer_str   =  [{}]".format(adcSampPer_str))
        print("  adcSampPer (b)   =  [0b{:016b}]".format(int(adcSampPer_str, base16)))
        print("  nAdcSampSkip (b) =  [0b{:016b}]".format(nAdcSampSkip))
        print("  nAdcSampSkip (d) =  [{}]".format(nAdcSampSkip))

    # time interval between samples in the UDP stream
    headerDict['DT_us'] = adcSampPer_us*(nAdcSampSkip+1)  # time between samples in microseconds

    return headerDict

def force_symlink(file1, file2):
    try:
        os.symlink(file1, file2)
    except OSError as e:
        if e.errno == errno.EEXIST:
            os.remove(file2)
            os.symlink(file1, file2)

def dwaReset(verbose=0):
    #fromDaqReg.reset          <= slv_reg0(0)= '1';
    # presumably this is handled by dwaReset()?

    s = tcpOpen(verbose=verbose)
    dwaRegWrite(s, '00000000', '00000001', verbose=verbose)
    time.sleep(0.2)
    tcpClose(s)

def dwaGetConfigParameters(configFile):
    """Parse and return DWA configuration parameters from a file

    """
    # Can use lists in this configuration file with:
    # [Foo]
    # fibs: [1,1,2,3,5,8,13]
    # >>> json.loads(config.get("Foo","fibs"))
    # [1, 1, 2, 3, 5, 8, 13
    # see: https://stackoverflow.com/questions/335695/lists-in-configparser

    cp = configparser.ConfigParser(inline_comment_prefixes="#")
    cp.read(configFile)

    config = {}

    SECTION = "FPGA"
    config["auto"] = cp.get(SECTION, "auto")
    # 
    config["stimFreqReq"]  = cp.get(SECTION, "stimFreqReq")
    config["stimFreqMin"]  = cp.get(SECTION, "stimFreqMin")
    config["stimFreqMax"]  = cp.get(SECTION, "stimFreqMax")
    config["stimFreqStep"] = cp.get(SECTION, "stimFreqStep")
    config["stimTime"]     = cp.get(SECTION, "stimTime")
    config["stimMag"]      = cp.get(SECTION, "stimMag")
    # 
    config["cyclesPerFreq"] = cp.get(SECTION, "cyclesPerFreq")
    config["adcSamplesPerCycle"] = cp.get(SECTION, "adcSamplesPerCycle")
    # 
    config["relayMask"] = cp.get(SECTION, "relayMask")
    config["coilDrive"] = cp.get(SECTION, "coilDrive")
    #
    # Defunct
    # dwaCtrl  => (auto mainsMinus_enable m_axis_tready)
    #config["dwaCtrl"] = cp.get(SECTION, "dwaCtrl")
    #config["adcAutoDc_chSel"] = cp.get(SECTION, "adcAutoDc_chSel")
    #config["adcHScale"] = cp.get(SECTION, "adcHScale")
    #config["freqReq_vio"] = cp.get(SECTION, "freqReq_vio")
    #config["ctrl_adc_nSamples"] = cp.get(SECTION, "ctrl_adc_nSamples")
    #
    #config["client_IP"] = cp.get(SECTION, "client_IP", fallback=None)
    if cp.has_option(SECTION, "client_IP"):
        config["client_IP"] = cp.get(SECTION, "client_IP")
        if config["client_IP"] == '':
            config["client_IP"] = None
    else:
        config["client_IP"] = None
    
    return config

def dwaConfig(verbose=0, configFile='dwaConfig.ini'):
    """
    Args:
        config (dict): dictionary containing configuration parameters
    
    Returns:

    Example:
    """
    print("verbose = {}".format(verbose))

    config = dwaGetConfigParameters(configFile)

    s = tcpOpen(verbose=verbose)
    sleepSec = 0.2
    time.sleep(sleepSec)

    #fromDaqReg.auto           <= slv_reg1(0)= '1';
    # is this saying sweep vs. fixed freq?
    dwaRegWrite(s, '00000001', config["auto"], verbose=verbose)
    time.sleep(sleepSec)
    #
    #fromDaqReg.stimFreqReq  <= unsigned(slv_reg3(23 downto 0));
    dwaRegWrite(s, '00000003', config["stimFreqReq"], verbose=verbose)
    time.sleep(sleepSec)
    #fromDaqReg.stimFreqMin  <= unsigned(slv_reg4(23 downto 0));
    dwaRegWrite(s, '00000004', config["stimFreqMin"], verbose=verbose)
    time.sleep(sleepSec)
    #fromDaqReg.stimFreqMax  <= unsigned(slv_reg5(23 downto 0));
    dwaRegWrite(s, '00000005', config["stimFreqMax"], verbose=verbose)
    time.sleep(sleepSec)
    #fromDaqReg.stimFreqStep <= unsigned(slv_reg6(23 downto 0));
    dwaRegWrite(s, '00000006', config["stimFreqStep"], verbose=verbose)
    time.sleep(sleepSec)
    #fromDaqReg.stimRampTime   <= unsigned(slv_reg7(23 downto 0));
    dwaRegWrite(s, '00000007', config["stimTime"], verbose=verbose)
    time.sleep(sleepSec)
    #fromDaqReg.stimMag        <= unsigned(slv_reg8(23 downto 0));
    dwaRegWrite(s, '00000008', config["stimMag"], verbose=verbose)
    time.sleep(sleepSec)
    # 
    #fromDaqReg.nAdcStimPeriod <= unsigned(slv_reg10(23 downto 0));
    dwaRegWrite(s, '0000000A', config["cyclesPerFreq"], verbose=verbose)
    time.sleep(sleepSec)
    #fromDaqReg.nAdcStimPeriodSamp <= unsigned(slv_reg11(23 downto 0));
    dwaRegWrite(s, '0000000B', config["adcSamplesPerCycle"], verbose=verbose)
    time.sleep(sleepSec)
    #
    #fromDaqReg.relayMask      <= slv_reg13;
    dwaRegWrite(s, '0000000D', config["relayMask"], verbose=verbose)
    time.sleep(sleepSec)
    #fromDaqReg.coilDrive      <= slv_reg14;
    dwaRegWrite(s, '0000000E', config["coilDrive"], verbose=verbose)
    time.sleep(sleepSec)

    
    ###############
    #time.sleep(sleepSec)
    #dwaRegWrite(s, '00000002',dwaCtrl, verbose=verbose)
    #time.sleep(sleepSec)
    #dwaRegWrite(s, '00000008',ctrl_adc_nSamples, verbose=verbose)
    #time.sleep(sleepSec)
    #dwaRegWrite(s, '0000000A',adcAutoDc_chSel, verbose=verbose)
    #time.sleep(sleepSec)
    #dwaRegWrite(s, '0000000B',adcHScale, verbose=verbose)
    #time.sleep(sleepSec)
    #dwaRegWrite(s, '0000000E',relays_enable, verbose=verbose)
    #time.sleep(sleepSec)

    # If there is an IP address in the config file, then set it
    if config["client_IP"]:
        print("Setting UDP address")
        #fromDaqReg.clientIp      <= slv_reg12;
        dwaSetUdpAddress(s, config["client_IP"], verbose=verbose)
        time.sleep(sleepSec)

    time.sleep(sleepSec)
    tcpClose(s, verbose=verbose)

def dwaStart(verbose=0):

    sleepSec = 0.2

    #fromDaqReg.ctrlStart      <= slv_reg0(1)= '1';
    # presumably this is handled by dwaStart()

    s = tcpOpen(verbose=verbose)
    # start
    dwaRegWrite(s,'00000000','00000002', verbose=verbose)
    time.sleep(sleepSec)

    tcpClose(s, verbose=verbose)

def dwaStat(verbose=0):

    sleepSec = 0.2

    s = tcpOpen(verbose=verbose)

    # acStim_nPeriod
    dwaRegRead(s, '0000000F')
    time.sleep(sleepSec)
    # acStimX200_nPeriod
    dwaRegRead(s, '00000010')
    time.sleep(sleepSec)
    # ctrl busy
    dwaRegRead(s, '00000011')
    time.sleep(sleepSec)
    # constant
    dwaRegRead(s, '00000012')
    time.sleep(sleepSec)
    # fifoAutoDC_ff fifoAutoDC_ef
    dwaRegRead(s, '0000001B')
    time.sleep(sleepSec)

    tcpClose(s)


def tcpClose(ss, verbose=0):
    # https://docs.python.org/3/library/socket.html#socket.socket.shutdown
    # how = socket.SHUT_RD or socket.SHUT_WR or socket.SHUT_RDWR
    # ss.shutdown(how)  
    ss.close()

def tcpOpen(verbose=1):
    # FIXME: move HOST to a config file
    # IP Address of microzed board
    #HOST = '149.130.136.243'     # Wellesley Lab (MAC: 84:2b:2b:97:da:01)
    #HOST = '140.247.132.37' # NW Lab
    #HOST = '140.247.123.186'     # J156Lab
    HOST = '149.130.136.211' # Wellesley DWA (MAC 0x84, 0x2b, 0x2b, 0x97, 0xda, 0x03)
    PORT = 7
    try:
        # FIXME: should we ue socket.SOCK_DGRAM instead of SOCK_STREAM?
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    except socket.error:
        print("Failed to create socket")
        sys.exit()
    else:
        if (verbose>0): print("Socket created")

    try:
        s.connect( (HOST,PORT) )
    except socket.gaierror:
        print("Hostname could not be resolved. Exiting")
        sys.exit()
    else:
        print("Socket connected to %s" % HOST)
    
    return s


def dwaRegWriteTest(address, value, verbose=0):
    s = tcpOpen()
    dwaRegWrite(s, address, value, verbose=verbose)
    tcpClose(s)

def dwaRegReadTest(address, verbose=0):
    s = tcpOpen()
    dwaRegRead(s, address, verbose=verbose)
    tcpClose(s)


def ipAddressToHexStr(ipStr):
    """ Convert an IP address in string form to a 32-bit hex str 

    Args:
        ipStr (str): string representation of IP address e.g. '149.130.136.84'
    
    Returns:
        hexStr (str): string representation of IP in 32-bit hex

    Example:
        >>> ipAddressToHexStr('149.130.136.8')
        >>> '95828854'
    """
    ipStr = ipStr.strip()
    toks = ipStr.split('.')
    if len(toks) != 4:
        print("EXPECTED AN IP ADDRESS OF THE FORM: XXX.XXX.XXX.XXX")
        return("00000000")
    fmtStr = '{{:0{}x}}'.format(2)
    hexStr = ''
    for tok in toks:
        hexStr += fmtStr.format(int(tok)).upper()
    return hexStr

def hexStrToIpAddressStr(hexStr):
    """convert hex string representation of IP to IP string
    Example:
        >>> hexStrToIpAddressStr('6C3134FC')
        >>> '149.130.136.8'
    """
    hexStr = hexStr.strip()
    toks = [hexStr[ii:ii+2] for ii in range(0,len(hexStr),2)]
    if len(toks) != 4:
        print("EXPECTED A HEX STRING WITH 8 CHARACTERS: XXXXXXXX")
        return("000.000.000.000")
    hexBase = 16
    ipVals = [int(tok,hexBase) for tok in toks]
    ipStr = '{}.{}.{}.{}'.format(*ipVals)
    return ipStr
    
def dwaSetUdpAddress(ss, address, verbose=0):
    # IP address where the UDP data will be sent (e.g. IP address of the DAQ computer)

    # "address" can either be an IP string like 149.130.136.84
    # or it can be a 32-bit hex representation of that string like '95828854'

    if address.find('.') > -1:
        address = ipAddressToHexStr(address)

    dwaRegComm(ss, payload_header='abcd1234', payload_type='FE170003',
               address=address, verbose=0)

def dwaRegComm(ss, payload_header='abcd1234', payload_type=None, 
               address=None, value=None, verbose=0):

    if payload_type == None:
        print("dwaRegComm: ERROR -- must specify payload_type")
        sys.exit()
    if address == None:
        print("dwaRegComm: ERROR -- must specify address")
        sys.exit()
    
    if value == None:
        # This is a reg read or a UDP IP address set
        # https://docs.python.org/2/library/struct.html#byte-order-size-and-alignment
        # '!' means network byte order (big-endian)
        # '>' means big-endian
        packerString = "!L L L"
        values = ( int(payload_header,16), int(payload_type, 16), int(address, 16) )
    else:
        # This a reg write, with a "value" entry
        packerString = "!L L L L"
        values = ( int(payload_header,16), int(payload_type, 16), int(address, 16), int(value, 16) )

    try :
        packer = struct.Struct(packerString)
        packed_data = packer.pack(*values)
        print('PAYLOAD_HEADER = {0:s}'.format(payload_header))
        print('PAYLOAD_TYPE = {0:s}'.format(payload_type))
        print('ADDRESS = {0:s}'.format(address))
        print('values = {}'.format(values))
        #
        print('Sending...')
        ss.sendall(packed_data)
        time.sleep(0.25)
        #FIXME: don't actually know if msg is sent successfully...
        print('Message sent successfully')
    except socket.error:
        #Send failed
        print('Send failed')
        sys.exit()
    
    #get reply and print
    if payload_type != 'FE170003':
        print(dwaRecvTimeout(ss, timeout=2, verbose=verbose))
    

def dwaRegRead(ss, address, verbose=0):
    dwaRegComm(ss, payload_header='abcd1234', payload_type='FE170001',
               address=address, verbose=0)


def dwaRegRead2(ss, address, verbose=0):
    try :
        # Send binary data via socket
        # FIXME: put these somewhere more global?
        PAYLOAD_HEADER = 'abcd1234'
        PAYLOAD_TYPE = 'FE170001'

        # For reading register
        values = ( int(PAYLOAD_HEADER,16), int(PAYLOAD_TYPE, 16), int(address, 16) )

        # https://docs.python.org/2/library/struct.html#byte-order-size-and-alignment
        # '!' means network byte order (big-endian)
        # '>' means big-endian
        packer = struct.Struct('!L L L')
        packed_data = packer.pack(*values)
        print('PAYLOAD_HEADER = {0:s}'.format(PAYLOAD_HEADER))
        print('PAYLOAD_TYPE = {0:s}'.format(PAYLOAD_TYPE))
        print('ADDRESS = {0:s}'.format(address))
        print('values = {}'.format(values))
        #
        print('Sending...')
        ss.sendall(packed_data)
        time.sleep(0.25)
        #FIXME: don't actually know if msg is sent successfully...
        print('Message sent successfully')
    except socket.error:
        #Send failed
        print('Send failed')
        sys.exit()
    
    #get reply and print
    print(dwaRecvTimeout(ss, timeout=2, verbose=verbose))



def dwaRecvTimeout(ss,timeout=2, verbose=0):
    # FIXME: there is not actually a timeout!!!!

    # make socket non blocking
    # https://docs.python.org/2/library/socket.html#socket.socket.setblocking
    # FIXME: should this be non-blocking???
    ss.setblocking(0)

    # receive/unpack
    unpacker = struct.Struct('!L L L')
    data = ss.recv(unpacker.size)
    # Data arrives in 4-byte chunks
    # First 4-Byte chunk is F1000000
    # Second 4-Byte chunk specifies which register address was read e.g. '00000000'
    # Third 4-Byte chunk contains the data at that address (e.g. 'A1000000')
    #
    # This assumes that we will only get three 4-byte chunks...
    header_bin = data[0:4]   # first  4 bytes
    address_bin = data[4:8]  # second 4 bytes
    data_bin = data[8:]      # third  4 bytes

    # FIXME: add verbose check
    print('type(data) = {}'.format(type(data)))
    print('binascii.hexlify(header_bin) = {}'.format(binascii.hexlify(header_bin)))
    print('binascii.hexlify(address_bin) = {}'.format(binascii.hexlify(address_bin)))
    print('binascii.hexlify(data_bin) = {}'.format(binascii.hexlify(data_bin)))
    print('received: {}'.format(binascii.hexlify(data)))
    unpacked_data = unpacker.unpack(data)
    print('unpacked:')
    print(unpacked_data)

    return(unpacked_data)


def dwaRegWrite(s, address, value, verbose=0):
    # s         socket (assumed open already)
    # address   Register address to write to 8 element hex string (e.g. '00000000')
    # value     Value to write to that address. 8 element hex string (e.g. 'A1000000')

    # Specific values for DWA FPGA
    # FIXME: put these somewhere more global?
    PAYLOAD_HEADER = 'abcd1234'
    PAYLOAD_TYPE = 'FE170002'      # For writing register

    #Send some data to remote server
    # Send binary data via socket
    try:
        values = ( int(PAYLOAD_HEADER,16), int(PAYLOAD_TYPE, 16), int(address, 16), int(value, 16) )

        # '!' means network byte order (big-endian)
        # '>' means big-endian
        # https://docs.python.org/2/library/struct.html#byte-order-size-and-alignment
        packer = struct.Struct('!L L L L')

        msg = packer.pack(*values)
        if (verbose > 0):
            print('PAYLOAD_HEADER = {0:s}'.format(PAYLOAD_HEADER))
            print('PAYLOAD_TYPE = {0:s}'.format(PAYLOAD_TYPE))
            print('ADDRESS = {0:s}'.format(address))
            print('VALUE = {0:s}'.format(value))
            print('values = {}'.format(values))
        
        if (verbose > 0): print('Sending...')
        s.sendall(msg)
        time.sleep(0.2)
        if (verbose > 0): print('Message sent successfully')
    except socket.error:
        #Send failed
        print('Send failed')
        sys.exit()

    print("FIXME: SHOULD WE READ AFTER WRITE?")

    #get reply and print
    #print recv_timeout(s)


#def addressValid(address):
#    # FIXME: check that 'address' is, indeed valid.
#    # must be a 4-byte hex string
#    return 1

def resonanceModel(freqs, a, b, c, f0, gamma):
    # see model in Jackson's Final Presentation
    # returns amplitude vs. frequency for a wire resonance
    # assumes that freqs is a numpy array (1D)
    ampls = a
    ampls += b*freqs 
    ampls += c*(f0**2 - freqs**2) / ( (f0**2-freqs**2)**2 + (2*gamma*freqs)**2 )
    return ampls
    

def adcSkipHexStringOfDt(dt, adc_dt=2.0e-6):
    """Calculate the hex string representation of the number of ADC samples to skip

    Args:
        dt (float): desired sample rate (seconds)
        adc_dt (float): ADC sampling period (seconds)

    Returns:
        skipHexStr (str): hex string representation of number of samples to skip

    Note: This is a 15 bit number contained in the fourth 16 bit
     header word.  The MS bit of this header word is a constant 1 and
     the LS 15 bits are the ADC sampling period.  The sample period
     tells you how many samples are skipped in order to keep roughly
     the same number of cycles for each frequency.  e.g. if the number
     is 2, every third sample is kept.  This will tell you the
     sampling rate and allow you to scale the sine fit. This is a 15
     bit number and the 16th bit in the word is always a '1' since it
     is part of the header.

    Example:
        adcSkipHexStringOfDt(2.0e-6, adc_dt=2.0e-6) returns '8000'
        adcSkipHexStringOfDt(4.0e-6, adc_dt=2.0e-6) returns '8001'
        adcSkipHexStringOfDt(0.5e-3, adc_dt=2.0e-6) returns '80F9'
    """
    nskip = int(dt/adc_dt)-1
    mask = 0b1000000000000000   # msb is 1, rest of the 15 bits are zero
    skipHexStr = '{:04x}'.format(nskip | mask).upper()
    return skipHexStr


def hexStringOfFreq(freq):
    """Calculate the hex string representation of the nearest valid period for a given frequency

    Args:
        freq (float): frequency, in Hz
    
    Returns:
        period_hexstr (str): hex string of period associated with the input frequency, rounded to 10ns

    Example:
        hexStringOfFreq(257.0) returns '05EFF1'  since 0x05EFF1 is 389105 (decimal), which is a period of 3.89105e-3 seconds
    """
    period_hexstr = '{:06x}'.format(int(1e8*1.0/freq)).upper()
    return period_hexstr

def hexStringOfPeriod(period_10ns):
    """Calculate the hex string representation of the nearest valid period for a given frequency

    Args:
        period_10ns (int): period, in units of 10ns
    
    Returns:
        period_hexstr (str): hex string of period associated with the input period

    Example:
        hexStringOfPeriod(389105) returns '05EFF1'  since 0x05EFF1 is 389105 (decimal)
    """
    period_hexstr = '{:06x}'.format(period_10ns).upper()
    return period_hexstr


def stimPeriodOfFreq(freq):
    """Calculate the nearest valid period for a given frequency

    Args:
        freq (float): frequency, in Hz
    
    Returns:
        period_10ns (int): period associated with the input frequency, rounded to 10ns

    Example:
        stimPeriodOfFreq(257.0) returns 389105
    """
    period_10ns = int(1e8*1.0/freq)
    return period_10ns
    

def freqOfPeriod(period_10ns):
    """Calculate the frequency of a given period

    Args:
        period_10ns (int): period, in units of 10ns
    
    Returns:
        freq (float): associated frequency, in Hz

    Example:
        freqOfPeriod(389105) returns 257.00003855  (Hz)
    """
    return 1./(period_10ns*1e-8)


def configStimTimeOfTime(dtSec):
    # provide a human readable stimulation time and
    # get back the corresponding hex string

    strLen = 8
    fmtStr = '{{:0{}x}}'.format(strLen)

    dt10ns = int(dtSec*1e8)
    hexStr = fmtStr.format(dt10ns).upper()
    return hexStr
