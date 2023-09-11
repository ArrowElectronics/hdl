module peripheral_sys (
		input  wire        clk_clk,                               //                     clk.clk
		input  wire [1:0]  dipsw_export,                          //                   dipsw.export
		output wire        dipsw_irq_irq,                         //               dipsw_irq.irq
		output wire        jtag_uart_irq_irq,                     //           jtag_uart_irq.irq
		output wire        mm_peripheral_bridge_s0_waitrequest,   // mm_peripheral_bridge_s0.waitrequest
		output wire [31:0] mm_peripheral_bridge_s0_readdata,      //                        .readdata
		output wire        mm_peripheral_bridge_s0_readdatavalid, //                        .readdatavalid
		input  wire [0:0]  mm_peripheral_bridge_s0_burstcount,    //                        .burstcount
		input  wire [31:0] mm_peripheral_bridge_s0_writedata,     //                        .writedata
		input  wire [23:0] mm_peripheral_bridge_s0_address,       //                        .address
		input  wire        mm_peripheral_bridge_s0_write,         //                        .write
		input  wire        mm_peripheral_bridge_s0_read,          //                        .read
		input  wire [3:0]  mm_peripheral_bridge_s0_byteenable,    //                        .byteenable
		input  wire        mm_peripheral_bridge_s0_debugaccess,   //                        .debugaccess
		input  wire [1:0]  pb_export,                             //                      pb.export
		output wire        pb_irq_irq,                            //                  pb_irq.irq
		input  wire        reset_reset,                           //                   reset.reset
		output wire [2:0]  rgb_led0_export,                       //                rgb_led0.export
		output wire [2:0]  rgb_led1_export,                       //                rgb_led1.export
		output wire [2:0]  rgb_led2_export,                       //                rgb_led2.export
		output wire [2:0]  rgb_led3_export                        //                rgb_led3.export
	);
endmodule

