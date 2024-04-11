import dwaTools as dwa
import time

print('\n\n======= dwaRelayConfigTest() ===========')
#dwa.dwaReset(verbose=1)
sleepSec = 0.2

s = dwa.tcpOpen(verbose=False)

# LS 24b dateCode                                                                          
dwa.dwaRegRead(s, '00000012')
time.sleep(sleepSec)
# read errorBits                                                                                 
dwa.dwaRegRead(s, '00000034')
time.sleep(sleepSec)
# ctrl busy                                                                                          
dwa.dwaRegRead(s, '00000011')
time.sleep(sleepSec)
# constant                                                                                           
dwa.dwaRegRead(s, '00000012')
time.sleep(sleepSec)
# fifoAutoDC_ff fifoAutoDC_ef                                                                        
dwa.dwaRegRead(s, '0000001B')
time.sleep(sleepSec)
dwa.tcpClose(s)

#print('\n\n======= dwaConfig() ===========')
#dwa.dwaConfig(verbose=0, configFile="dwaConfigWC.ini")
##dwa.dwaConfig(verbose=0, configFile="dwaConfigSingleFreq.ini")

#print('\n\n======= dwaStart() ===========')
#dwa.dwaStart(verbose=1)

#print('\n\n======= dwaStat() ===========')
#dwa.dwaStat(verbose=1)

