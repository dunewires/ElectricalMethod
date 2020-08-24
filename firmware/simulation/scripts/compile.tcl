# read list of source files and compile for simulation
# needs list of source, memory init file, and modelsim.ini

#modified from Doulos https://www.doulos.com/knowhow/tcltk/examples/modelsim/
set proj_name "mm_top_np"
# script directory path:
set scriptdir [pwd]/../../../
puts $scriptdir
# firmware directory:
set firmware_dir $scriptdir/../
# sources directories
set proj_sources_dir $firmware_dir/sources/
set nsw_tp_l1a $firmware_dir/../../nsw_tp_l1a/
#monL1aVhdl needs mmtpSimTcl and mmtpSimTcl needs monL1aVhdl!!
set listSimSource {$mmtpSimIp $mmtpSimTcl $monL1aVhdl $mmtpVhdl $hwCommonVhdl $mmtpSimVhdl}
# lib map from Vivado script, Custom libs added from script
vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/NSWTP_L1A
vlib msim/ATLAS_MMTP
vlib msim/TCL

vmap xil_defaultlib msim/xil_defaultlib
vmap NSWTP_L1A msim/NSWTP_L1A
vmap ATLAS_MMTP msim/ATLAS_MMTP
vmap TCL msim/TCL

source $scriptdir/implementation/listMmtpSource.tcl

set top_level              ATLAS_MMTP.tb_axi_file_io
set wave_patterns {
                           /*
}
set wave_radices {
                           hexadecimal {data q}
}

# After sourcing the script from ModelSim for the
# first time use these commands to recompile.

proc r  {} {uplevel #0 source compile.tcl}
proc rr {} {global last_compile_time
            set last_compile_time 0
            r                            }
proc q  {} {quit -force                  }

#Does this installation support Tk?
set tk_ok 1
if [catch {package require Tk}] {set tk_ok 0}

# Prefer a fixed point font for the transcript
set PrefMain(font) {Courier 10 roman normal}

# Compile out of date files
set time_now [clock seconds]
if [catch {set last_compile_time}] {
  set last_compile_time 0
}

#need to use subst when variable includes a variable
foreach sourceList $listSimSource {
    foreach {library file_list} [subst $sourceList] {
	foreach file $file_list {
	    #lindex ... end will look at last file in list, needed for clock IP 
	    if { $last_compile_time < [file mtime [lindex [subst $file] end]] } {
		if [regexp {.vhdl?$} [subst $file]] {
		    vcom -64 -2008 -work $library {*}[subst $file];
		} else {
		    #compile verlog source
		    #{*} is the command expansion used for mutiple arguments
		    vlog -64 -incr -work $library {*}[subst $file];
		}
		set last_compile_time 0
	    }
	}
    }
}

# compile glbl module
vlog -work ATLAS_MMTP $proj_sources_dir/simulation/glbl.v

set last_compile_time $time_now

puts {
  Script commands are:

  r = Recompile changed and dependent files
 rr = Recompile everything
  q = Quit without confirmation
}

# How long since project began?
if {[file isfile start_time.txt] == 0} {
  set f [open start_time.txt w]
  puts $f "Start time was [clock seconds]"
  close $f
} else {
  set f [open start_time.txt r]
  set line [gets $f]
  close $f
  regexp {\d+} $line start_time
  set total_time [expr ([clock seconds]-$start_time)/60]
  puts "Project time is $total_time minutes"
}

