	lvds_tx u0 (
		.tx_in        (<connected-to-tx_in>),        //        tx_in.export
		.tx_out       (<connected-to-tx_out>),       //       tx_out.export
		.tx_outclock  (<connected-to-tx_outclock>),  //  tx_outclock.export
		.tx_coreclock (<connected-to-tx_coreclock>), // tx_coreclock.export
		.inclock      (<connected-to-inclock>),      //      inclock.export
		.pll_areset   (<connected-to-pll_areset>),   //   pll_areset.export
		.pll_locked   (<connected-to-pll_locked>)    //   pll_locked.export
	);

