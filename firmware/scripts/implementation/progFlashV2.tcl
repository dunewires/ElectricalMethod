#Script Configuration from build script

# set program flash offset
#flash offset is 1/2 what was set in the bootloader 
# eg if the flash MB offset is 0x60000000, and 
# the bootloader is set to 0x61800000,
# the flash offset set in the write_cfgmem is set to 0x00c00000
#set flashOfst 0x00c00000
set scriptPath [file dirname [file normalize [info script]]]

set fsbl_elf $scriptPath/../../source/dwa_ps/vittis/dwaPsHw/export/dwaPsHw/sw/dwaPsHw/boot/fsbl.elf
set lwip_elf $scriptPath/../../source/dwa_ps/vittis/dwaPsSw/Release/dwaPsSw.elf
set boot_bin $scriptPath/../../flash/BOOT.bin

open_hw_manager
connect_hw_server -url localhost:3121 -allow_non_jtag
 ## t #jeff
    #current_hw_target [get_hw_targets */xilinx_tcf/Xilinx/00001c726cd801]
    #set_property PARAM.FREQUENCY 6000000 [get_hw_targets */xilinx_tcf/Xilinx/00001c726cd801]
 ## t if there is only one cable

	current_hw_target [get_hw_targets *]
	set_property PARAM.FREQUENCY 6000000 [get_hw_targets *]

open_hw_target
current_hw_device [get_hw_devices xc7z020_1]
create_hw_cfgmem -hw_device [lindex [get_hw_devices xc7z020_1] 0] [lindex [get_cfgmem_parts {s25fl128s-1.8v-qspi-x1-single}] 0]
set_property PROGRAM.ADDRESS_RANGE  {use_file} [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices xc7z020_1] 0]]
set_property PROGRAM.FILES $boot_bin [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices xc7z020_1] 0]]
set_property PROGRAM.BIN_OFFSET {0} [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices xc7z020_1] 0]]
#set_property PROGRAM.ZYNQ_FSBL {/home/nate/projects/duneWireTension/ElectricalMethod/firmware/source/dwa_ps/vittis/dwaPsHw/zynq_fsbl/fsbl.elf} [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices xc7z020_1] 0]]
set_property PROGRAM.ZYNQ_FSBL $fsbl_elf [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices xc7z020_1] 0]]
set_property PROGRAM.BLANK_CHECK  0 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices xc7z020_1] 0]]
set_property PROGRAM.ERASE  1 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices xc7z020_1] 0]]
set_property PROGRAM.CFG_PROGRAM  1 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices xc7z020_1] 0]]
set_property PROGRAM.VERIFY  0 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices xc7z020_1] 0]]
set_property PROGRAM.CHECKSUM  0 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices xc7z020_1] 0]]
program_hw_cfgmem -hw_cfgmem [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices xc7z020_1] 0]]
#catch {boot_hw_device  [lindex [get_hw_devices xc7z020_1] 0]}
close_hw_target
close_hw_manager

