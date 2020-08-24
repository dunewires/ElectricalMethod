onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_axi_file_io/TOP_MMTPP_INST/BCR
add wave -noupdate /tb_axi_file_io/TOP_MMTPP_INST/L1A
add wave -noupdate -expand -group {VMM mask} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/drainOne
add wave -noupdate -expand -group {VMM mask} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/rateCnt(2)(30)
add wave -noupdate -expand -group {VMM mask} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/GBT_PKT_DATA_QUIET_VEC(2)(86)
add wave -noupdate -expand -group {VMM mask} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/GBT_PKT_DATA_VEC(2)(86)
add wave -noupdate -expand -group {VMM mask} -color Red /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/vmmChEn(2)(30)
add wave -noupdate -expand -group {VMM mask} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/vmmOffset
add wave -noupdate -expand -group {VMM mask} -expand -subitemconfig {/tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/vmmChEn(2) -expand} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/vmmChEn
add wave -noupdate -expand -group {VMM mask} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/RX_GBT_PKT_HITMAP
add wave -noupdate -expand -group {VMM mask} -subitemconfig {/tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/rateCnt(2) -expand} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/rateCnt
add wave -noupdate -expand -group {VMM mask} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/hotThreshHyst
add wave -noupdate -expand -group {VMM mask} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/hotThresh
add wave -noupdate -expand -group {VMM mask} -subitemconfig {/tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/GBT_PKT_DATA_VEC(2) -expand} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/GBT_PKT_DATA_VEC
add wave -noupdate -expand -group {VMM mask} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/GBT_PKT_DATA_QUIET_VEC
add wave -noupdate -expand -group {VMM mask} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/drainPeriod
add wave -noupdate -expand -group {VMM mask} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/drainCnt
add wave -noupdate -expand -group {VMM mask} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/bcPhaseCnt
add wave -noupdate -expand -group {VMM mask} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/BCCLK320
add wave -noupdate -expand -group {VMM mask} /tb_axi_file_io/TOP_MMTPP_INST/hot_vmm_mask_inst/BCCLK40
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/TRACK_LATENCY_SHIFT
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/TRACK_DATA_MENCODE
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/TRACK_DATA
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/STEREO_SELECTED_PLANE_ROAD_del3
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/STEREO_SELECTED_PLANE_ROAD_del2
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/STEREO_SELECTED_PLANE_ROAD_del1
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/STEREO_SELECTED_PLANE_ROAD_comb
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/STEREO_SELECTED_PLANE_ROAD
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/STEREO_SEL_VLUT
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/STEREO_SEL_ULUT
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/ROAD_TO_TRACK_LATENCY
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/ROAD_HORIZ_MUX_SEL
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/ROAD_DATA_STRB_LAST
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/ROAD_DATA_STEREO_STRB_comb
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/ROAD_DATA_STEREO_STRB
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/ROAD_DATA_STEREO_SEL_comb
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/ROAD_DATA_STEREO_SEL
add wave -noupdate -group {srfind contrig} -expand /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/ROAD_DATA_ROAD_PLANE
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/ROAD_DATA_HORIZ_STRB
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/ROAD_DATA_HORIZ_SEL_comb
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/ROAD_DATA_HORIZ_SEL
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/ROAD_DATA_BXID
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/ROAD_DATA_BC_PHASE
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/ROAD_DATA_ALL_ROAD_PLANE
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/RESET
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/REGION
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/PE_STEREO_SEL_STRB
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/PE_STEREO_SEL_ROW
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/PE_STEREO_SEL_DIA
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/PE_STEREO_RESET
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/nSTEREO_PE_LOG
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/nSTEREO_PE
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/nSTEREO_MUXIN_LOG
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/nSTEREO_MUXIN
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_SELECTED_STRB_del
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_SELECTED_STRB
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_SELECTED_SEL_del4
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_SELECTED_SEL_del3
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_SELECTED_SEL_del2
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_SELECTED_SEL_del1
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_SELECTED_SEL
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_SELECTED_PLANE_del4
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_SELECTED_PLANE_del3
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_SELECTED_PLANE_del2
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_SELECTED_PLANE_del1
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_SELECTED_PLANE
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_MUXS2_IN
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_MUXS1_OUT_reg
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/HORIZ_MUXS1_OUT
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/DIA_SPAN_LOG
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/DIA_SPAN
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/DIA_INDEX_ALIGN_LATCH
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/DIA_INDEX_ALIGN
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/COIN_TRIG_STEREO_UD_COMB
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/COIN_TRIG_STEREO_LD_COMB
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/COIN_TRIG_STEREO_DONE
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/COIN_TRIG_STEREO_COMB
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/COIN_TRIG_STEREO_CD_COMB
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/COIN_TRIG_STEREO
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/COIN_TRIG_HORIZ_comb
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/COIN_TRIG_HORIZ_BC_END
add wave -noupdate -group {srfind contrig} /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/CLK_MMTPP
add wave -noupdate /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/TRACK_DATA_MENCODE
add wave -noupdate /tb_axi_file_io/TOP_MMTPP_INST/srfind_inst/region_gen(0)/srfind_cointrig_inst/TRACK_DATA
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/TRACK_DATA
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/TRACK_CAN_STRB
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/TRACK_CAN
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/ROI_STRB
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/ROI
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/MX_GLOBAL
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/MXG_STRB
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/MX_ROI_STRB
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/MX_ROI
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/MX_LOCAL_STRB
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/MX_LOCAL
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/MVG_STRB
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/MV_GLOBAL
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/MUG_STRB
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/MU_GLOBAL
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FRAME_FLAG
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FITTER_DATA_STRB
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FITTER_DATA
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/DTHETA_STRB
add wave -noupdate -group {top fitter} -expand /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/DTHETA
add wave -noupdate -group {top fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CLK_MMTPP
add wave -noupdate -group {top fitter} -expand /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/ROI_STRB_del
add wave -noupdate -group {top fitter} -expand /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/ROI_del
add wave -noupdate -group {top fitter} -expand /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/MX_ROI_STRB_del
add wave -noupdate -group {top fitter} -expand /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/MX_ROI_del
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/STRB_CNT
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/MXG_STRB
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/MX_RECIP_int
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/MX_RECIP
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/MX_PROD_int
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/MX_PROD
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/MX_LOCAL_STRB
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/MX_LOCAL
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/MX_GLOBAL_PIPED
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/MX_GLOBAL_PIPE
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/MX_GLOBAL_INT
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/MX_GLOBAL
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/MX_DIFF_PIPE
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/MX_DIFF_INT
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/MX_DIFF
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/DTHETA_STRB
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/DTHETA_int
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/DTHETA
add wave -noupdate -group {calc dtheta} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_DTHETA_INST/CLK_MMTPP
add wave -noupdate -group {calc roi} -expand -group {AVG GEN 2} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/BIN_TREE_AVG_INST_ROIMX/OCC_VECTOR
add wave -noupdate -group {calc roi} -expand -group {AVG GEN 2} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/BIN_TREE_AVG_INST_ROIMX/LEAF_COUNT_RECIP
add wave -noupdate -group {calc roi} -expand -group {AVG GEN 2} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/BIN_TREE_AVG_INST_ROIMX/DATA_SUM
add wave -noupdate -group {calc roi} -expand -group {AVG GEN 2} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/BIN_TREE_AVG_INST_ROIMX/DATA_LEAF
add wave -noupdate -group {calc roi} -expand -group {AVG GEN 2} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/BIN_TREE_AVG_INST_ROIMX/DATA_AVG_INT
add wave -noupdate -group {calc roi} -expand -group {AVG GEN 2} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/BIN_TREE_AVG_INST_ROIMX/DATA_AVG
add wave -noupdate -group {calc roi} -expand -group {AVG GEN 2} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/BIN_TREE_AVG_INST_ROIMX/CLK_MMTPP
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/ROI_STRB
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/ROI_MAP_ADDRESS
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/ROI_MAP_ADDR_MXG_p4
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/ROI_MAP_ADDR_MXG_p3
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/ROI_MAP_ADDR_MXG_p2
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/ROI_MAP_ADDR_MXG_p1
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/ROI_INT
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/ROI
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/MXG_STRB
add wave -noupdate -group {calc roi} -expand /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/MX_ROI_VEC
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/MX_ROI_VALID
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/MX_ROI_STRB
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/MX_ROI_int
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/MX_ROI
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/MX_GLOBAL
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/MVG_STRB
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/MV_GLOBAL
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/MUG_STRB
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/MU_GLOBAL
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/COT_SA_MX_VALID
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/COT_SA_MX
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/COT_SA_MV_VALID
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/COT_SA_MV
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/COT_SA_MU_VALID
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/COT_SA_MU
add wave -noupdate -group {calc roi} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/FIND_ROI_INST/CLK_MMTPP
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/TRACK_DATA
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/TRACK_DATA_STRB
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/MX_LOCAL
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/MX_LOCAL_STRB
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/CLK_MMTPP
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/STRB_CNT
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/OCC_AND_PLANE
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/CY
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/MX_LOCAL_INT
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/MX_LOCAL_C_ROM
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/SUMCY_0
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/SUMCY_01
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/SUMCY_012
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/SUMCY_0123
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/PCOUT_mult1
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/PCOUT_mult3
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/tree_01
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/tree_23
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/tree_0123_int
add wave -noupdate -group {calc mx local} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/TOP_FITTER_1/CALC_MX_LOCAL_INST/tree_0123
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/TRACK_DATA
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/FITTER_DATA
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/FITTER_DATA_STRB
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/mmFitFifoData
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/mmFitFifoDataValid
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/mmFitFifoEf
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/mmFitFifoRen
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/RESET
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/CLK_MMTPP
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/PKT_CTR
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/EVENT_CTR
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/FIFO_WE
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/PKT_DOUT
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/EF
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/FF
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/ERROR_BITS
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/ANC_FITTER_DATA_FF
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/PKT_DONE
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/SET_EF
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/REN_M
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/readoutBusy
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/readoutDone
add wave -noupdate -group {Data Collector Fitter} /tb_axi_file_io/TOP_MMTPP_INST/FIBER_TO_REGION_GEN(0)/data_collector_fitter_inst/nPktWords
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoData
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoDataValid
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoEf
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoRen
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/efifoData
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/efifoWe
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/efifoPfull
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/efifoWclk
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/clkMmtp
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoSel
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoData_reg
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoDataValid_reg
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoEf_reg
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoData_mux
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoDataValid_mux
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoEf_mux
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoDataValid_mux_del
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/readoutStart
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/readoutBusy
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/readoutDone
add wave -noupdate -group {rr Elink} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/incFifoSel
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/GBT_PKT_DATA_VEC
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/L1A_PIPE_BXID
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/L1A_PIPE_DATA
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/L1A_PIPE_VALID
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BCR
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/CLK_MMTPP
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/CLK_BX
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/GBT_PKT_DATA_VEC_del
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BXID_PHASE
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/LAT_FIFO_DIN
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/LAT_FIFO_DOUT
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/LAT_FIFO_FF
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/LAT_FIFO_EF
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/LAT_FIFO_WE
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/LAT_FIFO_RE
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/LAT_FIFO_RST
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BXID_DEL_CNT
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BXID_LAT_GLOBAL
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BXID_ROLLOVER
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BXID_LOCAL
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/ART_FIBER_NUMBER
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BX_PHASE_SYNC
add wave -noupdate -group {l1A pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BX_PHASE_SYNC_DEL
add wave -noupdate /tb_axi_file_io/GBT_PKT_DATA_VEC
add wave -noupdate /tb_axi_file_io/TOP_MMTPP_INST/HIT_MMFE8_PLANE
add wave -noupdate /tb_axi_file_io/L1A
add wave -noupdate /tb_axi_file_io/BCR
add wave -noupdate /tb_axi_file_io/f2e_wren_o
add wave -noupdate /tb_axi_file_io/f2e_hfull_i
add wave -noupdate /tb_axi_file_io/f2e_data_o
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/wr_col_sel
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/ttc_l1a_i
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/col_en
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/ttc_er_i
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/ttc_bcr_i
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/STREAMS
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/snake_wren_ai
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/snake_payload_ai
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/snake_bcid_ai
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/done_a
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_req_win_upper
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_req_win_lower
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_win_lower_cnt
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_win_upper_cnt
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_cnt
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_bcid_cnt
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/ROWS
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/reset_i
add wave -noupdate -group l1a_pkt -color Yellow /tb_axi_file_io/l1a_top_1/pkt_rd_en
add wave -noupdate -group l1a_pkt -expand /tb_axi_file_io/l1a_top_1/nempty_a
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/gen_proc(1)/l1a_data_row_u/gen_dcell(0)/l1a_data_cell_u/data_fifo_u/wr_en
add wave -noupdate -group l1a_pkt -color Yellow -expand -subitemconfig {/tb_axi_file_io/l1a_top_1/rd_en_a(0) {-color Yellow -height 17} /tb_axi_file_io/l1a_top_1/rd_en_a(1) {-color Yellow -height 17} /tb_axi_file_io/l1a_top_1/rd_en_a(2) {-color Yellow -height 17} /tb_axi_file_io/l1a_top_1/rd_en_a(3) {-color Yellow -height 17} /tb_axi_file_io/l1a_top_1/rd_en_a(4) {-color Yellow -height 17}} /tb_axi_file_io/l1a_top_1/rd_en_a
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/rd_col_sel_c
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/rd_col_sel
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/pkt_rd_row_sel_c
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/pkt_rd_row_sel
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/pkt_payload
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/pkt_nempty
add wave -noupdate -group l1a_pkt -color Yellow /tb_axi_file_io/l1a_top_1/pkt_en
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/pkt_done
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/pkt_counter
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/PIPELINES
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/PAYLOAD_LEN
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/payload_a
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_win_upper_wren_i
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_win_upper_i
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_win_upper
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_win_lower_wren_i
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_win_lower_i
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_win_lower
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_req_wren
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_req_win_upper_f
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_req_win_lower_f
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_req_rden
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_req_nempty
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_req_full
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_req_empty
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_req_dout
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_req_din
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_req_bcid
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_latency_i
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/l1a_event_cnt
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/HDR_LEN
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/full_a
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/fifo_dout
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/fifo_din
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/f2e_wren_o
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/f2e_hfull_i
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/f2e_data_o
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/counter_a
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/COLS
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/clk320_i
add wave -noupdate -group l1a_pkt /tb_axi_file_io/l1a_top_1/clk40_i
add wave -noupdate /tb_axi_file_io/mon_efifoData
add wave -noupdate /tb_axi_file_io/mon_efifoWe
add wave -noupdate /tb_axi_file_io/mon_efifoClk
add wave -noupdate /tb_axi_file_io/axi_file_io_1/sim_file
add wave -noupdate /tb_axi_file_io/axi_file_io_1/mon_outFileName
add wave -noupdate /tb_axi_file_io/axi_file_io_1/l1a_outFileName
add wave -noupdate /tb_axi_file_io/axi_file_io_1/PLAXI_WDATA
add wave -noupdate /tb_axi_file_io/axi_file_io_1/PLAXI_WSTRB
add wave -noupdate /tb_axi_file_io/axi_file_io_1/PLAXI_AWADDR
add wave -noupdate /tb_axi_file_io/axi_file_io_1/PLAXI_RDATA
add wave -noupdate /tb_axi_file_io/axi_file_io_1/PLAXI_RSTRB
add wave -noupdate /tb_axi_file_io/axi_file_io_1/PLAXI_ARADDR
add wave -noupdate /tb_axi_file_io/axi_file_io_1/PLAXI_ACLK
add wave -noupdate /tb_axi_file_io/axi_file_io_1/l1a_efifoData
add wave -noupdate /tb_axi_file_io/axi_file_io_1/l1a_efifoWe
add wave -noupdate /tb_axi_file_io/axi_file_io_1/l1a_efifoClk
add wave -noupdate /tb_axi_file_io/axi_file_io_1/mon_efifoData
add wave -noupdate /tb_axi_file_io/axi_file_io_1/mon_efifoWe
add wave -noupdate /tb_axi_file_io/axi_file_io_1/mon_efifoClk
add wave -noupdate /tb_axi_file_io/axi_file_io_1/dataread
add wave -noupdate /tb_axi_file_io/axi_file_io_1/datatosave
add wave -noupdate /tb_axi_file_io/axi_file_io_1/linenumber
add wave -noupdate /tb_axi_file_io/axi_file_io_1/ART_DATA_int
add wave -noupdate -group {l1a pipe} -expand /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/LAT_FIFO_WE
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/LAT_FIFO_RST
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/LAT_FIFO_RE
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/LAT_FIFO_FF
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/LAT_FIFO_EF
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/LAT_FIFO_DOUT
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/LAT_FIFO_DIN
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/L1A_PIPE_VALID
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/L1A_PIPE_DATA
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/L1A_PIPE_BXID
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/GBT_PKT_DATA_VEC_del
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/GBT_PKT_DATA_VEC
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/CLK_MMTPP
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/CLK_BX
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BXID_ROLLOVER
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BXID_PHASE
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BXID_LOCAL
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BXID_LAT_GLOBAL
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BXID_DEL_CNT
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BX_SYNC_OK_FIBER_PBIN
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BX_SYNC_OK_FIBER
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BX_PHASE_SYNC_DEL
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BX_PHASE_SYNC
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/BCR
add wave -noupdate -group {l1a pipe} /tb_axi_file_io/TOP_MMTPP_INST/lat_art_pipeline_inst/ART_FIBER_NUMBER
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoData
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoDataValid
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoEf
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoRen
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/efifoData
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/efifoWe
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/efifoPfull
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/efifoWclk
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/clkMmtp
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoSel
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoData_reg
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoDataValid_reg
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoEf_reg
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoData_mux
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoDataValid_mux
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoEf_mux
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/mmFifoDataValid_mux_del
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/readoutStart
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/readoutBusy
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/readoutDone
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/incFifoSel
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/efifoData_comb
add wave -noupdate -group {rr fifo collect} /tb_axi_file_io/TOP_MMTPP_INST/rr_fifo_collector_elink_inst/efifoWe_comb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1582488452 fs} 0} {{Cursor 2} {5361407088 fs} 0} {{Cursor 3} {32791992269 fs} 0} {{Cursor 4} {14950000000 fs} 0}
quietly wave cursor active 4
configure wave -namecolwidth 350
configure wave -valuecolwidth 120
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {13136093636 fs} {15833378119 fs}
