// (C) 2001-2023 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


(* icm_name="sm_flux_rx_demux", module_type="decoder", simple_name="UNKNOWN", atom_type__std *)
module tennm_sm_flux_rx_demux 
    #(
        parameter sel                                                = "SEL_UNUSED"                   /* Settings: SEL_PCIE_PCS, SEL_XCVRIF, SEL_UNUSED */
    )
    (
        input [39:0] i_rx_data,
        output [39:0] o_pcie_pcs,
        output [31:0] o_xcvrif
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_flux_rx_demux 
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(
        .sel(sel)
    )
`endif // ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_flux_rx_demux (
        .i_rx_data(i_rx_data),
        .o_pcie_pcs(o_pcie_pcs),
        .o_xcvrif(o_xcvrif)
        );
`else // ifdef DDM_BASED_COREIP_GENERATOR
    generate
        if ( "SEL_PCIE_PCS" == sel ) begin : sel_is_PCIE_PCS
            assign o_pcie_pcs = i_rx_data;
        end : sel_is_PCIE_PCS
        if ( "SEL_XCVRIF" == sel ) begin : sel_is_XCVRIF
            assign o_xcvrif = i_rx_data[31:0];
	    assign o_pcie_pcs = 1'b0;
        end : sel_is_XCVRIF
    endgenerate
`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_flux_rx_demux

(* icm_name="sm_flux_rx_rxword_clk_demux", module_type="decoder", simple_name="UNKNOWN", atom_type__std *)
module tennm_sm_flux_rx_rxword_clk_demux 
    #(
        parameter sel                                                = "SEL_UNUSED"                   /* Settings: SEL_ETH_RXWORD_CLK, SEL_PCIE_RXWORD_CLK, SEL_UNUSED */
    )
    (
        input i_ock_pcs_rxword,
        output o_eth_rxword_clk,
        output o_pcie_rxword_clk
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_flux_rx_rxword_clk_demux 
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(
        .sel(sel)
    )
`endif // ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_flux_rx_rxword_clk_demux (
        .i_ock_pcs_rxword(i_ock_pcs_rxword),
        .o_eth_rxword_clk(o_eth_rxword_clk),
        .o_pcie_rxword_clk(o_pcie_rxword_clk)
        );
`else // ifdef DDM_BASED_COREIP_GENERATOR
    generate
        if ( "SEL_ETH_RXWORD_CLK" == sel ) begin : sel_is_ETH_RXWORD_CLK
            assign o_eth_rxword_clk = i_ock_pcs_rxword;
	    assign o_pcie_rxword_clk = 1'b0;
        end : sel_is_ETH_RXWORD_CLK
        if ( "SEL_PCIE_RXWORD_CLK" == sel ) begin : sel_is_PCIE_RXWORD_CLK
            assign o_pcie_rxword_clk = i_ock_pcs_rxword;
        end : sel_is_PCIE_RXWORD_CLK
    endgenerate
`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_flux_rx_rxword_clk_demux

(* icm_name="sm_flux_tx_txword_clk_demux", module_type="decoder", simple_name="UNKNOWN", atom_type__std *)
module tennm_sm_flux_tx_txword_clk_demux 
    #(
        parameter sel                                                = "SEL_UNUSED"                   /* Settings: SEL_ETH_TXWORD_CLK, SEL_PCIE_TXWORD_CLK, SEL_UNUSED */
    )
    (
        input i_ock_pcs_txword,
        output o_eth_txword_clk,
        output o_pcie_txword_clk
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_flux_tx_txword_clk_demux 
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(
        .sel(sel)
    )
`endif // ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_flux_tx_txword_clk_demux (
        .i_ock_pcs_txword(i_ock_pcs_txword),
        .o_eth_txword_clk(o_eth_txword_clk),
        .o_pcie_txword_clk(o_pcie_txword_clk)
        );
`else // ifdef DDM_BASED_COREIP_GENERATOR
    generate
        if ( "SEL_ETH_TXWORD_CLK" == sel ) begin : sel_is_ETH_TXWORD_CLK
            assign o_eth_txword_clk = i_ock_pcs_txword;
	    assign o_pcie_txword_clk = 1'b0;
        end : sel_is_ETH_TXWORD_CLK
        if ( "SEL_PCIE_TXWORD_CLK" == sel ) begin : sel_is_PCIE_TXWORD_CLK
            assign o_pcie_txword_clk = i_ock_pcs_txword;
	    assign o_eth_txword_clk = 1'b0;
        end : sel_is_PCIE_TXWORD_CLK
    endgenerate
`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_flux_tx_txword_clk_demux

(* icm_name="sm_flux_tx_mux", module_type="mux", simple_name="UNKNOWN", atom_type__std *)
module tennm_sm_flux_tx_mux 
    #(
        parameter sel                                                = "SEL_UNUSED"                   /* Settings: SEL_PCIE_PCS, SEL_XCVRIF, SEL_UNUSED */
    )
    (
        input [39:0] i_pcie_pcs,
        input [31:0] i_xcvrif,
        output [39:0] o_tx_data
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_flux_tx_mux 
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(
        .sel(sel)
    )
`endif // ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_flux_tx_mux (
        .i_pcie_pcs(i_pcie_pcs),
        .i_xcvrif(i_xcvrif),
        .o_tx_data(o_tx_data)
        );
