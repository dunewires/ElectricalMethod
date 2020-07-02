######################################################################
#
# File name : headerFmtCompile.do
# Created on: Wed Jul 1 14:47:29 EDT 2020
#
######################################################################
vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xbip_utils_v3_0_10
vlib modelsim_lib/msim/axi_utils_v2_0_6
vlib modelsim_lib/msim/xbip_pipe_v3_0_6
vlib modelsim_lib/msim/xbip_bram18k_v3_0_6
vlib modelsim_lib/msim/mult_gen_v12_0_16
vlib modelsim_lib/msim/xbip_dsp48_addsub_v3_0_6
vlib modelsim_lib/msim/xbip_dsp48_multadd_v3_0_6
vlib modelsim_lib/msim/dds_compiler_v6_0_19
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/duneDwa

vmap xbip_utils_v3_0_10 modelsim_lib/msim/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 modelsim_lib/msim/axi_utils_v2_0_6
vmap xbip_pipe_v3_0_6 modelsim_lib/msim/xbip_pipe_v3_0_6
vmap xbip_bram18k_v3_0_6 modelsim_lib/msim/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 modelsim_lib/msim/mult_gen_v12_0_16
vmap xbip_dsp48_addsub_v3_0_6 modelsim_lib/msim/xbip_dsp48_addsub_v3_0_6
vmap xbip_dsp48_multadd_v3_0_6 modelsim_lib/msim/xbip_dsp48_multadd_v3_0_6
vmap dds_compiler_v6_0_19 modelsim_lib/msim/dds_compiler_v6_0_19
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap duneDwa modelsim_lib/msim/duneDwa

vcom -64 -93 -work xbip_utils_v3_0_10  \
"../source/cores/ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -64 -93 -work axi_utils_v2_0_6  \
"../source/cores/ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -64 -93 -work xbip_pipe_v3_0_6  \
"../source/cores/ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -64 -93 -work xbip_bram18k_v3_0_6  \
"../source/cores/ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -64 -93 -work mult_gen_v12_0_16  \
"../source/cores/ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -64 -93 -work xbip_dsp48_addsub_v3_0_6  \
"../source/cores/ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -64 -93 -work xbip_dsp48_multadd_v3_0_6  \
"../source/cores/ipstatic/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -64 -93 -work dds_compiler_v6_0_19  \
"../source/cores/ipstatic/hdl/dds_compiler_v6_0_vh_rfs.vhd" \

vcom -64 -93 -work xil_defaultlib  \
"../source/cores/ipMicrozed/dds_compiler_1khz/sim/dds_compiler_1khz.vhd" \
"../source/cores/ipMicrozed/fifo_autoDatacollection/fifo_autoDatacollection_sim_netlist.vhdl" \

vcom -64 -2008 -work duneDwa  \
"../source/packages/global_def.vhd" \
"../source/hdl/dacInterface.vhd" \
"../source/hdl/wtaController.vhd" \
"../source/hdl/adc_dds_io.vhd" \
"../source/hdl/adcReadout.vhd" \
"../source/hdl/top_tension_analyzer.vhd" \
"./source/tb_adc_emu.vhd" \

# compile glbl module
vlog -work duneDwa "glbl.v"

