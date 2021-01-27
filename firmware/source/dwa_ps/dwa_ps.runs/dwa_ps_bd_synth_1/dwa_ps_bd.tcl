# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param project.vivado.isBlockSynthRun true
create_project -in_memory -part xc7z020clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.cache/wt [current_project]
set_property parent.project_path /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part em.avnet.com:microzed_7020:part0:1.1 [current_project]
set_property ip_repo_paths {
  /home/nate/projects/duneWireTension/firmware/ip_repo
  /home/nate/projects/duneWireTension/vivadoProjects/ip_repo/dwa_registers_1.0
} [current_project]
update_ip_catalog
set_property ip_output_repo /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/dwa_ps_bd.bd
set_property used_in_implementation false [get_files -all /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ip/dwa_ps_bd_processing_system7_0_0/dwa_ps_bd_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ip/dwa_ps_bd_rst_ps7_0_100M_1/dwa_ps_bd_rst_ps7_0_100M_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ip/dwa_ps_bd_rst_ps7_0_100M_1/dwa_ps_bd_rst_ps7_0_100M_1.xdc]
set_property used_in_implementation false [get_files -all /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ip/dwa_ps_bd_rst_ps7_0_100M_1/dwa_ps_bd_rst_ps7_0_100M_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/ip/dwa_ps_bd_auto_pc_0/dwa_ps_bd_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/dwa_ps_bd_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top dwa_ps_bd -part xc7z020clg400-1 -mode out_of_context

rename_ref -prefix_all dwa_ps_bd_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef dwa_ps_bd.dcp
create_report "dwa_ps_bd_synth_1_synth_report_utilization_0" "report_utilization -file dwa_ps_bd_utilization_synth.rpt -pb dwa_ps_bd_utilization_synth.pb"

if { [catch {
  file copy -force /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.runs/dwa_ps_bd_synth_1/dwa_ps_bd.dcp /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/dwa_ps_bd.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/dwa_ps_bd_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/dwa_ps_bd_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/dwa_ps_bd_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/dwa_ps_bd_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if {[file isdir /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.ip_user_files/bd/dwa_ps_bd]} {
  catch { 
    file copy -force /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/dwa_ps_bd_stub.v /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.ip_user_files/bd/dwa_ps_bd
  }
}

if {[file isdir /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.ip_user_files/bd/dwa_ps_bd]} {
  catch { 
    file copy -force /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.srcs/sources_1/bd/dwa_ps_bd/dwa_ps_bd_stub.vhdl /home/nate/projects/duneWireTension/vivadoProjects/dwa_ps/dwa_ps.ip_user_files/bd/dwa_ps_bd
  }
}
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
