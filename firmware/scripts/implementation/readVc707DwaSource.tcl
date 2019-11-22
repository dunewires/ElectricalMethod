#source files for VC707 MMTP

# --------------------------------------------------------------------------
#                  vhdl sources
# --------------------------------------------------------------------------
# platform specific
#read_vhdl -library ATLAS_MMTP $proj_sources_dir/hdl/jtag_axi.vhd

#read_vhdl -vhdl2008 -library ATLAS_MMTP $proj_sources_dir/hdl/global_def_package.vhd
read_vhdl -vhdl2008 -library duneWta $proj_sources_dir/hdl/wtaController.vhd
read_vhdl -vhdl2008 -library duneWta $proj_sources_dir/hdl/top_tension_analyzer_vc707.vhd


# --------------------------------------------------------------------------
#                  constraints
# --------------------------------------------------------------------------
read_xdc -verbose $proj_sources_dir/constraints/system.xdc

# --------------------------------------------------------------------------
#                 Xilinx IP
# --------------------------------------------------------------------------
# IP for scint timestamp
read_ip $proj_sources_dir/cores/ip/clk_sysclk_mmcm/clk_sysclk_mmcm.xci
read_ip $proj_sources_dir/cores/ip/vio_ctrl/vio_ctrl.xci
read_ip $proj_sources_dir/cores/ip/fifo_autoDatacollection/fifo_autoDatacollection.xci
read_ip $proj_sources_dir/cores/ip/fifo_adcData/fifo_adcData.xci
read_ip $proj_sources_dir/cores/ip/ila_xadc/ila_xadc.xci
read_ip $proj_sources_dir/cores/ip/ila_xadc_big/ila_xadc_big.xci
read_ip $proj_sources_dir/cores/ip/xadc_senseWire/xadc_senseWire.xci

# --------------------------------------------------------------------------
#                  simulation sources
# --------------------------------------------------------------------------
#add_files  -fileset sim_1 $proj_sources_dir/simulation/axi_file_io.vhd
#add_files  -fileset sim_1 $proj_sources_dir/simulation/tb_axi_file_io.vhd

#set_property library ATLAS_MMTP [get_files  $proj_sources_dir/simulation/axi_file_io.vhd]
#set_property library ATLAS_MMTP [get_files  $proj_sources_dir/simulation/tb_axi_file_io.vhd]
#set_property top tb_axi_file_io [get_filesets sim_1]
