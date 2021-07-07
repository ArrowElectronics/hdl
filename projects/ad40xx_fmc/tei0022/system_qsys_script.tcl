set mmu_enabled 1
set ad_hdl_dir C:/Snehal_dev/Git_pulls_arrow/hdl_2
set ad_ghdl_dir C:/Snehal_dev/Git_pulls_arrow/ghdl
package require qsys
set_module_property NAME {system_bd}
set_project_property DEVICE_FAMILY {Cyclone V}
set_project_property DEVICE 5CSEMA5F31C8
foreach {param value} {} { set ad_project_params($param) $value }
source system_qsys.tcl
set_interconnect_requirement {$system} {qsys_mm.clockCrossingAdapter} {AUTO}
set_interconnect_requirement {$system} {qsys_mm.burstAdapterImplementation} {PER_BURST_TYPE_CONVERTER}
set_interconnect_requirement {$system} {qsys_mm.maxAdditionalLatency} {4}
save_system {system_bd.qsys}
