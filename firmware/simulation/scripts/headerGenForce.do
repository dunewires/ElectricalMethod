######################################################################
#
# File name : headerGenForce.do
# Created on: Wed Jun 3 14:47:29 EDT 2020
#
######################################################################
# Clocks
force -freeze sim:/tb_headergenerator/dwaClk100 1 0, 0 {5 ns} -r 10 ns
# Run sim for 1ns so forced signals come shortly after rising clock edge
run 1ns

# eventually will be PS, but are not yet
force -freeze sim:/tb_headergenerator/runOdometer 24'h000009 0
force -freeze sim:/tb_headergenerator/fpgaSerialNum 24'h012345 0

# PL signals
force -freeze sim:/tb_headergenerator/firmwareId_date 48'h1406110F0200 0
force -freeze sim:/tb_headergenerator/firmwareId_hash 32'h22BCBCBC 0
#
force -freeze sim:/tb_headergenerator/stimPeriodActive 24'h647681 0
force -freeze sim:/tb_headergenerator/stimPeriodCounter 24'h121213 0
force -freeze sim:/tb_headergenerator/adcSamplingPeriod 24'h424344 0
#
force -freeze sim:/tb_headergenerator/sendRunHdr TRUE {50 ns} -cancel {70 ns}
force -freeze sim:/tb_headergenerator/sendRunHdr TRUE {500 ns} -cancel {520 ns}
#force -freeze sim:/tb_headergenerator/sendStatusHdr TRUE {50 ns} -cancel {70 ns}
#force -freeze sim:/tb_headergenerator/sendAdcData TRUE {50 ns} -cancel {70 ns}
#force -freeze sim:/tb_headergenerator/sendAdcData TRUE {500 ns} -cancel {520 ns}
#
force -freeze sim:/tb_headergenerator/fromDaqReg.udpDataDone TRUE {440 ns} -cancel {460 ns}
#
force -freeze sim:/tb_headergenerator/udpDataRen TRUE {100 ns} -cancel {170 ns}
force -freeze sim:/tb_headergenerator/udpDataRen TRUE {200 ns} -cancel {280 ns}
force -freeze sim:/tb_headergenerator/udpDataRen TRUE {290 ns} -cancel {450 ns}
force -freeze sim:/tb_headergenerator/udpDataRen TRUE {510 ns} -cancel {900 ns}

# PS signals
#force -freeze sim:/tb_headergenerator/fromDaqReg.dwaCtrl 24'h0C0C0C 0
force -freeze sim:/tb_headergenerator/fromDaqReg.coilDrive 24'h000001 0
force -freeze sim:/tb_headergenerator/fromDaqReg.fixedPeriod 24'h0F0F0F 0
force -freeze sim:/tb_headergenerator/fromDaqReg.stimFreqReq 24'hBABABA 0
force -freeze sim:/tb_headergenerator/fromDaqReg.stimFreqMin 24'hABCD12 0
force -freeze sim:/tb_headergenerator/fromDaqReg.stimFreqMax 24'hDCBA12 0
force -freeze sim:/tb_headergenerator/fromDaqReg.stimFreqStep 24'hCAFE66 0
force -freeze sim:/tb_headergenerator/fromDaqReg.acStim_mag 24'hDEAD66 0
force -freeze sim:/tb_headergenerator/fromDaqReg.stimTime 24'hBEEF66 0
#force -freeze sim:/tb_headergenerator/fromDaqReg.adcAutoDc_chSel 16'h0102 0
force -freeze sim:/tb_headergenerator/fromDaqReg.cyclesPerFreq 24'h00CFCF 0
force -freeze sim:/tb_headergenerator/fromDaqReg.adcSamplesPerCycle 16'h002C 0
force -freeze sim:/tb_headergenerator/fromDaqReg.acStim_mag 12'h023 0
force -freeze sim:/tb_headergenerator/fromDaqReg.clientIp 32'h95828854 0
force -freeze sim:/tb_headergenerator/fromDaqReg.activeChannels 8'h09 0
force -freeze sim:/tb_headergenerator/fromDaqReg.relayMask 32'h91817161 0

