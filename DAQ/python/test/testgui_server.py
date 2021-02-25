# a UDP server that sends data
# can be paired with dwaDaqMultithread.py

import time
import socket
import struct
import math
import binascii
import random
import os

localIP = "127.0.0.1"
#localPort = 20001
localPort = 6008
bufferSize = 1024

msgFromServer = "Hello UDP Client"
bytesToSend = str.encode(msgFromServer)

# Create a datagram socket
sock = socket.socket(family=socket.AF_INET,  type=socket.SOCK_DGRAM)

# Bind to address and ip
#sock.bind((localIP, localPort))
print("UDP server initialized")

# Pause until client requests data start
waitForTrigger = False
while(waitForTrigger):
    bytesAddressPair = sock.recvfrom(bufferSize)
    message = bytesAddressPair[0]
    address = bytesAddressPair[1]
    clientMsg = "Message from Client:{}".format(message)
    clientIP  = "Client IP Address:{}".format(address)
    print(clientMsg)
    print(clientIP)
    print(message)
    if message == b'begin':
        # Sending a reply to client
        msgFromServer = "Received 'begin' command... will now send you data"
        bytesToSend = str.encode(msgFromServer)
        print("Sending reply to client = [{}]".format(msgFromServer))
        sock.sendto(bytesToSend, address)
        print("Client requested data. Will start sending data now...")
        break

def sendDummyDataSine(sock):
    # Read data from a file
    filename = 'testgui_data_sine.dat'
    f = open(filename, "rb")
    # read all data into a list (without newlines)
    # https://stackoverflow.com/questions/12330522/how-to-read-a-file-without-newlines
    data = f.read().splitlines()
    data = [float(tok) for tok in data]
    f.close()
    
    # Stream data over UDP, N data points at a time
    nPer = 10  # number of points to send per transmission
    nData = len(data)
    iimax = math.floor(nData/nPer)
    #print("nData = {}".format(nData))
    #print("iimax = {}".format(iimax))
    
    for ii in range(iimax):
        idmin = ii*nPer
        idmax = (ii+1)*nPer
        dataToSend = data[idmin:idmax]      
        bytesToSend = struct.pack('!{}f'.format(nPer), *dataToSend)
        #print("ids = {}:{}".format(idmin, idmax))
        sock.sendto(bytesToSend, address)


def sendDummyDataDwa(sock):
    # Read data from a file
    #filename = 'mmTest1F.python.txt'
    filename = 'junk.txt'
    f = open(filename, "rb")
    # read all data into a list (without newlines)
    # https://stackoverflow.com/questions/12330522/how-to-read-a-file-without-newlines
    data = f.read().splitlines()
    f.close()
    
    # Send data in file one line at a time
    nTx = 0
    for datum in data:
        nTx += 1
        dataToSend = datum
        #bytesToSend = struct.pack('!{}f'.format(nPer), *dataToSend)
        bytesToSend = binascii.unhexlify(dataToSend)  # convert string to bytes.  e.g. dataToSend is 'CAFE805E' and bytesToSend is b'\xca\xfe\x80^'
        #print("ids = {}:{}".format(idmin, idmax))
        sock.sendto(bytesToSend, address)
        time.sleep(0.03)  # needed otherwise packets are dropped.  not sure how small the sleep can be... 5ms seems to work fine though
    print("Sent {} lines of data".format(nTx))


def getAllLines(fname):
    f = open(fname, "rb")
    # read all data into a list (without newlines)
    # https://stackoverflow.com/questions/12330522/how-to-read-a-file-without-newlines
    data = f.read().splitlines()
    f.close()
    return data

def pickRegister(reglist):
    # pick a random register
    for ii in range(5):
        reg = random.choice(reglist)
    return reg

def pickNLines(nleft):
    nn = random.randint(1,6)
    if nn > nleft:
        nn = nleft
    return nn

def makeUdpHeader(udpPktNum, reg):
    # there are only 2 characters available for the UDP pkt number
    # so we must wrap the counter...:   00, 01, ... FE, FF, 00, 01
    # do this with udpPktNum modulo 256  (FF = 255)

    pktNumHexStr = '{:02X}'.format(udpPktNum % 256)   # convert int to hex
    line1 = b''.join([b'F00000', str.encode(pktNumHexStr)])
    line2 = str.encode('000000{}'.format(reg))
    #print("line1 = ")
    #print(line1)
    #print("line2 = ")
    #print(line2)
    return b''.join([line1, line2])

def sendDummyDataDwaMultiregister(sock):
    # Read data from a file
    print("Reading data from the following files: ")
    filenames = ['data/reg18.txt', 'data/reg19.txt', 'data/reg1A.txt',
                 'data/reg1B.txt', 'data/reg1C.txt', 'data/reg1D.txt',
                 'data/reg1E.txt', 'data/reg1F.txt']
    print(filenames)
    data_allreg = {}
    # Read all the data into a dictionary of lists
    for fname in filenames:
        regname = fname[-6:-4]
        data_allreg[regname] = getAllLines(fname)

    registers_with_data = list(data_allreg.keys())

    udpPacketNumber = 0
    while True:
        reg = pickRegister(registers_with_data)
        print("reg = %s" % reg)
        # pick a random number of lines to send
        nLines = pickNLines(len( data_allreg[reg] ))

        # pick the lines and make them into a single string
        print("items to send = ")
        print(data_allreg[reg][0:nLines])
        data = b''.join(data_allreg[reg][0:nLines])
        del data_allreg[reg][0:nLines]
        #print("data = ")
        print(data)

        # generate a UDP header
        udpHeader = makeUdpHeader(udpPacketNumber, reg)
        #print("udpHeader = ")
        print(udpHeader)
        udpPacketNumber += 1
      
        dataToSend = b''.join([udpHeader, data])
        print("dataToSend = ")
        print(dataToSend)
        #bytesToSend = struct.pack('!{}f'.format(nPer), *dataToSend)
        bytesToSend = binascii.unhexlify(dataToSend)  # convert string to bytes.  e.g. dataToSend is 'CAFE805E' and bytesToSend is b'\xca\xfe\x80^'
        #print("ids = {}:{}".format(idmin, idmax))
        sock.sendto(bytesToSend, address)
        time.sleep(0.03)  # needed otherwise packets are dropped.  not sure how small the sleep can be... 5ms seems to work fine though

        ###############################
        # if datafile is done, remove register from list of valid registers
        if len(data_allreg[reg]) == 0:
            registers_with_data.remove(reg)

        if len(registers_with_data) == 0:
            break

