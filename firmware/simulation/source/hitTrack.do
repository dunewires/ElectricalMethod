set scripts /home/nate/projects/atlas/mmtp/firmware/scripts/simulation/
########################

set simData /home/nate/projects/atlas/mmtp/software/python/GBT_packets
#set simFile  $simData/GBT_packet_custom_test
#set simFile  $simData/GBT_packet_up_centers_upper_nf_0_flx
#set simFile  $simData/GBT_packet_up_centers_upper
#set simFile  $simData/GBT_packet_l1a_single
#set simFile  $simData/GBT_packet_recab_single
#set simFile  $simData/../../simData/recable_01.txt
set simFile  $simData/../../simData/recable_rate.txt

# TP Results output 
set ancGbtDataFile $simData/ancGbtData.txt
set ancHitDataFile  $simData/ancHitData.txt
set ancTrackDataFile $simData/ancTrackData.txt
set ancFitterDataFile $simData/ancFitterData.txt

vsim -voptargs="+acc" -L blk_mem_gen_v8_4_1 -L blk_mem_gen_v8_4_0 -L blk_mem_gen_v8_3_6  -L xil_defaultlib -L dist_mem_gen_v8_0_11 -L dist_mem_gen_v8_0_12 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_utils_v3_0_7 -L xbip_pipe_v3_0_3 -L xbip_dsp48_macro_v3_0_14 -L xbip_dsp48_macro_v3_0_14 -L fifo_generator_v13_1_4 -L fifo_generator_v13_2_2 -L fifo_generator_v13_2_3 -L  xbip_bram18k_v3_0_3  -L mult_gen_v12_0_13 -L mult_gen_v12_0_14 -L ATLAS_MMTP -L unisims_ver -L unimacro_ver -L secureip -L xpm -lib xil_defaultlib ATLAS_MMTP.tb_axi_file_io ATLAS_MMTP.glbl -Gsim_file=$simFile -Ganc_gbt_data_file=$ancGbtDataFile -Ganc_hit_data_file=$ancHitDataFile -Ganc_track_data_file=$ancTrackDataFile -Ganc_fitter_data_file=$ancFitterDataFile

  do $scripts/user/nate/mmtppForce.do
 do $scripts/user/nate/mmtppWave.do


