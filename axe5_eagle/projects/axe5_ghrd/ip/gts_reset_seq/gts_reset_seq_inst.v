	gts_reset_seq u0 (
		.o_src_rs_grant    (_connected_to_o_src_rs_grant_),    //  output,  width = 1,         rsif.src_rs_grant
		.i_src_rs_priority (_connected_to_i_src_rs_priority_), //   input,  width = 1,             .src_rs_priority
		.i_src_rs_req      (_connected_to_i_src_rs_req_),      //   input,  width = 1,             .src_rs_req
		.o_pma_cu_clk      (_connected_to_o_pma_cu_clk_)       //  output,  width = 1, o_pma_cu_clk.clk
	);

