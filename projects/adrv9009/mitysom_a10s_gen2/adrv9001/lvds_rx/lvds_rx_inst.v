	lvds_rx u0 (
		.inclock      (<connected-to-inclock>),      //      inclock.export
		.pll_areset   (<connected-to-pll_areset>),   //   pll_areset.export
		.pll_locked   (<connected-to-pll_locked>),   //   pll_locked.export
		.rx_in        (<connected-to-rx_in>),        //        rx_in.export
		.rx_out       (<connected-to-rx_out>),       //       rx_out.export
		.rx_coreclock (<connected-to-rx_coreclock>)  // rx_coreclock.export
	);

