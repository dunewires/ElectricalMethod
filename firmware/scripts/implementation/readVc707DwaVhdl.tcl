#source files for VC707 MMTP

# --------------------------------------------------------------------------
#                  vhdl sources
# --------------------------------------------------------------------------
# platform specific
#read_vhdl -library ATLAS_MMTP $proj_sources_dir/hdl/jtag_axi.vhd

#read_vhdl -vhdl2008 -library ATLAS_MMTP $proj_sources_dir/hdl/global_def_package.vhd
read_vhdl -vhdl2008 -library ATLAS_MMTP $proj_sources_dir/hdl/top_tension_analyzer_vc707.vhd

# --------------------------------------------------------------------------
#                 Xilinx IP
# --------------------------------------------------------------------------
# IP for scint timestamp
#read_ip $proj_sources_dir/cores/ip/fifo_w64_r32_d16/fifo_w64_r32_d16.xci

# --------------------------------------------------------------------------
#                  simulation sources
# --------------------------------------------------------------------------
#add_files  -fileset sim_1 $proj_sources_dir/simulation/axi_file_io.vhd
#add_files  -fileset sim_1 $proj_sources_dir/simulation/tb_axi_file_io.vhd

#set_property library ATLAS_MMTP [get_files  $proj_sources_dir/simulation/axi_file_io.vhd]
#set_property library ATLAS_MMTP [get_files  $proj_sources_dir/simulation/tb_axi_file_io.vhd]
#set_property top tb_axi_file_io [get_filesets sim_1]
