// niosv_sys_altera_merlin_burst_adapter_altera_avalon_st_pipeline_stage_1923_qjy2pjq.v

// Generated using ACDS version 23.2.1 194

`timescale 1 ps / 1 ps
module niosv_sys_altera_merlin_burst_adapter_altera_avalon_st_pipeline_stage_1923_qjy2pjq #(
		parameter SYMBOLS_PER_BEAT = 1,
		parameter BITS_PER_SYMBOL  = 134,
		parameter USE_PACKETS      = 1,
		parameter USE_EMPTY        = 0,
		parameter EMPTY_WIDTH      = 0,
		parameter CHANNEL_WIDTH    = 14,
		parameter PACKET_WIDTH     = 2,
		parameter ERROR_WIDTH      = 0,
		parameter PIPELINE_READY   = 1,
		parameter SYNC_RESET       = 1
	) (
		input  wire         clk,               //       cr0.clk
		input  wire         reset,             // cr0_reset.reset
		output wire         in_ready,          //     sink0.ready
		input  wire         in_valid,          //          .valid
		input  wire         in_startofpacket,  //          .startofpacket
		input  wire         in_endofpacket,    //          .endofpacket
		input  wire [133:0] in_data,           //          .data
		input  wire [13:0]  in_channel,        //          .channel
		input  wire         out_ready,         //   source0.ready
		output wire         out_valid,         //          .valid
		output wire         out_startofpacket, //          .startofpacket
		output wire         out_endofpacket,   //          .endofpacket
		output wire [133:0] out_data,          //          .data
		output wire [13:0]  out_channel        //          .channel
	);

	niosv_sys_altera_avalon_st_pipeline_stage_1930_bv2ucky #(
		.SYMBOLS_PER_BEAT (SYMBOLS_PER_BEAT),
		.BITS_PER_SYMBOL  (BITS_PER_SYMBOL),
		.USE_PACKETS      (USE_PACKETS),
		.USE_EMPTY        (USE_EMPTY),
		.EMPTY_WIDTH      (EMPTY_WIDTH),
		.CHANNEL_WIDTH    (CHANNEL_WIDTH),
		.PACKET_WIDTH     (PACKET_WIDTH),
		.ERROR_WIDTH      (ERROR_WIDTH),
		.PIPELINE_READY   (PIPELINE_READY),
		.SYNC_RESET       (SYNC_RESET)
	) my_altera_avalon_st_pipeline_stage (
		.clk               (clk),               //   input,    width = 1,       cr0.clk
		.reset             (reset),             //   input,    width = 1, cr0_reset.reset
		.in_ready          (in_ready),          //  output,    width = 1,     sink0.ready
		.in_valid          (in_valid),          //   input,    width = 1,          .valid
		.in_startofpacket  (in_startofpacket),  //   input,    width = 1,          .startofpacket
		.in_endofpacket    (in_endofpacket),    //   input,    width = 1,          .endofpacket
		.in_data           (in_data),           //   input,  width = 134,          .data
		.in_channel        (in_channel),        //   input,   width = 14,          .channel
		.out_ready         (out_ready),         //   input,    width = 1,   source0.ready
		.out_valid         (out_valid),         //  output,    width = 1,          .valid
		.out_startofpacket (out_startofpacket), //  output,    width = 1,          .startofpacket
		.out_endofpacket   (out_endofpacket),   //  output,    width = 1,          .endofpacket
		.out_data          (out_data),          //  output,  width = 134,          .data
		.out_channel       (out_channel),       //  output,   width = 14,          .channel
		.in_empty          (1'b0),              // (terminated),                         
		.out_empty         (),                  // (terminated),                         
		.out_error         (),                  // (terminated),                         
		.in_error          (1'b0)               // (terminated),                         
	);

endmodule
