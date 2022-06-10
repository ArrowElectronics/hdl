set dac_fifo_address_width 10

source $ad_hdl_dir/projects/common/mitysom_a10s/mitysom_a10s_system_qsys.tcl
#source $ad_hdl_dir/projects/common/mitysom_a10s/mitysom_a10s_plddr4_dacfifo_qsys.tcl
source $ad_hdl_dir/projects/adrv9002/mitysom_a10s_gen2/sys_ddr4_init_qsys.tcl

#set cmos_lvds_n 0 #for LSSI
set cmos_lvds_n 0
set fp [open "interface_selection" r]
set cmos_lvds_n [read $fp 1]
close $fp


if {$cmos_lvds_n == 0} {
source ../common/adrv9002_qsys_lssi.tcl
} elseif {$cmos_lvds_n == 1} {
source ../common/adrv9002_qsys_cssi.tcl
} else {
return -code error [format "ERROR: Invalid interface type! Define as \'serial\' or \'parallel\' ..."]
}