`else // ifdef DDM_BASED_COREIP_GENERATOR
    generate
        if ( "SEL_PCIE_PCS" == sel ) begin : sel_is_PCIE_PCS
            assign o_tx_data = i_pcie_pcs;
        end : sel_is_PCIE_PCS
        if ( "SEL_XCVRIF" == sel ) begin : sel_is_XCVRIF
            assign o_tx_data = {8'b0, i_xcvrif};
        end : sel_is_XCVRIF
    endgenerate
`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_flux_tx_mux

(* icm_name="sm_flux_tx_txword_clk_mux", module_type="mux", simple_name="UNKNOWN", atom_type__std *)
module tennm_sm_flux_tx_txword_clk_mux 
    #(
        parameter sel                                                = "SEL_UNUSED"                   /* Settings: SEL_XCVR_TXWORD_CLK, SEL_UX_OCK_PMA_CLK, SEL_UNUSED */
    )
    (
        input i_ux_ock_pma_clk,
        input i_xcvr_txword_clk,
        output o_pcs_txword
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_flux_tx_txword_clk_mux 
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(
        .sel(sel)
    )
`endif // ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_flux_tx_txword_clk_mux (
        .i_ux_ock_pma_clk(i_ux_ock_pma_clk),
        .i_xcvr_txword_clk(i_xcvr_txword_clk),
        .o_pcs_txword(o_pcs_txword)
        );
`else // ifdef DDM_BASED_COREIP_GENERATOR
    generate
        if ( "SEL_XCVR_TXWORD_CLK" == sel ) begin : sel_is_XCVR_TXWORD_CLK
            assign o_pcs_txword = i_xcvr_txword_clk;
        end : sel_is_XCVR_TXWORD_CLK
        if ( "SEL_UX_OCK_PMA_CLK" == sel ) begin : sel_is_UX_OCK_PMA_CLK
            assign o_pcs_txword = i_ux_ock_pma_clk;
        end : sel_is_UX_OCK_PMA_CLK
    endgenerate
`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_flux_tx_txword_clk_mux

(* icm_name="sm_xcvrif_rx_ch_clk_mux", module_type="mux", simple_name="UNKNOWN", atom_type__std *)
module tennm_sm_xcvrif_rx_ch_clk_mux 
    #(
        parameter sel                                                = "SEL_UNUSED"                   /* Settings: SEL_RXWORD_CLK, SEL_SYS_CLK, SEL_UNUSED */
    )
    (
        input i_ground_clk,
        input i_rxword_clk,
        input i_sys_clk,
        output o_eth_rx_ch_clk
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_xcvrif_rx_ch_clk_mux 
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(
        .sel(sel)
    )
`endif // ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_xcvrif_rx_ch_clk_mux (
        .i_ground_clk(i_ground_clk),
        .i_rxword_clk(i_rxword_clk),
        .i_sys_clk(i_sys_clk),
        .o_eth_rx_ch_clk(o_eth_rx_ch_clk)
        );
`else // ifdef DDM_BASED_COREIP_GENERATOR
    generate
        if ( "SEL_RXWORD_CLK" == sel ) begin : sel_is_RXWORD_CLK
            assign o_eth_rx_ch_clk = i_rxword_clk;
        end : sel_is_RXWORD_CLK
        if ( "SEL_SYS_CLK" == sel ) begin : sel_is_SYS_CLK
            assign o_eth_rx_ch_clk = i_sys_clk;
        end : sel_is_SYS_CLK
        if ( "SEL_UNUSED" == sel ) begin : sel_is_UNUSED
            assign o_eth_rx_ch_clk = i_ground_clk;
        end : sel_is_UNUSED
    endgenerate
`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_xcvrif_rx_ch_clk_mux

