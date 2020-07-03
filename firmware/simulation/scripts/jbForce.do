######################################################################
#
######################################################################
# Clocks
force -freeze sim:/tb_jbtest/dwaClk100 1 0, 0 {5 ns} -r 10 ns
# Run sim for 1ns so forced signals come shortly after rising clock edge
run 1ns

# PL signals
force -freeze sim:/tb_jbtest/sendRunHdr TRUE {30 ns} -cancel {50 ns}
#force -freeze sim:/tb_jbtest/sendRunHdr TRUE {500 ns} -cancel {520 ns}

# PS signals
#force -freeze sim:/tb_jbtest/fromDaqReg.udpPacketCounter 16'h002A 0
