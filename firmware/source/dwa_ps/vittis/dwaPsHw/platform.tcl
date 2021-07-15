# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/nate/projects/duneWireTension/ElectricalMethod/firmware/source/dwa_ps/vittis/dwaPsHw/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/nate/projects/duneWireTension/ElectricalMethod/firmware/source/dwa_ps/vittis/dwaPsHw/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {dwaPsHw}\
-hw {/home/nate/projects/duneWireTension/ElectricalMethod/firmware/source/dwa_ps/dwa_ps_bd_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {/home/nate/projects/duneWireTension/ElectricalMethod/firmware/source/dwa_ps/vittis}

platform write
platform generate -domains 
platform active {dwaPsHw}
platform active {dwaPsHw}
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {lwip_echo_server}
platform generate -domains 
platform write
domain active {zynq_fsbl}
domain active {standalone_domain}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
platform generate
platform active {dwaPsHw}
platform generate -domains 
platform generate -domains standalone_domain,standalone_ps7_cortexa9_0,zynq_fsbl 
platform active {dwaPsHw}
platform generate -domains 
platform generate -domains 
platform clean
platform generate
platform generate
platform generate
platform generate
