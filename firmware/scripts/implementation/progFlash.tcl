#Script Configuration from build script

# set program flash offset
#flash offset is 1/2 what was set in the bootloader 
# eg if the flash MB offset is 0x60000000, and 
# the bootloader is set to 0x61800000,
# the flash offset set in the write_cfgmem is set to 0x00c00000
#set flashOfst 0x00c00000

# create "bif" file which is just a pointer to files that will be in mem



puts "program_flash -f  $boot_bin   -offset 0 -flash_type qspi-x4-single -fsbl  $fsbl_elf  -cable type xilinx_tcf url TCP:127.0.0.1:3121"
exec program_flash -f $boot_bin  -offset 0 -flash_type qspi-x4-single -fsbl $fsbl_elf  -cable type xilinx_tcf url $hardware_loc 

# example on programming the flash directly outside of MCS  may add confusion?
#zynq_flash -f ./mm_top/mm_top.sdk/top_vc707_dev_hw_platform_0/cache/BOOT.bin -offset 0x61800000 -flash_type mt28gu01gaax1e-bpi-x16 -cable type xilinx_tcf url TCP:127.0.0.1:3121 

#put the bootloader in the bit file, MB will exec this from internal mem
#exec updatemem -force -meminfo $mmiIn -bit $bitIn  -data $bootElf -proc system_i/microblaze_0 -out $bitOut

#put the prog offset in flash
#write_cfgmem -force -format mcs -interface bpix16 -size 128 -loadbit "up 0x0  $bitOut"  -loaddata "up $flashOfst $sdkCachePath/BOOT.bin" -file $mcsOut

#puts {use PROM PC28F00AG18FE}
