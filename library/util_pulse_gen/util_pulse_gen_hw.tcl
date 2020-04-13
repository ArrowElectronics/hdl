package require qsys
source ../scripts/adi_env.tcl
source ../scripts/adi_ip_intel.tcl

set_module_property NAME util_pulse_gen_v1_0
set_module_property DESCRIPTION "Pulse generator"
set_module_property VERSION 1.0
set_module_property GROUP "Analog Devices"
set_module_property DISPLAY_NAME util_pulse_gen_v1_0

# files

add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property quartus_synth TOP_LEVEL util_pulse_gen
add_fileset_file util_pulse_gen.v VERILOG PATH $ad_hdl_dir/library/common/util_pulse_gen.v VERILOG

# parameters

add_parameter PULSE_PERIOD INTEGER 100000000
set_parameter_property PULSE_PERIOD DEFAULT_VALUE 100000000
set_parameter_property PULSE_PERIOD DISPLAY_NAME PULSE_PERIOD
set_parameter_property PULSE_PERIOD TYPE INTEGER
set_parameter_property PULSE_PERIOD UNITS None
set_parameter_property PULSE_PERIOD ALLOWED_RANGES -2147483648:2147483647
set_parameter_property PULSE_PERIOD HDL_PARAMETER true

add_parameter PULSE_WIDTH INTEGER 7
set_parameter_property PULSE_WIDTH DEFAULT_VALUE 7
set_parameter_property PULSE_WIDTH DISPLAY_NAME PULSE_WIDTH
set_parameter_property PULSE_WIDTH TYPE INTEGER
set_parameter_property PULSE_WIDTH UNITS None
set_parameter_property PULSE_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property PULSE_WIDTH HDL_PARAMETER true

# 
# connection point clock
# 
add_interface clk clock end
set_interface_property clk clockRate 0
add_interface_port clk clk clk Input 1


# 
# connection point rstn
# 
add_interface rstn reset end
set_interface_property rstn associatedClock clk
add_interface_port rstn rstn reset_n Input 1

# 
# connection point pulse_width
# 
add_interface pulse_width conduit end
set_interface_property pulse_width associatedClock clk
add_interface_port pulse_width pulse_width pulse_width Input 32

# 
# connection point pulse_period
# 
add_interface pulse_period conduit end
set_interface_property pulse_period associatedClock clk
add_interface_port pulse_period pulse_period pulse_period Input 32

# 
# connection point load_config
# 
add_interface load_config conduit end
set_interface_property load_config associatedClock clk
add_interface_port load_config load_config load_config Input 1

# 
# connection point pulse
# 
add_interface pulse conduit end
set_interface_property pulse associatedClock clk
add_interface_port pulse pulse pulse Output 1

# 
# connection point pulse_counter
# 
add_interface pulse_counter conduit end
set_interface_property pulse_counter associatedClock clk
add_interface_port pulse_counter pulse_counter pulse_counter Output 32

