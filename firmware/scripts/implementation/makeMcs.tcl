#Script Configuration from build script

# set program flash offset
#flash offset is 1/2 what was set in the bootloader 
# eg if the flash MB offset is 0x60000000, and 
# the bootloader is set to 0x61800000,
# the flash offset set in the write_cfgmem is set to 0x00c00000
#set flashOfst 0x00c00000

# create "bif" file which is just a pointer to files that will be in mem
# temp file with pointers to source
set boot_bif $proj_sources_dir/sdk/bootimage.bif
#set proj_bit 	$proj_dir/${proj_name}_${build_date}_${build_time}_${post_route_wns}ns.bit

exec echo "//arch = zynq; split = false; format = BIN" > $boot_bif
exec echo the_ROM_image: >> $boot_bif
exec echo "{" >> $boot_bif
exec echo \[bootloader\]$fsbl_elf >> $proj_sources_dir/sdk/bootimage.bif
exec echo   $proj_dir/$build_name.bit   >> $boot_bif
exec echo 	$lwip_elf >> $boot_bif
exec echo "}" >> $boot_bif
# gen prog bin

puts "bootgen -image $boot_bif -arch zynq -o  $boot_bin  -w on "
exec bootgen -image $boot_bif -arch zynq -o  $boot_bin  -w on 
