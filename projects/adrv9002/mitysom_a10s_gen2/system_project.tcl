
source ../../scripts/adi_env.tcl
source ../../scripts/adi_project_intel.tcl

#set cmos_lvds_n 0 #for LSSI
set cmos_lvds_n 0
set fp [open "interface_selection" r]
set cmos_lvds_n [read $fp 1]
close $fp

adi_project adrv9002_mitysom_a10s
#source $ad_hdl_dir/projects/common/mitysom_a10s/mitysom_a10s_system_assign.tcl
#source $ad_hdl_dir/projects/common/mitysom_a10s/mitysom_a10s_plddr4_assign.tcl





if {$cmos_lvds_n == 0} {
set_global_assignment -name QSYS_FILE pll.qsys
set_global_assignment -name QSYS_FILE lvds_rx.qsys
set_global_assignment -name QSYS_FILE lvds_tx1.qsys
set_global_assignment -name QSYS_FILE lvds_tx.qsys
} else {
set_global_assignment -name QSYS_FILE adrv9002_gpio_in.qsys
set_global_assignment -name QSYS_FILE adrv9002_gpio_out.qsys
}

source $ad_hdl_dir/projects/common/mitysom_a10s/mitysom_a10s_system_assign.tcl
source $ad_hdl_dir/projects/common/mitysom_a10s/mitysom_a10s_plddr4_assign.tcl

if {$cmos_lvds_n == 0} {
source system_project_LSSI.tcl
} elseif {$cmos_lvds_n == 1} {
source system_project_CSSI.tcl
} else {
return -code error [format "ERROR: Invalid interface type! Define as \'serial\' or \'parallel\' ..."]
}


# set optimization to get a better timing closure
set_global_assignment -name OPTIMIZATION_MODE "HIGH PERFORMANCE EFFORT"

execute_flow -compile


