# Collection of functions for python interface to DUNE Wire Analyzer (DWA)
# 
# Created by James Battat
# 2019 December 17

import sys
import socket
import time
import struct
import binascii

def dwaReset(verbose=0):
    s = tcpOpen(verbose=verbose)
    dwaRegWrite(s, '00000001', '00000000', verbose=verbose)
    time.sleep(0.2)
    dwaRegWrite(s, '00000001', '00000001', verbose=verbose)
    time.sleep(0.2)
    tcpClose(s)

def dwaConfig(verbose=0):
    print("verbose = {}".format(verbose))

    # FIXME: move these to a config file
    freqReq_vio = "00001000"
    # dwaCtrl  => (auto mainsMinus_enable m_axis_tready)
    dwaCtrl = "00000005"
    ctrl_freqMin = "00000100"
    ctrl_freqMax = "00000200"
    ctrl_freqStep = "00000010"
    ctrl_stimTime = "00001000"
    ctrl_adc_nSamples = "00000008"
    adcAutoDc_chSel = "00000001"
    adcHScale = "00000018"

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


# Receive with timeout from e.g.:
# https://stackoverflow.com/questions/17499961/send-receive-packets-with-tcp-sockets

    ##total data partwise in an array
    #total_data=[];
    #data='';
    #
    ##beginning time
    #begin=time.time()
    #while 1:
    #    #if you got some data, then break after timeout
    #    if total_data and time.time()-begin > timeout:
    #        print 'here'
    #        break
    #
    #    #if you got no data at all, wait a little longer, twice the timeout
    #    elif time.time()-begin > timeout*2:
    #        print 'no data'
    #        break
    #
    #    #recv something
    #    try:
    #        data = ss.recv(8192)
    #        if data:
    #            total_data.append(data)
    #            #change the beginning time for measurement
    #            begin=time.time()
    #        else:
    #            #sleep for sometime to indicate a gap
    #            time.sleep(0.1)
    #    except:
    #        pass
    #
    ##join all parts to make final string
    #return ''.join(total_data)


