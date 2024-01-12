	peripheral_sys u0 (
		.clk_clk                               (_connected_to_clk_clk_),                               //   input,   width = 1,                     clk.clk
		.dipsw_export                          (_connected_to_dipsw_export_),                          //   input,   width = 2,                   dipsw.export
		.dipsw_irq_irq                         (_connected_to_dipsw_irq_irq_),                         //  output,   width = 1,               dipsw_irq.irq
		.jtag_uart_irq_irq                     (_connected_to_jtag_uart_irq_irq_),                     //  output,   width = 1,           jtag_uart_irq.irq
		.mm_peripheral_bridge_s0_waitrequest   (_connected_to_mm_peripheral_bridge_s0_waitrequest_),   //  output,   width = 1, mm_peripheral_bridge_s0.waitrequest
		.mm_peripheral_bridge_s0_readdata      (_connected_to_mm_peripheral_bridge_s0_readdata_),      //  output,  width = 32,                        .readdata
		.mm_peripheral_bridge_s0_readdatavalid (_connected_to_mm_peripheral_bridge_s0_readdatavalid_), //  output,   width = 1,                        .readdatavalid
		.mm_peripheral_bridge_s0_burstcount    (_connected_to_mm_peripheral_bridge_s0_burstcount_),    //   input,   width = 1,                        .burstcount
		.mm_peripheral_bridge_s0_writedata     (_connected_to_mm_peripheral_bridge_s0_writedata_),     //   input,  width = 32,                        .writedata
		.mm_peripheral_bridge_s0_address       (_connected_to_mm_peripheral_bridge_s0_address_),       //   input,  width = 24,                        .address
		.mm_peripheral_bridge_s0_write         (_connected_to_mm_peripheral_bridge_s0_write_),         //   input,   width = 1,                        .write
		.mm_peripheral_bridge_s0_read          (_connected_to_mm_peripheral_bridge_s0_read_),          //   input,   width = 1,                        .read
		.mm_peripheral_bridge_s0_byteenable    (_connected_to_mm_peripheral_bridge_s0_byteenable_),    //   input,   width = 4,                        .byteenable
		.mm_peripheral_bridge_s0_debugaccess   (_connected_to_mm_peripheral_bridge_s0_debugaccess_),   //   input,   width = 1,                        .debugaccess
		.pb_export                             (_connected_to_pb_export_),                             //   input,   width = 2,                      pb.export
		.pb_irq_irq                            (_connected_to_pb_irq_irq_),                            //  output,   width = 1,                  pb_irq.irq
		.reset_reset                           (_connected_to_reset_reset_),                           //   input,   width = 1,                   reset.reset
		.rgb_led0_export                       (_connected_to_rgb_led0_export_),                       //  output,   width = 3,                rgb_led0.export
		.rgb_led1_export                       (_connected_to_rgb_led1_export_),                       //  output,   width = 3,                rgb_led1.export
		.rgb_led2_export                       (_connected_to_rgb_led2_export_),                       //  output,   width = 3,                rgb_led2.export
		.rgb_led3_export                       (_connected_to_rgb_led3_export_),                       //  output,   width = 3,                rgb_led3.export
		.usb_hub_rst_export                    (_connected_to_usb_hub_rst_export_)                     //  output,   width = 1,             usb_hub_rst.export
	);

