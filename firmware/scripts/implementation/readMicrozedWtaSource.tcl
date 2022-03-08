#source files for VC707 MMTP

# --------------------------------------------------------------------------
#                  vhdl sources
# --------------------------------------------------------------------------
# platform specific


read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/packages/global_def.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/packages/trigPhaseCorr.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/wtaController.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/ledCheck.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/bandPassClkGen.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/adc_dds_io.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/adcReadout.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/triggerMains.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/mainsNoiseCorrection.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/serialPromInterface.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/wireRelayInterface.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/dacInterface.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/dpotInterface.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/headerGenerator.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/ledCheck.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/top_tension_analyzer.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/dwa_registers_v1_0_S00_AXI.vhd
read_vhdl -vhdl2008 -library duneDwa $proj_sources_dir/hdl/dwa_ps_pl_top.vhd

# --------------------------------------------------------------------------
#                  constraints
# --------------------------------------------------------------------------
read_xdc -verbose $proj_sources_dir/constraints/tensionAnalyzerMicrozedPl.xdc

# --------------------------------------------------------------------------
#                 Custom DCP
# --------------------------------------------------------------------------
# design checkpoint for PS BD
read_checkpoint $proj_sources_dir/cores/checkpoints/dwa_ps_bd.dcp
# --------------------------------------------------------------------------
#                 Xilinx IP
# --------------------------------------------------------------------------
# IP for scint timestamp
read_ip $proj_sources_dir/cores/ipMicrozed/dds_compiler_1khz/dds_compiler_1khz.xci
read_ip $proj_sources_dir/cores/ipMicrozed/blkMem_mainsAvg/blkMem_mainsAvg.xci
read_ip $proj_sources_dir/cores/ipMicrozed/bram_sdp_18x8k/bram_sdp_18x8k.xci
read_ip $proj_sources_dir/cores/ipMicrozed/clk_sysclk_mmcm/clk_sysclk_mmcm.xci
read_ip $proj_sources_dir/cores/ipMicrozed/vio_ctrl/vio_ctrl.xci
read_ip $proj_sources_dir/cores/ipMicrozed/fifo_autoDatacollection/fifo_autoDatacollection.xci
read_ip $proj_sources_dir/cores/ipMicrozed/ila_xadc/ila_xadc.xci
read_ip $proj_sources_dir/cores/ipMicrozed/ila_xadc_big/ila_xadc_big.xci
read_ip $proj_sources_dir/cores/ipMicrozed/xadc_senseWire/xadc_senseWire.xci
read_ip $proj_sources_dir/cores/ipMicrozed/ila_4x32/ila_4x32.xci
read_ip $proj_sources_dir/cores/ipMicrozed/clk_dwa_pl/clk_dwa_pl.xci

# read_ip /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ip/dwa_ps_bd_auto_pc_0/dwa_ps_bd_auto_pc_0.xci
# read_ip /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ip/dwa_ps_bd_dwa_registers_0_0/dwa_ps_bd_dwa_registers_0_0.xci
# read_ip /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ip/dwa_ps_bd_processing_system7_0_0/dwa_ps_bd_processing_system7_0_0.xci
# read_ip /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ip/dwa_ps_bd_ps7_0_axi_periph_0/dwa_ps_bd_ps7_0_axi_periph_0.xci
# read_ip /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ip/dwa_ps_bd_rst_ps7_0_100M_0/dwa_ps_bd_rst_ps7_0_100M_0.xci

# --------------------------------------------------------------------------
#                  simulation sources
# --------------------------------------------------------------------------
#add_files  -fileset sim_1 $proj_sources_dir/simulation/axi_file_io.vhd
#add_files  -fileset sim_1 $proj_sources_dir/simulation/tb_axi_file_io.vhd

#set_property library ATLAS_MMTP [get_files  $proj_sources_dir/simulation/axi_file_io.vhd]
#set_property library ATLAS_MMTP [get_files  $proj_sources_dir/simulation/tb_axi_file_io.vhd]
#set_property top tb_axi_file_io [get_filesets sim_1]
