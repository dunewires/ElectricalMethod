# filename: build.tcl
#proc setup { } {
#######################################################################################
# User Settings 
#######################################################################################

# to generate bitfile from scripts directory in: vivado -mode tcl
# source implementation/build.tcl
# makeBit 
puts "use commands: setup, readSource, synth, opt, place, postPlacePhysOpt route, bitgen, makeBit, explorePlaceDirectives exploreFullDirectives"

proc makeBit {} {

    puts "\n##################################################################"
    puts "#                    Run Selected Implementation Processes       #"
    puts "##################################################################\n"

    setup
    readSource
    synth
    opt
    place
    postPlacePhysOpt
    route
    bitgen
}

proc rePlace {} {
    global proj_dir
    global proj_name

    puts "\n##################################################################"
    puts "#                    Run Selected Implementation Processes       #"
    puts "##################################################################\n"

  #  setup
  #  read_checkpoint  $proj_dir/${proj_name}_post_opt.dcp
  #  delete_pblock [get_pblocks pB_*]

    opt
    place
    postPlacePhysOpt
    route
   # bitgen
}

proc setup {} {

    puts "\n##################################################################"
    puts "#                    Setup                                         #"
    puts "##################################################################\n"

    #Script Configuration
    set synth 0

    global top_module
    global proj_name
    global proj_dir
    global scriptdir
    global firmware_dir
    global proj_sources_dir
    global board_part
    global part
    global post_route_wns
    global target
    global ip_dir
    global fsbl_elf
    global lwip_elf
    global boot_bin
    global hardware_loc

    #set location of compiled soruce for flash

 ##select configuration   
    set target "dune"

    set scriptdir [pwd]
    set firmware_dir $scriptdir/../
    set proj_sources_dir $firmware_dir/source/


        #set top_module "top_tension_analyzer"
        set top_module "dwa_ps_pl_top"
        set proj_name "dwa_ps_pl_top"
        set part "xc7z020clg400-1"
        # if a board part is used we need to create a project. 
        # We'll use "in_memory" to avoide an entire project file
        create_project -in_memory -part $part
        set board_part "em.avnet.com:microzed_7020:part0:1.1"

#        set top_module "top_tension_analyzer_vc707"
#        set proj_name "tension_analyzer_vc707"
#        set part "xc7vx485tffg1761-2"

    set_param general.maxThreads 8
    set post_route_wns xxx
    set proj_dir $firmware_dir/../../vivadoProjects/$proj_name
   
    set fsbl_elf $proj_sources_dir/sdk/dwaFsbl/Debug/dwaFsbl.elf
    set lwip_elf $proj_sources_dir/sdk/lwip_ref/Release/lwip_ref.elf
    set boot_bin $proj_dir/BOOT.bin
    set hardware_loc TCP:127.0.0.1:3124
    puts "Target: $target"
    puts "FPGA Part: $part"
    puts "Scripts Directory:  $scriptdir"
    puts "Project Directory: $proj_dir"
    
  #  set_property ip_repo_paths {$scriptdir/../../../vivadoProjects/ip_repo/dwa_registers_1.0} [current_project]
   # update_ip_catalog

# Current date, time, and seconds since epoch
# 0 = 4-digit year
# 1 = 2-digit year
# 2 = 2-digit month
# 3 = 2-digit day
# 4 = 2-digit hour
# 5 = 2-digit minute
# 6 = 2-digit second
# 7 = Epoch (seconds since 1970-01-01_00:00:00)
# Array index                                            0  1  2  3  4  5  6  7
set datetime_arr [clock format [clock seconds] -format {%Y %y %m %d %H %M %S %s}]
 
# Get the dateCode in the yy-mm-dd-HH format
set dateCode [lindex $datetime_arr 1][lindex $datetime_arr 2][lindex $datetime_arr 3][lindex $datetime_arr 4]
# Show this in the log
puts dateCode=$dateCode
 
# Get the git hashtag for this project
#if needed use the git dir command git --git-dir /foo/bar/.git log
set git_hash [exec git log -1 --pretty='%h']
# Show this in the log
puts hashCode=$git_hash
 
# Set the generics
set_property generic "dateCode=32'h$dateCode hashCode=32'h$git_hash" [current_fileset]

}

