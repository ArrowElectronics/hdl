
module pll_1 (
	rst,
	refclk,
	locked,
	lvds_clk,
	loaden,
	outclk_2);	

	input		rst;
	input		refclk;
	output		locked;
	output	[1:0]	lvds_clk;
	output	[1:0]	loaden;
	output		outclk_2;
endmodule
