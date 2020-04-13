package require qsys
source ../../scripts/adi_env.tcl
source ../../scripts/adi_ip_intel.tcl

set_module_property NAME spi_engine_offload_v1_0
set_module_property DESCRIPTION "SPI Engine offload"
set_module_property VERSION 1.0
set_module_property GROUP "Analog Devices"
set_module_property DISPLAY_NAME spi_engine_offload_v1_0

# files

add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property quartus_synth TOP_LEVEL spi_engine_offload
add_fileset_file spi_engine_offload.v VERILOG PATH $ad_hdl_dir/library/spi_engine/spi_engine_offload/spi_engine_offload.v VERILOG

# parameters

add_parameter ASYNC_SPI_CLK INTEGER 0
set_parameter_property ASYNC_SPI_CLK DEFAULT_VALUE 0
set_parameter_property ASYNC_SPI_CLK DISPLAY_NAME ASYNC_SPI_CLK
set_parameter_property ASYNC_SPI_CLK TYPE INTEGER
set_parameter_property ASYNC_SPI_CLK UNITS None
set_parameter_property ASYNC_SPI_CLK ALLOWED_RANGES -2147483648:2147483647
set_parameter_property ASYNC_SPI_CLK HDL_PARAMETER true

add_parameter ASYNC_TRIG INTEGER 0
set_parameter_property ASYNC_TRIG DEFAULT_VALUE 0
set_parameter_property ASYNC_TRIG DISPLAY_NAME ASYNC_TRIG
set_parameter_property ASYNC_TRIG TYPE INTEGER
set_parameter_property ASYNC_TRIG UNITS None
set_parameter_property ASYNC_TRIG ALLOWED_RANGES -2147483648:2147483647
set_parameter_property ASYNC_TRIG HDL_PARAMETER true

add_parameter CMD_MEM_ADDRESS_WIDTH INTEGER 4
set_parameter_property CMD_MEM_ADDRESS_WIDTH DEFAULT_VALUE 4
set_parameter_property CMD_MEM_ADDRESS_WIDTH DISPLAY_NAME CMD_MEM_ADDRESS_WIDTH
set_parameter_property CMD_MEM_ADDRESS_WIDTH TYPE INTEGER
set_parameter_property CMD_MEM_ADDRESS_WIDTH UNITS None
set_parameter_property CMD_MEM_ADDRESS_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property CMD_MEM_ADDRESS_WIDTH HDL_PARAMETER true

add_parameter SDO_MEM_ADDRESS_WIDTH INTEGER 4
set_parameter_property SDO_MEM_ADDRESS_WIDTH DEFAULT_VALUE 4
set_parameter_property SDO_MEM_ADDRESS_WIDTH DISPLAY_NAME SDO_MEM_ADDRESS_WIDTH
set_parameter_property SDO_MEM_ADDRESS_WIDTH TYPE INTEGER
set_parameter_property SDO_MEM_ADDRESS_WIDTH UNITS None
set_parameter_property SDO_MEM_ADDRESS_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property SDO_MEM_ADDRESS_WIDTH HDL_PARAMETER true

add_parameter DATA_WIDTH INTEGER 8
set_parameter_property DATA_WIDTH DEFAULT_VALUE 8
set_parameter_property DATA_WIDTH DISPLAY_NAME DATA_WIDTH
set_parameter_property DATA_WIDTH TYPE INTEGER
set_parameter_property DATA_WIDTH UNITS None
set_parameter_property DATA_WIDTH ALLOWED_RANGES -2147483648:2147483647
set_parameter_property DATA_WIDTH HDL_PARAMETER true

add_parameter NUM_OF_SDI INTEGER 1
set_parameter_property NUM_OF_SDI DEFAULT_VALUE 1
set_parameter_property NUM_OF_SDI DISPLAY_NAME NUM_OF_SDI
set_parameter_property NUM_OF_SDI TYPE INTEGER
set_parameter_property NUM_OF_SDI UNITS None
set_parameter_property NUM_OF_SDI ALLOWED_RANGES -2147483648:2147483647
set_parameter_property NUM_OF_SDI HDL_PARAMETER true

# 
# connection point spi_engine_offload_ctrl
# 
add_interface spi_engine_offload_ctrl conduit end
set_interface_property spi_engine_offload_ctrl associatedClock spi_clk
add_interface_port spi_engine_offload_ctrl ctrl_cmd_wr_en cmd_wr_en Input 1
add_interface_port spi_engine_offload_ctrl ctrl_cmd_wr_data cmd_wr_data Input 16
add_interface_port spi_engine_offload_ctrl ctrl_sdo_wr_en sdo_wr_en Input 1
add_interface_port spi_engine_offload_ctrl ctrl_sdo_wr_data sdo_wr_data Input DATA_WIDTH
add_interface_port spi_engine_offload_ctrl ctrl_enable enable Input 1
add_interface_port spi_engine_offload_ctrl ctrl_enabled enabled Output 1
add_interface_port spi_engine_offload_ctrl ctrl_mem_reset reset Input 1

# 
# connection point ctrl_clk
# 
add_interface ctrl_clk clock sink
set_interface_property ctrl_clk clockRate 0
add_interface_port ctrl_clk ctrl_clk clk Input 1

# 
# connection point spi_clk
# 
add_interface spi_clk clock sink
set_interface_property spi_clk clockRate 0
add_interface_port spi_clk spi_clk clk Input 1

# 
# connection point spi_resetn
# 
add_interface spi_resetn reset end
set_interface_property spi_resetn associatedClock spi_clk
add_interface_port spi_resetn spi_resetn reset_n Input 1

# 
# connection point trigger
# 
add_interface trigger conduit end
set_interface_property trigger associatedClock spi_clk
add_interface_port trigger trigger pulse Input 1

# 
# connection point spi_engine_ctrl
# 
add_interface spi_engine_ctrl conduit end
set_interface_property spi_engine_ctrl associatedClock spi_clk
set_interface_property spi_engine_ctrl associatedReset spi_resetn
add_interface_port spi_engine_ctrl cmd_ready cmd_ready Input 1
add_interface_port spi_engine_ctrl cmd_valid cmd_valid Output 1
add_interface_port spi_engine_ctrl cmd cmd_data Output 16
add_interface_port spi_engine_ctrl sdo_data_ready sdo_ready Input 1
add_interface_port spi_engine_ctrl sdo_data_valid sdo_valid Output 1
add_interface_port spi_engine_ctrl sdo_data sdo_data Output DATA_WIDTH
add_interface_port spi_engine_ctrl sdi_data_ready sdi_ready Output 1
add_interface_port spi_engine_ctrl sdi_data_valid sdi_valid Input 1
add_interface_port spi_engine_ctrl sdi_data sdi_data Input DATA_WIDTH
add_interface_port spi_engine_ctrl sync_ready sync_ready Output 1
add_interface_port spi_engine_ctrl sync_valid sync_valid Input 1
add_interface_port spi_engine_ctrl sync_data sync_data Input 8

# 
# connection point offload_sdi
# 
add_interface offload_sdi conduit end
set_interface_property offload_sdi associatedClock spi_clk
add_interface_port offload_sdi offload_sdi_ready ready Input 1
add_interface_port offload_sdi offload_sdi_valid valid Output 1
add_interface_port offload_sdi offload_sdi_data data Output NUM_OF_SDI*DATA_WIDTH


