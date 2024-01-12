module gts_reset_seq (
		output wire [0:0] o_src_rs_grant,    //         rsif.src_rs_grant,    SRC_GRANT
		input  wire [0:0] i_src_rs_priority, //             .src_rs_priority, PRIORITY BIT
		input  wire [0:0] i_src_rs_req,      //             .src_rs_req,      SRC_REQ
		output wire [0:0] o_pma_cu_clk       // o_pma_cu_clk.clk,             PMA clock from PLL for proper calculation. For simulation only
	);
endmodule

