
#---------------------------------------------------------
# MMTP project import source list for MMTP core VHDL and IP
# 
#---------------------------------------------------------
#---------------------------------------------------------

# --------------------------------------------------------------------------
#                  vhdl sources
# --------------------------------------------------------------------------
set mmtpVhdl {
    ATLAS_MMTP {$proj_sources_dir/packages/global_def.vhd
	        $proj_sources_dir/packages/lppc_custom_fn_pkg.vhd
	        $proj_sources_dir/hdl/common/standard_mux16.vhd
                $proj_sources_dir/hdl/common/mux16_vector9.vhd
                $proj_sources_dir/hdl/common/mux16_nibb.vhd
                $proj_sources_dir/hdl/common/mux16_1.vhd
                $proj_sources_dir/hdl/common/mux16_3.vhd
                $proj_sources_dir/hdl/common/mux16_10.vhd
                $proj_sources_dir/hdl/common/mux16_roads.vhd
                $proj_sources_dir/hdl/common/data_collector_hits.vhd
                $proj_sources_dir/hdl/common/data_collector_track.vhd
                $proj_sources_dir/hdl/common/data_collector_fitter.vhd
                $proj_sources_dir/hdl/common/rr_fifo_collector_elink.vhd
                $proj_sources_dir/hdl/common/monitoring_gbt_pkts.vhd
                $proj_sources_dir/hdl/gbtDecode/gbt_decode_priority_encode_cell.vhd
                $proj_sources_dir/hdl/gbtDecode/gbt_decode_priority_encode.vhd
                $proj_sources_dir/hdl/gbtDecode/gbt_decode_priority_select.vhd
                $proj_sources_dir/hdl/gbtDecode/gbt_decode_calc_slope.vhd
                $proj_sources_dir/hdl/gbtDecode/gbt_decode.vhd
                $proj_sources_dir/hdl/finder/fifo_hit_buff.vhd
                $proj_sources_dir/hdl/finder/srfind_hit_buff.vhd
                $proj_sources_dir/hdl/finder/srfind_hit_mark.vhd
                $proj_sources_dir/hdl/finder/srfind_roads.vhd
                $proj_sources_dir/hdl/finder/srfind_cointrig_priority_3select.vhd
                $proj_sources_dir/hdl/finder/srfind_cointrig_priority_3row.vhd
                $proj_sources_dir/hdl/finder/srfind_get_stereo_roads_romsel.vhd
                $proj_sources_dir/hdl/finder/srfind_cointrig_priority.vhd
                $proj_sources_dir/hdl/finder/srfind_cointrig.vhd
                $proj_sources_dir/hdl/finder/top_srfind.vhd
                $proj_sources_dir/hdl/fitter/xip_avg.vhd
                $proj_sources_dir/hdl/fitter/bin_tree_add.vhd
                $proj_sources_dir/hdl/fitter/bin_tree_avg_s.vhd
                $proj_sources_dir/hdl/fitter/calc_roi_struct.vhd
                $proj_sources_dir/hdl/fitter/calc_mx_local_behav.vhd
                $proj_sources_dir/hdl/fitter/calc_dtheta.vhd
                $proj_sources_dir/hdl/fitter/track_can_priority.vhd
                $proj_sources_dir/hdl/fitter/top_fitter.vhd
                $proj_sources_dir/hdl/common/lat_art_pipeline.vhd
	        $proj_sources_dir/hdl/top_mmtpp_struct.vhd}
}
# --------------------------------------------------------------------------
#                 Xilinx IP
# --------------------------------------------------------------------------
# use read_ip to keep ip in sources directory

