import dwaTools as dwa

print('\n\n======= dwaReset() ===========')
dwa.dwaReset(verbose=1)

# FIXME: need to define config parameters and pass to dwaConfig()
# dwa.dwaConfigParameters()

print('\n\n======= dwaConfig() ===========')
dwa.dwaConfig(verbose=0)

print('\n\n======= dwaStart() ===========')
dwa.dwaStart(verbose=1)

print('\n\n======= dwaStat() ===========')
dwa.dwaStat(verbose=1)

# From dwaGoGo.m
#dwaReset;
#dwaConfigParameters;
#dwaConfig;
#dwaStart;
#dwaStat;

