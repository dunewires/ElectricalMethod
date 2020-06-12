######################################################################
#
# File name : headerGenForce.do
# Created on: Wed Jun 3 14:47:29 EDT 2020
#
######################################################################
# Emulate parameter value that are usually set by DAQ/DWA
#force -freeze sim:/tb_headergenerator/fromDaqReg.freqMin 24'habcd12 0
#force -freeze sim:/tb_headergenerator/fromDaqReg.freqMax 24'hdcba12 0
#
#force -freeze sim:/tb_headergenerator/fromDwaReg.freqMin 24'habcd12 0
#force -freeze sim:/tb_headergenerator/fromDwaReg.freqMax 24'hdcba12 0
#force -freeze sim:/tb_headergenerator/fromDwaReg.freqStep 24'hcafe66 0
#force -freeze sim:/tb_headergenerator/fromDwaReg.acStim_mag 24'hdead66 0
#force -freeze sim:/tb_headergenerator/fromDwaReg.stimTime 24'hbeef66 0

force -freeze sim:/tb_headergenerator/dwaClk100 1 0, 0 {5 ns} -r 10 ns

force -freeze sim:/tb_headergenerator/headAStart true 50ns -cancel 60ns
force -freeze sim:/tb_headergenerator/headFStart true 150ns -cancel 160ns
force -freeze sim:/tb_headergenerator/headCStart true 350ns -cancel 360ns

force -freeze sim:/tb_headergenerator/fromDaqReg.headARen FALSE 0
force -freeze sim:/tb_headergenerator/fromDaqReg.headARen TRUE {101 ns} -cancel {111 ns}
force -freeze sim:/tb_headergenerator/fromDaqReg.headARen TRUE {121 ns} -cancel {151 ns}
force -freeze sim:/tb_headergenerator/fromDaqReg.headARen TRUE {181 ns} -cancel {191 ns}

force -freeze sim:/tb_headergenerator/fromDaqReg.headFRen FALSE 0
force -freeze sim:/tb_headergenerator/fromDaqReg.headFRen TRUE {201 ns} -cancel {211 ns}
force -freeze sim:/tb_headergenerator/fromDaqReg.headFRen TRUE {221 ns} -cancel {251 ns}
force -freeze sim:/tb_headergenerator/fromDaqReg.headFRen TRUE {281 ns} -cancel {291 ns}
force -freeze sim:/tb_headergenerator/fromDaqReg.headFRen TRUE {301 ns} -cancel {321 ns}

force -freeze sim:/tb_headergenerator/fromDaqReg.headCRen FALSE 0
force -freeze sim:/tb_headergenerator/fromDaqReg.headCRen TRUE {371 ns} -cancel {381 ns}
force -freeze sim:/tb_headergenerator/fromDaqReg.headCRen TRUE {401 ns} -cancel {421 ns}


