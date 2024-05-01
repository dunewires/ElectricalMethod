import dwaTools as dwa
import time

print('\n\n======= dwaRelayConfigTest() ===========')
#dwa.dwaReset(verbose=1)
sleepSec = 0.2

relayBusTopReg = ['']*2
relayBusBotReg = ['']*2

relayBusTopReg[0] =  '00000000'
relayBusTopReg[1] =  '00000000'
relayBusBotReg[0] =  '00000000'
relayBusBotReg[1] =  '00000000'

s = dwa.tcpOpen(verbose=False)

# LS 24b dateCode                                                                          
dwa.dwaRegRead(s, '00000012')
time.sleep(sleepSec)
# read errorBits                                                                                 
dwa.dwaRegRead(s, '00000034')
time.sleep(sleepSec)

# relayBusTop(1);
dwa.dwaRegWrite(s, '0000002B', rbt1)
time.sleep(sleepSec)
# relayBusTop(0);
dwa.dwaRegWrite(s, '0000002A', )
time.sleep(sleepSec)
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
# relayBusBot(1);
dwa.dwaRegWrite(s, '00000025', '00000000')
time.sleep(sleepSec)
# relayBusBot(0);
dwa.dwaRegWrite(s, '00000024', '00000000')
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

