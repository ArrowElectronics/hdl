
module lvds_rx (
	inclock,
	pll_areset,
	pll_locked,
	rx_in,
	rx_out,
	rx_coreclock);	

	input		inclock;
	input		pll_areset;
	output		pll_locked;
	input	[2:0]	rx_in;
	output	[23:0]	rx_out;
	output		rx_coreclock;
endmodule
