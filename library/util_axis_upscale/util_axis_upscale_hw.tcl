package require qsys
source ../scripts/adi_env.tcl
source ../scripts/adi_ip_intel.tcl

set_module_property NAME util_axis_upscale_v1_0
set_module_property DESCRIPTION "Upscaler"
set_module_property VERSION 1.0
set_module_property GROUP "Analog Devices"
set_module_property DISPLAY_NAME util_axis_upscale_v1_0

# files

add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property quartus_synth TOP_LEVEL util_axis_upscale
add_fileset_file util_axis_upscale.v VERILOG PATH $ad_hdl_dir/library/common/util_axis_upscale.v VERILOG

# parameters

add_parameter NUM_OF_CHANNELS INTEGER 4
set_parameter_property NUM_OF_CHANNELS DEFAULT_VALUE 4
set_parameter_property NUM_OF_CHANNELS DISPLAY_NAME NUM_OF_CHANNELS
set_parameter_property NUM_OF_CHANNELS TYPE INTEGER
set_parameter_property NUM_OF_CHANNELS UNITS None
set_parameter_property NUM_OF_CHANNELS ALLOWED_RANGES -2147483648:2147483647
set_parameter_property NUM_OF_CHANNELS HDL_PARAMETER true

add_parameter DATA_WIDTH INTEGER 24
set_parameter_property DATA_WIDTH DEFAULT_VALUE 24
set_parameter_property DATA_WIDTH DISPLAY_NAME DATA_WIDTH
set_parameter_property DATA_WIDTH TYPE INTEGER
set_parameter_property DATA_WIDTH UNITS None
set_parameter_property DATA_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property DATA_WIDTH HDL_PARAMETER true

add_parameter UDATA_WIDTH INTEGER 32
set_parameter_property UDATA_WIDTH DEFAULT_VALUE 32
set_parameter_property UDATA_WIDTH DISPLAY_NAME UDATA_WIDTH
set_parameter_property UDATA_WIDTH TYPE INTEGER
set_parameter_property UDATA_WIDTH UNITS None
set_parameter_property UDATA_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property UDATA_WIDTH HDL_PARAMETER true

# 
# connection point s_axis
# 
add_interface s_axis conduit end
set_interface_property s_axis associatedClock clk
set_interface_property s_axis associatedReset resetn
add_interface_port s_axis s_axis_ready ready Output 1
add_interface_port s_axis s_axis_valid valid Input 1
add_interface_port s_axis s_axis_data data Input 20

# 
# connection point clk
# 
add_interface clk clock sink
set_interface_property clk clockRate 0
add_interface_port clk clk clk Input 1

# 
# connection point resetn
# 
add_interface resetn reset end
set_interface_property resetn associatedClock clk
add_interface_port resetn resetn reset_n Input 1

# 
# connection point dfmt_enable
# 
add_interface dfmt_enable conduit end
set_interface_property dfmt_enable associatedClock none
add_interface_port dfmt_enable dfmt_enable dfmt_enable Input 1

# 
# connection point dfmt_type
# 
add_interface dfmt_type conduit end
set_interface_property dfmt_type associatedClock none
add_interface_port dfmt_type dfmt_type dfmt_type Input 1

# 
# connection point dfmt_se
# 
add_interface dfmt_se conduit end
set_interface_property dfmt_se associatedClock none
add_interface_port dfmt_se dfmt_se dfmt_se Input 1

# 
# connection point m_axis
# 
add_interface m_axis axi4stream start
set_interface_property m_axis associatedClock clk
add_interface_port m_axis m_axis_ready tready Input 1
add_interface_port m_axis m_axis_valid tvalid Output 1
add_interface_port m_axis m_axis_data tdata Output 32
