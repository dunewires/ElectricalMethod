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

dpotReg = ['']*2

# attach CSV header
print('Run Number,Bus String,relayBusBotReg1,relayBusBotReg0,dpotReg1,dpotReg0,Starting Errors,Ending Errors,Total Lockout Err,Total Readback Err',file = sourceFile)

# outer loop will shift the error bit(s)
for i in range(1):
	dpotReg[0] = 0
	dpotReg[1] = 255
	for j in range(256):
		print('dwaReg 0',format(dpotReg[0],'x').zfill(8))
		print('dwaReg 1',format(dpotReg[1],'x').zfill(8))
		dwa.dwaRegWrite(s, '00000010', format(dpotReg[1],'x').zfill(8))
		time.sleep(sleepSec)
		dwa.dwaRegWrite(s, '0000000F', format(dpotReg[0],'x').zfill(8))
		time.sleep(sleepSec)		

		dpotReg[0] += 1
		dpotReg[1] -= 1

		runNumber+=1

# LS 24b dateCode                                                                          
dwa.dwaRegRead(s, '00000012')
time.sleep(sleepSec)


dwa.tcpClose(s)
sourceFile.close()