proc readSource {} {
    global scriptdir
    global proj_sources_dir
    global proj_name    
    global proj_dir    
    global board_part
    global part
    global target
    
    puts "\n##################################################################"
    puts "#                    Read Source                                 #"
    puts "##################################################################\n"

        # board part and in memory project mey be needed with BSP 
        # create_project -in_memory -part $part
        # set_property board_part $board_part [current_project]
        # source $scriptdir/implementation/readVc707DwaSource.tcl
        source $scriptdir/implementation/readMicrozedWtaSource.tcl
        #source ../../vivadoProjects/dwa_ps/dwa_ps_bd.tcl
}

proc synth {} {
    global top_module
    global scriptdir
    global proj_sources_dir
    global proj_dir
    global proj_name
    global part
    global target


    puts "\n##################################################################"
    puts "#                    Synth Design                                #"
    puts "##################################################################\n"

    set defines ""
    append defines -verilog_define " " USE_DEBUG " "

    # synthesis related settings
    # vivado 2017 Flow_PerfOptomized_high
    #setup
    set synth_args ""
    append SYNTH_ARGS " " -flatten_hierarchy " " rebuilt " "
    append SYNTH_ARGS " " -gated_clock_conversion " " off " "
    append SYNTH_ARGS " " -bufg " {" 12 "} "
    append SYNTH_ARGS " " -fanout_limit " {" 400 "} "
    append SYNTH_ARGS " " -directive " " Default " "
    append SYNTH_ARGS " " -fsm_extraction " " one_hot " "
    append SYNTH_ARGS " " -keep_equivalent_registers " "
    append SYNTH_ARGS " " -resource_sharing " " off " "
    append SYNTH_ARGS " " -control_set_opt_threshold " " auto " "
    append SYNTH_ARGS " " -no_lc " "
    append SYNTH_ARGS " " -shreg_min_size " {" 5 "} "
    append SYNTH_ARGS " " -max_bram " {" -1 "} "
    append SYNTH_ARGS " " -max_uram " {" -1 "} "
    append SYNTH_ARGS " " -max_dsp " {" -1 "} "
    append SYNTH_ARGS " " -max_bram_cascade_height " {" -1 "} "
    append SYNTH_ARGS " " -max_uram_cascade_height " {" -1 "} "
    append SYNTH_ARGS " " -cascade_dsp " " auto " "
    append SYNTH_ARGS " " -verbose

    eval "synth_design $defines $synth_args -top $top_module -part $part"

    report_timing_summary -file $proj_dir/${proj_name}_post_synth_tim.rpt
    report_utilization -file $proj_dir/${proj_name}_post_synth_util.rpt
    write_checkpoint -force $proj_dir/${proj_name}_post_synth.dcp
}

proc opt {} {
    global proj_dir
    global proj_name
puts $proj_name
    #################################
    #check for incremental compile
    #################################
    # currently f's the placer
    #read_checkpoint -incremental $incrReuseDcp
    #report_incremental_reuse

    puts "\n##################################################################"
    puts "#                    Opt Design          ExploreWithRemap                        #"
    puts "##################################################################\n"

    opt_design -directive ExploreWithRemap
    report_timing_summary -file $proj_dir/${proj_name}_post_opt_tim.rpt
    report_utilization -file $proj_dir/${proj_name}_post_opt_util.rpt
    write_checkpoint -force $proj_dir/${proj_name}_post_opt.dcp
    # Upgrade DSP connection warnings (like "Invalid PCIN Connection for OPMODE value") to
    # an error because this is an error post route
    set_property SEVERITY {ERROR} [get_drc_checks DSPS-*]
    # Run DRC on opt design to catch early issues like comb loops
    report_drc -file $proj_dir/${proj_name}_post_opt_drc.rpt
}


