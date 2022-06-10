
module lvds_tx1 (
	ext_coreclock,
	ext_fclk,
	ext_loaden,
	tx_coreclock,
	tx_in,
	tx_out,
	tx_outclock);	

	input		ext_coreclock;
	input		ext_fclk;
	input		ext_loaden;
	output		tx_coreclock;
	input	[31:0]	tx_in;
	output	[3:0]	tx_out;
	output		tx_outclock;
endmodule