def sendDummyDataNewHeadersOLD(sock):
    print("Reading data from the following files: ")
    #fname= 'newdata_run.dat'
    #filenames = ['newdata_run.dat',
    #             'newdata_adc_0.dat', 'newdata_adc_1.dat',
    #             'newdata_adc_2.dat', 'newdata_adc_3.dat',
    #             'newdata_adc_4.dat', 'newdata_adc_5.dat',
    #             'newdata_adc_6.dat', 'newdata_adc_7.dat']
    #filenames = ['data/{}'.format(ff) for ff in filenames]  # prepend subdir
    #fileroot = 'data/fromSebastien/20200813T000904'
    fileroot = 'data/fromSebastien_20210125T010957/20210125T010957'
    filenames = [f'{fileroot}_FF.txt']
    #freqMin, freqMax = 0, 157
    #freqMin, freqMax = 50, 130
    freqMin, freqMax = 0, 80
    chanMax = 7
    #for freq in range(0,freqMax+1):
    for freq in range(freqMin,freqMax+1):
        for chan in range(0, chanMax+1):
            filenames.append(f'{fileroot}_{chan:02}_{freq:04}.txt')

    address = (localIP, localPort)

    oldFreq = 'FF'
    for fname in filenames:
        toks = fname.split("_")
        try:
            freqNum = toks[2]
            freqNum = freqNum[0:4]
            print(freqNum)
            if freqNum != oldFreq:
                time.sleep(0.05)
                oldFreq = freqNum
        except:
            pass
        lines = getAllLines(fname)
        print("lines = ")
        print(lines)
        dataToSend = b''.join(lines)
        print("dataToSend = ")
        print(dataToSend)
        bytesToSend = binascii.unhexlify(dataToSend)  # convert string to bytes.  e.g. dataToSend is 'CAFE805E' and bytesToSend is b'\xca\xfe\x80^'
        sock.sendto(bytesToSend, address)
        time.sleep(0.005)  # needed otherwise packets are dropped.  not sure how small the sleep can be... 5ms seems to work fine though



def sendDummyDataNewHeaders(sock):
    """ Replay data in the nominal format. No need to break apart files 
    e.g. if fileroot = data/fromSebastien_20210125T010957/'
    and scanId = 20210125T010957
    then this code will pull and replay all data from the following files:
     data/fromSebastien_20210125T010957/20210125T010957_FF.txt
     data/fromSebastien_20210125T010957/20210125T010957_00.txt
     data/fromSebastien_20210125T010957/20210125T010957_01.txt
     ...
     data/fromSebastien_20210125T010957/20210125T010957_07.txt
    """
    #fileroot = 'data/fromSebastien/20200813T000904'
    #fileroot = 'data/fromSebastien_20210125T010957/20210125T010957'
    #fileroot = 'data/fromSebastien_20010101/'
    #scanId = '20210125T010957'

    #fileroot = 'data/fromSebastien_quickScan/'
    #scanId = '20210224T212726'
    fileroot = 'data/fromSebastien_slowScan/'
    scanId = '20210224T205700'

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
    udpData['FF'] = getAllLines(runHeaderFile)

    for chan in range(nChan):
        # Read the full file into memory
        lines = getAllLines(wireDataFilenames[chan])
        # Find where the UDP packet boundaries are in the file (lines starting with 'AAAA0')
        udpDelimIdxs = []
        for ii, line in enumerate(lines):
            if line.startswith(b'AAAA0'):
                udpDelimIdxs.append(ii)
        # Make a list of lists. Outer level list is one entry per UDP packet
        # inner level of list is one entry per line of that UDP packet
        for ii in range(len(udpDelimIdxs)-1):
            udpData[chan] = [ lines[udpDelimIdxs[ii]:udpDelimIdxs[ii+1]]
                              for ii in range(len(udpDelimIdxs)-1) ]
            udpData[chan].append(lines[udpDelimIdxs[-1]:])

    nFreq = len(udpData[0])

    # Prepare for UDP transmission
    address = (localIP, localPort)

    # Transmit the run header
    dataToSend = b''.join(udpData['FF'])
    bytesToSend = binascii.unhexlify(dataToSend)  # convert string to bytes.  e.g. dataToSend is 'CAFE805E' and bytesToSend is b'\xca\xfe\x80^'
    sock.sendto(bytesToSend, address)
    time.sleep(0.005)

    # Loop over frequencies and channels and transmit the ADC data
    for ifreq in range(nFreq):
        for ichan in range(nChan):
            bytesToSend = binascii.unhexlify( b''.join(udpData[ichan][ifreq]) )
            sock.sendto(bytesToSend, address)
            time.sleep(0.005)  # pause between channel transmissions on a single freq
            
        time.sleep(0.07)  # pause after all channels send a single freq.

#sendDummyDataSine(sock)
#sendDummyDataDwa(sock)
#sendDummyDataDwaMultiregister(sock)
sendDummyDataNewHeaders(sock)
sock.close()
