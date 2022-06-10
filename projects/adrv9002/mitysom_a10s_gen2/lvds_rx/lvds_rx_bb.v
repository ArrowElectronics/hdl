
module lvds_rx (
	ext_coreclock,
	ext_fclk,
	ext_loaden,
	rx_in,
	rx_out);	

	input		ext_coreclock;
	input		ext_fclk;
	input		ext_loaden;
	input	[3:0]	rx_in;
	output	[31:0]	rx_out;
endmodule
