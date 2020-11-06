set scripts ./scripts/
########################

set simData ./simData
set resultsData ./resultsData
set simFile  $simData/recable_01.txt

vsim -voptargs="+acc" -L xbip_utils_v3_0_10 -L blk_mem_gen_v8_4_4 -L axi_utils_v2_0_6 -L xbip_pipe_v3_0_6 -L xbip_bram18k_v3_0_6 -L mult_gen_v12_0_16 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_dsp48_addsub_v3_0_6 -L xbip_dsp48_multadd_v3_0_6 -L dds_compiler_v6_0_19 -L xil_defaultlib -L duneDwa -L unisims_ver -L unimacro_ver -L secureip -L xpm -lib xil_defaultlib duneDwa.tb_adc_emu duneDwa.glbl 
# start wave before force to catch anything that happens there
 do $scripts/headerMnsWave.do
 do $scripts/headerMnsForce.do
 run 10us
