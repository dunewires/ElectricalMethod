#clocks
force -freeze sim:/tb_adc_emu/dwaClk10 1 0, 0 {50 ns} -r 100 ns
force -freeze sim:/tb_adc_emu/dwaClk100 1 0, 0 {5 ns} -r 10 ns

#collect data
force -freeze sim:/tb_adc_emu/top_tension_analyzer_1/regToDwa(0) 32'h00000001 0
force -freeze sim:/tb_adc_emu/regFromDwa_strb(24) 32'h00000000 0
force -freeze sim:/tb_adc_emu/regFromDwa_strb(25) 32'h00000000 0
force -freeze sim:/tb_adc_emu/regFromDwa_strb(26) 32'h00000000 0
force -freeze sim:/tb_adc_emu/regFromDwa_strb(27) 32'h00000000 0
force -freeze sim:/tb_adc_emu/regFromDwa_strb(28) 32'h00000000 0
force -freeze sim:/tb_adc_emu/regFromDwa_strb(29) 32'h00000000 0
force -freeze sim:/tb_adc_emu/regFromDwa_strb(30) 32'h00000000 0
force -freeze sim:/tb_adc_emu/regFromDwa_strb(31) 32'h00000000 0

#DWA config
# freqrec
force -freeze sim:/tb_adc_emu/regToDwa(0) 32'h00008000 0
# ctrl
force -freeze sim:/tb_adc_emu/regToDwa(2) 32'h00000005 0
# min
force -freeze sim:/tb_adc_emu/regToDwa(4) 32'h00000800 0
# max
force -freeze sim:/tb_adc_emu/regToDwa(5) 32'h00000900 0
# step
force -freeze sim:/tb_adc_emu/regToDwa(6) 32'h00000020 0
# stim time
force -freeze sim:/tb_adc_emu/regToDwa(7) 32'h00000008 0
# ctrl start
force -freeze sim:/tb_adc_emu/regToDwa(9) 32'h00000000 0
# adcSamp_nStimPeriod
force -freeze sim:/tb_adc_emu/regToDwa(10) 32'h00000005 0
# adcSamp_nStimPeriodSamp
force -freeze sim:/tb_adc_emu/regToDwa(11) 32'h00000008 0
# stimMag
force -freeze sim:/tb_adc_emu/regToDwa(12) 32'h00000010 0
# relaysEnable
force -freeze sim:/tb_adc_emu/regToDwa(14) 32'h00000000 0

# reset bar
force -freeze sim:/tb_adc_emu/regToDwa(1) 32'h00000000 0
run 10 us
force -freeze sim:/tb_adc_emu/regToDwa(1) 32'h00000001 0
run 10 us

# start signal
force -freeze sim:/tb_adc_emu/regToDwa(9) 32'h00000001 0
run 10 us
force -freeze sim:/tb_adc_emu/regToDwa(9) 32'h00000000 0
