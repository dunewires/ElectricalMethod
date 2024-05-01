import dwaTools as dwa
import time

print('\n\n======= dwaRelayConfigTest() ===========')
#dwa.dwaReset(verbose=1)
sleepSec = 0.2
s = dwa.tcpOpen(verbose=False)

relayBusTopReg = ['']*2
relayBusBotReg = ['']*2

#set initial values
relayBusTopReg[0] =  0x0
relayBusTopReg[1] =  0xaa
relayBusBotReg[0] =  relayBusTopReg[1] <<2
relayBusBotReg[1] =  0x22
print('relayBusTopReg', format(relayBusTopReg[1],'x').zfill(8),relayBusTopReg[0])
print('relayBusTopReg', relayBusBotReg[1],relayBusBotReg[0])



# LS 24b dateCode                                                                          
dwa.dwaRegRead(s, '00000012')
time.sleep(sleepSec)
# read errorBits                                                                                 
dwa.dwaRegRead(s, '00000034')
time.sleep(sleepSec)

# relayBusTop(1);
dwa.dwaRegWrite(s, '0000002B', 'aaaaaaaa')
time.sleep(sleepSec)
# relayBusTop(0);
time.sleep(sleepSec)
# relayBusBot(1);
dwa.dwaRegWrite(s, '00000025', '00000000')
time.sleep(sleepSec)
# relayBusBot(0);
dwa.dwaRegWrite(s, '00000024', '00000000')
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

# Update relays
dwa.dwaRegWrite(s, '00000000', '00000004')
time.sleep(sleepSec)

# read errorBits                                                                                 
dwa.dwaRegRead(s, '00000034')
time.sleep(sleepSec)

dwa.tcpClose(s)

#print('\n\n======= dwaConfig() ===========')
#dwa.dwaConfig(verbose=0, configFile="dwaConfigWC.ini")
##dwa.dwaConfig(verbose=0, configFile="dwaConfigSingleFreq.ini")

#print('\n\n======= dwaStart() ===========')
#dwa.dwaStart(verbose=1)

#print('\n\n======= dwaStat() ===========')
#dwa.dwaStat(verbose=1)

