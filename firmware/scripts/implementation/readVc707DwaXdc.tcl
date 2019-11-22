# --------------------------------------------------------------------------
#                VC707 constraints
# --------------------------------------------------------------------------
read_xdc -verbose $proj_sources_dir/constraints/system.xdc
read_xdc -verbose $proj_sources_dir/constraints/vc707_pin.xdc
read_xdc -verbose $proj_sources_dir/constraints/findFit.xdc
read_xdc -verbose $proj_sources_dir/constraints/kc705_gbt_exmpldsgn_clks.xdc
read_xdc -verbose $proj_sources_dir/constraints/kc705_gbt_exmpldsgn_floorplanning.xdc
read_xdc -verbose $proj_sources_dir/constraints/kc705_gbt_exmpldsgn_io.xdc
read_xdc -verbose $proj_sources_dir/constraints/kc705_gbt_exmpldsgn_timingclosure.xdc
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]

#changed from read_edif to  read_bd dont need the xdc
#read_xdc -verbose $proj_sources_dir/constraints/mb_system_bd.xdc