set mmtpIp {
     xil_defaultlib {$proj_sources_dir/cores/ip/blk_mem_gen_mxlocalC_L/blk_mem_gen_mxlocalC_L.xci
                $proj_sources_dir/cores/ip/blk_mem_gbt_pkt_delay/blk_mem_gbt_pkt_delay.xci
                $proj_sources_dir/cores/ip/dist_mem_16_14/dist_mem_16_14.xci
                $proj_sources_dir/cores/ip/dist_mem_16_16/dist_mem_16_16.xci
                $proj_sources_dir/cores/ip/dist_mem_stereo_select_7/dist_mem_stereo_select_7.xci
                $proj_sources_dir/cores/ip/dsp48_add_mult_no_out_reg/dsp48_add_mult_no_out_reg.xci
                $proj_sources_dir/cores/ip/dsp48_add_mult_px/dsp48_add_mult_px.xci
                $proj_sources_dir/cores/ip/dsp48_mcalc_add/dsp48_mcalc_add.xci
                $proj_sources_dir/cores/ip/dsp48_mcalc_mult/dsp48_mcalc_mult.xci
                $proj_sources_dir/cores/ip/fifo_w128_r32_d16/fifo_w128_r32_d16.xci
                $proj_sources_dir/cores/ip/fifo_w4_r4_d16/fifo_w4_r4_d16.xci
                $proj_sources_dir/cores/ip/fifo_w16_r16_d16/fifo_w16_r16_d16.xci
                $proj_sources_dir/cores/ip/fifo_dc_w16_r16_d16/fifo_dc_w16_r16_d16.xci
                $proj_sources_dir/cores/ip/fifo_dc_w128_r32_d16/fifo_dc_w128_r32_d16.xci
                $proj_sources_dir/cores/ip/fifo_w256_r32/fifo_w256_r32.xci
                $proj_sources_dir/cores/ip/fifo_w32_r128/fifo_w32_r128.xci
                $proj_sources_dir/cores/ip_horx/fifo_w32_r32_d16/fifo_w32_r32_d16.xci
                $proj_sources_dir/cores/ip_horx/fifo_pkt_collector/fifo_pkt_collector.xci
                $proj_sources_dir/cores/ip/mult_S16_U16_32/mult_S16_U16_32.xci
                $proj_sources_dir/cores/ip/mult_U16_U16_32/mult_U16_U16_32.xci
                $proj_sources_dir/cores/ip/mult_u14_u16_16/mult_u14_u16_16.xci
                $proj_sources_dir/cores/ip/rom_d_theta_mx_recip/rom_d_theta_mx_recip.xci
                $proj_sources_dir/cores/ip/rom_roi_map/rom_roi_map.xci
                $proj_sources_dir/cores/ip/blk_mem_gen_mxlocalC_CRTS/blk_mem_gen_mxlocalC_CRTS.xci
                $proj_sources_dir/cores/ip_horx/blk_mem_gen_mxlocalC_L/blk_mem_gen_mxlocalC_L.xci
                $proj_sources_dir/cores/ip/xbip_axb_pcin_regout/xbip_axb_pcin_regout.xci
                $proj_sources_dir/cores/ip/xbip_axb_pcout_no_regout/xbip_axb_pcout_no_regout.xci
                $proj_sources_dir/cores/ip/clk40_pll/clk40_pll.xci
                $proj_sources_dir/cores/ip/mmcm_usr_clk/mmcm_usr_clk.xci}
}


#Vivado generated script uses 2 sim files and an include directory for the clock IP
#glbl.v is needed for the set/reset verlog simulation

