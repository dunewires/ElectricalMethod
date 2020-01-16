# Collection of functions for python interface to DUNE Wire Analyzer (DWA)
# 
# Created by James Battat
# 2019 December 17

import sys
import socket
import time
import struct
import binascii
import json, configparser

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

def parseUdpDataLine(line, verbose=False):
    line = line.strip()
    data1 = line[0:4]
    data2 = line[4:]
    if verbose:
        print('data1, data2 = [{}], [{}]'.format(data1, data2))
    bits = 16  # bits per ADC sample  'FFCA' is 16 bits (4 bits per hexstring character)
    return [twos_complement(data1, bits), twos_complement(data2, bits)]

def parseUdpHeader(hdr1, hdr2, verbose=False):
    """Parse the two-line header in the DWA UDP stream

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
        print("  nAdcSampSkip (b) =  [0b{:016b}]".format(nAdcSampSkip))
        print("  nAdcSampSkip (d) =  [{}]".format(nAdcSampSkip))

    # time interval between samples in the UDP stream
    headerDict['DT_us'] = adcSampPer_us*(nAdcSampSkip+1)  # time between samples in microseconds

    return headerDict



def dwaReset(verbose=0):
    s = tcpOpen(verbose=verbose)
    dwaRegWrite(s, '00000001', '00000000', verbose=verbose)
    time.sleep(0.2)
    dwaRegWrite(s, '00000001', '00000001', verbose=verbose)
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

    cp = configparser.ConfigParser()
    cp.read(configFile)

    config = {}

    SECTION = "FPGA"
    # FIXME: move these to a config file
    config["freqReq_vio"] = cp.get(SECTION, "freqReq_vio")
    # dwaCtrl  => (auto mainsMinus_enable m_axis_tready)
    config["dwaCtrl"] = cp.get(SECTION, "dwaCtrl")
    config["ctrl_freqMin"] = cp.get(SECTION, "ctrl_freqMin")
    config["ctrl_freqMax"] = cp.get(SECTION, "ctrl_freqMax")
    config["ctrl_freqStep"] = cp.get(SECTION, "ctrl_freqStep")
    config["ctrl_stimTime"] = cp.get(SECTION, "ctrl_stimTime")
    config["ctrl_adc_nSamples"] = cp.get(SECTION, "ctrl_adc_nSamples")
    config["adcAutoDc_chSel"] = cp.get(SECTION, "adcAutoDc_chSel")
    config["adcHScale"] = cp.get(SECTION, "adcHScale")

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

    # FIXME: move these to a config file
    freqReq_vio = config["freqReq_vio"]
    # dwaCtrl  => (auto mainsMinus_enable m_axis_tready)
    dwaCtrl = config["dwaCtrl"]
    ctrl_freqMin = config["ctrl_freqMin"]
    ctrl_freqMax = config["ctrl_freqMax"]
    ctrl_freqStep = config["ctrl_freqStep"]
    ctrl_stimTime = config["ctrl_stimTime"]
    ctrl_adc_nSamples = config["ctrl_adc_nSamples"]
    adcAutoDc_chSel = config["adcAutoDc_chSel"]
    adcHScale = config["adcHScale"]


    s = tcpOpen(verbose=verbose)

    sleepSec = 0.2

    time.sleep(sleepSec)
    dwaRegWrite(s, '00000000',freqReq_vio, verbose=verbose)
    time.sleep(sleepSec)
    dwaRegWrite(s, '00000002',dwaCtrl, verbose=verbose)
    time.sleep(sleepSec)
    dwaRegWrite(s, '00000004',ctrl_freqMin, verbose=verbose)
    time.sleep(sleepSec)
    dwaRegWrite(s, '00000005',ctrl_freqMax, verbose=verbose)
    time.sleep(sleepSec)
    dwaRegWrite(s, '00000006',ctrl_freqStep, verbose=verbose)
    time.sleep(sleepSec)
    dwaRegWrite(s, '00000007',ctrl_stimTime, verbose=verbose)
    time.sleep(sleepSec)
    dwaRegWrite(s, '00000008',ctrl_adc_nSamples, verbose=verbose)
    time.sleep(sleepSec)
    dwaRegWrite(s, '0000000A',adcAutoDc_chSel, verbose=verbose)
    time.sleep(sleepSec)
    dwaRegWrite(s, '0000000B',adcHScale, verbose=verbose)
    time.sleep(sleepSec)

    tcpClose(s, verbose=verbose)

def dwaStart(verbose=0):

    sleepSec = 0.2

    s = tcpOpen(verbose=verbose)
    # start
    dwaRegWrite(s,'00000009','00000001', verbose=verbose)
    time.sleep(sleepSec)
    dwaRegWrite(s,'00000009','00000000', verbose=verbose)
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
    HOST = '149.130.136.243'
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

def dwaRegRead(ss, address, verbose=0):
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
