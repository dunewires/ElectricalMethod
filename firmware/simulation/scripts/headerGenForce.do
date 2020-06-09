######################################################################
#
# File name : headerGenForce.do
# Created on: Wed Jun 3 14:47:29 EDT 2020
#
######################################################################
force -freeze sim:/tb_headergenerator/fromDaqReg.freqMax 24'habcd12 0
force -freeze sim:/tb_headergenerator/fromDaqReg.freqStep 24'hcafe66 0
force -freeze sim:/tb_headergenerator/dwaClk100 1 0, 0 {5 ns} -r 10 ns
force -freeze sim:/tb_headergenerator/headAStart true 50ns -cancel 60ns

force -freeze sim:/tb_headergenerator/fromDaqReg.headARen FALSE 0
force -freeze sim:/tb_headergenerator/fromDaqReg.headARen TRUE {101 ns} -cancel {111 ns}
force -freeze sim:/tb_headergenerator/fromDaqReg.headARen TRUE {121 ns} -cancel {151 ns}
force -freeze sim:/tb_headergenerator/fromDaqReg.headARen TRUE {181 ns} -cancel {191 ns}
