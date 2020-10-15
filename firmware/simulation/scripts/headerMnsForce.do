######################################################################
#
# File name : headerFmtForce.do
# Created on: Wed Jul 1 14:47:29 EDT 2020
#
######################################################################
# Clocks
force -freeze sim:/tb_adc_emu/dwaClk100 1 0, 0 {5 ns} -r 10 ns
force -freeze sim:/tb_adc_emu/dwaClk10 1 0, 0 {50 ns} -r 100 ns
# Run sim for 1ns so forced signals come shortly after rising clock edge
run 1ns

# PS signals
force -freeze sim:/tb_adc_emu/fromDaqReg.auto TRUE 0      
force -freeze sim:/tb_adc_emu/fromDaqReg.coilDrive 32'h00000000 0
force -freeze sim:/tb_adc_emu/fromDaqReg.fixedPeriod 24'h0F0F0F 0
force -freeze sim:/tb_adc_emu/fromDaqReg.stimFreqReq 24'h000100 0
force -freeze sim:/tb_adc_emu/fromDaqReg.stimFreqMin 24'h00003D 0
force -freeze sim:/tb_adc_emu/fromDaqReg.stimFreqMax 24'h00003F 0
force -freeze sim:/tb_adc_emu/fromDaqReg.stimFreqStep 24'h000008 0
force -freeze sim:/tb_adc_emu/fromDaqReg.cyclesPerFreq 24'h0000008 0
force -freeze sim:/tb_adc_emu/fromDaqReg.adcSamplesPerCycle 16'h0008 0
force -freeze sim:/tb_adc_emu/fromDaqReg.stimMag 12'h023 0
force -freeze sim:/tb_adc_emu/fromDaqReg.clientIp 32'h95828854 0
force -freeze sim:/tb_adc_emu/fromDaqReg.stimTime 24'h000010 0
force -freeze sim:/tb_adc_emu/fromDaqReg.activeChannels 8'h09 0
force -freeze sim:/tb_adc_emu/fromDaqReg.relayMask 32'h91817161 0
force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/fromDaqReg.senseWireGain(7) 8'h00 0
force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/fromDaqReg.senseWireGain(6) 8'h00 0
force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/fromDaqReg.senseWireGain(5) 8'h00 0
force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/fromDaqReg.senseWireGain(4) 8'h01 0
force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/fromDaqReg.senseWireGain(3) 8'h64 0
force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/fromDaqReg.senseWireGain(2) 8'h63 0
force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/fromDaqReg.senseWireGain(1) 8'h62 0
force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/fromDaqReg.senseWireGain(0) 8'h61 0

force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/fromDaqReg.noiseFreqMin 24'h0003B0 0 
force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/fromDaqReg.noiseFreqMax 24'h000400 0 
# 1 Hz
force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/fromDaqReg.noiseFreqStep 24'h000010 0 
# 32 samp / cycle @ 60 Hz
# force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/fromDaqReg.noiseSampPer 24'h00CB73 0 
force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/fromDaqReg.noiseSampPer 24'h000100 0 
force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/fromDaqReg.noiseNCnv 24'h000004 0 

# set reset and start
force -freeze sim:/tb_adc_emu/fromDaqReg.reset true 20ns -cancel 30ns
force -freeze sim:/tb_adc_emu/mainsSquare 0 0
force -freeze sim:/tb_adc_emu/fromDaqReg.ctrlStart true 100ns -cancel 110ns
force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/mainsTrig 1 0, 0 {10000000 fs} -r 1000ns

