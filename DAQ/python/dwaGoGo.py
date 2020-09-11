import dwaTools as dwa

print('\n\n======= dwaReset() ===========')
dwa.dwaReset(verbose=1)

print('\n\n======= dwaConfig() ===========')
dwa.dwaConfig(verbose=0, configFile="dwaConfigWC.ini")
#dwa.dwaConfig(verbose=0, configFile="dwaConfigSingleFreq.ini")

print('\n\n======= dwaStart() ===========')
dwa.dwaStart(verbose=1)

#print('\n\n======= dwaStat() ===========')
#dwa.dwaStat(verbose=1)

