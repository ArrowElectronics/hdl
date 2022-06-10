# _hw.tcl file for adrv9002_gpio_in
package require -exact qsys 14.0

# module properties
set_module_property NAME {adrv9002_gpio_in_export}
set_module_property DISPLAY_NAME {adrv9002_gpio_in_export_display}

# default module properties
set_module_property VERSION {1.0}
set_module_property GROUP {default group}
set_module_property DESCRIPTION {default description}
set_module_property AUTHOR {author}

set_module_property COMPOSITION_CALLBACK compose
set_module_property opaque_address_map false

proc compose { } {
    # Instances and instance parameters
    # (disabled instances are intentionally culled)
    add_instance gpio_0 altera_gpio 20.1
    set_instance_parameter_value gpio_0 {EXT_DRIVER_PARAM} {0}
    set_instance_parameter_value gpio_0 {GENERATE_SDC_FILE} {0}
    set_instance_parameter_value gpio_0 {IP_MIGRATE_PORT_MAP_FILE} {altddio_bidir_port_map.csv}
    set_instance_parameter_value gpio_0 {PIN_TYPE_GUI} {Input}
    set_instance_parameter_value gpio_0 {SIZE} {1}
    set_instance_parameter_value gpio_0 {gui_areset_mode} {None}
    set_instance_parameter_value gpio_0 {gui_bus_hold} {0}
    set_instance_parameter_value gpio_0 {gui_diff_buff} {0}
    set_instance_parameter_value gpio_0 {gui_enable_cke} {0}
    set_instance_parameter_value gpio_0 {gui_enable_migratable_port_names} {0}
    set_instance_parameter_value gpio_0 {gui_enable_termination_ports} {0}
    set_instance_parameter_value gpio_0 {gui_hr_logic} {0}
    set_instance_parameter_value gpio_0 {gui_io_reg_mode} {DDIO}
    set_instance_parameter_value gpio_0 {gui_open_drain} {0}
    set_instance_parameter_value gpio_0 {gui_pseudo_diff} {1}
    set_instance_parameter_value gpio_0 {gui_separate_io_clks} {0}
    set_instance_parameter_value gpio_0 {gui_sreset_mode} {None}
    set_instance_parameter_value gpio_0 {gui_use_oe} {0}

    # connections and connection parameters
    # exported interfaces
    add_interface ck conduit end
    set_interface_property ck EXPORT_OF gpio_0.ck
    add_interface dout conduit end
    set_interface_property dout EXPORT_OF gpio_0.dout
    add_interface pad_in conduit end
    set_interface_property pad_in EXPORT_OF gpio_0.pad_in

    # interconnect requirements
    set_interconnect_requirement {$system} {qsys_mm.clockCrossingAdapter} {HANDSHAKE}
    set_interconnect_requirement {$system} {qsys_mm.enableEccProtection} {FALSE}
    set_interconnect_requirement {$system} {qsys_mm.insertDefaultSlave} {FALSE}
    set_interconnect_requirement {$system} {qsys_mm.maxAdditionalLatency} {1}
}
