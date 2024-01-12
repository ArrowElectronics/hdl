// peripheral_sys.v

// Generated using ACDS version 23.2.1 194

`timescale 1 ps / 1 ps
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

	wire         clock_in_out_clk_clk;                                      // clock_in:out_clk -> [dipsw:clk, jtag_uart:clk, mm_bridge_0:clk, mm_interconnect_0:clock_in_out_clk_clk, pb:clk, reset_in:clk, rgb_led0:clk, rgb_led1:clk, rgb_led2:clk, rgb_led3:clk, rst_controller:clk, sys_id:clock]
	wire         reset_in_out_reset_reset;                                  // reset_in:out_reset -> [dipsw:reset_n, jtag_uart:rst_n, mm_bridge_0:reset, pb:reset_n, rgb_led0:reset_n, rgb_led1:reset_n, rgb_led2:reset_n, rgb_led3:reset_n, rst_controller:reset_in0, sys_id:reset_n]
	wire         mm_bridge_0_m0_waitrequest;                                // mm_interconnect_0:mm_bridge_0_m0_waitrequest -> mm_bridge_0:m0_waitrequest
	wire  [31:0] mm_bridge_0_m0_readdata;                                   // mm_interconnect_0:mm_bridge_0_m0_readdata -> mm_bridge_0:m0_readdata
	wire         mm_bridge_0_m0_debugaccess;                                // mm_bridge_0:m0_debugaccess -> mm_interconnect_0:mm_bridge_0_m0_debugaccess
	wire  [23:0] mm_bridge_0_m0_address;                                    // mm_bridge_0:m0_address -> mm_interconnect_0:mm_bridge_0_m0_address
	wire         mm_bridge_0_m0_read;                                       // mm_bridge_0:m0_read -> mm_interconnect_0:mm_bridge_0_m0_read
	wire   [3:0] mm_bridge_0_m0_byteenable;                                 // mm_bridge_0:m0_byteenable -> mm_interconnect_0:mm_bridge_0_m0_byteenable
	wire         mm_bridge_0_m0_readdatavalid;                              // mm_interconnect_0:mm_bridge_0_m0_readdatavalid -> mm_bridge_0:m0_readdatavalid
	wire  [31:0] mm_bridge_0_m0_writedata;                                  // mm_bridge_0:m0_writedata -> mm_interconnect_0:mm_bridge_0_m0_writedata
	wire         mm_bridge_0_m0_write;                                      // mm_bridge_0:m0_write -> mm_interconnect_0:mm_bridge_0_m0_write
	wire   [0:0] mm_bridge_0_m0_burstcount;                                 // mm_bridge_0:m0_burstcount -> mm_interconnect_0:mm_bridge_0_m0_burstcount
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect;  // mm_interconnect_0:jtag_uart_avalon_jtag_slave_chipselect -> jtag_uart:av_chipselect
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata;    // jtag_uart:av_readdata -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_readdata
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest; // jtag_uart:av_waitrequest -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_waitrequest
	wire   [0:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_address;     // mm_interconnect_0:jtag_uart_avalon_jtag_slave_address -> jtag_uart:av_address
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_read;        // mm_interconnect_0:jtag_uart_avalon_jtag_slave_read -> jtag_uart:av_read_n
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_write;       // mm_interconnect_0:jtag_uart_avalon_jtag_slave_write -> jtag_uart:av_write_n
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata;   // mm_interconnect_0:jtag_uart_avalon_jtag_slave_writedata -> jtag_uart:av_writedata
	wire  [31:0] mm_interconnect_0_sys_id_control_slave_readdata;           // sys_id:readdata -> mm_interconnect_0:sys_id_control_slave_readdata
	wire   [0:0] mm_interconnect_0_sys_id_control_slave_address;            // mm_interconnect_0:sys_id_control_slave_address -> sys_id:address
	wire         mm_interconnect_0_pb_s1_chipselect;                        // mm_interconnect_0:pb_s1_chipselect -> pb:chipselect
	wire  [31:0] mm_interconnect_0_pb_s1_readdata;                          // pb:readdata -> mm_interconnect_0:pb_s1_readdata
	wire   [1:0] mm_interconnect_0_pb_s1_address;                           // mm_interconnect_0:pb_s1_address -> pb:address
	wire         mm_interconnect_0_pb_s1_write;                             // mm_interconnect_0:pb_s1_write -> pb:write_n
	wire  [31:0] mm_interconnect_0_pb_s1_writedata;                         // mm_interconnect_0:pb_s1_writedata -> pb:writedata
	wire         mm_interconnect_0_dipsw_s1_chipselect;                     // mm_interconnect_0:dipsw_s1_chipselect -> dipsw:chipselect
	wire  [31:0] mm_interconnect_0_dipsw_s1_readdata;                       // dipsw:readdata -> mm_interconnect_0:dipsw_s1_readdata
	wire   [1:0] mm_interconnect_0_dipsw_s1_address;                        // mm_interconnect_0:dipsw_s1_address -> dipsw:address
	wire         mm_interconnect_0_dipsw_s1_write;                          // mm_interconnect_0:dipsw_s1_write -> dipsw:write_n
	wire  [31:0] mm_interconnect_0_dipsw_s1_writedata;                      // mm_interconnect_0:dipsw_s1_writedata -> dipsw:writedata
	wire         mm_interconnect_0_rgb_led0_s1_chipselect;                  // mm_interconnect_0:rgb_led0_s1_chipselect -> rgb_led0:chipselect
	wire  [31:0] mm_interconnect_0_rgb_led0_s1_readdata;                    // rgb_led0:readdata -> mm_interconnect_0:rgb_led0_s1_readdata
	wire   [1:0] mm_interconnect_0_rgb_led0_s1_address;                     // mm_interconnect_0:rgb_led0_s1_address -> rgb_led0:address
	wire         mm_interconnect_0_rgb_led0_s1_write;                       // mm_interconnect_0:rgb_led0_s1_write -> rgb_led0:write_n
	wire  [31:0] mm_interconnect_0_rgb_led0_s1_writedata;                   // mm_interconnect_0:rgb_led0_s1_writedata -> rgb_led0:writedata
	wire         mm_interconnect_0_rgb_led1_s1_chipselect;                  // mm_interconnect_0:rgb_led1_s1_chipselect -> rgb_led1:chipselect
	wire  [31:0] mm_interconnect_0_rgb_led1_s1_readdata;                    // rgb_led1:readdata -> mm_interconnect_0:rgb_led1_s1_readdata
	wire   [1:0] mm_interconnect_0_rgb_led1_s1_address;                     // mm_interconnect_0:rgb_led1_s1_address -> rgb_led1:address
	wire         mm_interconnect_0_rgb_led1_s1_write;                       // mm_interconnect_0:rgb_led1_s1_write -> rgb_led1:write_n
	wire  [31:0] mm_interconnect_0_rgb_led1_s1_writedata;                   // mm_interconnect_0:rgb_led1_s1_writedata -> rgb_led1:writedata
	wire         mm_interconnect_0_rgb_led2_s1_chipselect;                  // mm_interconnect_0:rgb_led2_s1_chipselect -> rgb_led2:chipselect
	wire  [31:0] mm_interconnect_0_rgb_led2_s1_readdata;                    // rgb_led2:readdata -> mm_interconnect_0:rgb_led2_s1_readdata
	wire   [1:0] mm_interconnect_0_rgb_led2_s1_address;                     // mm_interconnect_0:rgb_led2_s1_address -> rgb_led2:address
	wire         mm_interconnect_0_rgb_led2_s1_write;                       // mm_interconnect_0:rgb_led2_s1_write -> rgb_led2:write_n
	wire  [31:0] mm_interconnect_0_rgb_led2_s1_writedata;                   // mm_interconnect_0:rgb_led2_s1_writedata -> rgb_led2:writedata
	wire         mm_interconnect_0_rgb_led3_s1_chipselect;                  // mm_interconnect_0:rgb_led3_s1_chipselect -> rgb_led3:chipselect
	wire  [31:0] mm_interconnect_0_rgb_led3_s1_readdata;                    // rgb_led3:readdata -> mm_interconnect_0:rgb_led3_s1_readdata
	wire   [1:0] mm_interconnect_0_rgb_led3_s1_address;                     // mm_interconnect_0:rgb_led3_s1_address -> rgb_led3:address
	wire         mm_interconnect_0_rgb_led3_s1_write;                       // mm_interconnect_0:rgb_led3_s1_write -> rgb_led3:write_n
	wire  [31:0] mm_interconnect_0_rgb_led3_s1_writedata;                   // mm_interconnect_0:rgb_led3_s1_writedata -> rgb_led3:writedata
	wire         rst_controller_reset_out_reset;                            // rst_controller:reset_out -> [mm_interconnect_0:mm_bridge_0_m0_translator_reset_reset_bridge_in_reset_reset, mm_interconnect_0:mm_bridge_0_reset_reset_bridge_in_reset_reset]

	peripheral_sys_clock_in clock_in (
		.in_clk  (clk_clk),              //   input,  width = 1,  in_clk.clk
		.out_clk (clock_in_out_clk_clk)  //  output,  width = 1, out_clk.clk
	);

	peripheral_sys_pio_1 dipsw (
		.clk        (clock_in_out_clk_clk),                  //   input,   width = 1,                 clk.clk
		.reset_n    (~reset_in_out_reset_reset),             //   input,   width = 1,               reset.reset_n
		.address    (mm_interconnect_0_dipsw_s1_address),    //   input,   width = 2,                  s1.address
		.write_n    (~mm_interconnect_0_dipsw_s1_write),     //   input,   width = 1,                    .write_n
		.writedata  (mm_interconnect_0_dipsw_s1_writedata),  //   input,  width = 32,                    .writedata
		.chipselect (mm_interconnect_0_dipsw_s1_chipselect), //   input,   width = 1,                    .chipselect
		.readdata   (mm_interconnect_0_dipsw_s1_readdata),   //  output,  width = 32,                    .readdata
		.in_port    (dipsw_export),                          //   input,   width = 2, external_connection.export
		.irq        (dipsw_irq_irq)                          //  output,   width = 1,                 irq.irq
	);

	peripheral_sys_jtag_uart_0 jtag_uart (
		.clk            (clock_in_out_clk_clk),                                      //   input,   width = 1,               clk.clk
		.rst_n          (~reset_in_out_reset_reset),                                 //   input,   width = 1,             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  //   input,   width = 1, avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //   input,   width = 1,                  .address
		.av_read_n      (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),       //   input,   width = 1,                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //  output,  width = 32,                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),      //   input,   width = 1,                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //   input,  width = 32,                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //  output,   width = 1,                  .waitrequest
		.av_irq         (jtag_uart_irq_irq)                                          //  output,   width = 1,               irq.irq
	);

	peripheral_sys_mm_bridge_0 mm_bridge_0 (
		.clk              (clock_in_out_clk_clk),                  //   input,   width = 1,   clk.clk
		.reset            (reset_in_out_reset_reset),              //   input,   width = 1, reset.reset
		.s0_waitrequest   (mm_peripheral_bridge_s0_waitrequest),   //  output,   width = 1,    s0.waitrequest
		.s0_readdata      (mm_peripheral_bridge_s0_readdata),      //  output,  width = 32,      .readdata
		.s0_readdatavalid (mm_peripheral_bridge_s0_readdatavalid), //  output,   width = 1,      .readdatavalid
		.s0_burstcount    (mm_peripheral_bridge_s0_burstcount),    //   input,   width = 1,      .burstcount
		.s0_writedata     (mm_peripheral_bridge_s0_writedata),     //   input,  width = 32,      .writedata
		.s0_address       (mm_peripheral_bridge_s0_address),       //   input,  width = 24,      .address
		.s0_write         (mm_peripheral_bridge_s0_write),         //   input,   width = 1,      .write
		.s0_read          (mm_peripheral_bridge_s0_read),          //   input,   width = 1,      .read
		.s0_byteenable    (mm_peripheral_bridge_s0_byteenable),    //   input,   width = 4,      .byteenable
		.s0_debugaccess   (mm_peripheral_bridge_s0_debugaccess),   //   input,   width = 1,      .debugaccess
		.m0_waitrequest   (mm_bridge_0_m0_waitrequest),            //   input,   width = 1,    m0.waitrequest
		.m0_readdata      (mm_bridge_0_m0_readdata),               //   input,  width = 32,      .readdata
		.m0_readdatavalid (mm_bridge_0_m0_readdatavalid),          //   input,   width = 1,      .readdatavalid
		.m0_burstcount    (mm_bridge_0_m0_burstcount),             //  output,   width = 1,      .burstcount
		.m0_writedata     (mm_bridge_0_m0_writedata),              //  output,  width = 32,      .writedata
		.m0_address       (mm_bridge_0_m0_address),                //  output,  width = 24,      .address
		.m0_write         (mm_bridge_0_m0_write),                  //  output,   width = 1,      .write
		.m0_read          (mm_bridge_0_m0_read),                   //  output,   width = 1,      .read
		.m0_byteenable    (mm_bridge_0_m0_byteenable),             //  output,   width = 4,      .byteenable
		.m0_debugaccess   (mm_bridge_0_m0_debugaccess)             //  output,   width = 1,      .debugaccess
	);

	peripheral_sys_pio_0 pb (
		.clk        (clock_in_out_clk_clk),               //   input,   width = 1,                 clk.clk
		.reset_n    (~reset_in_out_reset_reset),          //   input,   width = 1,               reset.reset_n
		.address    (mm_interconnect_0_pb_s1_address),    //   input,   width = 2,                  s1.address
		.write_n    (~mm_interconnect_0_pb_s1_write),     //   input,   width = 1,                    .write_n
		.writedata  (mm_interconnect_0_pb_s1_writedata),  //   input,  width = 32,                    .writedata
		.chipselect (mm_interconnect_0_pb_s1_chipselect), //   input,   width = 1,                    .chipselect
		.readdata   (mm_interconnect_0_pb_s1_readdata),   //  output,  width = 32,                    .readdata
		.in_port    (pb_export),                          //   input,   width = 2, external_connection.export
		.irq        (pb_irq_irq)                          //  output,   width = 1,                 irq.irq
	);

	peripheral_sys_reset_in reset_in (
		.clk       (clock_in_out_clk_clk),     //   input,  width = 1,       clk.clk
		.in_reset  (reset_reset),              //   input,  width = 1,  in_reset.reset
		.out_reset (reset_in_out_reset_reset)  //  output,  width = 1, out_reset.reset
	);

	peripheral_sys_pio_2 rgb_led0 (
		.clk        (clock_in_out_clk_clk),                     //   input,   width = 1,                 clk.clk
		.reset_n    (~reset_in_out_reset_reset),                //   input,   width = 1,               reset.reset_n
		.address    (mm_interconnect_0_rgb_led0_s1_address),    //   input,   width = 2,                  s1.address
		.write_n    (~mm_interconnect_0_rgb_led0_s1_write),     //   input,   width = 1,                    .write_n
		.writedata  (mm_interconnect_0_rgb_led0_s1_writedata),  //   input,  width = 32,                    .writedata
		.chipselect (mm_interconnect_0_rgb_led0_s1_chipselect), //   input,   width = 1,                    .chipselect
		.readdata   (mm_interconnect_0_rgb_led0_s1_readdata),   //  output,  width = 32,                    .readdata
		.out_port   (rgb_led0_export)                           //  output,   width = 3, external_connection.export
	);

	peripheral_sys_pio_3 rgb_led1 (
		.clk        (clock_in_out_clk_clk),                     //   input,   width = 1,                 clk.clk
		.reset_n    (~reset_in_out_reset_reset),                //   input,   width = 1,               reset.reset_n
		.address    (mm_interconnect_0_rgb_led1_s1_address),    //   input,   width = 2,                  s1.address
		.write_n    (~mm_interconnect_0_rgb_led1_s1_write),     //   input,   width = 1,                    .write_n
		.writedata  (mm_interconnect_0_rgb_led1_s1_writedata),  //   input,  width = 32,                    .writedata
		.chipselect (mm_interconnect_0_rgb_led1_s1_chipselect), //   input,   width = 1,                    .chipselect
		.readdata   (mm_interconnect_0_rgb_led1_s1_readdata),   //  output,  width = 32,                    .readdata
		.out_port   (rgb_led1_export)                           //  output,   width = 3, external_connection.export
	);

	peripheral_sys_pio_4 rgb_led2 (
		.clk        (clock_in_out_clk_clk),                     //   input,   width = 1,                 clk.clk
		.reset_n    (~reset_in_out_reset_reset),                //   input,   width = 1,               reset.reset_n
		.address    (mm_interconnect_0_rgb_led2_s1_address),    //   input,   width = 2,                  s1.address
		.write_n    (~mm_interconnect_0_rgb_led2_s1_write),     //   input,   width = 1,                    .write_n
		.writedata  (mm_interconnect_0_rgb_led2_s1_writedata),  //   input,  width = 32,                    .writedata
		.chipselect (mm_interconnect_0_rgb_led2_s1_chipselect), //   input,   width = 1,                    .chipselect
		.readdata   (mm_interconnect_0_rgb_led2_s1_readdata),   //  output,  width = 32,                    .readdata
		.out_port   (rgb_led2_export)                           //  output,   width = 3, external_connection.export
	);

	peripheral_sys_pio_5 rgb_led3 (
		.clk        (clock_in_out_clk_clk),                     //   input,   width = 1,                 clk.clk
		.reset_n    (~reset_in_out_reset_reset),                //   input,   width = 1,               reset.reset_n
		.address    (mm_interconnect_0_rgb_led3_s1_address),    //   input,   width = 2,                  s1.address
		.write_n    (~mm_interconnect_0_rgb_led3_s1_write),     //   input,   width = 1,                    .write_n
		.writedata  (mm_interconnect_0_rgb_led3_s1_writedata),  //   input,  width = 32,                    .writedata
		.chipselect (mm_interconnect_0_rgb_led3_s1_chipselect), //   input,   width = 1,                    .chipselect
		.readdata   (mm_interconnect_0_rgb_led3_s1_readdata),   //  output,  width = 32,                    .readdata
		.out_port   (rgb_led3_export)                           //  output,   width = 3, external_connection.export
	);

	peripheral_sys_sysid_qsys_0 sys_id (
		.clock    (clock_in_out_clk_clk),                            //   input,   width = 1,           clk.clk
		.reset_n  (~reset_in_out_reset_reset),                       //   input,   width = 1,         reset.reset_n
		.readdata (mm_interconnect_0_sys_id_control_slave_readdata), //  output,  width = 32, control_slave.readdata
		.address  (mm_interconnect_0_sys_id_control_slave_address)   //   input,   width = 1,              .address
	);

	peripheral_sys_altera_mm_interconnect_1920_khqujnq mm_interconnect_0 (
		.mm_bridge_0_m0_address                                      (mm_bridge_0_m0_address),                                    //   input,  width = 24,                                        mm_bridge_0_m0.address
		.mm_bridge_0_m0_waitrequest                                  (mm_bridge_0_m0_waitrequest),                                //  output,   width = 1,                                                      .waitrequest
		.mm_bridge_0_m0_burstcount                                   (mm_bridge_0_m0_burstcount),                                 //   input,   width = 1,                                                      .burstcount
		.mm_bridge_0_m0_byteenable                                   (mm_bridge_0_m0_byteenable),                                 //   input,   width = 4,                                                      .byteenable
		.mm_bridge_0_m0_read                                         (mm_bridge_0_m0_read),                                       //   input,   width = 1,                                                      .read
		.mm_bridge_0_m0_readdata                                     (mm_bridge_0_m0_readdata),                                   //  output,  width = 32,                                                      .readdata
		.mm_bridge_0_m0_readdatavalid                                (mm_bridge_0_m0_readdatavalid),                              //  output,   width = 1,                                                      .readdatavalid
		.mm_bridge_0_m0_write                                        (mm_bridge_0_m0_write),                                      //   input,   width = 1,                                                      .write
		.mm_bridge_0_m0_writedata                                    (mm_bridge_0_m0_writedata),                                  //   input,  width = 32,                                                      .writedata
		.mm_bridge_0_m0_debugaccess                                  (mm_bridge_0_m0_debugaccess),                                //   input,   width = 1,                                                      .debugaccess
		.jtag_uart_avalon_jtag_slave_address                         (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //  output,   width = 1,                           jtag_uart_avalon_jtag_slave.address
		.jtag_uart_avalon_jtag_slave_write                           (mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),       //  output,   width = 1,                                                      .write
		.jtag_uart_avalon_jtag_slave_read                            (mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),        //  output,   width = 1,                                                      .read
		.jtag_uart_avalon_jtag_slave_readdata                        (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //   input,  width = 32,                                                      .readdata
		.jtag_uart_avalon_jtag_slave_writedata                       (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //  output,  width = 32,                                                      .writedata
		.jtag_uart_avalon_jtag_slave_waitrequest                     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //   input,   width = 1,                                                      .waitrequest
		.jtag_uart_avalon_jtag_slave_chipselect                      (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  //  output,   width = 1,                                                      .chipselect
		.sys_id_control_slave_address                                (mm_interconnect_0_sys_id_control_slave_address),            //  output,   width = 1,                                  sys_id_control_slave.address
		.sys_id_control_slave_readdata                               (mm_interconnect_0_sys_id_control_slave_readdata),           //   input,  width = 32,                                                      .readdata
		.pb_s1_address                                               (mm_interconnect_0_pb_s1_address),                           //  output,   width = 2,                                                 pb_s1.address
		.pb_s1_write                                                 (mm_interconnect_0_pb_s1_write),                             //  output,   width = 1,                                                      .write
		.pb_s1_readdata                                              (mm_interconnect_0_pb_s1_readdata),                          //   input,  width = 32,                                                      .readdata
		.pb_s1_writedata                                             (mm_interconnect_0_pb_s1_writedata),                         //  output,  width = 32,                                                      .writedata
		.pb_s1_chipselect                                            (mm_interconnect_0_pb_s1_chipselect),                        //  output,   width = 1,                                                      .chipselect
		.dipsw_s1_address                                            (mm_interconnect_0_dipsw_s1_address),                        //  output,   width = 2,                                              dipsw_s1.address
		.dipsw_s1_write                                              (mm_interconnect_0_dipsw_s1_write),                          //  output,   width = 1,                                                      .write
		.dipsw_s1_readdata                                           (mm_interconnect_0_dipsw_s1_readdata),                       //   input,  width = 32,                                                      .readdata
		.dipsw_s1_writedata                                          (mm_interconnect_0_dipsw_s1_writedata),                      //  output,  width = 32,                                                      .writedata
		.dipsw_s1_chipselect                                         (mm_interconnect_0_dipsw_s1_chipselect),                     //  output,   width = 1,                                                      .chipselect
		.rgb_led0_s1_address                                         (mm_interconnect_0_rgb_led0_s1_address),                     //  output,   width = 2,                                           rgb_led0_s1.address
		.rgb_led0_s1_write                                           (mm_interconnect_0_rgb_led0_s1_write),                       //  output,   width = 1,                                                      .write
		.rgb_led0_s1_readdata                                        (mm_interconnect_0_rgb_led0_s1_readdata),                    //   input,  width = 32,                                                      .readdata
		.rgb_led0_s1_writedata                                       (mm_interconnect_0_rgb_led0_s1_writedata),                   //  output,  width = 32,                                                      .writedata
		.rgb_led0_s1_chipselect                                      (mm_interconnect_0_rgb_led0_s1_chipselect),                  //  output,   width = 1,                                                      .chipselect
		.rgb_led1_s1_address                                         (mm_interconnect_0_rgb_led1_s1_address),                     //  output,   width = 2,                                           rgb_led1_s1.address
		.rgb_led1_s1_write                                           (mm_interconnect_0_rgb_led1_s1_write),                       //  output,   width = 1,                                                      .write
		.rgb_led1_s1_readdata                                        (mm_interconnect_0_rgb_led1_s1_readdata),                    //   input,  width = 32,                                                      .readdata
		.rgb_led1_s1_writedata                                       (mm_interconnect_0_rgb_led1_s1_writedata),                   //  output,  width = 32,                                                      .writedata
		.rgb_led1_s1_chipselect                                      (mm_interconnect_0_rgb_led1_s1_chipselect),                  //  output,   width = 1,                                                      .chipselect
		.rgb_led2_s1_address                                         (mm_interconnect_0_rgb_led2_s1_address),                     //  output,   width = 2,                                           rgb_led2_s1.address
		.rgb_led2_s1_write                                           (mm_interconnect_0_rgb_led2_s1_write),                       //  output,   width = 1,                                                      .write
		.rgb_led2_s1_readdata                                        (mm_interconnect_0_rgb_led2_s1_readdata),                    //   input,  width = 32,                                                      .readdata
		.rgb_led2_s1_writedata                                       (mm_interconnect_0_rgb_led2_s1_writedata),                   //  output,  width = 32,                                                      .writedata
		.rgb_led2_s1_chipselect                                      (mm_interconnect_0_rgb_led2_s1_chipselect),                  //  output,   width = 1,                                                      .chipselect
		.rgb_led3_s1_address                                         (mm_interconnect_0_rgb_led3_s1_address),                     //  output,   width = 2,                                           rgb_led3_s1.address
		.rgb_led3_s1_write                                           (mm_interconnect_0_rgb_led3_s1_write),                       //  output,   width = 1,                                                      .write
		.rgb_led3_s1_readdata                                        (mm_interconnect_0_rgb_led3_s1_readdata),                    //   input,  width = 32,                                                      .readdata
		.rgb_led3_s1_writedata                                       (mm_interconnect_0_rgb_led3_s1_writedata),                   //  output,  width = 32,                                                      .writedata
		.rgb_led3_s1_chipselect                                      (mm_interconnect_0_rgb_led3_s1_chipselect),                  //  output,   width = 1,                                                      .chipselect
		.mm_bridge_0_reset_reset_bridge_in_reset_reset               (rst_controller_reset_out_reset),                            //   input,   width = 1,               mm_bridge_0_reset_reset_bridge_in_reset.reset
		.mm_bridge_0_m0_translator_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                            //   input,   width = 1, mm_bridge_0_m0_translator_reset_reset_bridge_in_reset.reset
		.clock_in_out_clk_clk                                        (clock_in_out_clk_clk)                                       //   input,   width = 1,                                      clock_in_out_clk.clk
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("both"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (reset_in_out_reset_reset),       //   input,  width = 1, reset_in0.reset
		.clk            (clock_in_out_clk_clk),           //   input,  width = 1,       clk.clk
		.reset_out      (rst_controller_reset_out_reset), //  output,  width = 1, reset_out.reset
		.reset_req      (),                               // (terminated),                       
		.reset_req_in0  (1'b0),                           // (terminated),                       
		.reset_in1      (1'b0),                           // (terminated),                       
		.reset_req_in1  (1'b0),                           // (terminated),                       
		.reset_in2      (1'b0),                           // (terminated),                       
		.reset_req_in2  (1'b0),                           // (terminated),                       
		.reset_in3      (1'b0),                           // (terminated),                       
		.reset_req_in3  (1'b0),                           // (terminated),                       
		.reset_in4      (1'b0),                           // (terminated),                       
		.reset_req_in4  (1'b0),                           // (terminated),                       
		.reset_in5      (1'b0),                           // (terminated),                       
		.reset_req_in5  (1'b0),                           // (terminated),                       
		.reset_in6      (1'b0),                           // (terminated),                       
		.reset_req_in6  (1'b0),                           // (terminated),                       
		.reset_in7      (1'b0),                           // (terminated),                       
		.reset_req_in7  (1'b0),                           // (terminated),                       
		.reset_in8      (1'b0),                           // (terminated),                       
		.reset_req_in8  (1'b0),                           // (terminated),                       
		.reset_in9      (1'b0),                           // (terminated),                       
		.reset_req_in9  (1'b0),                           // (terminated),                       
		.reset_in10     (1'b0),                           // (terminated),                       
		.reset_req_in10 (1'b0),                           // (terminated),                       
		.reset_in11     (1'b0),                           // (terminated),                       
		.reset_req_in11 (1'b0),                           // (terminated),                       
		.reset_in12     (1'b0),                           // (terminated),                       
		.reset_req_in12 (1'b0),                           // (terminated),                       
		.reset_in13     (1'b0),                           // (terminated),                       
		.reset_req_in13 (1'b0),                           // (terminated),                       
		.reset_in14     (1'b0),                           // (terminated),                       
		.reset_req_in14 (1'b0),                           // (terminated),                       
		.reset_in15     (1'b0),                           // (terminated),                       
		.reset_req_in15 (1'b0)                            // (terminated),                       
	);

endmodule