set mmtpSimIp {
xil_defaultlib {$proj_sources_dir/cores/ip/blk_mem_gbt_pkt_delay/sim/blk_mem_gbt_pkt_delay.v
                $proj_sources_dir/cores/ip/blk_mem_gen_mxlocalC_CRTS/sim/blk_mem_gen_mxlocalC_CRTS.v
                $proj_sources_dir/cores/ip_horx/blk_mem_gen_mxlocalC_L/sim/blk_mem_gen_mxlocalC_L.v
                +incdir+$proj_sources_dir/cores/ip/clk40_pll\ $proj_sources_dir/cores/ip/clk40_pll/clk40_pll_clk_wiz.v\ $proj_sources_dir/cores/ip/clk40_pll/clk40_pll.v
                $proj_sources_dir/cores/ip/dist_mem_16_14/sim/dist_mem_16_14.v
                $proj_sources_dir/cores/ip/dist_mem_16_16/sim/dist_mem_16_16.v
                $proj_sources_dir/cores/ip/dist_mem_stereo_select_7/sim/dist_mem_stereo_select_7.v
                $proj_sources_dir/cores/ip/dsp48_add_mult_no_out_reg/sim/dsp48_add_mult_no_out_reg.vhd
                $proj_sources_dir/cores/ip/dsp48_add_mult_px/sim/dsp48_add_mult_px.vhd
                $proj_sources_dir/cores/ip/dsp48_mcalc_add_mult/sim/dsp48_mcalc_add_mult.vhd 
                $proj_sources_dir/cores/ip/dsp48_mcalc_add/sim/dsp48_mcalc_add.vhd 
                $proj_sources_dir/cores/ip/dsp48_mcalc_mult/sim/dsp48_mcalc_mult.vhd 
                $proj_sources_dir/cores/ip/fifo_w128_r32_d16/sim/fifo_w128_r32_d16.v
                $proj_sources_dir/cores/ip/fifo_w16_r16_d16/sim/fifo_w16_r16_d16.v
                $proj_sources_dir/cores/ip_horx/fifo_dc_w16_r16_d16/sim/fifo_dc_w16_r16_d16.v
                $proj_sources_dir/cores/ip_horx/fifo_dc_w128_r32_d16/sim/fifo_dc_w128_r32_d16.v
                $proj_sources_dir/cores/ip_horx/fifo_dc_w32_r32_d16/sim/fifo_dc_w32_r32_d16.v
                $proj_sources_dir/cores/ip/fifo_w256_r32/sim/fifo_w256_r32.v
                $proj_sources_dir/cores/ip/fifo_w32_r128/sim/fifo_w32_r128.v
                $proj_sources_dir/cores/ip/fifo_w32_r128_dr32k/sim/fifo_w32_r128_dr32k.v
                $proj_sources_dir/cores/ip_horx/fifo_w32_r32_d16/sim/fifo_w32_r32_d16.v
                $proj_sources_dir/cores/ip_horx/fifo_pkt_collector/sim/fifo_pkt_collector.v
                $proj_sources_dir/cores/ip_horx/fifo_lat_art_pipeline/sim/fifo_lat_art_pipeline.v
                $proj_sources_dir/cores/ip/fifo_w4_r4_d16/sim/fifo_w4_r4_d16.v
                $proj_sources_dir/cores/ip/mult_S16_U16_32/sim/mult_S16_U16_32.vhd
                $proj_sources_dir/cores/ip/mult_U16_U16_32/sim/mult_U16_U16_32.vhd
                $proj_sources_dir/cores/ip/mult_u14_u16_16/sim/mult_u14_u16_16.vhd
                $proj_sources_dir/cores/ip/rom_d_theta_mx_recip/sim/rom_d_theta_mx_recip.v
                $proj_sources_dir/cores/ip/rom_roi_map/sim/rom_roi_map.v
                $proj_sources_dir/cores/ip/xbip_axb_pcin_regout/sim/xbip_axb_pcin_regout.vhd
                $proj_sources_dir/cores/ip/xbip_axb_pcout_no_regout/sim/xbip_axb_pcout_no_regout.vhd
                +incdir+$proj_sources_dir/cores/ip/clk_mmfe_sync\ $proj_sources_dir/cores/ip/clk_mmfe_sync/clk_mmfe_sync_clk_wiz.v\ $proj_sources_dir/cores/ip/clk_mmfe_sync/clk_mmfe_sync.v
                $proj_sources_dir/cores/ip/fifo_w64_r32_d16/sim/fifo_w64_r32_d16.v}
}

set hwCommonVhdl {
    ATLAS_MMTP   {$proj_sources_dir/hdl/common/data_collector_scint_timestamp.vhd
                  $proj_sources_dir/hdl/common/mmtp_ctrl.vhd}
}

set hwVc707Vhdl {
    ATLAS_MMTP   {}
}

set hwHorxVhdl {
    ATLAS_MMTP   {}
}

set mmtpSimVhdl {
    ATLAS_MMTP {$proj_sources_dir/simulation/axi_file_io.vhd
                $proj_sources_dir/simulation/tb_axi_file_io.vhd}
}


