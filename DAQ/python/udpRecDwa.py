import socket
import sys
import binascii

# FIXME: 
# No doc yet on the meaning/format/rules of the data that arrives via UDP
# So implementing a kluge for now... May fail badly in general case
# but works for now...

#ECHO_TO_SCREEN = True


UDP_IP = ''       # '' is a symbolic name meaning all available interfaces
UDP_PORT = 6008   # port (set to match the hard-coded value on the FPGA)

bufferSize = 1024*1  # max amount of data to be received at once (in bytes?)
tokSize = 8 # length of each token (token is a 8-entry HEX value like 'CAFE8030')
#bufsize = 65536
#timeout = 300 # seconds
#readInterval = 0.01 # seconds

try:
    sock = socket.socket(family=socket.AF_INET,   # internet
                         type=socket.SOCK_DGRAM)  # UDP
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    sock.bind( (UDP_IP, UDP_PORT) )
except:
    print("UDP Error: could not setup UDP")
    sys.exit()


# Open a file for writing data
fout = open('mmTest1F.python.txt', 'a')

try:
    print("UDP Receiver ready ...")
    print("CTRL-c to terminate")
    while True:
        data, addr = sock.recvfrom(bufferSize)
        print("\n\nbing! Data received")
        #print(addr)
        #print(data)
        #print(repr(data))
        #print("type(data) = {}".format(type(data)))
        #print("len(data) = {}".format(len(data)))
        #print("Length = {}".format(len(data)))
        #print('binascii.hexlify(data[0:4]) = {}'.format(binascii.hexlify(data[0:4])))
        # 
        # Warning: len(data) does not reliably give the 
        # number of hex characters in the data
        # but the length of dataToks*chunkLength does...
        # Why? although most bytes display as \xHH (e.g. \xd2)
        # some display as single characters (e.g. 0x28 displays as '(' 
        # and 0x4d displays as 'M' which throws off the count)
        # See: https://stackoverflow.com/questions/39963516/converting-repr-to-hex
        #
        #nChunks = len(data)/tokSize  # THIS DOES NOT WORK
        #print("      {} words arrived".format(nChunks))  # THIS DOES NOT WORK
        #
        # convert received data into a list of strings, each 8 chars long.
        dataStr = binascii.hexlify(data)
        dataToks = [ str(dataStr[ii:ii+tokSize], 'utf-8').upper() 
                     for ii in range(0, len(dataStr), tokSize) ]
        print("      {} words arrived".format(len(dataToks)))
        for tok in dataToks:
            print(tok)  # Print all toks to screen
            # Certain toks should not be logged to file
            # FIXME: in general the headers can change
            # e.g. the "1F" at the end of the second header line will vary
            # by register.
            # just skip the first two entries of dataToks as those will
            # always be the UDP packet header lines
            # e.g.
            # udpHeader = dataToks[0:2]
            # dataToks = dataToks[2:]
            if tok.startswith('F00001'):
                continue
            if tok == '0000001F':
                continue
            fout.write(tok)
            fout.write('\n')
            fout.flush()

except KeyboardInterrupt:
    print("SIGINT received, stopping...")
    # clean up
    sock.close()
    # close files?
    fout.flush()
    fout.close()
    sys.exit()
