source $ad_hdl_dir/projects/common/tei0022/tei0022_system_qsys.tcl
source ../common/ad738x_qsys.tcl

set ad738x_if 0
set fp [open "interface_selection" r]
set ad738x_if  [read $fp 1]
close $fp

if {$ad738x_if == 0} {
source ../common/ad7380_qsys.tcl
} elseif {$ad738x_if == 1} {
source ../common/ad7381_qsys.tcl
} else {
  return -code error [format "ERROR: Invalid ADC type selected ..."]
}



