# a UDP server that sends data
import socket
import struct
import math

localIP = "127.0.0.1"
localPort = 20001
bufferSize = 1024

msgFromServer = "Hello UDP Client"
bytesToSend = str.encode(msgFromServer)

# Create a datagram socket
sock = socket.socket(family=socket.AF_INET,  type=socket.SOCK_DGRAM)

# Bind to address and ip
sock.bind((localIP, localPort))
print("UDP server up and listening")

sendData = False

# Pause until client requests data start
while(True):
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
        sock.sendto(bytesToSend, address)
        print("Client requested data. Will start sending data now...")
        break


# Read data from a file
filename = 'testgui_data.dat'
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
    #dataToSend = data[ii*nPer:(ii+1)*nPer]
    bytesToSend = struct.pack('!{}f'.format(nPer), *dataToSend)
    #print("ids = {}:{}".format(idmin, idmax))
    sock.sendto(bytesToSend, address)

#while (data):
#    if (sock.sendto(data, address)):
#        print("sending...")
#        data = f.read(bufferSize)
sock.close()


