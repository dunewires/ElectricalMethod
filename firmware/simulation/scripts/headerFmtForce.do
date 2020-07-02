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
force -freeze sim:/tb_adc_emu/fromDaqReg.stimPeriodReq 24'h0F0F0F 0
force -freeze sim:/tb_adc_emu/fromDaqReg.stimPeriodMin 24'hABCD12 0
force -freeze sim:/tb_adc_emu/fromDaqReg.stimPeriodMax 24'hDCBA12 0
force -freeze sim:/tb_adc_emu/fromDaqReg.stimPeriodStep 24'hCAFE66 0
force -freeze sim:/tb_adc_emu/fromDaqReg.cyclesPerFreq 24'h00CFCF 0
force -freeze sim:/tb_adc_emu/fromDaqReg.adcSamplesPerCycle 16'h002C 0
force -freeze sim:/tb_adc_emu/fromDaqReg.acStim_mag 12'h023 0
force -freeze sim:/tb_adc_emu/fromDaqReg.clientIp 32'h95828854 0
force -freeze sim:/tb_adc_emu/fromDaqReg.stimTime 24'h718191 0
force -freeze sim:/tb_adc_emu/fromDaqReg.activeChannels 8'h09 0
force -freeze sim:/tb_adc_emu/fromDaqReg.relayMask 32'h91817161 0

force -freeze sim:/tb_adc_emu/fromDaqReg.reset TRUE {20 ns} -cancel {30 ns}
force -freeze sim:/tb_adc_emu/fromDaqReg.ctrlStart TRUE {50 ns} -cancel {60 ns} 
