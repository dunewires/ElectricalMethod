vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_8
vlib activehdl/processing_system7_vip_v1_0_10
vlib activehdl/xil_defaultlib
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/fifo_generator_v13_2_5
vlib activehdl/axi_data_fifo_v2_1_21
vlib activehdl/axi_register_slice_v2_1_22
vlib activehdl/axi_protocol_converter_v2_1_22

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 activehdl/axi_vip_v1_1_8
vmap processing_system7_vip_v1_0_10 activehdl/processing_system7_vip_v1_0_10
vmap xil_defaultlib activehdl/xil_defaultlib
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_5 activehdl/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_21 activehdl/axi_data_fifo_v2_1_21
vmap axi_register_slice_v2_1_22 activehdl/axi_register_slice_v2_1_22
vmap axi_protocol_converter_v2_1_22 activehdl/axi_protocol_converter_v2_1_22

vlog -work xilinx_vip  -sv2k12 "+incdir+/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"/bulkDrive/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/bulkDrive/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/bulkDrive/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/bulkDrive/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/bulkDrive/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/bulkDrive/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/bulkDrive/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/bulkDrive/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/bulkDrive/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/ec67/hdl" "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/34f8/hdl" "+incdir+/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/bulkDrive/tools/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/ec67/hdl" "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/34f8/hdl" "+incdir+/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -sv2k12 "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/ec67/hdl" "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/34f8/hdl" "+incdir+/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_10  -sv2k12 "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/ec67/hdl" "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/34f8/hdl" "+incdir+/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/ec67/hdl" "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/34f8/hdl" "+incdir+/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/dwa_ps_bd/ip/dwa_ps_bd_processing_system7_0_0/sim/dwa_ps_bd_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/dwa_ps_bd/ip/dwa_ps_bd_rst_ps7_0_100M_1/sim/dwa_ps_bd_rst_ps7_0_100M_1.vhd" \
"../../../bd/dwa_ps_bd/sim/dwa_ps_bd.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/ec67/hdl" "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/34f8/hdl" "+incdir+/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/ec67/hdl" "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/34f8/hdl" "+incdir+/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/ec67/hdl" "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/34f8/hdl" "+incdir+/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  -v2k5 "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/ec67/hdl" "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/34f8/hdl" "+incdir+/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  -v2k5 "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/ec67/hdl" "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/34f8/hdl" "+incdir+/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_22  -v2k5 "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/ec67/hdl" "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/34f8/hdl" "+incdir+/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/ec67/hdl" "+incdir+../../../../dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ipshared/34f8/hdl" "+incdir+/home/tools/bulkDrive/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/dwa_ps_bd/ip/dwa_ps_bd_auto_pc_0/sim/dwa_ps_bd_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

