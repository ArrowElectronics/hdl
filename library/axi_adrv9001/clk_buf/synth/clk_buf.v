// clk_buf.v

// Generated using ACDS version 20.1 720

`timescale 1 ps / 1 ps
module clk_buf (
		input  wire  inclk,  //  altclkctrl_input.inclk
		output wire  outclk  // altclkctrl_output.outclk
	);

	clk_buf_altclkctrl_201_cgsd42i altclkctrl_0 (
		.inclk  (inclk),  //  altclkctrl_input.inclk
		.outclk (outclk)  // altclkctrl_output.outclk
	);

endmodule