(* icm_name="sm_xcvrif_tx_ch_clk_mux", module_type="mux", simple_name="UNKNOWN", atom_type__std *)
module tennm_sm_xcvrif_tx_ch_clk_mux 
    #(
        parameter sel                                                = "SEL_UNUSED"                   /* Settings: SEL_TXWORD_CLK, SEL_SYS_CLK, SEL_UNUSED */
    )
    (
        input i_ground_clk,
        input i_sys_clk,
        input i_txword_clk,
        output o_eth_tx_ch_clk
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_xcvrif_tx_ch_clk_mux 
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(
        .sel(sel)
    )
`endif // ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_xcvrif_tx_ch_clk_mux (
        .i_ground_clk(i_ground_clk),
        .i_sys_clk(i_sys_clk),
        .i_txword_clk(i_txword_clk),
        .o_eth_tx_ch_clk(o_eth_tx_ch_clk)
        );
`else // ifdef DDM_BASED_COREIP_GENERATOR
    generate
        if ( "SEL_TXWORD_CLK" == sel ) begin : sel_is_TXWORD_CLK
            assign o_eth_tx_ch_clk = i_txword_clk;
        end : sel_is_TXWORD_CLK
        if ( "SEL_SYS_CLK" == sel ) begin : sel_is_SYS_CLK
            assign o_eth_tx_ch_clk = i_sys_clk;
        end : sel_is_SYS_CLK
        if ( "SEL_UNUSED" == sel ) begin : sel_is_UNUSED
            assign o_eth_tx_ch_clk = i_ground_clk;
        end : sel_is_UNUSED
    endgenerate
`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_xcvrif_tx_ch_clk_mux


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "2sDhNbsqyAR6V4Cr1lf5sImhr2SjWD7Ex2tYxKHF+IxvEaFRxKZWMkPZ+k48k3iCoaf0nTwAsDUUBl4fvfgS/iXIsTcNBwqFtOVPv0fEQaH2Ijv+AAinwREFYY55f7RCJuh0iq2GHsLBOTgOE0kU30iJucqGnwoxratsmBGEVxsK1Izs9h2XGY0aoPdp+Y01o+YCRr6HpUFA9dc0zYENP38Wm5OfDCpQ/NiurtGu9I23zTxFEWFDMO2x3z6SCpwDNveL6o45BJcO99MGV2AO45l6FxR17i3Yej5GX8F+1WlaaY09ae6uZ62EYX7WBPxGUfVSCQCC8ZXio0pBeoRHRdS+2eschljYaclc8NXxfF8OrZwx4QWtshBqZkNnHqV4ldU3F8Hdj2GfRrX/uDDBhmALo0taBjR3iauDOkan3sqtmZny42dNP3uIdKZyYIDv6ifGvpqCeKdF0D9xm9T+DxSRc4LI31xMHHrVPS9cL50lZFwcLja40UdtsYiP8ysQ6Nhcdi6ewsqWl41zpB0cED+ANE9YBfM2P35F3XY63LHq7+fpjfw7uS9X+z6ZYYlf+wkJEFtxkLpH9E26N+8gLKxwOUHEj+BjXipmTT50E2bOnmd86yLi9AZJO72DQA5gBZ2lGTFp+m+TkFxLwQGO5LyO9N8aTbSq+IhMcjXpILDKcQ8bfA0HrErZ4bjy8cRuG4UuBZAYQN9fQ8DV1eOS8jLoVsWmdlJ0gCZF8de2IWtJ9erfSUuBKjCJ4AZ7b/LcWAllaGE9dmugbm6qjAqYfSrxWLsAocpFrt9H9m/RL38USumCiTkkCxGdKJiC9W6vNDfGB83DF/IkWFImGT+2iaB9eFW10fknDK/GIS01s0Dnp7unXwbzy6uZQYWIiJQmds9xfemT9ac0nUeP7VQdjLbVakCW7h9sog7dc8fHhxwwnr6l+bHDFlyebyqVsL+CV1sRpaPeh1PFN3q75p7ysrLCGMWa42rJ7DGyUDml2L9sFp2HY2KgxTlcKn88TxFB"
`endif