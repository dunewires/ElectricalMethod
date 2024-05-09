import dwaTools as dwa
import time
sourceFile = open('dwaRelayScan.txt', 'w')
#dwa.dwaReset(verbose=1)
sleepSec = 0.2
totalLockoutEr=0
totalReadbackEr=0
runNumber=1

s = dwa.tcpOpen(verbose=False)

# read errorBits                                                                                 
regHead,regAddress,regData=dwa.dwaRegRead(s, '00000014')
print('Firmware git hash:',format(regData,'x').zfill(8),end=', ',file = sourceFile)
regHead,regAddress,regData=dwa.dwaRegRead(s, '00000030')
print('DWA S/N:',format(regData,'x').zfill(8), file = sourceFile)
time.sleep(sleepSec)

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

relayBusStart =  0x0000000000000000
relayBusError =  0x0000000000000000
print('Run Number,Bus String,relayBusBotReg1,relayBusBotReg0,relayBusTopReg1,relayBusTopReg0,Starting Errors,Ending Errors,Total Lockout Err,Total Readback Err',file = sourceFile)


for i in range(32):
	relayBusScan =  relayBusStart
	for j in range(1):
		print(format(runNumber,'d').zfill(8), end=',', file = sourceFile)
		print('run number:',format(runNumber,'d').zfill(8))
		relayBus = relayBusError | relayBusScan
		#print('test index',i,j, end=' ', file = sourceFile)
		print(format(relayBus,'b').zfill(64), end=',', file = sourceFile)
		print('bus bits:',format(relayBus,'b').zfill(64))
		relayBusBotReg[1] =  (relayBus & 0xffff000000000000)>>48
		relayBusBotReg[0] =  (relayBus & 0x0000ffff00000000)>>32
		relayBusTopReg[1] =  (relayBus & 0x00000000ffff0000)>>16
		relayBusTopReg[0] =  (relayBus & 0x000000000000ffff)
		print(format(relayBusBotReg[1],'x').zfill(8),',',format(relayBusBotReg[0],'x').zfill(8), end=',', file = sourceFile)
		print(format(relayBusTopReg[1],'x').zfill(8),',',format(relayBusTopReg[0],'x').zfill(8), end=',', file = sourceFile)

		# read errorBits 
		regHead,regAddress,regData=dwa.dwaRegRead(s, '00000034')
		print(format(regData,'x').zfill(8), end=',', file = sourceFile)
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
		regHead,regAddress,regData=dwa.dwaRegRead(s, '00000034')
		time.sleep(sleepSec)
		print(format(regData,'x').zfill(8), end=',', file = sourceFile)
		if (regData & 0x00000040) > 0 :
			totalLockoutEr += 1
		if (regData & 0x00000020) > 0 :
			totalReadbackEr += 1
		print(format(totalLockoutEr,'d').zfill(8), end=',', file = sourceFile)
		print('total lockout err:',format(totalLockoutEr,'d').zfill(8))
		print(format(totalReadbackEr,'d').zfill(8), file = sourceFile)
		print('total readback err:',format(totalReadbackEr,'d').zfill(8),'\n')
		runNumber+=1

		relayBusScan = relayBusScan>>1
		if (num % 2) and (i < 32):
			# for the first 16 odd index, shift in 1
		    relayBusScan = relayBusScan | 1<<64
	
	relayBusError = relayBusError>>2

# LS 24b dateCode                                                                          
dwa.dwaRegRead(s, '00000012')
time.sleep(sleepSec)

dwa.tcpClose(s)
sourceFile.close()
