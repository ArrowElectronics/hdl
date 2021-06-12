source ../../scripts/adi_env.tcl
source ../../scripts/adi_project_intel.tcl

set ad7606b_if 0
set fp [open "interface_selection" r]
set ad7606b_if [read $fp 1]
close $fp

adi_project ad7606b_fmc_tei0022

if {$ad7606b_if == 0} {
set_global_assignment -name VERILOG_FILE $ad_hdl_dir/projects/ad7606b_fmc/tei0022/system_top_si.v
set_global_assignment -name TOP_LEVEL_ENTITY system_top_si
source $ad_hdl_dir/projects/common/tei0022/tei0022_system_assign.tcl
source system_project_si.tcl
} elseif {$ad7606b_if == 1} {
set_global_assignment -name VERILOG_FILE $ad_hdl_dir/projects/ad7606b_fmc/tei0022/system_top_pi.v
set_global_assignment -name TOP_LEVEL_ENTITY system_top_pi
source $ad_hdl_dir/projects/common/tei0022/tei0022_system_assign.tcl
source system_project_pi.tcl
} else {
return -code error [format "ERROR: Invalid interface type! Define as \'serial\' or \'parallel\' ..."]
}

execute_flow -compile
 