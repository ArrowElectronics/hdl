package require qsys
source ../../scripts/adi_env.tcl
source ../../scripts/adi_ip_intel.tcl

set_module_property NAME spi_engine_execution_v1_0
set_module_property DESCRIPTION "SPI Engine execution"
set_module_property VERSION 1.0
set_module_property GROUP "Analog Devices"
set_module_property DISPLAY_NAME spi_engine_execution_v1_0

# files

add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property quartus_synth TOP_LEVEL spi_engine_execution
add_fileset_file spi_engine_execution.v VERILOG PATH $ad_hdl_dir/library/spi_engine/spi_engine_execution/spi_engine_execution.v VERILOG

# parameters

add_parameter NUM_OF_CS INTEGER 1
set_parameter_property NUM_OF_CS DEFAULT_VALUE 1
set_parameter_property NUM_OF_CS DISPLAY_NAME NUM_OF_CS
set_parameter_property NUM_OF_CS TYPE INTEGER
set_parameter_property NUM_OF_CS UNITS None
set_parameter_property NUM_OF_CS ALLOWED_RANGES -2147483648:2147483647
set_parameter_property NUM_OF_CS HDL_PARAMETER true

add_parameter DEFAULT_SPI_CFG INTEGER 0
set_parameter_property DEFAULT_SPI_CFG DEFAULT_VALUE 0
set_parameter_property DEFAULT_SPI_CFG DISPLAY_NAME DEFAULT_SPI_CFG
set_parameter_property DEFAULT_SPI_CFG TYPE INTEGER
set_parameter_property DEFAULT_SPI_CFG UNITS None
set_parameter_property DEFAULT_SPI_CFG ALLOWED_RANGES -2147483648:2147483647
set_parameter_property DEFAULT_SPI_CFG HDL_PARAMETER true

add_parameter DEFAULT_CLK_DIV INTEGER 0
set_parameter_property DEFAULT_CLK_DIV DEFAULT_VALUE 0
set_parameter_property DEFAULT_CLK_DIV DISPLAY_NAME DEFAULT_CLK_DIV
set_parameter_property DEFAULT_CLK_DIV TYPE INTEGER
set_parameter_property DEFAULT_CLK_DIV UNITS None
set_parameter_property DEFAULT_CLK_DIV ALLOWED_RANGES -2147483648:2147483647
set_parameter_property DEFAULT_CLK_DIV HDL_PARAMETER true

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

add_parameter SDO_DEFAULT STD_LOGIC_VECTOR 0
set_parameter_property SDO_DEFAULT DEFAULT_VALUE 0
set_parameter_property SDO_DEFAULT DISPLAY_NAME SDO_DEFAULT
set_parameter_property SDO_DEFAULT WIDTH 2
set_parameter_property SDO_DEFAULT TYPE STD_LOGIC_VECTOR
set_parameter_property SDO_DEFAULT UNITS None
set_parameter_property SDO_DEFAULT ALLOWED_RANGES 0:3
set_parameter_property SDO_DEFAULT HDL_PARAMETER true

add_parameter SDI_DELAY STD_LOGIC_VECTOR 0
set_parameter_property SDI_DELAY DEFAULT_VALUE 0
set_parameter_property SDI_DELAY DISPLAY_NAME SDI_DELAY
set_parameter_property SDI_DELAY WIDTH 3
set_parameter_property SDI_DELAY TYPE STD_LOGIC_VECTOR
set_parameter_property SDI_DELAY UNITS None
set_parameter_property SDI_DELAY ALLOWED_RANGES 0:7
set_parameter_property SDI_DELAY HDL_PARAMETER true


# 
# connection point clk
# 
add_interface clk clock end
set_interface_property clk clockRate 0
set_interface_property clk ENABLED true
set_interface_property clk EXPORT_OF ""
set_interface_property clk PORT_NAME_MAP ""
set_interface_property clk CMSIS_SVD_VARIABLES ""
set_interface_property clk SVD_ADDRESS_GROUP ""

add_interface_port clk clk clk Input 1

# 
# connection point resetn
# 
add_interface resetn reset end
set_interface_property resetn associatedClock clk
set_interface_property resetn synchronousEdges DEASSERT
set_interface_property resetn ENABLED true
set_interface_property resetn EXPORT_OF ""
set_interface_property resetn PORT_NAME_MAP ""
set_interface_property resetn CMSIS_SVD_VARIABLES ""
set_interface_property resetn SVD_ADDRESS_GROUP ""

add_interface_port resetn resetn reset_n Input 1

# 
# connection point ctrl
# 
add_interface ctrl conduit end
set_interface_property ctrl associatedClock clk
set_interface_property ctrl associatedReset resetn
set_interface_property ctrl ENABLED true
set_interface_property ctrl EXPORT_OF ""
set_interface_property ctrl PORT_NAME_MAP ""
set_interface_property ctrl CMSIS_SVD_VARIABLES ""
set_interface_property ctrl SVD_ADDRESS_GROUP ""

add_interface_port ctrl cmd_valid cmd_valid Input 1
add_interface_port ctrl sdo_data_valid sdo_data_valid Input 1
add_interface_port ctrl sdo_data_ready sdo_data_ready Output 1
add_interface_port ctrl sdo_data sdo_data Input DATA_WIDTH
add_interface_port ctrl sdi_data_ready sdi_data_ready Input 1
add_interface_port ctrl sdi_data_valid sdi_data_valid Output 1
add_interface_port ctrl sdi_data sdi_data Output NUM_OF_SDI*DATA_WIDTH
add_interface_port ctrl sync_ready sync_ready Input 1
add_interface_port ctrl sync_valid sync_valid Output 1
add_interface_port ctrl sync sync Output 8
add_interface_port ctrl cmd_ready cmd_ready Output 1
add_interface_port ctrl cmd cmd Input 16

# 
# connection point spi
# 
add_interface spi conduit end
set_interface_property spi associatedClock clk
set_interface_property spi associatedReset resetn
set_interface_property spi ENABLED true
set_interface_property spi EXPORT_OF ""
set_interface_property spi PORT_NAME_MAP ""
set_interface_property spi CMSIS_SVD_VARIABLES ""
set_interface_property spi SVD_ADDRESS_GROUP ""

add_interface_port spi three_wire three_wire Output 1
add_interface_port spi sdo_t sdo_t Output 1
add_interface_port spi sdo sdo Output 1
add_interface_port spi sdi sdi Input 1
add_interface_port spi cs cs Output NUM_OF_CS
add_interface_port spi sclk sclk Output 1

# 
# connection point active
# 
add_interface active conduit end
set_interface_property active associatedClock ""
set_interface_property active associatedReset ""
set_interface_property active ENABLED true
set_interface_property active EXPORT_OF ""
set_interface_property active PORT_NAME_MAP ""
set_interface_property active CMSIS_SVD_VARIABLES ""
set_interface_property active SVD_ADDRESS_GROUP ""

add_interface_port active active active Output 1