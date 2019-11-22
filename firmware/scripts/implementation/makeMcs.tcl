#Script Configuration
#project directory Includes SDK
#run from implementation directory with filename as argument
#vivado2017.1 -mode batch -source /home/nate/projects/atlas/mmtp/firmware/scripts/implementation/makeMcs.tcl -tclargs 38TestStand20170504_08


#set projPath "/home/nate/projects/atlas/mmtp/vivadoProjects/mm_top/"
# Temp standalone implementation
#set projPath "/home/nate/projects/atlas/mmtp/vivadoProjects/mm_top/mm_top.runs/impl_4"
#changed to run from implementation folder
set projPath [pwd]

set sdkPath "/home/nate/projects/atlas/mmtp/firmware/sources/sdk/"

#cache moved to sdk source
#set sdkCachePath $projPath/mm_top.sdk/TOP_VC707_DEV_hw_platform_0/cache/
set sdkCachePath $sdkPath/mmtp_lwip_interface/cache/

set sdkMbBin /home/nate/opt/Xilinx/SDK/2015.1/gnu/microblaze/lin/bin/

# select memory source files
#set bitInName 38TestStand20170504_08
set bitInName $argv
set mmiInName $argv
set bootElf $sdkPath/bootload/Debug/bootload.elf 
#set progElf $sdkPath/mmtp_lwip_interface/Debug/mmtp_lwip_interface_38TestStand.elf 
set progElf $sdkPath/mmtp_lwip_interface/Release/mmtp_lwip_interface.elf 


# keep programming files in runs/imp folder
set bitIn $projPath/${bitInName}.bit
set mmiIn $projPath/${mmiInName}.mmi
set bitOut $projPath/${bitInName}Boot.bit
set mcsOut $projPath/${bitInName}.mcs
# set program flash offset
#flash offset is 1/2 what was set in the bootloader 
# eg if the flash MB offset is 0x60000000, and 
# the bootloader is set to 0x61800000,
# the flash offset set in the write_cfgmem is set to 0x00c00000
set flashOfst 0x00c00000

# generate prog  elf to srec then prog bin
exec $sdkMbBin/mb-objcopy -O srec $progElf $sdkCachePath/prog.srec
# create "bif" file which is just a pointer to the SREC as required by bootgen
exec echo "the_ROM_image:" > $sdkCachePath/bootimage.bif 
exec echo "{" >> $sdkCachePath/bootimage.bif 
exec echo "$sdkCachePath/prog.srec" >> $sdkCachePath/bootimage.bif 
exec echo "}" >> $sdkCachePath/bootimage.bif 
# gen prog bin

puts "bootgen -arch fpga -image $sdkCachePath/bootimage.bif -w -o $sdkCachePath/BOOT.bin  -interface bpix16"
exec bootgen -arch fpga -image $sdkCachePath/bootimage.bif -w -o $sdkCachePath/BOOT.bin  -interface bpix16

# example on programming the flash directly outside of MCS  may add confusion?
#zynq_flash -f ./mm_top/mm_top.sdk/top_vc707_dev_hw_platform_0/cache/BOOT.bin -offset 0x61800000 -flash_type mt28gu01gaax1e-bpi-x16 -cable type xilinx_tcf url TCP:127.0.0.1:3121 

#put the bootloader in the bit file, MB will exec this from internal mem
exec updatemem -force -meminfo $mmiIn -bit $bitIn  -data $bootElf -proc system_i/microblaze_0 -out $bitOut

#put the prog offset in flash
write_cfgmem -force -format mcs -interface bpix16 -size 128 -loadbit "up 0x0  $bitOut"  -loaddata "up $flashOfst $sdkCachePath/BOOT.bin" -file $mcsOut

puts {use PROM PC28F00AG18FE}
