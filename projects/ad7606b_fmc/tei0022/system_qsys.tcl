source $ad_hdl_dir/projects/common/tei0022/tei0022_system_qsys.tcl
source ../common/ad7606b_qsys.tcl

set ad7606b_if   0
set fp [open "interface_selection" r]
set ad7606b_if [read $fp 1]
close $fp

if {$ad7606b_if == 0} {
source ../common/ad7606b_bd_si.tcl
} elseif {$ad7606b_if == 1} {
source ../common/ad7606b_bd_pi.tcl
} else {
  return -code error [format "ERROR: Invalid interface type! Define as \'serial\' or \'parallel\' ..."]
}
