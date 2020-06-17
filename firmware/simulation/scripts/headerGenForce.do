######################################################################
#
# File name : headerGenForce.do
# Created on: Wed Jun 3 14:47:29 EDT 2020
#
######################################################################
# Emulate parameter value that are usually set by DAQ/DWA
#force -freeze sim:/tb_headergenerator/fromDaqReg.freqMin 24'habcd12 0
#force -freeze sim:/tb_headergenerator/fromDaqReg.freqMax 24'hdcba12 0

# PL signals
force -freeze sim:/tb_headergenerator/internalDwaReg.dataRegister 8'hFF 0
force -freeze sim:/tb_headergenerator/internalDwaReg.runOdometer 24'h000009 0
force -freeze sim:/tb_headergenerator/internalDwaReg.fpgaSerialNum 24'h012345 0
force -freeze sim:/tb_headergenerator/internalDwaReg.firmwareId_date 48'h1406110F0200 0
force -freeze sim:/tb_headergenerator/internalDwaReg.firmwareId_hash 32'h22BCBCBC 0
force -freeze sim:/tb_headergenerator/internalDwaReg.dwaCtrl 24'h0C0C0C 0
force -freeze sim:/tb_headergenerator/internalDwaReg.fixedPeriod 24'h0F0F0F 0
force -freeze sim:/tb_headergenerator/internalDwaReg.stimPeriodMin 24'hABCD12 0
force -freeze sim:/tb_headergenerator/internalDwaReg.stimPeriodMax 24'hDCBA12 0
force -freeze sim:/tb_headergenerator/internalDwaReg.stimPeriodStep 24'hCAFE66 0
force -freeze sim:/tb_headergenerator/internalDwaReg.acStim_mag 24'hDEAD66 0
force -freeze sim:/tb_headergenerator/internalDwaReg.stimTime 24'hBEEF66 0
force -freeze sim:/tb_headergenerator/internalDwaReg.adcAutoDc_chSel 16'h0102 0
force -freeze sim:/tb_headergenerator/internalDwaReg.cyclesPerFreq 24'h00CFCF 0
force -freeze sim:/tb_headergenerator/internalDwaReg.adcSamplesPerCycle 16'h002C 0
force -freeze sim:/tb_headergenerator/internalDwaReg.acStim_mag 12'h023 0
force -freeze sim:/tb_headergenerator/internalDwaReg.clientIp 32'h95828854 0
force -freeze sim:/tb_headergenerator/internalDwaReg.ctrl_stimTime 24'h718191 0
force -freeze sim:/tb_headergenerator/internalDwaReg.activeChannels 8'h09 0
force -freeze sim:/tb_headergenerator/internalDwaReg.relayMask 32'h91817161 0
#
force -freeze sim:/tb_headergenerator/internalDwaReg.stimPeriodActive 24'h647681 0
force -freeze sim:/tb_headergenerator/internalDwaReg.adcSamplingPeriod 24'h424344 0


# PS signals
force -freeze sim:/tb_headergenerator/fromDaqReg.udpPacketCounter 16'h002A 0
#
force -freeze sim:/tb_headergenerator/fromDaqReg.headARen FALSE 0
force -freeze sim:/tb_headergenerator/fromDaqReg.headARen TRUE {101 ns} -cancel {111 ns}
force -freeze sim:/tb_headergenerator/fromDaqReg.headARen TRUE {121 ns} -cancel {151 ns}
force -freeze sim:/tb_headergenerator/fromDaqReg.headARen TRUE {181 ns} -cancel {191 ns}
#
force -freeze sim:/tb_headergenerator/fromDaqReg.headFRen FALSE 0
force -freeze sim:/tb_headergenerator/fromDaqReg.headFRen TRUE {201 ns} -cancel {251 ns}
force -freeze sim:/tb_headergenerator/fromDaqReg.headFRen TRUE {261 ns} -cancel {291 ns}
force -freeze sim:/tb_headergenerator/fromDaqReg.headFRen TRUE {301 ns} -cancel {601 ns}
# ADD MORE STROBES TO READ OUT ALL OF THE F-HEADER LINES
#
force -freeze sim:/tb_headergenerator/fromDaqReg.headCRen FALSE 0
force -freeze sim:/tb_headergenerator/fromDaqReg.headCRen TRUE {371 ns} -cancel {381 ns}
force -freeze sim:/tb_headergenerator/fromDaqReg.headCRen TRUE {401 ns} -cancel {471 ns}

# Clocks
force -freeze sim:/tb_headergenerator/dwaClk100 1 0, 0 {5 ns} -r 10 ns

# other
force -freeze sim:/tb_headergenerator/headAStart true 50ns -cancel 60ns
force -freeze sim:/tb_headergenerator/headFStart true 150ns -cancel 160ns
force -freeze sim:/tb_headergenerator/headCStart true 350ns -cancel 360ns




