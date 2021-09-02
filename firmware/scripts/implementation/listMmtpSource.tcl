
#---------------------------------------------------------
# MMTP project import source list for MMTP core VHDL and IP
# 
#---------------------------------------------------------
#---------------------------------------------------------

# --------------------------------------------------------------------------
#                  vhdl sources
# --------------------------------------------------------------------------
set dwaVhdl {
    ATLAS_MMTP {$proj_sources_dir/packages/global_def.vhd
                $proj_sources_dir/packages/trigPhaseDelPack.vhd
                $proj_sources_dir/hdl/triggerMains.vhd
                $proj_sources_dir/hdl/wtaController.vhd
                $proj_sources_dir/hdl/adcReadout.vhd
                $proj_sources_dir/hdl/dacInterface.vhd
                $proj_sources_dir/hdl/dpotInterface.vhd
                $proj_sources_dir/hdl/top_tension_analyzer.vhd
                $proj_sources_dir/hdl/dwa_registers_v1_0_S00_AXI.vhd
                $proj_sources_dir/hdl/dwa_ps_pl_top.vhd}
}
# --------------------------------------------------------------------------
#                 Xilinx IP
# --------------------------------------------------------------------------
# use read_ip to keep ip in sources directory

set xilinxIpHdl {
     xil_defaultlib {$proj_sources_dir/cores/ipMicrozed/blkMem_mainsAvg/sim/blkMem_mainsAvg.v
                +incdir+$proj_sources_dir/cores/ipMicrozed/clk_sysclk_mmcm\ $proj_sources_dir/cores/ipMicrozed/clk_sysclk_mmcm/clk_sysclk_mmcm_clk_wiz.v\ $proj_sources_dir/cores/ipMicrozed/clk_sysclk_mmcm/clk_sysclk_mmcm.v
                    $proj_sources_dir/cores/ipMicrozed/vio_ctrl/sim/vio_ctrl.vhd
                    $proj_sources_dir/cores/ipMicrozed/fifo_autoDatacollection/sim/fifo_autoDatacollection.v
                    $proj_sources_dir/cores/ipMicrozed/ila_xadc/sim/ila_xadc.vhd
                    $proj_sources_dir/cores/ipMicrozed/ila_xadc_big/sim/ila_xadc_big.vhd
                    $proj_sources_dir/cores/ipMicrozed/xadc_senseWire/sim/xadc_senseWire.v
                }
}


#Vivado generated script uses 2 sim files and an include directory for the clock IP
#glbl.v is needed for the set/reset verlog simulation

set xilinxIp {
xil_defaultlib {$proj_sources_dir/cores/ipMicrozed/blkMem_mainsAvg/blkMem_mainsAvg.xci
                    $proj_sources_dir/cores/ipMicrozed/clk_sysclk_mmcm/clk_sysclk_mmcm.xci
                    $proj_sources_dir/cores/ipMicrozed/vio_ctrl/vio_ctrl.xci
                    $proj_sources_dir/cores/ipMicrozed/fifo_autoDatacollection/fifo_autoDatacollection.xci
                    $proj_sources_dir/cores/ipMicrozed/ila_xadc/ila_xadc.xci
                    $proj_sources_dir/cores/ipMicrozed/ila_xadc_big/ila_xadc_big.xci
                    $proj_sources_dir/cores/ipMicrozed/xadc_senseWire/xadc_senseWire.xci}
}

set SimVhdl {
    ATLAS_MMTP {$proj_sources_dir/simulation/adc_file_io.vhd
                $proj_sources_dir/simulation/tb_dwa_file_io.vhd}
}


