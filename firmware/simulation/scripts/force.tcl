#clocks
add_force {/tb_adc_emu/top_tension_analyzer_1/S_AXI_ACLK_10} -radix hex {1 0ns} {0 50000ps} -repeat_every 100000ps
add_force {/tb_adc_emu/top_tension_analyzer_1/S_AXI_ACLK_100} -radix hex {1 0ns} {0 5000ps} -repeat_every 10000ps
#collect data
add_force {/tb_adc_emu/regFromDwa_strb[24]} -radix hex {0 0ns}
add_force {/tb_adc_emu/regFromDwa_strb[25]} -radix hex {0 0ns}
add_force {/tb_adc_emu/regFromDwa_strb[26]} -radix hex {0 0ns}
add_force {/tb_adc_emu/regFromDwa_strb[27]} -radix hex {0 0ns}
add_force {/tb_adc_emu/regFromDwa_strb[28]} -radix hex {0 0ns}
add_force {/tb_adc_emu/regFromDwa_strb[29]} -radix hex {0 0ns}
add_force {/tb_adc_emu/regFromDwa_strb[30]} -radix hex {0 0ns}
add_force {/tb_adc_emu/regFromDwa_strb[31]} -radix hex {0 0ns}
#DWA config
#freqrec
add_force {/tb_adc_emu/regToDwa[0]} -radix hex {00008000 0ns}
#ctrl
add_force {/tb_adc_emu/regToDwa[2]} -radix hex {00000005 0ns}
#min
add_force {/tb_adc_emu/regToDwa[4]} -radix hex {00000800 0ns}
#max
add_force {/tb_adc_emu/regToDwa[5]} -radix hex {900 0ns}
#step
add_force {/tb_adc_emu/regToDwa[6]} -radix hex {20 0ns}
#stim time
add_force {/tb_adc_emu/regToDwa[7]} -radix hex {8 0ns}
#adc nsamples
add_force {/tb_adc_emu/regToDwa[8]} -radix hex {10 0ns}
#ctrl start
add_force {/tb_adc_emu/regToDwa[9]} -radix hex {0 0ns}
#chansel
add_force {/tb_adc_emu/regToDwa[10]} -radix hex {7 0ns}
#hscale
add_force {/tb_adc_emu/regToDwa[11]} -radix hex {1d 0ns}
#stimMag
add_force {/tb_adc_emu/regToDwa[12]} -radix hex {10 0ns}
#relaysEnable
add_force {/tb_adc_emu/regToDwa[14]} -radix hex {0 0ns}
#reset bar
add_force {/tb_adc_emu/regToDwa[1]} -radix hex {0 0ns}
run 10 us
add_force {/tb_adc_emu/regToDwa[1]} -radix hex {1 0ns}
run 10 us
#start signal
add_force {/tb_adc_emu/regToDwa[9]} -radix hex {1 0ns}
run 10 us
add_force {/tb_adc_emu/regToDwa[9]} -radix hex {0 0ns}