# Place Design
# explore placment directives then quit 
#source $scriptdir/implementation/explorePlaceDirectives.tcl
proc place {} {
    global proj_dir
    global proj_name


    puts "\n##################################################################"
    puts "#                    Place                   ExtraTimingOpt                    #"
    puts "##################################################################\n"

    # scan of directives using ExtraNetDelay wns  +0.118
    # scan of directives using AltSpreadLogicy wns  +0.110
    #place_design -directive  AltSpreadLogic_medium
    #place_design -directive  ExtraNetDelay_low
    place_design -directive  ExtraTimingOpt -timing_summary 
    report_timing_summary -file $proj_dir/${proj_name}_post_place_tim.rpt
    report_utilization -file $proj_dir/${proj_name}_post_place_util.rpt
    write_checkpoint -force $proj_dir/${proj_name}_post_place.dcp

    set WNS [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
    puts "\n Post Place  WNS = $WNS \n"
}

proc postPlacePhysOpt {} {
    global proj_dir
    global proj_name

    puts "\n##################################################################"
    puts "#                    Post Place Phys Opt   AlternateReplication   #"
    puts "##################################################################\n"
    phys_opt_design -directive AlternateReplication
    report_timing_summary -file $proj_dir/${proj_name}_post_place_physopt_tim2.rpt
 
    set WNS [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
    puts "\n Post Phys Opt WNS = $WNS \n"
}
proc route {} {
    global proj_dir
    global proj_name
    global post_route_wns
    puts "\n##################################################################"
    puts "#                    Route                                       #"
    puts "##################################################################"
    puts ""
    # Route Design
    route_design -directive Explore
    report_timing_summary -file $proj_dir/${proj_name}_post_route_tim.rpt
    report_utilization -hierarchical -file $proj_dir/${proj_name}_post_route_util.rpt
    report_route_status -file $proj_dir/${proj_name}_post_route_status.rpt
    report_io -file $proj_dir/${proj_name}_post_route_io.rpt
    report_power -file $proj_dir/${proj_name}_post_route_power.rpt
    report_design_analysis -logic_level_distribution \
	-of_timing_paths [get_timing_paths -max_paths 10000 \
			      -slack_lesser_than 0] \
	-file $proj_dir/${proj_name}_post_route_vios.rpt
    write_checkpoint -force $proj_dir/${proj_name}_post_route.dcp

    set WNS [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
    puts "\n Post Route WNS = $WNS \n"
    set post_route_wns $WNS
}
proc postRoutePhysOpt {} {
    global proj_dir
    global proj_name


    puts "\n##################################################################"
    puts "#                    Post Route Phys Opt    AggressiveExplore                #"
    puts "##################################################################\n"
    phys_opt_design -directive AggressiveExplore
    report_timing_summary -file $proj_dir/${proj_name}_post_place_physopt_tim1.rpt

 
    #phys_opt_design -directive AddRetime
    #report_timing_summary -file $proj_dir/${proj_name}_post_place_physopt_tim3.rpt
    report_utilization -file $proj_dir/${proj_name}_post_place_physopt_util.rpt
    write_checkpoint -force $proj_dir/${proj_name}_post_route_physopt.dcp

    set WNS [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
    puts "\n Post Phys Opt WNS = $WNS \n"
}

proc bitgen {} {
    global proj_dir
    global proj_name
    global post_route_wns
    global proj_sources_dir
    global target
    global build_name
    global fsbl_elf
    global lwip_elf
    global boot_bin
    global hardware_loc
    global scriptdir

    puts "\n##################################################################"
    puts "#                   Generate  Bitfile                            #"
    puts "##################################################################\n"

    set build_date [ clock format [ clock seconds ] -format %Y%m%d ]
    set build_time [ clock format [ clock seconds ] -format %H%M%S ]
    set build_name    ${proj_name}_${build_date}_${build_time}_${post_route_wns}ns

    write_debug_probes -force $proj_dir/$build_name.ltx
    write_bitstream -force  $proj_dir/$build_name.bit 

    source $scriptdir/implementation/makeMcs.tcl

}

proc progFlash {} {
    setup
    global fsbl_elf
    global boot_bin
    global hardware_loc
    global scriptdir

    puts "\n##################################################################"
    puts "#                   program flash                           #"
    puts "##################################################################\n"

    source $scriptdir/implementation/progFlash.tcl
}

proc writeGdrive {} {
    exec  rclone copy $proj_dir/${proj_name}_${build_date}_${build_time}_${post_route_wns}ns.ltx gharvard:/projects/atlas/mmtp/mcsFiles
    exec  rclone copy $proj_dir/${proj_name}_${build_date}_${build_time}_${post_route_wns}ns.bit gharvard:/projects/atlas/mmtp/mcsFiles
}

