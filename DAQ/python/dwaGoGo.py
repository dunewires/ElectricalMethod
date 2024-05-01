import dwaTools as dwa
import time
sourceFile = open('demo.txt', 'w')
print('Starting test', file = sourceFile)
print('\n\n======= dwaRelayConfigTest() ===========', file = sourceFile)
#dwa.dwaReset(verbose=1)
sleepSec = 0.2
s = dwa.tcpOpen(verbose=False)
# !! for now all wires are off, should we do something here?
# relayWireTop(3);
dwa.dwaRegWrite(s, '00000029', '00000000')
time.sleep(sleepSec)
# relayWireTop(2);
dwa.dwaRegWrite(s, '00000028', '00000000')
time.sleep(sleepSec)
# relayWireTop(1);
dwa.dwaRegWrite(s, '00000027', '00000000')
time.sleep(sleepSec)
# relayWireTop(0);
dwa.dwaRegWrite(s, '00000026', '00000000')
time.sleep(sleepSec)
# relayWireBot(3);
dwa.dwaRegWrite(s, '00000023', '00000000')
time.sleep(sleepSec)
# relayWireBot(2);
dwa.dwaRegWrite(s, '00000022', '00000000')
time.sleep(sleepSec)
# relayWireBot(1);
dwa.dwaRegWrite(s, '00000021', '00000000')
time.sleep(sleepSec)
# relayWireBot(0);
dwa.dwaRegWrite(s, '00000020', '00000000')
time.sleep(sleepSec)

relayBusTopReg = ['']*2
relayBusBotReg = ['']*2

relayBusStart =  0x8000000000000000
relayBusError =  0x4000000000000000
for i in range(16):
	relayBusScan =  relayBusStart
	for j in range(16):
		relayBus = relayBusError | relayBusScan
		#print('test index',i,j, end=' ', file = sourceFile)
		print('Bus bits',format(relayBus,'b').zfill(64), end=' ', file = sourceFile)
		relayBusBotReg[1] =  (relayBus & 0xffff000000000000)>>48
		relayBusBotReg[0] =  (relayBus & 0x0000ffff00000000)>>32
		relayBusTopReg[1] =  (relayBus & 0x00000000ffff0000)>>16
		relayBusTopReg[0] =  (relayBus & 0x000000000000ffff)
		print('relayBusBotReg',format(relayBusBotReg[1],'x').zfill(8),format(relayBusBotReg[0],'x').zfill(8), end=' ', file = sourceFile)
		print('relayBusTopReg',format(relayBusTopReg[1],'x').zfill(8),format(relayBusTopReg[0],'x').zfill(8), end=' ', file = sourceFile)

		# read errorBits 
		errors=dwa.dwaRegRead(s, '00000034')                                                                                
		print (errors, end=' ', file = sourceFile)
		time.sleep(sleepSec)

		# relayBusTop(1);
		dwa.dwaRegWrite(s, '0000002B', format(relayBusTopReg[1],'x').zfill(8))
		time.sleep(sleepSec)
		# relayBusTop(0);
		dwa.dwaRegWrite(s, '0000002A', format(relayBusTopReg[0],'x').zfill(8))
		time.sleep(sleepSec)
		# relayBusBot(1);
		dwa.dwaRegWrite(s, '00000025', format(relayBusBotReg[1],'x').zfill(8))
		time.sleep(sleepSec)
		# relayBusBot(0);
		dwa.dwaRegWrite(s, '00000024', format(relayBusBotReg[0],'x').zfill(8))
		time.sleep(sleepSec)
		# Update relays
		dwa.dwaRegWrite(s, '00000000', '00000004')
		time.sleep(sleepSec)

		# read errorBits                                                                                 
		errors=dwa.dwaRegRead(s, '00000034')                                                                                
		print (errors, file = sourceFile)
		time.sleep(sleepSec)


		relayBusScan = relayBusScan>>2
	relayBusError = relayBusError>>2

# LS 24b dateCode                                                                          
dwa.dwaRegRead(s, '00000012')
time.sleep(sleepSec)

dwa.tcpClose(s)
sourceFile.close()

#print('\n\n======= dwaConfig() ===========', file = sourceFile)
#dwa.dwaConfig(verbose=0, configFile="dwaConfigWC.ini")
##dwa.dwaConfig(verbose=0, configFile="dwaConfigSingleFreq.ini")

#print('\n\n======= dwaStart() ===========', file = sourceFile)
#dwa.dwaStart(verbose=1)

#print('\n\n======= dwaStat() ===========', file = sourceFile)
#dwa.dwaStat(verbose=1)

