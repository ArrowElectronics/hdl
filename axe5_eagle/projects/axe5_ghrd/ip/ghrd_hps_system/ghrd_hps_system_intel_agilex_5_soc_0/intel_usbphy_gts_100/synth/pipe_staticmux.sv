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


(* icm_name="sm_hssi_pcie_pcs_clk_mux", module_type="mux", simple_name="UNKNOWN", atom_type__std *)
module tennm_sm_hssi_pcie_pcs_clk_mux #(
        parameter sel                                                = "SEL_UNUSED"                   /* Settings: SEL_SAME_QUAD_PCLK0, SEL_UPPER_QUAD_PCLK0, SEL_USB_PCLK, SEL_UNUSED */
    )
    (
        input i_same_quad_pclk0_clk,
        input i_unused_pclk0_clk,
        input i_upper_quad_pclk0_clk,
        input i_usb_pclk_clk,
        output o_clk 
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_hssi_pcie_pcs_clk_mux 
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(    
        .sel(sel)
    )
`endif // DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_hssi_pcie_pcs_clk_mux (
        .i_same_quad_pclk0_clk(i_same_quad_pclk0_clk),
        .i_unused_pclk0_clk(i_unused_pclk0_clk),
        .i_upper_quad_pclk0_clk(i_upper_quad_pclk0_clk),
        .i_usb_pclk_clk(i_usb_pclk_clk),
        .o_clk(o_clk)
        );    
`else // ifdef DDM_BASED_COREIP_GENERATOR
    generate
        if ( "SEL_SAME_QUAD_PCLK0" == sel ) begin : sel_is_SAME_QUAD_PCLK0
            assign o_clk = i_same_quad_pclk0_clk;
        end : sel_is_SAME_QUAD_PCLK0
        if ( "SEL_UPPER_QUAD_PCLK0" == sel ) begin : sel_is_UPPER_QUAD_PCLK0
            assign o_clk = i_upper_quad_pclk0_clk;
        end : sel_is_UPPER_QUAD_PCLK0
        if ( "SEL_USB_PCLK" == sel ) begin : sel_is_USB_PCLK
            assign o_clk = i_usb_pclk_clk;
        end : sel_is_USB_PCLK
        if ( "SEL_UNUSED" == sel ) begin : sel_is_UNUSED
            assign o_clk = i_unused_pclk0_clk;
        end : sel_is_UNUSED
    endgenerate
`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_hssi_pcie_pcs_clk_mux

(* icm_name="sm_hssi_pcie_pcs_hps_clkmux", module_type="mux", simple_name="UNKNOWN", atom_type__std *)
module tennm_sm_hssi_pcie_pcs_hps_clkmux #(
        parameter sel                                                = "SEL_UNUSED"                   /* Settings: SEL_HPS_PCS1_ENABLED, SEL_HPS_PCS2_ENABLED, SEL_UNUSED */
    )
    (
        input i_hps_pcs1_enabled_hps_clk,
        input i_hps_pcs2_enabled_hps_clk,
        output o_hps_clk
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_hssi_pcie_pcs_hps_clkmux 
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(    
        .sel(sel)
    )
`endif // DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_hssi_pcie_pcs_hps_clkmux (
        .i_hps_pcs1_enabled_hps_clk(i_hps_pcs1_enabled_hps_clk),
        .i_hps_pcs2_enabled_hps_clk(i_hps_pcs2_enabled_hps_clk),
        .o_hps_clk(o_hps_clk)
        );    
`else // ifdef DDM_BASED_COREIP_GENERATOR
    generate
        if ( "SEL_HPS_PCS1_ENABLED" == sel ) begin : sel_is_HPS_PCS1_ENABLED
            assign o_hps_clk = i_hps_pcs1_enabled_hps_clk;
        end : sel_is_HPS_PCS1_ENABLED
        if ( "SEL_HPS_PCS2_ENABLED" == sel ) begin : sel_is_HPS_PCS2_ENABLED
            assign o_hps_clk = i_hps_pcs2_enabled_hps_clk;
        end : sel_is_HPS_PCS2_ENABLED
    endgenerate
`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_hssi_pcie_pcs_hps_clkmux

(* icm_name="sm_hssi_pcie_pcs_hps_demux", module_type="decoder", simple_name="UNKNOWN", atom_type__std *)
module tennm_sm_hssi_pcie_pcs_hps_demux #(
        parameter sel                                                = "SEL_UNUSED"                   /* Settings: SEL_HPS_PCS1_ENABLED, SEL_HPS_PCS2_ENABLED, SEL_UNUSED */
    )
    (
        input i_txpipe_ebuf_mode,
        input [3:0] i_txpipe_powerdown,
        input [1:0] i_txpipe_rate,
        input i_txpipe_rxeqtraining,
        input i_txpipe_rxpolarity,
        input i_txpipe_rxtermination,
        input [15:0] i_txpipe_txdata,
        input [1:0] i_txpipe_txdatak,
        input i_txpipe_txdtctrx_lb,
        input i_txpipe_txelecidle,
        input i_txpipe_txoneszeros,
        output o_hps_pcs1_enabled_txpipe_asyncpowerchangeack,
        output o_hps_pcs1_enabled_txpipe_blockaligncontrol,
        output o_hps_pcs1_enabled_txpipe_cfg_hw_auto_sp_dis,
        output o_hps_pcs1_enabled_txpipe_dirchange,
        output o_hps_pcs1_enabled_txpipe_ebuf_mode,
        output o_hps_pcs1_enabled_txpipe_encodedecodebypass,
        output [5:0] o_hps_pcs1_enabled_txpipe_fs,
        output o_hps_pcs1_enabled_txpipe_getlocalpresetcoefficients,
        output o_hps_pcs1_enabled_txpipe_invalidrequest,
        output [5:0] o_hps_pcs1_enabled_txpipe_lf,
        output [4:0] o_hps_pcs1_enabled_txpipe_localpresetindex,
        output o_hps_pcs1_enabled_txpipe_lowpin_nt,
        output [7:0] o_hps_pcs1_enabled_txpipe_m2p_bus,
        output [2:0] o_hps_pcs1_enabled_txpipe_pclk_rate,
        output o_hps_pcs1_enabled_txpipe_pclkchangeack,
        output [3:0] o_hps_pcs1_enabled_txpipe_phy_mode_nt,
        output [3:0] o_hps_pcs1_enabled_txpipe_powerdown,
        output [2:0] o_hps_pcs1_enabled_txpipe_rate,
        output o_hps_pcs1_enabled_txpipe_rxelecidle_disable_a,
        output o_hps_pcs1_enabled_txpipe_rxeqclr,
        output o_hps_pcs1_enabled_txpipe_rxeqeval,
        output o_hps_pcs1_enabled_txpipe_rxeqinprogress,
        output o_hps_pcs1_enabled_txpipe_rxeqtraining,
        output o_hps_pcs1_enabled_txpipe_rxpolarity,
        output [2:0] o_hps_pcs1_enabled_txpipe_rxpresethint,
        output o_hps_pcs1_enabled_txpipe_rxstandby,
        output o_hps_pcs1_enabled_txpipe_rxtermination,
        output o_hps_pcs1_enabled_txpipe_srisenable,
        output o_hps_pcs1_enabled_txpipe_txcmnmode_disable_a,
        output o_hps_pcs1_enabled_txpipe_txcompliance,
        output [39:0] o_hps_pcs1_enabled_txpipe_txdata,
        output [3:0] o_hps_pcs1_enabled_txpipe_txdatak,
        output o_hps_pcs1_enabled_txpipe_txdatavalid,
        output [17:0] o_hps_pcs1_enabled_txpipe_txdeemph,
        output o_hps_pcs1_enabled_txpipe_txdtctrx_lb,
        output o_hps_pcs1_enabled_txpipe_txelecidle,
        output [2:0] o_hps_pcs1_enabled_txpipe_txmargin,
        output o_hps_pcs1_enabled_txpipe_txoneszeros,
        output o_hps_pcs1_enabled_txpipe_txstartblock,
        output o_hps_pcs1_enabled_txpipe_txswing,
        output [3:0] o_hps_pcs1_enabled_txpipe_txsyncheader,
        output [2:0] o_hps_pcs1_enabled_txpipe_width,
        output o_hps_pcs2_enabled_txpipe_asyncpowerchangeack,
        output o_hps_pcs2_enabled_txpipe_blockaligncontrol,
        output o_hps_pcs2_enabled_txpipe_cfg_hw_auto_sp_dis,
        output o_hps_pcs2_enabled_txpipe_dirchange,
        output o_hps_pcs2_enabled_txpipe_ebuf_mode,
        output o_hps_pcs2_enabled_txpipe_encodedecodebypass,
        output [5:0] o_hps_pcs2_enabled_txpipe_fs,
        output o_hps_pcs2_enabled_txpipe_getlocalpresetcoefficients,
        output o_hps_pcs2_enabled_txpipe_invalidrequest,
        output [5:0] o_hps_pcs2_enabled_txpipe_lf,
        output [4:0] o_hps_pcs2_enabled_txpipe_localpresetindex,
        output o_hps_pcs2_enabled_txpipe_lowpin_nt,
        output [7:0] o_hps_pcs2_enabled_txpipe_m2p_bus,
        output [2:0] o_hps_pcs2_enabled_txpipe_pclk_rate,
        output o_hps_pcs2_enabled_txpipe_pclkchangeack,
        output [3:0] o_hps_pcs2_enabled_txpipe_phy_mode_nt,
        output [3:0] o_hps_pcs2_enabled_txpipe_powerdown,
        output [2:0] o_hps_pcs2_enabled_txpipe_rate,
        output o_hps_pcs2_enabled_txpipe_rxelecidle_disable_a,
        output o_hps_pcs2_enabled_txpipe_rxeqclr,
        output o_hps_pcs2_enabled_txpipe_rxeqeval,
        output o_hps_pcs2_enabled_txpipe_rxeqinprogress,
        output o_hps_pcs2_enabled_txpipe_rxeqtraining,
        output o_hps_pcs2_enabled_txpipe_rxpolarity,
        output [2:0] o_hps_pcs2_enabled_txpipe_rxpresethint,
        output o_hps_pcs2_enabled_txpipe_rxstandby,
        output o_hps_pcs2_enabled_txpipe_rxtermination,
        output o_hps_pcs2_enabled_txpipe_srisenable,
        output o_hps_pcs2_enabled_txpipe_txcmnmode_disable_a,
        output o_hps_pcs2_enabled_txpipe_txcompliance,
        output [39:0] o_hps_pcs2_enabled_txpipe_txdata,
        output [3:0] o_hps_pcs2_enabled_txpipe_txdatak,
        output o_hps_pcs2_enabled_txpipe_txdatavalid,
        output [17:0] o_hps_pcs2_enabled_txpipe_txdeemph,
        output o_hps_pcs2_enabled_txpipe_txdtctrx_lb,
        output o_hps_pcs2_enabled_txpipe_txelecidle,
        output [2:0] o_hps_pcs2_enabled_txpipe_txmargin,
        output o_hps_pcs2_enabled_txpipe_txoneszeros,
        output o_hps_pcs2_enabled_txpipe_txstartblock,
        output o_hps_pcs2_enabled_txpipe_txswing,
        output [3:0] o_hps_pcs2_enabled_txpipe_txsyncheader,
        output [2:0] o_hps_pcs2_enabled_txpipe_width
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_hssi_pcie_pcs_hps_demux
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(
        .sel(sel)
    )
`endif // DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_hssi_pcie_pcs_hps_demux (
        .i_txpipe_ebuf_mode(i_txpipe_ebuf_mode),
        .i_txpipe_powerdown(i_txpipe_powerdown),
        .i_txpipe_rate(i_txpipe_rate),
        .i_txpipe_rxeqtraining(i_txpipe_rxeqtraining),
        .i_txpipe_rxpolarity(i_txpipe_rxpolarity),
        .i_txpipe_rxtermination(i_txpipe_rxtermination),
        .i_txpipe_txdata(i_txpipe_txdata),
        .i_txpipe_txdatak(i_txpipe_txdatak),
        .i_txpipe_txdtctrx_lb(i_txpipe_txdtctrx_lb),
        .i_txpipe_txelecidle(i_txpipe_txelecidle),
        .i_txpipe_txoneszeros(i_txpipe_txoneszeros),
        .o_hps_pcs1_enabled_txpipe_asyncpowerchangeack(o_hps_pcs1_enabled_txpipe_asyncpowerchangeack),
        .o_hps_pcs1_enabled_txpipe_blockaligncontrol(o_hps_pcs1_enabled_txpipe_blockaligncontrol),
        .o_hps_pcs1_enabled_txpipe_cfg_hw_auto_sp_dis(o_hps_pcs1_enabled_txpipe_cfg_hw_auto_sp_dis),
        .o_hps_pcs1_enabled_txpipe_dirchange(o_hps_pcs1_enabled_txpipe_dirchange),
        .o_hps_pcs1_enabled_txpipe_ebuf_mode(o_hps_pcs1_enabled_txpipe_ebuf_mode),
        .o_hps_pcs1_enabled_txpipe_encodedecodebypass(o_hps_pcs1_enabled_txpipe_encodedecodebypass),
        .o_hps_pcs1_enabled_txpipe_fs(o_hps_pcs1_enabled_txpipe_fs),
        .o_hps_pcs1_enabled_txpipe_getlocalpresetcoefficients(o_hps_pcs1_enabled_txpipe_getlocalpresetcoefficients),
        .o_hps_pcs1_enabled_txpipe_invalidrequest(o_hps_pcs1_enabled_txpipe_invalidrequest),
        .o_hps_pcs1_enabled_txpipe_lf(o_hps_pcs1_enabled_txpipe_lf),
        .o_hps_pcs1_enabled_txpipe_localpresetindex(o_hps_pcs1_enabled_txpipe_localpresetindex),
        .o_hps_pcs1_enabled_txpipe_lowpin_nt(o_hps_pcs1_enabled_txpipe_lowpin_nt),
        .o_hps_pcs1_enabled_txpipe_m2p_bus(o_hps_pcs1_enabled_txpipe_m2p_bus),
        .o_hps_pcs1_enabled_txpipe_pclk_rate(o_hps_pcs1_enabled_txpipe_pclk_rate),
        .o_hps_pcs1_enabled_txpipe_pclkchangeack(o_hps_pcs1_enabled_txpipe_pclkchangeack),
        .o_hps_pcs1_enabled_txpipe_phy_mode_nt(o_hps_pcs1_enabled_txpipe_phy_mode_nt),
        .o_hps_pcs1_enabled_txpipe_powerdown(o_hps_pcs1_enabled_txpipe_powerdown),
        .o_hps_pcs1_enabled_txpipe_rate(o_hps_pcs1_enabled_txpipe_rate),
        .o_hps_pcs1_enabled_txpipe_rxelecidle_disable_a(o_hps_pcs1_enabled_txpipe_rxelecidle_disable_a),
        .o_hps_pcs1_enabled_txpipe_rxeqclr(o_hps_pcs1_enabled_txpipe_rxeqclr),
        .o_hps_pcs1_enabled_txpipe_rxeqeval(o_hps_pcs1_enabled_txpipe_rxeqeval),
        .o_hps_pcs1_enabled_txpipe_rxeqinprogress(o_hps_pcs1_enabled_txpipe_rxeqinprogress),
        .o_hps_pcs1_enabled_txpipe_rxeqtraining(o_hps_pcs1_enabled_txpipe_rxeqtraining),
        .o_hps_pcs1_enabled_txpipe_rxpolarity(o_hps_pcs1_enabled_txpipe_rxpolarity),
        .o_hps_pcs1_enabled_txpipe_rxpresethint(o_hps_pcs1_enabled_txpipe_rxpresethint),
        .o_hps_pcs1_enabled_txpipe_rxstandby(o_hps_pcs1_enabled_txpipe_rxstandby),
        .o_hps_pcs1_enabled_txpipe_rxtermination(o_hps_pcs1_enabled_txpipe_rxtermination),
        .o_hps_pcs1_enabled_txpipe_srisenable(o_hps_pcs1_enabled_txpipe_srisenable),
        .o_hps_pcs1_enabled_txpipe_txcmnmode_disable_a(o_hps_pcs1_enabled_txpipe_txcmnmode_disable_a),
        .o_hps_pcs1_enabled_txpipe_txcompliance(o_hps_pcs1_enabled_txpipe_txcompliance),
        .o_hps_pcs1_enabled_txpipe_txdata(o_hps_pcs1_enabled_txpipe_txdata),
        .o_hps_pcs1_enabled_txpipe_txdatak(o_hps_pcs1_enabled_txpipe_txdatak),
        .o_hps_pcs1_enabled_txpipe_txdatavalid(o_hps_pcs1_enabled_txpipe_txdatavalid),
        .o_hps_pcs1_enabled_txpipe_txdeemph(o_hps_pcs1_enabled_txpipe_txdeemph),
        .o_hps_pcs1_enabled_txpipe_txdtctrx_lb(o_hps_pcs1_enabled_txpipe_txdtctrx_lb),
        .o_hps_pcs1_enabled_txpipe_txelecidle(o_hps_pcs1_enabled_txpipe_txelecidle),
        .o_hps_pcs1_enabled_txpipe_txmargin(o_hps_pcs1_enabled_txpipe_txmargin),
        .o_hps_pcs1_enabled_txpipe_txoneszeros(o_hps_pcs1_enabled_txpipe_txoneszeros),
        .o_hps_pcs1_enabled_txpipe_txstartblock(o_hps_pcs1_enabled_txpipe_txstartblock),
        .o_hps_pcs1_enabled_txpipe_txswing(o_hps_pcs1_enabled_txpipe_txswing),
        .o_hps_pcs1_enabled_txpipe_txsyncheader(o_hps_pcs1_enabled_txpipe_txsyncheader),
        .o_hps_pcs1_enabled_txpipe_width(o_hps_pcs1_enabled_txpipe_width),
        .o_hps_pcs2_enabled_txpipe_asyncpowerchangeack(o_hps_pcs2_enabled_txpipe_asyncpowerchangeack),
        .o_hps_pcs2_enabled_txpipe_blockaligncontrol(o_hps_pcs2_enabled_txpipe_blockaligncontrol),
        .o_hps_pcs2_enabled_txpipe_cfg_hw_auto_sp_dis(o_hps_pcs2_enabled_txpipe_cfg_hw_auto_sp_dis),
        .o_hps_pcs2_enabled_txpipe_dirchange(o_hps_pcs2_enabled_txpipe_dirchange),
        .o_hps_pcs2_enabled_txpipe_ebuf_mode(o_hps_pcs2_enabled_txpipe_ebuf_mode),
        .o_hps_pcs2_enabled_txpipe_encodedecodebypass(o_hps_pcs2_enabled_txpipe_encodedecodebypass),
        .o_hps_pcs2_enabled_txpipe_fs(o_hps_pcs2_enabled_txpipe_fs),
        .o_hps_pcs2_enabled_txpipe_getlocalpresetcoefficients(o_hps_pcs2_enabled_txpipe_getlocalpresetcoefficients),
        .o_hps_pcs2_enabled_txpipe_invalidrequest(o_hps_pcs2_enabled_txpipe_invalidrequest),
        .o_hps_pcs2_enabled_txpipe_lf(o_hps_pcs2_enabled_txpipe_lf),
        .o_hps_pcs2_enabled_txpipe_localpresetindex(o_hps_pcs2_enabled_txpipe_localpresetindex),
        .o_hps_pcs2_enabled_txpipe_lowpin_nt(o_hps_pcs2_enabled_txpipe_lowpin_nt),
        .o_hps_pcs2_enabled_txpipe_m2p_bus(o_hps_pcs2_enabled_txpipe_m2p_bus),
        .o_hps_pcs2_enabled_txpipe_pclk_rate(o_hps_pcs2_enabled_txpipe_pclk_rate),
        .o_hps_pcs2_enabled_txpipe_pclkchangeack(o_hps_pcs2_enabled_txpipe_pclkchangeack),
        .o_hps_pcs2_enabled_txpipe_phy_mode_nt(o_hps_pcs2_enabled_txpipe_phy_mode_nt),
        .o_hps_pcs2_enabled_txpipe_powerdown(o_hps_pcs2_enabled_txpipe_powerdown),
        .o_hps_pcs2_enabled_txpipe_rate(o_hps_pcs2_enabled_txpipe_rate),
        .o_hps_pcs2_enabled_txpipe_rxelecidle_disable_a(o_hps_pcs2_enabled_txpipe_rxelecidle_disable_a),
        .o_hps_pcs2_enabled_txpipe_rxeqclr(o_hps_pcs2_enabled_txpipe_rxeqclr),
        .o_hps_pcs2_enabled_txpipe_rxeqeval(o_hps_pcs2_enabled_txpipe_rxeqeval),
        .o_hps_pcs2_enabled_txpipe_rxeqinprogress(o_hps_pcs2_enabled_txpipe_rxeqinprogress),
        .o_hps_pcs2_enabled_txpipe_rxeqtraining(o_hps_pcs2_enabled_txpipe_rxeqtraining),
        .o_hps_pcs2_enabled_txpipe_rxpolarity(o_hps_pcs2_enabled_txpipe_rxpolarity),
        .o_hps_pcs2_enabled_txpipe_rxpresethint(o_hps_pcs2_enabled_txpipe_rxpresethint),
        .o_hps_pcs2_enabled_txpipe_rxstandby(o_hps_pcs2_enabled_txpipe_rxstandby),
        .o_hps_pcs2_enabled_txpipe_rxtermination(o_hps_pcs2_enabled_txpipe_rxtermination),
        .o_hps_pcs2_enabled_txpipe_srisenable(o_hps_pcs2_enabled_txpipe_srisenable),
        .o_hps_pcs2_enabled_txpipe_txcmnmode_disable_a(o_hps_pcs2_enabled_txpipe_txcmnmode_disable_a),
        .o_hps_pcs2_enabled_txpipe_txcompliance(o_hps_pcs2_enabled_txpipe_txcompliance),
        .o_hps_pcs2_enabled_txpipe_txdata(o_hps_pcs2_enabled_txpipe_txdata),
        .o_hps_pcs2_enabled_txpipe_txdatak(o_hps_pcs2_enabled_txpipe_txdatak),
        .o_hps_pcs2_enabled_txpipe_txdatavalid(o_hps_pcs2_enabled_txpipe_txdatavalid),
        .o_hps_pcs2_enabled_txpipe_txdeemph(o_hps_pcs2_enabled_txpipe_txdeemph),
        .o_hps_pcs2_enabled_txpipe_txdtctrx_lb(o_hps_pcs2_enabled_txpipe_txdtctrx_lb),
        .o_hps_pcs2_enabled_txpipe_txelecidle(o_hps_pcs2_enabled_txpipe_txelecidle),
        .o_hps_pcs2_enabled_txpipe_txmargin(o_hps_pcs2_enabled_txpipe_txmargin),
        .o_hps_pcs2_enabled_txpipe_txoneszeros(o_hps_pcs2_enabled_txpipe_txoneszeros),
        .o_hps_pcs2_enabled_txpipe_txstartblock(o_hps_pcs2_enabled_txpipe_txstartblock),
        .o_hps_pcs2_enabled_txpipe_txswing(o_hps_pcs2_enabled_txpipe_txswing),
        .o_hps_pcs2_enabled_txpipe_txsyncheader(o_hps_pcs2_enabled_txpipe_txsyncheader),
        .o_hps_pcs2_enabled_txpipe_width(o_hps_pcs2_enabled_txpipe_width)
        );
`else // ifdef DDM_BASED_COREIP_GENERATOR
    generate
        if ( "SEL_HPS_PCS1_ENABLED" == sel ) begin : sel_is_HPS_PCS1_ENABLED
            assign o_hps_pcs1_enabled_txpipe_asyncpowerchangeack = '0;
            assign o_hps_pcs1_enabled_txpipe_blockaligncontrol = '0;
            assign o_hps_pcs1_enabled_txpipe_cfg_hw_auto_sp_dis = '0;
            assign o_hps_pcs1_enabled_txpipe_dirchange = '0;
            assign o_hps_pcs1_enabled_txpipe_ebuf_mode = i_txpipe_ebuf_mode;
            assign o_hps_pcs1_enabled_txpipe_encodedecodebypass = '0;
            assign o_hps_pcs1_enabled_txpipe_fs = '0;
            assign o_hps_pcs1_enabled_txpipe_getlocalpresetcoefficients = '0;
            assign o_hps_pcs1_enabled_txpipe_invalidrequest = '0;
            assign o_hps_pcs1_enabled_txpipe_lf = '0;
            assign o_hps_pcs1_enabled_txpipe_localpresetindex = '0;
            assign o_hps_pcs1_enabled_txpipe_lowpin_nt = '0;
            assign o_hps_pcs1_enabled_txpipe_m2p_bus = '0;
            assign o_hps_pcs1_enabled_txpipe_pclk_rate = 3'b001;
            assign o_hps_pcs1_enabled_txpipe_pclkchangeack = '0;
            assign o_hps_pcs1_enabled_txpipe_phy_mode_nt = 4'd1;
            assign o_hps_pcs1_enabled_txpipe_powerdown = i_txpipe_powerdown;
            assign o_hps_pcs1_enabled_txpipe_rate[1:0] = '0;
            assign o_hps_pcs1_enabled_txpipe_rate[2] = '0;
            assign o_hps_pcs1_enabled_txpipe_rxelecidle_disable_a = '0;
            assign o_hps_pcs1_enabled_txpipe_rxeqclr = '0;
            assign o_hps_pcs1_enabled_txpipe_rxeqeval = '0;
            assign o_hps_pcs1_enabled_txpipe_rxeqinprogress = '0;
            assign o_hps_pcs1_enabled_txpipe_rxeqtraining = i_txpipe_rxeqtraining;
            assign o_hps_pcs1_enabled_txpipe_rxpolarity = i_txpipe_rxpolarity;
            assign o_hps_pcs1_enabled_txpipe_rxpresethint = '0;
            assign o_hps_pcs1_enabled_txpipe_rxstandby = '0;
            assign o_hps_pcs1_enabled_txpipe_rxtermination = i_txpipe_rxtermination;
            assign o_hps_pcs1_enabled_txpipe_srisenable = '0;
            assign o_hps_pcs1_enabled_txpipe_txcmnmode_disable_a = '0;
            assign o_hps_pcs1_enabled_txpipe_txcompliance = '0;
            assign o_hps_pcs1_enabled_txpipe_txdata[15:0] = i_txpipe_txdata;
            assign o_hps_pcs1_enabled_txpipe_txdata[39:16] = '0;
            assign o_hps_pcs1_enabled_txpipe_txdatak[1:0] = i_txpipe_txdatak;
            assign o_hps_pcs1_enabled_txpipe_txdatak[3:2] = '0;
            assign o_hps_pcs1_enabled_txpipe_txdatavalid = '0;
            assign o_hps_pcs1_enabled_txpipe_txdeemph = {16'd0,i_txpipe_rate[1:0]};
            assign o_hps_pcs1_enabled_txpipe_txdtctrx_lb = i_txpipe_txdtctrx_lb;
            assign o_hps_pcs1_enabled_txpipe_txelecidle = i_txpipe_txelecidle;
            assign o_hps_pcs1_enabled_txpipe_txmargin = '0;
            assign o_hps_pcs1_enabled_txpipe_txoneszeros = i_txpipe_txoneszeros;
            assign o_hps_pcs1_enabled_txpipe_txstartblock = '0;
            assign o_hps_pcs1_enabled_txpipe_txswing = '0;
            assign o_hps_pcs1_enabled_txpipe_txsyncheader = '0;
            assign o_hps_pcs1_enabled_txpipe_width = 3'b001;
            assign o_hps_pcs2_enabled_txpipe_asyncpowerchangeack = '0;
            assign o_hps_pcs2_enabled_txpipe_blockaligncontrol = '0;
            assign o_hps_pcs2_enabled_txpipe_cfg_hw_auto_sp_dis = '0;
            assign o_hps_pcs2_enabled_txpipe_dirchange = '0;
            assign o_hps_pcs2_enabled_txpipe_ebuf_mode = '0;
            assign o_hps_pcs2_enabled_txpipe_encodedecodebypass = '0;
            assign o_hps_pcs2_enabled_txpipe_fs = '0;
            assign o_hps_pcs2_enabled_txpipe_getlocalpresetcoefficients = '0;
            assign o_hps_pcs2_enabled_txpipe_invalidrequest = '0;
            assign o_hps_pcs2_enabled_txpipe_lf = '0;
            assign o_hps_pcs2_enabled_txpipe_localpresetindex = '0;
            assign o_hps_pcs2_enabled_txpipe_lowpin_nt = '0;
            assign o_hps_pcs2_enabled_txpipe_m2p_bus = '0;
            assign o_hps_pcs2_enabled_txpipe_pclk_rate = 3'b001;
            assign o_hps_pcs2_enabled_txpipe_pclkchangeack = '0;
            assign o_hps_pcs2_enabled_txpipe_phy_mode_nt = 4'd1;
            assign o_hps_pcs2_enabled_txpipe_powerdown = '0;
            assign o_hps_pcs2_enabled_txpipe_rate = '0;
            assign o_hps_pcs2_enabled_txpipe_rxelecidle_disable_a = '0;
            assign o_hps_pcs2_enabled_txpipe_rxeqclr = '0;
            assign o_hps_pcs2_enabled_txpipe_rxeqeval = '0;
            assign o_hps_pcs2_enabled_txpipe_rxeqinprogress = '0;
            assign o_hps_pcs2_enabled_txpipe_rxeqtraining = '0;
            assign o_hps_pcs2_enabled_txpipe_rxpolarity = '0;
            assign o_hps_pcs2_enabled_txpipe_rxpresethint = '0;
            assign o_hps_pcs2_enabled_txpipe_rxstandby = '0;
            assign o_hps_pcs2_enabled_txpipe_rxtermination = '0;
            assign o_hps_pcs2_enabled_txpipe_srisenable = '0;
            assign o_hps_pcs2_enabled_txpipe_txcmnmode_disable_a = '0;
            assign o_hps_pcs2_enabled_txpipe_txcompliance = '0;
            assign o_hps_pcs2_enabled_txpipe_txdata = '0;
            assign o_hps_pcs2_enabled_txpipe_txdatak = '0;
            assign o_hps_pcs2_enabled_txpipe_txdatavalid = '0;
            assign o_hps_pcs2_enabled_txpipe_txdeemph = '0;
            assign o_hps_pcs2_enabled_txpipe_txdtctrx_lb = '0;
            assign o_hps_pcs2_enabled_txpipe_txelecidle = '0;
            assign o_hps_pcs2_enabled_txpipe_txmargin = '0;
            assign o_hps_pcs2_enabled_txpipe_txoneszeros = '0;
            assign o_hps_pcs2_enabled_txpipe_txstartblock = '0;
            assign o_hps_pcs2_enabled_txpipe_txswing = '0;
            assign o_hps_pcs2_enabled_txpipe_txsyncheader = '0;
            assign o_hps_pcs2_enabled_txpipe_width = 3'b001;
        end : sel_is_HPS_PCS1_ENABLED
        if ( "SEL_HPS_PCS2_ENABLED" == sel ) begin : sel_is_HPS_PCS2_ENABLED
            assign o_hps_pcs2_enabled_txpipe_asyncpowerchangeack = '0;
            assign o_hps_pcs2_enabled_txpipe_blockaligncontrol = '0;
            assign o_hps_pcs2_enabled_txpipe_cfg_hw_auto_sp_dis = '0;
            assign o_hps_pcs2_enabled_txpipe_dirchange = '0;
            assign o_hps_pcs2_enabled_txpipe_ebuf_mode = i_txpipe_ebuf_mode;
            assign o_hps_pcs2_enabled_txpipe_encodedecodebypass = '0;
            assign o_hps_pcs2_enabled_txpipe_fs = '0;
            assign o_hps_pcs2_enabled_txpipe_getlocalpresetcoefficients = '0;
            assign o_hps_pcs2_enabled_txpipe_invalidrequest = '0;
            assign o_hps_pcs2_enabled_txpipe_lf = '0;
            assign o_hps_pcs2_enabled_txpipe_localpresetindex = '0;
            assign o_hps_pcs2_enabled_txpipe_lowpin_nt = '0;
            assign o_hps_pcs2_enabled_txpipe_m2p_bus = '0;
            assign o_hps_pcs2_enabled_txpipe_pclk_rate = 3'b001;
            assign o_hps_pcs2_enabled_txpipe_pclkchangeack = '0;
            assign o_hps_pcs2_enabled_txpipe_phy_mode_nt = 4'd1;
            assign o_hps_pcs2_enabled_txpipe_powerdown = i_txpipe_powerdown;
            assign o_hps_pcs2_enabled_txpipe_rate[1:0] = '0;
            assign o_hps_pcs2_enabled_txpipe_rate[2] = '0;
            assign o_hps_pcs2_enabled_txpipe_rxelecidle_disable_a = '0;
            assign o_hps_pcs2_enabled_txpipe_rxeqclr = '0;
            assign o_hps_pcs2_enabled_txpipe_rxeqeval = '0;
            assign o_hps_pcs2_enabled_txpipe_rxeqinprogress = '0;
            assign o_hps_pcs2_enabled_txpipe_rxeqtraining = i_txpipe_rxeqtraining;
            assign o_hps_pcs2_enabled_txpipe_rxpolarity = i_txpipe_rxpolarity;
            assign o_hps_pcs2_enabled_txpipe_rxpresethint = '0;
            assign o_hps_pcs2_enabled_txpipe_rxstandby = '0;
            assign o_hps_pcs2_enabled_txpipe_rxtermination = i_txpipe_rxtermination;
            assign o_hps_pcs2_enabled_txpipe_srisenable = '0;
            assign o_hps_pcs2_enabled_txpipe_txcmnmode_disable_a = '0;
            assign o_hps_pcs2_enabled_txpipe_txcompliance = '0;
            assign o_hps_pcs2_enabled_txpipe_txdata[15:0] = i_txpipe_txdata;
            assign o_hps_pcs2_enabled_txpipe_txdata[39:16] = '0;
            assign o_hps_pcs2_enabled_txpipe_txdatak[1:0] = i_txpipe_txdatak;
            assign o_hps_pcs2_enabled_txpipe_txdatak[3:2] = '0;
            assign o_hps_pcs2_enabled_txpipe_txdatavalid = '0;
            assign o_hps_pcs2_enabled_txpipe_txdeemph = {16'd0,i_txpipe_rate[1:0]};
            assign o_hps_pcs2_enabled_txpipe_txdtctrx_lb = i_txpipe_txdtctrx_lb;
            assign o_hps_pcs2_enabled_txpipe_txelecidle = i_txpipe_txelecidle;
            assign o_hps_pcs2_enabled_txpipe_txmargin = '0;
            assign o_hps_pcs2_enabled_txpipe_txoneszeros = i_txpipe_txoneszeros;
            assign o_hps_pcs2_enabled_txpipe_txstartblock = '0;
            assign o_hps_pcs2_enabled_txpipe_txswing = '0;
            assign o_hps_pcs2_enabled_txpipe_txsyncheader = '0;
            assign o_hps_pcs2_enabled_txpipe_width = 3'b001;
            assign o_hps_pcs1_enabled_txpipe_asyncpowerchangeack = '0;
            assign o_hps_pcs1_enabled_txpipe_blockaligncontrol = '0;
            assign o_hps_pcs1_enabled_txpipe_cfg_hw_auto_sp_dis = '0;
            assign o_hps_pcs1_enabled_txpipe_dirchange = '0;
            assign o_hps_pcs1_enabled_txpipe_ebuf_mode = '0;
            assign o_hps_pcs1_enabled_txpipe_encodedecodebypass = '0;
            assign o_hps_pcs1_enabled_txpipe_fs = '0;
            assign o_hps_pcs1_enabled_txpipe_getlocalpresetcoefficients = '0;
            assign o_hps_pcs1_enabled_txpipe_invalidrequest = '0;
            assign o_hps_pcs1_enabled_txpipe_lf = '0;
            assign o_hps_pcs1_enabled_txpipe_localpresetindex = '0;
            assign o_hps_pcs1_enabled_txpipe_lowpin_nt = '0;
            assign o_hps_pcs1_enabled_txpipe_m2p_bus = '0;
            assign o_hps_pcs1_enabled_txpipe_pclk_rate = 3'b001;
            assign o_hps_pcs1_enabled_txpipe_pclkchangeack = '0;
            assign o_hps_pcs1_enabled_txpipe_phy_mode_nt = 4'd1;
            assign o_hps_pcs1_enabled_txpipe_powerdown = '0;
            assign o_hps_pcs1_enabled_txpipe_rate = '0;
            assign o_hps_pcs1_enabled_txpipe_rxelecidle_disable_a = '0;
            assign o_hps_pcs1_enabled_txpipe_rxeqclr = '0;
            assign o_hps_pcs1_enabled_txpipe_rxeqeval = '0;
            assign o_hps_pcs1_enabled_txpipe_rxeqinprogress = '0;
            assign o_hps_pcs1_enabled_txpipe_rxeqtraining = '0;
            assign o_hps_pcs1_enabled_txpipe_rxpolarity = '0;
            assign o_hps_pcs1_enabled_txpipe_rxpresethint = '0;
            assign o_hps_pcs1_enabled_txpipe_rxstandby = '0;
            assign o_hps_pcs1_enabled_txpipe_rxtermination = '0;
            assign o_hps_pcs1_enabled_txpipe_srisenable = '0;
            assign o_hps_pcs1_enabled_txpipe_txcmnmode_disable_a = '0;
            assign o_hps_pcs1_enabled_txpipe_txcompliance = '0;
            assign o_hps_pcs1_enabled_txpipe_txdata = '0;
            assign o_hps_pcs1_enabled_txpipe_txdatak = '0;
            assign o_hps_pcs1_enabled_txpipe_txdatavalid = '0;
            assign o_hps_pcs1_enabled_txpipe_txdeemph = '0;
            assign o_hps_pcs1_enabled_txpipe_txdtctrx_lb = '0;
            assign o_hps_pcs1_enabled_txpipe_txelecidle = '0;
            assign o_hps_pcs1_enabled_txpipe_txmargin = '0;
            assign o_hps_pcs1_enabled_txpipe_txoneszeros = '0;
            assign o_hps_pcs1_enabled_txpipe_txstartblock = '0;
            assign o_hps_pcs1_enabled_txpipe_txswing = '0;
            assign o_hps_pcs1_enabled_txpipe_txsyncheader = '0;
            assign o_hps_pcs1_enabled_txpipe_width = 3'b001;
        end : sel_is_HPS_PCS2_ENABLED
        if ( "SEL_UNUSED" == sel ) begin : sel_is_UNUSED
            assign o_hps_pcs1_enabled_txpipe_asyncpowerchangeack = '0;
            assign o_hps_pcs1_enabled_txpipe_blockaligncontrol = '0;
            assign o_hps_pcs1_enabled_txpipe_cfg_hw_auto_sp_dis = '0;
            assign o_hps_pcs1_enabled_txpipe_dirchange = '0;
            assign o_hps_pcs1_enabled_txpipe_ebuf_mode = '0;
            assign o_hps_pcs1_enabled_txpipe_encodedecodebypass = '0;
            assign o_hps_pcs1_enabled_txpipe_fs = '0;
            assign o_hps_pcs1_enabled_txpipe_getlocalpresetcoefficients = '0;
            assign o_hps_pcs1_enabled_txpipe_invalidrequest = '0;
            assign o_hps_pcs1_enabled_txpipe_lf = '0;
            assign o_hps_pcs1_enabled_txpipe_localpresetindex = '0;
            assign o_hps_pcs1_enabled_txpipe_lowpin_nt = '0;
            assign o_hps_pcs1_enabled_txpipe_m2p_bus = '0;
            assign o_hps_pcs1_enabled_txpipe_pclk_rate = 3'b001;
            assign o_hps_pcs1_enabled_txpipe_pclkchangeack = '0;
            assign o_hps_pcs1_enabled_txpipe_phy_mode_nt = 4'd1;
            assign o_hps_pcs1_enabled_txpipe_powerdown = '0;
            assign o_hps_pcs1_enabled_txpipe_rate = '0;
            assign o_hps_pcs1_enabled_txpipe_rxelecidle_disable_a = '0;
            assign o_hps_pcs1_enabled_txpipe_rxeqclr = '0;
            assign o_hps_pcs1_enabled_txpipe_rxeqeval = '0;
            assign o_hps_pcs1_enabled_txpipe_rxeqinprogress = '0;
            assign o_hps_pcs1_enabled_txpipe_rxeqtraining = '0;
            assign o_hps_pcs1_enabled_txpipe_rxpolarity = '0;
            assign o_hps_pcs1_enabled_txpipe_rxpresethint = '0;
            assign o_hps_pcs1_enabled_txpipe_rxstandby = '0;
            assign o_hps_pcs1_enabled_txpipe_rxtermination = '0;
            assign o_hps_pcs1_enabled_txpipe_srisenable = '0;
            assign o_hps_pcs1_enabled_txpipe_txcmnmode_disable_a = '0;
            assign o_hps_pcs1_enabled_txpipe_txcompliance = '0;
            assign o_hps_pcs1_enabled_txpipe_txdata = '0;
            assign o_hps_pcs1_enabled_txpipe_txdatak = '0;
            assign o_hps_pcs1_enabled_txpipe_txdatavalid = '0;
            assign o_hps_pcs1_enabled_txpipe_txdeemph = '0;
            assign o_hps_pcs1_enabled_txpipe_txdtctrx_lb = '0;
            assign o_hps_pcs1_enabled_txpipe_txelecidle = '0;
            assign o_hps_pcs1_enabled_txpipe_txmargin = '0;
            assign o_hps_pcs1_enabled_txpipe_txoneszeros = '0;
            assign o_hps_pcs1_enabled_txpipe_txstartblock = '0;
            assign o_hps_pcs1_enabled_txpipe_txswing = '0;
            assign o_hps_pcs1_enabled_txpipe_txsyncheader = '0;
            assign o_hps_pcs1_enabled_txpipe_width = 3'b001;
            assign o_hps_pcs2_enabled_txpipe_asyncpowerchangeack = '0;
            assign o_hps_pcs2_enabled_txpipe_blockaligncontrol = '0;
            assign o_hps_pcs2_enabled_txpipe_cfg_hw_auto_sp_dis = '0;
            assign o_hps_pcs2_enabled_txpipe_dirchange = '0;
            assign o_hps_pcs2_enabled_txpipe_ebuf_mode = '0;
            assign o_hps_pcs2_enabled_txpipe_encodedecodebypass = '0;
            assign o_hps_pcs2_enabled_txpipe_fs = '0;
            assign o_hps_pcs2_enabled_txpipe_getlocalpresetcoefficients = '0;
            assign o_hps_pcs2_enabled_txpipe_invalidrequest = '0;
            assign o_hps_pcs2_enabled_txpipe_lf = '0;
            assign o_hps_pcs2_enabled_txpipe_localpresetindex = '0;
            assign o_hps_pcs2_enabled_txpipe_lowpin_nt = '0;
            assign o_hps_pcs2_enabled_txpipe_m2p_bus = '0;
            assign o_hps_pcs2_enabled_txpipe_pclk_rate = 3'b001;
            assign o_hps_pcs2_enabled_txpipe_pclkchangeack = '0;
            assign o_hps_pcs2_enabled_txpipe_phy_mode_nt = 4'd1;
            assign o_hps_pcs2_enabled_txpipe_powerdown = '0;
            assign o_hps_pcs2_enabled_txpipe_rate = '0;
            assign o_hps_pcs2_enabled_txpipe_rxelecidle_disable_a = '0;
            assign o_hps_pcs2_enabled_txpipe_rxeqclr = '0;
            assign o_hps_pcs2_enabled_txpipe_rxeqeval = '0;
            assign o_hps_pcs2_enabled_txpipe_rxeqinprogress = '0;
            assign o_hps_pcs2_enabled_txpipe_rxeqtraining = '0;
            assign o_hps_pcs2_enabled_txpipe_rxpolarity = '0;
            assign o_hps_pcs2_enabled_txpipe_rxpresethint = '0;
            assign o_hps_pcs2_enabled_txpipe_rxstandby = '0;
            assign o_hps_pcs2_enabled_txpipe_rxtermination = '0;
            assign o_hps_pcs2_enabled_txpipe_srisenable = '0;
            assign o_hps_pcs2_enabled_txpipe_txcmnmode_disable_a = '0;
            assign o_hps_pcs2_enabled_txpipe_txcompliance = '0;
            assign o_hps_pcs2_enabled_txpipe_txdata = '0;
            assign o_hps_pcs2_enabled_txpipe_txdatak = '0;
            assign o_hps_pcs2_enabled_txpipe_txdatavalid = '0;
            assign o_hps_pcs2_enabled_txpipe_txdeemph = '0;
            assign o_hps_pcs2_enabled_txpipe_txdtctrx_lb = '0;
            assign o_hps_pcs2_enabled_txpipe_txelecidle = '0;
            assign o_hps_pcs2_enabled_txpipe_txmargin = '0;
            assign o_hps_pcs2_enabled_txpipe_txoneszeros = '0;
            assign o_hps_pcs2_enabled_txpipe_txstartblock = '0;
            assign o_hps_pcs2_enabled_txpipe_txswing = '0;
            assign o_hps_pcs2_enabled_txpipe_txsyncheader = '0;
            assign o_hps_pcs2_enabled_txpipe_width = 3'b001;
        end : sel_is_UNUSED
    endgenerate
`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_hssi_pcie_pcs_hps_demux

(* icm_name="sm_hssi_pcie_pcs_hps_mux", module_type="mux", simple_name="UNKNOWN", atom_type__std *)
module tennm_sm_hssi_pcie_pcs_hps_mux #(
        parameter sel                                                = "SEL_UNUSED"                   /* Settings: SEL_HPS_PCS1_ENABLED, SEL_HPS_PCS2_ENABLED, SEL_UNUSED */
    )
    (
        input [5:0] i_hps_pcs1_enabled_rxpipe_dirfeedback,
        input [7:0] i_hps_pcs1_enabled_rxpipe_linkevaluationfeedbackfiguremerit,
        input [5:0] i_hps_pcs1_enabled_rxpipe_localfs,
        input [5:0] i_hps_pcs1_enabled_rxpipe_locallf,
        input i_hps_pcs1_enabled_rxpipe_localtxcoefficientsvalid,
        input [17:0] i_hps_pcs1_enabled_rxpipe_localtxpresetcoefficients,
        input [7:0] i_hps_pcs1_enabled_rxpipe_p2m_bus,
        input i_hps_pcs1_enabled_rxpipe_pclkchangeok,
        input i_hps_pcs1_enabled_rxpipe_phystatus,
        input [39:0] i_hps_pcs1_enabled_rxpipe_rxdata,
        input [3:0] i_hps_pcs1_enabled_rxpipe_rxdatak,
        input i_hps_pcs1_enabled_rxpipe_rxdatavalid,
        input i_hps_pcs1_enabled_rxpipe_rxelecidlea,
        input i_hps_pcs1_enabled_rxpipe_rxstandbystatus,
        input [0:0] i_hps_pcs1_enabled_rxpipe_rxstartblock,
        input [2:0] i_hps_pcs1_enabled_rxpipe_rxstatus,
        input [3:0] i_hps_pcs1_enabled_rxpipe_rxsyncheader,
        input i_hps_pcs1_enabled_rxpipe_rxvalid,
        input [5:0] i_hps_pcs2_enabled_rxpipe_dirfeedback,
        input [7:0] i_hps_pcs2_enabled_rxpipe_linkevaluationfeedbackfiguremerit,
        input [5:0] i_hps_pcs2_enabled_rxpipe_localfs,
        input [5:0] i_hps_pcs2_enabled_rxpipe_locallf,
        input i_hps_pcs2_enabled_rxpipe_localtxcoefficientsvalid,
        input [17:0] i_hps_pcs2_enabled_rxpipe_localtxpresetcoefficients,
        input [7:0] i_hps_pcs2_enabled_rxpipe_p2m_bus,
        input i_hps_pcs2_enabled_rxpipe_pclkchangeok,
        input i_hps_pcs2_enabled_rxpipe_phystatus,
        input [39:0] i_hps_pcs2_enabled_rxpipe_rxdata,
        input [3:0] i_hps_pcs2_enabled_rxpipe_rxdatak,
        input i_hps_pcs2_enabled_rxpipe_rxdatavalid,
        input i_hps_pcs2_enabled_rxpipe_rxelecidlea,
        input i_hps_pcs2_enabled_rxpipe_rxstandbystatus,
        input [0:0] i_hps_pcs2_enabled_rxpipe_rxstartblock,
        input [2:0] i_hps_pcs2_enabled_rxpipe_rxstatus,
        input [3:0] i_hps_pcs2_enabled_rxpipe_rxsyncheader,
        input i_hps_pcs2_enabled_rxpipe_rxvalid,
        output o_rxpipe_phystatus,
        output [15:0] o_rxpipe_rxdata,
        output [1:0] o_rxpipe_rxdatak,
        output o_rxpipe_rxelecidle_a,
        output [2:0] o_rxpipe_rxstatus,
        output o_rxpipe_rxvalid
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_hssi_pcie_pcs_hps_mux
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(
        .sel(sel)
    )
`endif // DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_hssi_pcie_pcs_hps_mux (
        .i_hps_pcs1_enabled_rxpipe_dirfeedback(i_hps_pcs1_enabled_rxpipe_dirfeedback),
        .i_hps_pcs1_enabled_rxpipe_linkevaluationfeedbackfiguremerit(i_hps_pcs1_enabled_rxpipe_linkevaluationfeedbackfiguremerit),
        .i_hps_pcs1_enabled_rxpipe_localfs(i_hps_pcs1_enabled_rxpipe_localfs),
        .i_hps_pcs1_enabled_rxpipe_locallf(i_hps_pcs1_enabled_rxpipe_locallf),
        .i_hps_pcs1_enabled_rxpipe_localtxcoefficientsvalid(i_hps_pcs1_enabled_rxpipe_localtxcoefficientsvalid),
        .i_hps_pcs1_enabled_rxpipe_localtxpresetcoefficients(i_hps_pcs1_enabled_rxpipe_localtxpresetcoefficients),
        .i_hps_pcs1_enabled_rxpipe_p2m_bus(i_hps_pcs1_enabled_rxpipe_p2m_bus),
        .i_hps_pcs1_enabled_rxpipe_pclkchangeok(i_hps_pcs1_enabled_rxpipe_pclkchangeok),
        .i_hps_pcs1_enabled_rxpipe_phystatus(i_hps_pcs1_enabled_rxpipe_phystatus),
        .i_hps_pcs1_enabled_rxpipe_rxdata(i_hps_pcs1_enabled_rxpipe_rxdata),
        .i_hps_pcs1_enabled_rxpipe_rxdatak(i_hps_pcs1_enabled_rxpipe_rxdatak),
        .i_hps_pcs1_enabled_rxpipe_rxdatavalid(i_hps_pcs1_enabled_rxpipe_rxdatavalid),
        .i_hps_pcs1_enabled_rxpipe_rxelecidlea(i_hps_pcs1_enabled_rxpipe_rxelecidlea),
        .i_hps_pcs1_enabled_rxpipe_rxstandbystatus(i_hps_pcs1_enabled_rxpipe_rxstandbystatus),
        .i_hps_pcs1_enabled_rxpipe_rxstartblock(i_hps_pcs1_enabled_rxpipe_rxstartblock),
        .i_hps_pcs1_enabled_rxpipe_rxstatus(i_hps_pcs1_enabled_rxpipe_rxstatus),
        .i_hps_pcs1_enabled_rxpipe_rxsyncheader(i_hps_pcs1_enabled_rxpipe_rxsyncheader),
        .i_hps_pcs1_enabled_rxpipe_rxvalid(i_hps_pcs1_enabled_rxpipe_rxvalid),
        .i_hps_pcs2_enabled_rxpipe_dirfeedback(i_hps_pcs2_enabled_rxpipe_dirfeedback),
        .i_hps_pcs2_enabled_rxpipe_linkevaluationfeedbackfiguremerit(i_hps_pcs2_enabled_rxpipe_linkevaluationfeedbackfiguremerit),
        .i_hps_pcs2_enabled_rxpipe_localfs(i_hps_pcs2_enabled_rxpipe_localfs),
        .i_hps_pcs2_enabled_rxpipe_locallf(i_hps_pcs2_enabled_rxpipe_locallf),
        .i_hps_pcs2_enabled_rxpipe_localtxcoefficientsvalid(i_hps_pcs2_enabled_rxpipe_localtxcoefficientsvalid),
        .i_hps_pcs2_enabled_rxpipe_localtxpresetcoefficients(i_hps_pcs2_enabled_rxpipe_localtxpresetcoefficients),
        .i_hps_pcs2_enabled_rxpipe_p2m_bus(i_hps_pcs2_enabled_rxpipe_p2m_bus),
        .i_hps_pcs2_enabled_rxpipe_pclkchangeok(i_hps_pcs2_enabled_rxpipe_pclkchangeok),
        .i_hps_pcs2_enabled_rxpipe_phystatus(i_hps_pcs2_enabled_rxpipe_phystatus),
        .i_hps_pcs2_enabled_rxpipe_rxdata(i_hps_pcs2_enabled_rxpipe_rxdata),
        .i_hps_pcs2_enabled_rxpipe_rxdatak(i_hps_pcs2_enabled_rxpipe_rxdatak),
        .i_hps_pcs2_enabled_rxpipe_rxdatavalid(i_hps_pcs2_enabled_rxpipe_rxdatavalid),
        .i_hps_pcs2_enabled_rxpipe_rxelecidlea(i_hps_pcs2_enabled_rxpipe_rxelecidlea),
        .i_hps_pcs2_enabled_rxpipe_rxstandbystatus(i_hps_pcs2_enabled_rxpipe_rxstandbystatus),
        .i_hps_pcs2_enabled_rxpipe_rxstartblock(i_hps_pcs2_enabled_rxpipe_rxstartblock),
        .i_hps_pcs2_enabled_rxpipe_rxstatus(i_hps_pcs2_enabled_rxpipe_rxstatus),
        .i_hps_pcs2_enabled_rxpipe_rxsyncheader(i_hps_pcs2_enabled_rxpipe_rxsyncheader),
        .i_hps_pcs2_enabled_rxpipe_rxvalid(i_hps_pcs2_enabled_rxpipe_rxvalid),
        .o_rxpipe_phystatus(o_rxpipe_phystatus),
        .o_rxpipe_rxdata(o_rxpipe_rxdata),
        .o_rxpipe_rxdatak(o_rxpipe_rxdatak),
        .o_rxpipe_rxelecidle_a(o_rxpipe_rxelecidle_a),
        .o_rxpipe_rxstatus(o_rxpipe_rxstatus),
        .o_rxpipe_rxvalid(o_rxpipe_rxvalid)
        );
`else // ifdef DDM_BASED_COREIP_GENERATOR
    generate
        if ( "SEL_HPS_PCS1_ENABLED" == sel ) begin : sel_is_HPS_PCS1_ENABLED
            assign o_rxpipe_phystatus = i_hps_pcs1_enabled_rxpipe_phystatus;
            assign o_rxpipe_rxdata = i_hps_pcs1_enabled_rxpipe_rxdata[15:0];
            assign o_rxpipe_rxdatak = i_hps_pcs1_enabled_rxpipe_rxdatak[1:0];
            assign o_rxpipe_rxelecidle_a = i_hps_pcs1_enabled_rxpipe_rxelecidlea;
            assign o_rxpipe_rxstatus = i_hps_pcs1_enabled_rxpipe_rxstatus;
            assign o_rxpipe_rxvalid = i_hps_pcs1_enabled_rxpipe_rxvalid;
        end : sel_is_HPS_PCS1_ENABLED
        if ( "SEL_HPS_PCS2_ENABLED" == sel ) begin : sel_is_HPS_PCS2_ENABLED
            assign o_rxpipe_phystatus = i_hps_pcs2_enabled_rxpipe_phystatus;
            assign o_rxpipe_rxdata = i_hps_pcs2_enabled_rxpipe_rxdata[15:0];
            assign o_rxpipe_rxdatak = i_hps_pcs2_enabled_rxpipe_rxdatak[1:0];
            assign o_rxpipe_rxelecidle_a = i_hps_pcs2_enabled_rxpipe_rxelecidlea;
            assign o_rxpipe_rxstatus = i_hps_pcs2_enabled_rxpipe_rxstatus;
            assign o_rxpipe_rxvalid = i_hps_pcs2_enabled_rxpipe_rxvalid;
        end : sel_is_HPS_PCS2_ENABLED
        if ( "SEL_UNUSED" == sel ) begin : sel_is_UNUSED
            assign o_rxpipe_phystatus = '0;
            assign o_rxpipe_rxdata = '0;
            assign o_rxpipe_rxdatak = '0;
            assign o_rxpipe_rxelecidle_a = '0;
            assign o_rxpipe_rxstatus = '0;
            assign o_rxpipe_rxvalid = '0;
        end : sel_is_UNUSED
    endgenerate
`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_hssi_pcie_pcs_hps_mux

/*(* icm_name="sm_hssi_pcie_pcs_lane", module_type="std", simple_name="PPCS", atom_type__std *)
module tennm_sm_hssi_pcie_pcs_lane #(
        parameter sris_enable                                        = "SRIS_ENABLE_DISABLED"        */ /* Settings: SRIS_ENABLE_ENABLED, SRIS_ENABLE_DISABLED */
/*    )
    (
        input [16:0] i_lavmm_pcie_addr,
        input [3:0] i_lavmm_pcie_be,
        input i_lavmm_pcie_clk,
        input i_lavmm_pcie_read,
        input i_lavmm_pcie_rstn,
        input [31:0] i_lavmm_pcie_wdata,
        input i_lavmm_pcie_write,
        input i_pcie_rxword_clk,
        input i_pcie_txword_clk,
        input i_pcs_pclk,
        input i_pcs_pipe_rstn,
        input i_txpipe_asyncpowerchangeack,
        input i_txpipe_blockaligncontrol,
        input i_txpipe_cfg_hw_auto_sp_dis,
        input i_txpipe_dirchange,
        input i_txpipe_ebuf_mode,
        input i_txpipe_encodedecodebypass,
        input [5:0] i_txpipe_fs,
        input i_txpipe_getlocalpresetcoefficients,
        input i_txpipe_invalidrequest,
        input [5:0] i_txpipe_lf,
        input [4:0] i_txpipe_localpresetindex,
        input i_txpipe_lowpin_nt,
        input [7:0] i_txpipe_m2p_bus,
        input [2:0] i_txpipe_pclk_rate,
        input i_txpipe_pclkchangeack,
        input [3:0] i_txpipe_phy_mode_nt,
        input [3:0] i_txpipe_powerdown,
        input [2:0] i_txpipe_rate,
        input i_txpipe_rxelecidle_disable_a,
        input i_txpipe_rxeqclr,
        input i_txpipe_rxeqeval,
        input i_txpipe_rxeqinprogress,
        input i_txpipe_rxeqtraining,
        input i_txpipe_rxpolarity,
        input [2:0] i_txpipe_rxpresethint,
        input i_txpipe_rxstandby,
        input i_txpipe_rxtermination,
        input i_txpipe_srisenable,
        input i_txpipe_txcmnmode_disable_a,
        input i_txpipe_txcompliance,
        input [39:0] i_txpipe_txdata,
        input [3:0] i_txpipe_txdatak,
        input i_txpipe_txdatavalid,
        input [17:0] i_txpipe_txdeemph,
        input i_txpipe_txdtctrx_lb,
        input i_txpipe_txelecidle,
        input [2:0] i_txpipe_txmargin,
        input i_txpipe_txoneszeros,
        input i_txpipe_txstartblock,
        input i_txpipe_txswing,
        input [3:0] i_txpipe_txsyncheader,
        input [2:0] i_txpipe_width,
        input i_uxq_rxcdrlock2dataa,
        input [13:0] i_uxq_rxeq_best_eye_vala,
        input i_uxq_rxeq_donea,
        input i_uxq_rxmargin_nacka,
        input [1:0] i_uxq_rxmargin_status_gray_a,
        input i_uxq_rxmargin_statusa,
        input i_uxq_rxsignaldetect_lfpsa,
        input i_uxq_rxsignaldetecta,
        input i_uxq_rxstatusa,
        input [39:0] i_uxq_rxword,
        input i_uxq_synthlcfast_postdiv,
        input i_uxq_synthlcmed_postdiv,
        input i_uxq_synthlcslow_postdiv,
        input i_uxq_txdetectrx_acka,
        input i_uxq_txdetectrx_statct,
        input i_uxq_txstatusa,
        output [31:0] o_lavmm_pcie_rdata,
        output o_lavmm_pcie_rdata_valid,
        output o_lavmm_pcie_waitreq,
        output o_pcs_pclk,
        output o_pcs_pipe_rstn,
        output [5:0] o_rxpipe_dirfeedback,
        output [7:0] o_rxpipe_linkevaluationfeedbackfiguremerit,
        output [5:0] o_rxpipe_localfs,
        output [5:0] o_rxpipe_locallf,
        output o_rxpipe_localtxcoefficientsvalid,
        output [17:0] o_rxpipe_localtxpresetcoefficients,
        output [7:0] o_rxpipe_p2m_bus,
        output o_rxpipe_pclkchangeok,
        output o_rxpipe_phystatus,
        output [39:0] o_rxpipe_rxdata,
        output [3:0] o_rxpipe_rxdatak,
        output o_rxpipe_rxdatavalid,
        output o_rxpipe_rxelecidlea,
        output o_rxpipe_rxstandbystatus,
        output [0:0] o_rxpipe_rxstartblock,
        output [2:0] o_rxpipe_rxstatus,
        output [3:0] o_rxpipe_rxsyncheader,
        output o_rxpipe_rxvalid,
        output o_ux_ock_pma_clk,
        output o_uxq_lfps_ennt,
        output [1:0] o_uxq_pcie_l1ctrla,
        output o_uxq_pma_cmn_ctrl,
        output o_uxq_pma_ctrl,
        output o_uxq_rst_pcs_rx_b_a,
        output o_uxq_rst_pcs_tx_b_a,
        output o_uxq_rxeiosdetectstata,
        output [2:0] o_uxq_rxeq_precal_code_selnt,
        output o_uxq_rxeq_starta,
        output o_uxq_rxeq_static_ena,
        output o_uxq_rxmargin_direction_nt,
        output o_uxq_rxmargin_mode_nt,
        output o_uxq_rxmargin_offset_change_a,
        output [6:0] o_uxq_rxmargin_offset_nt,
        output o_uxq_rxmargin_start_a,
        output [2:0] o_uxq_rxpstate,
        output [3:0] o_uxq_rxrate,
        output o_uxq_rxterm_hiz_ena,
        output [2:0] o_uxq_rxwidth,
        output o_uxq_tstbus_lane,
        output o_uxq_txbeacona,
        output [2:0] o_uxq_txclkdivrate,
        output o_uxq_txdetectrx_reqa,
        output [5:0] o_uxq_txdrv_levn,
        output [4:0] o_uxq_txdrv_levnm1,
        output [2:0] o_uxq_txdrv_levnm2,
        output [4:0] o_uxq_txdrv_levnp1,
        output [3:0] o_uxq_txdrv_slew,
        output [3:0] o_uxq_txelecidle,
        output [2:0] o_uxq_txpstate,
        output [3:0] o_uxq_txrate,
        output [2:0] o_uxq_txwidth,
        output [39:0] o_uxq_txword
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_hssi_pcie_pcs_lane
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(
        .sris_enable(sris_enable)
    )
`endif // DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_hssi_pcie_pcs_lane (
        .i_lavmm_pcie_addr(i_lavmm_pcie_addr),
        .i_lavmm_pcie_be(i_lavmm_pcie_be),
        .i_lavmm_pcie_clk(i_lavmm_pcie_clk),
        .i_lavmm_pcie_read(i_lavmm_pcie_read),
        .i_lavmm_pcie_rstn(i_lavmm_pcie_rstn),
        .i_lavmm_pcie_wdata(i_lavmm_pcie_wdata),
        .i_lavmm_pcie_write(i_lavmm_pcie_write),
        .i_pcie_rxword_clk(i_pcie_rxword_clk),
        .i_pcie_txword_clk(i_pcie_txword_clk),
        .i_pcs_pclk(i_pcs_pclk),
        .i_pcs_pipe_rstn(i_pcs_pipe_rstn),
        .i_txpipe_asyncpowerchangeack(i_txpipe_asyncpowerchangeack),
        .i_txpipe_blockaligncontrol(i_txpipe_blockaligncontrol),
        .i_txpipe_cfg_hw_auto_sp_dis(i_txpipe_cfg_hw_auto_sp_dis),
        .i_txpipe_dirchange(i_txpipe_dirchange),
        .i_txpipe_ebuf_mode(i_txpipe_ebuf_mode),
        .i_txpipe_encodedecodebypass(i_txpipe_encodedecodebypass),
        .i_txpipe_fs(i_txpipe_fs),
        .i_txpipe_getlocalpresetcoefficients(i_txpipe_getlocalpresetcoefficients),
        .i_txpipe_invalidrequest(i_txpipe_invalidrequest),
        .i_txpipe_lf(i_txpipe_lf),
        .i_txpipe_localpresetindex(i_txpipe_localpresetindex),
        .i_txpipe_lowpin_nt(i_txpipe_lowpin_nt),
        .i_txpipe_m2p_bus(i_txpipe_m2p_bus),
        .i_txpipe_pclk_rate(i_txpipe_pclk_rate),
        .i_txpipe_pclkchangeack(i_txpipe_pclkchangeack),
        .i_txpipe_phy_mode_nt(i_txpipe_phy_mode_nt),
        .i_txpipe_powerdown(i_txpipe_powerdown),
        .i_txpipe_rate(i_txpipe_rate),
        .i_txpipe_rxelecidle_disable_a(i_txpipe_rxelecidle_disable_a),
        .i_txpipe_rxeqclr(i_txpipe_rxeqclr),
        .i_txpipe_rxeqeval(i_txpipe_rxeqeval),
        .i_txpipe_rxeqinprogress(i_txpipe_rxeqinprogress),
        .i_txpipe_rxeqtraining(i_txpipe_rxeqtraining),
        .i_txpipe_rxpolarity(i_txpipe_rxpolarity),
        .i_txpipe_rxpresethint(i_txpipe_rxpresethint),
        .i_txpipe_rxstandby(i_txpipe_rxstandby),
        .i_txpipe_rxtermination(i_txpipe_rxtermination),
        .i_txpipe_srisenable(i_txpipe_srisenable),
        .i_txpipe_txcmnmode_disable_a(i_txpipe_txcmnmode_disable_a),
        .i_txpipe_txcompliance(i_txpipe_txcompliance),
        .i_txpipe_txdata(i_txpipe_txdata),
        .i_txpipe_txdatak(i_txpipe_txdatak),
        .i_txpipe_txdatavalid(i_txpipe_txdatavalid),
        .i_txpipe_txdeemph(i_txpipe_txdeemph),
        .i_txpipe_txdtctrx_lb(i_txpipe_txdtctrx_lb),
        .i_txpipe_txelecidle(i_txpipe_txelecidle),
        .i_txpipe_txmargin(i_txpipe_txmargin),
        .i_txpipe_txoneszeros(i_txpipe_txoneszeros),
        .i_txpipe_txstartblock(i_txpipe_txstartblock),
        .i_txpipe_txswing(i_txpipe_txswing),
        .i_txpipe_txsyncheader(i_txpipe_txsyncheader),
        .i_txpipe_width(i_txpipe_width),
        .i_uxq_rxcdrlock2dataa(i_uxq_rxcdrlock2dataa),
        .i_uxq_rxeq_best_eye_vala(i_uxq_rxeq_best_eye_vala),
        .i_uxq_rxeq_donea(i_uxq_rxeq_donea),
        .i_uxq_rxmargin_nacka(i_uxq_rxmargin_nacka),
        .i_uxq_rxmargin_status_gray_a(i_uxq_rxmargin_status_gray_a),
        .i_uxq_rxmargin_statusa(i_uxq_rxmargin_statusa),
        .i_uxq_rxsignaldetect_lfpsa(i_uxq_rxsignaldetect_lfpsa),
        .i_uxq_rxsignaldetecta(i_uxq_rxsignaldetecta),
        .i_uxq_rxstatusa(i_uxq_rxstatusa),
        .i_uxq_rxword(i_uxq_rxword),
        .i_uxq_synthlcfast_postdiv(i_uxq_synthlcfast_postdiv),
        .i_uxq_synthlcmed_postdiv(i_uxq_synthlcmed_postdiv),
        .i_uxq_synthlcslow_postdiv(i_uxq_synthlcslow_postdiv),
        .i_uxq_txdetectrx_acka(i_uxq_txdetectrx_acka),
        .i_uxq_txdetectrx_statct(i_uxq_txdetectrx_statct),
        .i_uxq_txstatusa(i_uxq_txstatusa),
        .o_lavmm_pcie_rdata(o_lavmm_pcie_rdata),
        .o_lavmm_pcie_rdata_valid(o_lavmm_pcie_rdata_valid),
        .o_lavmm_pcie_waitreq(o_lavmm_pcie_waitreq),
        .o_pcs_pclk(o_pcs_pclk),
        .o_pcs_pipe_rstn(o_pcs_pipe_rstn),
        .o_rxpipe_dirfeedback(o_rxpipe_dirfeedback),
        .o_rxpipe_linkevaluationfeedbackfiguremerit(o_rxpipe_linkevaluationfeedbackfiguremerit),
        .o_rxpipe_localfs(o_rxpipe_localfs),
        .o_rxpipe_locallf(o_rxpipe_locallf),
        .o_rxpipe_localtxcoefficientsvalid(o_rxpipe_localtxcoefficientsvalid),
        .o_rxpipe_localtxpresetcoefficients(o_rxpipe_localtxpresetcoefficients),
        .o_rxpipe_p2m_bus(o_rxpipe_p2m_bus),
        .o_rxpipe_pclkchangeok(o_rxpipe_pclkchangeok),
        .o_rxpipe_phystatus(o_rxpipe_phystatus),
        .o_rxpipe_rxdata(o_rxpipe_rxdata),
        .o_rxpipe_rxdatak(o_rxpipe_rxdatak),
        .o_rxpipe_rxdatavalid(o_rxpipe_rxdatavalid),
        .o_rxpipe_rxelecidlea(o_rxpipe_rxelecidlea),
        .o_rxpipe_rxstandbystatus(o_rxpipe_rxstandbystatus),
        .o_rxpipe_rxstartblock(o_rxpipe_rxstartblock),
        .o_rxpipe_rxstatus(o_rxpipe_rxstatus),
        .o_rxpipe_rxsyncheader(o_rxpipe_rxsyncheader),
        .o_rxpipe_rxvalid(o_rxpipe_rxvalid),
        .o_ux_ock_pma_clk(o_ux_ock_pma_clk),
        .o_uxq_lfps_ennt(o_uxq_lfps_ennt),
        .o_uxq_pcie_l1ctrla(o_uxq_pcie_l1ctrla),
        .o_uxq_pma_cmn_ctrl(o_uxq_pma_cmn_ctrl),
        .o_uxq_pma_ctrl(o_uxq_pma_ctrl),
        .o_uxq_rst_pcs_rx_b_a(o_uxq_rst_pcs_rx_b_a),
        .o_uxq_rst_pcs_tx_b_a(o_uxq_rst_pcs_tx_b_a),
        .o_uxq_rxeiosdetectstata(o_uxq_rxeiosdetectstata),
        .o_uxq_rxeq_precal_code_selnt(o_uxq_rxeq_precal_code_selnt),
        .o_uxq_rxeq_starta(o_uxq_rxeq_starta),
        .o_uxq_rxeq_static_ena(o_uxq_rxeq_static_ena),
        .o_uxq_rxmargin_direction_nt(o_uxq_rxmargin_direction_nt),
        .o_uxq_rxmargin_mode_nt(o_uxq_rxmargin_mode_nt),
        .o_uxq_rxmargin_offset_change_a(o_uxq_rxmargin_offset_change_a),
        .o_uxq_rxmargin_offset_nt(o_uxq_rxmargin_offset_nt),
        .o_uxq_rxmargin_start_a(o_uxq_rxmargin_start_a),
        .o_uxq_rxpstate(o_uxq_rxpstate),
        .o_uxq_rxrate(o_uxq_rxrate),
        .o_uxq_rxterm_hiz_ena(o_uxq_rxterm_hiz_ena),
        .o_uxq_rxwidth(o_uxq_rxwidth),
        .o_uxq_tstbus_lane(o_uxq_tstbus_lane),
        .o_uxq_txbeacona(o_uxq_txbeacona),
        .o_uxq_txclkdivrate(o_uxq_txclkdivrate),
        .o_uxq_txdetectrx_reqa(o_uxq_txdetectrx_reqa),
        .o_uxq_txdrv_levn(o_uxq_txdrv_levn),
        .o_uxq_txdrv_levnm1(o_uxq_txdrv_levnm1),
        .o_uxq_txdrv_levnm2(o_uxq_txdrv_levnm2),
        .o_uxq_txdrv_levnp1(o_uxq_txdrv_levnp1),
        .o_uxq_txdrv_slew(o_uxq_txdrv_slew),
        .o_uxq_txelecidle(o_uxq_txelecidle),
        .o_uxq_txpstate(o_uxq_txpstate),
        .o_uxq_txrate(o_uxq_txrate),
        .o_uxq_txwidth(o_uxq_txwidth),
        .o_uxq_txword(o_uxq_txword)
        );
`else // ifdef DDM_BASED_COREIP_GENERATOR

`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_hssi_pcie_pcs_lane
*/
(* icm_name="sm_hssi_pcie_pcs_rst_mux", module_type="mux", simple_name="UNKNOWN", atom_type__std *)
module tennm_sm_hssi_pcie_pcs_rst_mux #(
        parameter sel                                                = "SEL_UNUSED"                   /* Settings: SEL_SAME_QUAD_PCS_RST, SEL_UPPER_QUAD_PCS_RST, SEL_HPS_RST, SEL_UNUSED */
    )
    (
        input i_hps_rst_rstn,
        input i_same_quad_pcs_rst_rstn,
        input i_unused_rstn,
        input i_upper_quad_pcs_rst_rstn,
        output o_rstn
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_hssi_pcie_pcs_rst_mux
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(
        .sel(sel)
    )
`endif // DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_hssi_pcie_pcs_rst_mux (
        .i_hps_rst_rstn(i_hps_rst_rstn),
        .i_same_quad_pcs_rst_rstn(i_same_quad_pcs_rst_rstn),
        .i_unused_rstn(i_unused_rstn),
        .i_upper_quad_pcs_rst_rstn(i_upper_quad_pcs_rst_rstn),
        .o_rstn(o_rstn)
        );
`else // ifdef DDM_BASED_COREIP_GENERATOR
    generate
        if ( "SEL_SAME_QUAD_PCS_RST" == sel ) begin : sel_is_SAME_QUAD_PCS_RST
            assign o_rstn = i_same_quad_pcs_rst_rstn;
        end : sel_is_SAME_QUAD_PCS_RST
        if ( "SEL_UPPER_QUAD_PCS_RST" == sel ) begin : sel_is_UPPER_QUAD_PCS_RST
            assign o_rstn = i_upper_quad_pcs_rst_rstn;
        end : sel_is_UPPER_QUAD_PCS_RST
        if ( "SEL_HPS_RST" == sel ) begin : sel_is_HPS_RST
            assign o_rstn = i_hps_rst_rstn;
        end : sel_is_HPS_RST
        if ( "SEL_UNUSED" == sel ) begin : sel_is_UNUSED
            assign o_rstn = i_unused_rstn;
        end : sel_is_UNUSED
    endgenerate
`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_hssi_pcie_pcs_rst_mux

(* icm_name="sm_hssi_pcie_pcs_rx_demux", module_type="mux", simple_name="UNKNOWN", atom_type__std *)
module tennm_sm_hssi_pcie_pcs_rx_demux #(
        parameter sel                                                = "SEL_UNUSED"                   /* Settings: SEL_SAME_QUAD_PCIE_CTRL, SEL_UPPER_QUAD_PCIE_CTRL, SEL_HPS, SEL_UNUSED */
    )
    (
        input [5:0] i_rxpipe_dirfeedback,
        input [7:0] i_rxpipe_linkevaluationfeedbackfiguremerit,
        input [5:0] i_rxpipe_localfs,
        input [5:0] i_rxpipe_locallf,
        input i_rxpipe_localtxcoefficientsvalid,
        input [17:0] i_rxpipe_localtxpresetcoefficients,
        input [7:0] i_rxpipe_p2m_bus,
        input i_rxpipe_pclkchangeok,
        input i_rxpipe_phystatus,
        input [39:0] i_rxpipe_rxdata,
        input [3:0] i_rxpipe_rxdatak,
        input i_rxpipe_rxdatavalid,
        input i_rxpipe_rxelecidlea,
        input i_rxpipe_rxstandbystatus,
        input [0:0] i_rxpipe_rxstartblock,
        input [2:0] i_rxpipe_rxstatus,
        input [3:0] i_rxpipe_rxsyncheader,
        input i_rxpipe_rxvalid,
        output [5:0] o_hps_rxpipe_dirfeedback,
        output [7:0] o_hps_rxpipe_linkevaluationfeedbackfiguremerit,
        output [5:0] o_hps_rxpipe_localfs,
        output [5:0] o_hps_rxpipe_locallf,
        output o_hps_rxpipe_localtxcoefficientsvalid,
        output [17:0] o_hps_rxpipe_localtxpresetcoefficients,
        output [7:0] o_hps_rxpipe_p2m_bus,
        output o_hps_rxpipe_pclkchangeok,
        output o_hps_rxpipe_phystatus,
        output [39:0] o_hps_rxpipe_rxdata,
        output [3:0] o_hps_rxpipe_rxdatak,
        output o_hps_rxpipe_rxdatavalid,
        output o_hps_rxpipe_rxelecidlea,
        output o_hps_rxpipe_rxstandbystatus,
        output [0:0] o_hps_rxpipe_rxstartblock,
        output [2:0] o_hps_rxpipe_rxstatus,
        output [3:0] o_hps_rxpipe_rxsyncheader,
        output o_hps_rxpipe_rxvalid,
        output [5:0] o_same_quad_pcie_ctrl_rxpipe_dirfeedback,
        output [7:0] o_same_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit,
        output [5:0] o_same_quad_pcie_ctrl_rxpipe_localfs,
        output [5:0] o_same_quad_pcie_ctrl_rxpipe_locallf,
        output o_same_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid,
        output [17:0] o_same_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients,
        output [7:0] o_same_quad_pcie_ctrl_rxpipe_p2m_bus,
        output o_same_quad_pcie_ctrl_rxpipe_pclkchangeok,
        output o_same_quad_pcie_ctrl_rxpipe_phystatus,
        output [39:0] o_same_quad_pcie_ctrl_rxpipe_rxdata,
        output [3:0] o_same_quad_pcie_ctrl_rxpipe_rxdatak,
        output o_same_quad_pcie_ctrl_rxpipe_rxdatavalid,
        output o_same_quad_pcie_ctrl_rxpipe_rxelecidlea,
        output o_same_quad_pcie_ctrl_rxpipe_rxstandbystatus,
        output [0:0] o_same_quad_pcie_ctrl_rxpipe_rxstartblock,
        output [2:0] o_same_quad_pcie_ctrl_rxpipe_rxstatus,
        output [3:0] o_same_quad_pcie_ctrl_rxpipe_rxsyncheader,
        output o_same_quad_pcie_ctrl_rxpipe_rxvalid,
        output [5:0] o_unused_rxpipe_dirfeedback,
        output [7:0] o_unused_rxpipe_linkevaluationfeedbackfiguremerit,
        output [5:0] o_unused_rxpipe_localfs,
        output [5:0] o_unused_rxpipe_locallf,
        output o_unused_rxpipe_localtxcoefficientsvalid,
        output [17:0] o_unused_rxpipe_localtxpresetcoefficients,
        output [7:0] o_unused_rxpipe_p2m_bus,
        output o_unused_rxpipe_pclkchangeok,
        output o_unused_rxpipe_phystatus,
        output [39:0] o_unused_rxpipe_rxdata,
        output [3:0] o_unused_rxpipe_rxdatak,
        output o_unused_rxpipe_rxdatavalid,
        output o_unused_rxpipe_rxelecidlea,
        output o_unused_rxpipe_rxstandbystatus,
        output [0:0] o_unused_rxpipe_rxstartblock,
        output [2:0] o_unused_rxpipe_rxstatus,
        output [3:0] o_unused_rxpipe_rxsyncheader,
        output o_unused_rxpipe_rxvalid,
        output [5:0] o_upper_quad_pcie_ctrl_rxpipe_dirfeedback,
        output [7:0] o_upper_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit,
        output [5:0] o_upper_quad_pcie_ctrl_rxpipe_localfs,
        output [5:0] o_upper_quad_pcie_ctrl_rxpipe_locallf,
        output o_upper_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid,
        output [17:0] o_upper_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients,
        output [7:0] o_upper_quad_pcie_ctrl_rxpipe_p2m_bus,
        output o_upper_quad_pcie_ctrl_rxpipe_pclkchangeok,
        output o_upper_quad_pcie_ctrl_rxpipe_phystatus,
        output [39:0] o_upper_quad_pcie_ctrl_rxpipe_rxdata,
        output [3:0] o_upper_quad_pcie_ctrl_rxpipe_rxdatak,
        output o_upper_quad_pcie_ctrl_rxpipe_rxdatavalid,
        output o_upper_quad_pcie_ctrl_rxpipe_rxelecidlea,
        output o_upper_quad_pcie_ctrl_rxpipe_rxstandbystatus,
        output [0:0] o_upper_quad_pcie_ctrl_rxpipe_rxstartblock,
        output [2:0] o_upper_quad_pcie_ctrl_rxpipe_rxstatus,
        output [3:0] o_upper_quad_pcie_ctrl_rxpipe_rxsyncheader,
        output o_upper_quad_pcie_ctrl_rxpipe_rxvalid
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_hssi_pcie_pcs_rx_demux
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(
        .sel(sel)
    )
`endif // DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_hssi_pcie_pcs_rx_demux (
        .i_rxpipe_dirfeedback(i_rxpipe_dirfeedback),
        .i_rxpipe_linkevaluationfeedbackfiguremerit(i_rxpipe_linkevaluationfeedbackfiguremerit),
        .i_rxpipe_localfs(i_rxpipe_localfs),
        .i_rxpipe_locallf(i_rxpipe_locallf),
        .i_rxpipe_localtxcoefficientsvalid(i_rxpipe_localtxcoefficientsvalid),
        .i_rxpipe_localtxpresetcoefficients(i_rxpipe_localtxpresetcoefficients),
        .i_rxpipe_p2m_bus(i_rxpipe_p2m_bus),
        .i_rxpipe_pclkchangeok(i_rxpipe_pclkchangeok),
        .i_rxpipe_phystatus(i_rxpipe_phystatus),
        .i_rxpipe_rxdata(i_rxpipe_rxdata),
        .i_rxpipe_rxdatak(i_rxpipe_rxdatak),
        .i_rxpipe_rxdatavalid(i_rxpipe_rxdatavalid),
        .i_rxpipe_rxelecidlea(i_rxpipe_rxelecidlea),
        .i_rxpipe_rxstandbystatus(i_rxpipe_rxstandbystatus),
        .i_rxpipe_rxstartblock(i_rxpipe_rxstartblock),
        .i_rxpipe_rxstatus(i_rxpipe_rxstatus),
        .i_rxpipe_rxsyncheader(i_rxpipe_rxsyncheader),
        .i_rxpipe_rxvalid(i_rxpipe_rxvalid),
        .o_hps_rxpipe_dirfeedback(o_hps_rxpipe_dirfeedback),
        .o_hps_rxpipe_linkevaluationfeedbackfiguremerit(o_hps_rxpipe_linkevaluationfeedbackfiguremerit),
        .o_hps_rxpipe_localfs(o_hps_rxpipe_localfs),
        .o_hps_rxpipe_locallf(o_hps_rxpipe_locallf),
        .o_hps_rxpipe_localtxcoefficientsvalid(o_hps_rxpipe_localtxcoefficientsvalid),
        .o_hps_rxpipe_localtxpresetcoefficients(o_hps_rxpipe_localtxpresetcoefficients),
        .o_hps_rxpipe_p2m_bus(o_hps_rxpipe_p2m_bus),
        .o_hps_rxpipe_pclkchangeok(o_hps_rxpipe_pclkchangeok),
        .o_hps_rxpipe_phystatus(o_hps_rxpipe_phystatus),
        .o_hps_rxpipe_rxdata(o_hps_rxpipe_rxdata),
        .o_hps_rxpipe_rxdatak(o_hps_rxpipe_rxdatak),
        .o_hps_rxpipe_rxdatavalid(o_hps_rxpipe_rxdatavalid),
        .o_hps_rxpipe_rxelecidlea(o_hps_rxpipe_rxelecidlea),
        .o_hps_rxpipe_rxstandbystatus(o_hps_rxpipe_rxstandbystatus),
        .o_hps_rxpipe_rxstartblock(o_hps_rxpipe_rxstartblock),
        .o_hps_rxpipe_rxstatus(o_hps_rxpipe_rxstatus),
        .o_hps_rxpipe_rxsyncheader(o_hps_rxpipe_rxsyncheader),
        .o_hps_rxpipe_rxvalid(o_hps_rxpipe_rxvalid),
        .o_same_quad_pcie_ctrl_rxpipe_dirfeedback(o_same_quad_pcie_ctrl_rxpipe_dirfeedback),
        .o_same_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit(o_same_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit),
        .o_same_quad_pcie_ctrl_rxpipe_localfs(o_same_quad_pcie_ctrl_rxpipe_localfs),
        .o_same_quad_pcie_ctrl_rxpipe_locallf(o_same_quad_pcie_ctrl_rxpipe_locallf),
        .o_same_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid(o_same_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid),
        .o_same_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients(o_same_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients),
        .o_same_quad_pcie_ctrl_rxpipe_p2m_bus(o_same_quad_pcie_ctrl_rxpipe_p2m_bus),
        .o_same_quad_pcie_ctrl_rxpipe_pclkchangeok(o_same_quad_pcie_ctrl_rxpipe_pclkchangeok),
        .o_same_quad_pcie_ctrl_rxpipe_phystatus(o_same_quad_pcie_ctrl_rxpipe_phystatus),
        .o_same_quad_pcie_ctrl_rxpipe_rxdata(o_same_quad_pcie_ctrl_rxpipe_rxdata),
        .o_same_quad_pcie_ctrl_rxpipe_rxdatak(o_same_quad_pcie_ctrl_rxpipe_rxdatak),
        .o_same_quad_pcie_ctrl_rxpipe_rxdatavalid(o_same_quad_pcie_ctrl_rxpipe_rxdatavalid),
        .o_same_quad_pcie_ctrl_rxpipe_rxelecidlea(o_same_quad_pcie_ctrl_rxpipe_rxelecidlea),
        .o_same_quad_pcie_ctrl_rxpipe_rxstandbystatus(o_same_quad_pcie_ctrl_rxpipe_rxstandbystatus),
        .o_same_quad_pcie_ctrl_rxpipe_rxstartblock(o_same_quad_pcie_ctrl_rxpipe_rxstartblock),
        .o_same_quad_pcie_ctrl_rxpipe_rxstatus(o_same_quad_pcie_ctrl_rxpipe_rxstatus),
        .o_same_quad_pcie_ctrl_rxpipe_rxsyncheader(o_same_quad_pcie_ctrl_rxpipe_rxsyncheader),
        .o_same_quad_pcie_ctrl_rxpipe_rxvalid(o_same_quad_pcie_ctrl_rxpipe_rxvalid),
        .o_unused_rxpipe_dirfeedback(o_unused_rxpipe_dirfeedback),
        .o_unused_rxpipe_linkevaluationfeedbackfiguremerit(o_unused_rxpipe_linkevaluationfeedbackfiguremerit),
        .o_unused_rxpipe_localfs(o_unused_rxpipe_localfs),
        .o_unused_rxpipe_locallf(o_unused_rxpipe_locallf),
        .o_unused_rxpipe_localtxcoefficientsvalid(o_unused_rxpipe_localtxcoefficientsvalid),
        .o_unused_rxpipe_localtxpresetcoefficients(o_unused_rxpipe_localtxpresetcoefficients),
        .o_unused_rxpipe_p2m_bus(o_unused_rxpipe_p2m_bus),
        .o_unused_rxpipe_pclkchangeok(o_unused_rxpipe_pclkchangeok),
        .o_unused_rxpipe_phystatus(o_unused_rxpipe_phystatus),
        .o_unused_rxpipe_rxdata(o_unused_rxpipe_rxdata),
        .o_unused_rxpipe_rxdatak(o_unused_rxpipe_rxdatak),
        .o_unused_rxpipe_rxdatavalid(o_unused_rxpipe_rxdatavalid),
        .o_unused_rxpipe_rxelecidlea(o_unused_rxpipe_rxelecidlea),
        .o_unused_rxpipe_rxstandbystatus(o_unused_rxpipe_rxstandbystatus),
        .o_unused_rxpipe_rxstartblock(o_unused_rxpipe_rxstartblock),
        .o_unused_rxpipe_rxstatus(o_unused_rxpipe_rxstatus),
        .o_unused_rxpipe_rxsyncheader(o_unused_rxpipe_rxsyncheader),
        .o_unused_rxpipe_rxvalid(o_unused_rxpipe_rxvalid),
        .o_upper_quad_pcie_ctrl_rxpipe_dirfeedback(o_upper_quad_pcie_ctrl_rxpipe_dirfeedback),
        .o_upper_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit(o_upper_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit),
        .o_upper_quad_pcie_ctrl_rxpipe_localfs(o_upper_quad_pcie_ctrl_rxpipe_localfs),
        .o_upper_quad_pcie_ctrl_rxpipe_locallf(o_upper_quad_pcie_ctrl_rxpipe_locallf),
        .o_upper_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid(o_upper_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid),
        .o_upper_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients(o_upper_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients),
        .o_upper_quad_pcie_ctrl_rxpipe_p2m_bus(o_upper_quad_pcie_ctrl_rxpipe_p2m_bus),
        .o_upper_quad_pcie_ctrl_rxpipe_pclkchangeok(o_upper_quad_pcie_ctrl_rxpipe_pclkchangeok),
        .o_upper_quad_pcie_ctrl_rxpipe_phystatus(o_upper_quad_pcie_ctrl_rxpipe_phystatus),
        .o_upper_quad_pcie_ctrl_rxpipe_rxdata(o_upper_quad_pcie_ctrl_rxpipe_rxdata),
        .o_upper_quad_pcie_ctrl_rxpipe_rxdatak(o_upper_quad_pcie_ctrl_rxpipe_rxdatak),
        .o_upper_quad_pcie_ctrl_rxpipe_rxdatavalid(o_upper_quad_pcie_ctrl_rxpipe_rxdatavalid),
        .o_upper_quad_pcie_ctrl_rxpipe_rxelecidlea(o_upper_quad_pcie_ctrl_rxpipe_rxelecidlea),
        .o_upper_quad_pcie_ctrl_rxpipe_rxstandbystatus(o_upper_quad_pcie_ctrl_rxpipe_rxstandbystatus),
        .o_upper_quad_pcie_ctrl_rxpipe_rxstartblock(o_upper_quad_pcie_ctrl_rxpipe_rxstartblock),
        .o_upper_quad_pcie_ctrl_rxpipe_rxstatus(o_upper_quad_pcie_ctrl_rxpipe_rxstatus),
        .o_upper_quad_pcie_ctrl_rxpipe_rxsyncheader(o_upper_quad_pcie_ctrl_rxpipe_rxsyncheader),
        .o_upper_quad_pcie_ctrl_rxpipe_rxvalid(o_upper_quad_pcie_ctrl_rxpipe_rxvalid)
        );
`else // ifdef DDM_BASED_COREIP_GENERATOR
    generate
        if ( "SEL_SAME_QUAD_PCIE_CTRL" == sel ) begin : sel_is_SAME_QUAD_PCIE_CTRL
            assign o_same_quad_pcie_ctrl_rxpipe_dirfeedback = i_rxpipe_dirfeedback;
            assign o_same_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit = i_rxpipe_linkevaluationfeedbackfiguremerit;
            assign o_same_quad_pcie_ctrl_rxpipe_localfs = i_rxpipe_localfs;
            assign o_same_quad_pcie_ctrl_rxpipe_locallf = i_rxpipe_locallf;
            assign o_same_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid = i_rxpipe_localtxcoefficientsvalid;
            assign o_same_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients = i_rxpipe_localtxpresetcoefficients;
            assign o_same_quad_pcie_ctrl_rxpipe_p2m_bus = i_rxpipe_p2m_bus;
            assign o_same_quad_pcie_ctrl_rxpipe_pclkchangeok = i_rxpipe_pclkchangeok;
            assign o_same_quad_pcie_ctrl_rxpipe_phystatus = i_rxpipe_phystatus;
            assign o_same_quad_pcie_ctrl_rxpipe_rxdata = i_rxpipe_rxdata;
            assign o_same_quad_pcie_ctrl_rxpipe_rxdatak = i_rxpipe_rxdatak;
            assign o_same_quad_pcie_ctrl_rxpipe_rxdatavalid = i_rxpipe_rxdatavalid;
            assign o_same_quad_pcie_ctrl_rxpipe_rxelecidlea = i_rxpipe_rxelecidlea;
            assign o_same_quad_pcie_ctrl_rxpipe_rxstandbystatus = i_rxpipe_rxstandbystatus;
            assign o_same_quad_pcie_ctrl_rxpipe_rxstartblock = i_rxpipe_rxstartblock;
            assign o_same_quad_pcie_ctrl_rxpipe_rxstatus = i_rxpipe_rxstatus;
            assign o_same_quad_pcie_ctrl_rxpipe_rxsyncheader = i_rxpipe_rxsyncheader;
            assign o_same_quad_pcie_ctrl_rxpipe_rxvalid = i_rxpipe_rxvalid;
        end : sel_is_SAME_QUAD_PCIE_CTRL
        if ( "SEL_UPPER_QUAD_PCIE_CTRL" == sel ) begin : sel_is_UPPER_QUAD_PCIE_CTRL
            assign o_upper_quad_pcie_ctrl_rxpipe_dirfeedback = i_rxpipe_dirfeedback;
            assign o_upper_quad_pcie_ctrl_rxpipe_linkevaluationfeedbackfiguremerit = i_rxpipe_linkevaluationfeedbackfiguremerit;
            assign o_upper_quad_pcie_ctrl_rxpipe_localfs = i_rxpipe_localfs;
            assign o_upper_quad_pcie_ctrl_rxpipe_locallf = i_rxpipe_locallf;
            assign o_upper_quad_pcie_ctrl_rxpipe_localtxcoefficientsvalid = i_rxpipe_localtxcoefficientsvalid;
            assign o_upper_quad_pcie_ctrl_rxpipe_localtxpresetcoefficients = i_rxpipe_localtxpresetcoefficients;
            assign o_upper_quad_pcie_ctrl_rxpipe_p2m_bus = i_rxpipe_p2m_bus;
            assign o_upper_quad_pcie_ctrl_rxpipe_pclkchangeok = i_rxpipe_pclkchangeok;
            assign o_upper_quad_pcie_ctrl_rxpipe_phystatus = i_rxpipe_phystatus;
            assign o_upper_quad_pcie_ctrl_rxpipe_rxdata = i_rxpipe_rxdata;
            assign o_upper_quad_pcie_ctrl_rxpipe_rxdatak = i_rxpipe_rxdatak;
            assign o_upper_quad_pcie_ctrl_rxpipe_rxdatavalid = i_rxpipe_rxdatavalid;
            assign o_upper_quad_pcie_ctrl_rxpipe_rxelecidlea = i_rxpipe_rxelecidlea;
            assign o_upper_quad_pcie_ctrl_rxpipe_rxstandbystatus = i_rxpipe_rxstandbystatus;
            assign o_upper_quad_pcie_ctrl_rxpipe_rxstartblock = i_rxpipe_rxstartblock;
            assign o_upper_quad_pcie_ctrl_rxpipe_rxstatus = i_rxpipe_rxstatus;
            assign o_upper_quad_pcie_ctrl_rxpipe_rxsyncheader = i_rxpipe_rxsyncheader;
            assign o_upper_quad_pcie_ctrl_rxpipe_rxvalid = i_rxpipe_rxvalid;
        end : sel_is_UPPER_QUAD_PCIE_CTRL
        if ( "SEL_HPS" == sel ) begin : sel_is_HPS
            assign o_hps_rxpipe_dirfeedback = i_rxpipe_dirfeedback;
            assign o_hps_rxpipe_linkevaluationfeedbackfiguremerit = i_rxpipe_linkevaluationfeedbackfiguremerit;
            assign o_hps_rxpipe_localfs = i_rxpipe_localfs;
            assign o_hps_rxpipe_locallf = i_rxpipe_locallf;
            assign o_hps_rxpipe_localtxcoefficientsvalid = i_rxpipe_localtxcoefficientsvalid;
            assign o_hps_rxpipe_localtxpresetcoefficients = i_rxpipe_localtxpresetcoefficients;
            assign o_hps_rxpipe_p2m_bus = i_rxpipe_p2m_bus;
            assign o_hps_rxpipe_pclkchangeok = i_rxpipe_pclkchangeok;
            assign o_hps_rxpipe_phystatus = i_rxpipe_phystatus;
            assign o_hps_rxpipe_rxdata = i_rxpipe_rxdata;
            assign o_hps_rxpipe_rxdatak = i_rxpipe_rxdatak;
            assign o_hps_rxpipe_rxdatavalid = i_rxpipe_rxdatavalid;
            assign o_hps_rxpipe_rxelecidlea = i_rxpipe_rxelecidlea;
            assign o_hps_rxpipe_rxstandbystatus = i_rxpipe_rxstandbystatus;
            assign o_hps_rxpipe_rxstartblock = i_rxpipe_rxstartblock;
            assign o_hps_rxpipe_rxstatus = i_rxpipe_rxstatus;
            assign o_hps_rxpipe_rxsyncheader = i_rxpipe_rxsyncheader;
            assign o_hps_rxpipe_rxvalid = i_rxpipe_rxvalid;
        end : sel_is_HPS
        if ( "SEL_UNUSED" == sel ) begin : sel_is_UNUSED
            assign o_unused_rxpipe_dirfeedback = i_rxpipe_dirfeedback;
            assign o_unused_rxpipe_linkevaluationfeedbackfiguremerit = i_rxpipe_linkevaluationfeedbackfiguremerit;
            assign o_unused_rxpipe_localfs = i_rxpipe_localfs;
            assign o_unused_rxpipe_locallf = i_rxpipe_locallf;
            assign o_unused_rxpipe_localtxcoefficientsvalid = i_rxpipe_localtxcoefficientsvalid;
            assign o_unused_rxpipe_localtxpresetcoefficients = i_rxpipe_localtxpresetcoefficients;
            assign o_unused_rxpipe_p2m_bus = i_rxpipe_p2m_bus;
            assign o_unused_rxpipe_pclkchangeok = i_rxpipe_pclkchangeok;
            assign o_unused_rxpipe_phystatus = i_rxpipe_phystatus;
            assign o_unused_rxpipe_rxdata = i_rxpipe_rxdata;
            assign o_unused_rxpipe_rxdatak = i_rxpipe_rxdatak;
            assign o_unused_rxpipe_rxdatavalid = i_rxpipe_rxdatavalid;
            assign o_unused_rxpipe_rxelecidlea = i_rxpipe_rxelecidlea;
            assign o_unused_rxpipe_rxstandbystatus = i_rxpipe_rxstandbystatus;
            assign o_unused_rxpipe_rxstartblock = i_rxpipe_rxstartblock;
            assign o_unused_rxpipe_rxstatus = i_rxpipe_rxstatus;
            assign o_unused_rxpipe_rxsyncheader = i_rxpipe_rxsyncheader;
            assign o_unused_rxpipe_rxvalid = i_rxpipe_rxvalid;
        end : sel_is_UNUSED
    endgenerate
`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_hssi_pcie_pcs_rx_demux

(* icm_name="sm_hssi_pcie_pcs_tx_mux", module_type="mux", simple_name="UNKNOWN", atom_type__std *)
module tennm_sm_hssi_pcie_pcs_tx_mux #(
        parameter sel                                                = "SEL_UNUSED"                   /* Settings: SEL_SAME_QUAD_PCIE_CTRL, SEL_UPPER_QUAD_PCIE_CTRL, SEL_HPS, SEL_UNUSED */
    )
    (
        input i_hps_txpipe_asyncpowerchangeack,
        input i_hps_txpipe_blockaligncontrol,
        input i_hps_txpipe_cfg_hw_auto_sp_dis,
        input i_hps_txpipe_dirchange,
        input i_hps_txpipe_ebuf_mode,
        input i_hps_txpipe_encodedecodebypass,
        input [5:0] i_hps_txpipe_fs,
        input i_hps_txpipe_getlocalpresetcoefficients,
        input i_hps_txpipe_invalidrequest,
        input [5:0] i_hps_txpipe_lf,
        input [4:0] i_hps_txpipe_localpresetindex,
        input i_hps_txpipe_lowpin_nt,
        input [7:0] i_hps_txpipe_m2p_bus,
        input [2:0] i_hps_txpipe_pclk_rate,
        input i_hps_txpipe_pclkchangeack,
        input [3:0] i_hps_txpipe_phy_mode_nt,
        input [3:0] i_hps_txpipe_powerdown,
        input [2:0] i_hps_txpipe_rate,
        input i_hps_txpipe_rxelecidle_disable_a,
        input i_hps_txpipe_rxeqclr,
        input i_hps_txpipe_rxeqeval,
        input i_hps_txpipe_rxeqinprogress,
        input i_hps_txpipe_rxeqtraining,
        input i_hps_txpipe_rxpolarity,
        input [2:0] i_hps_txpipe_rxpresethint,
        input i_hps_txpipe_rxstandby,
        input i_hps_txpipe_rxtermination,
        input i_hps_txpipe_srisenable,
        input i_hps_txpipe_txcmnmode_disable_a,
        input i_hps_txpipe_txcompliance,
        input [39:0] i_hps_txpipe_txdata,
        input [3:0] i_hps_txpipe_txdatak,
        input i_hps_txpipe_txdatavalid,
        input [17:0] i_hps_txpipe_txdeemph,
        input i_hps_txpipe_txdtctrx_lb,
        input i_hps_txpipe_txelecidle,
        input [2:0] i_hps_txpipe_txmargin,
        input i_hps_txpipe_txoneszeros,
        input i_hps_txpipe_txstartblock,
        input i_hps_txpipe_txswing,
        input [3:0] i_hps_txpipe_txsyncheader,
        input [2:0] i_hps_txpipe_width,
        input i_same_quad_pcie_ctrl_txpipe_asyncpowerchangeack,
        input i_same_quad_pcie_ctrl_txpipe_blockaligncontrol,
        input i_same_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis,
        input i_same_quad_pcie_ctrl_txpipe_dirchange,
        input i_same_quad_pcie_ctrl_txpipe_ebuf_mode,
        input i_same_quad_pcie_ctrl_txpipe_encodedecodebypass,
        input [5:0] i_same_quad_pcie_ctrl_txpipe_fs,
        input i_same_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients,
        input i_same_quad_pcie_ctrl_txpipe_invalidrequest,
        input [5:0] i_same_quad_pcie_ctrl_txpipe_lf,
        input [4:0] i_same_quad_pcie_ctrl_txpipe_localpresetindex,
        input i_same_quad_pcie_ctrl_txpipe_lowpin_nt,
        input [7:0] i_same_quad_pcie_ctrl_txpipe_m2p_bus,
        input [2:0] i_same_quad_pcie_ctrl_txpipe_pclk_rate,
        input i_same_quad_pcie_ctrl_txpipe_pclkchangeack,
        input [3:0] i_same_quad_pcie_ctrl_txpipe_phy_mode_nt,
        input [3:0] i_same_quad_pcie_ctrl_txpipe_powerdown,
        input [2:0] i_same_quad_pcie_ctrl_txpipe_rate,
        input i_same_quad_pcie_ctrl_txpipe_rxelecidle_disable_a,
        input i_same_quad_pcie_ctrl_txpipe_rxeqclr,
        input i_same_quad_pcie_ctrl_txpipe_rxeqeval,
        input i_same_quad_pcie_ctrl_txpipe_rxeqinprogress,
        input i_same_quad_pcie_ctrl_txpipe_rxeqtraining,
        input i_same_quad_pcie_ctrl_txpipe_rxpolarity,
        input [2:0] i_same_quad_pcie_ctrl_txpipe_rxpresethint,
        input i_same_quad_pcie_ctrl_txpipe_rxstandby,
        input i_same_quad_pcie_ctrl_txpipe_rxtermination,
        input i_same_quad_pcie_ctrl_txpipe_srisenable,
        input i_same_quad_pcie_ctrl_txpipe_txcmnmode_disable_a,
        input i_same_quad_pcie_ctrl_txpipe_txcompliance,
        input [39:0] i_same_quad_pcie_ctrl_txpipe_txdata,
        input [3:0] i_same_quad_pcie_ctrl_txpipe_txdatak,
        input i_same_quad_pcie_ctrl_txpipe_txdatavalid,
        input [17:0] i_same_quad_pcie_ctrl_txpipe_txdeemph,
        input i_same_quad_pcie_ctrl_txpipe_txdtctrx_lb,
        input i_same_quad_pcie_ctrl_txpipe_txelecidle,
        input [2:0] i_same_quad_pcie_ctrl_txpipe_txmargin,
        input i_same_quad_pcie_ctrl_txpipe_txoneszeros,
        input i_same_quad_pcie_ctrl_txpipe_txstartblock,
        input i_same_quad_pcie_ctrl_txpipe_txswing,
        input [3:0] i_same_quad_pcie_ctrl_txpipe_txsyncheader,
        input [2:0] i_same_quad_pcie_ctrl_txpipe_width,
        input i_unused_txpipe_asyncpowerchangeack,
        input i_unused_txpipe_blockaligncontrol,
        input i_unused_txpipe_cfg_hw_auto_sp_dis,
        input i_unused_txpipe_dirchange,
        input i_unused_txpipe_ebuf_mode,
        input i_unused_txpipe_encodedecodebypass,
        input [5:0] i_unused_txpipe_fs,
        input i_unused_txpipe_getlocalpresetcoefficients,
        input i_unused_txpipe_invalidrequest,
        input [5:0] i_unused_txpipe_lf,
        input [4:0] i_unused_txpipe_localpresetindex,
        input i_unused_txpipe_lowpin_nt,
        input [7:0] i_unused_txpipe_m2p_bus,
        input [2:0] i_unused_txpipe_pclk_rate,
        input i_unused_txpipe_pclkchangeack,
        input [3:0] i_unused_txpipe_phy_mode_nt,
        input [3:0] i_unused_txpipe_powerdown,
        input [2:0] i_unused_txpipe_rate,
        input i_unused_txpipe_rxelecidle_disable_a,
        input i_unused_txpipe_rxeqclr,
        input i_unused_txpipe_rxeqeval,
        input i_unused_txpipe_rxeqinprogress,
        input i_unused_txpipe_rxeqtraining,
        input i_unused_txpipe_rxpolarity,
        input [2:0] i_unused_txpipe_rxpresethint,
        input i_unused_txpipe_rxstandby,
        input i_unused_txpipe_rxtermination,
        input i_unused_txpipe_srisenable,
        input i_unused_txpipe_txcmnmode_disable_a,
        input i_unused_txpipe_txcompliance,
        input [39:0] i_unused_txpipe_txdata,
        input [3:0] i_unused_txpipe_txdatak,
        input i_unused_txpipe_txdatavalid,
        input [17:0] i_unused_txpipe_txdeemph,
        input i_unused_txpipe_txdtctrx_lb,
        input i_unused_txpipe_txelecidle,
        input [2:0] i_unused_txpipe_txmargin,
        input i_unused_txpipe_txoneszeros,
        input i_unused_txpipe_txstartblock,
        input i_unused_txpipe_txswing,
        input [3:0] i_unused_txpipe_txsyncheader,
        input [2:0] i_unused_txpipe_width,
        input i_upper_quad_pcie_ctrl_txpipe_asyncpowerchangeack,
        input i_upper_quad_pcie_ctrl_txpipe_blockaligncontrol,
        input i_upper_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis,
        input i_upper_quad_pcie_ctrl_txpipe_dirchange,
        input i_upper_quad_pcie_ctrl_txpipe_ebuf_mode,
        input i_upper_quad_pcie_ctrl_txpipe_encodedecodebypass,
        input [5:0] i_upper_quad_pcie_ctrl_txpipe_fs,
        input i_upper_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients,
        input i_upper_quad_pcie_ctrl_txpipe_invalidrequest,
        input [5:0] i_upper_quad_pcie_ctrl_txpipe_lf,
        input [4:0] i_upper_quad_pcie_ctrl_txpipe_localpresetindex,
        input i_upper_quad_pcie_ctrl_txpipe_lowpin_nt,
        input [7:0] i_upper_quad_pcie_ctrl_txpipe_m2p_bus,
        input [2:0] i_upper_quad_pcie_ctrl_txpipe_pclk_rate,
        input i_upper_quad_pcie_ctrl_txpipe_pclkchangeack,
        input [3:0] i_upper_quad_pcie_ctrl_txpipe_phy_mode_nt,
        input [3:0] i_upper_quad_pcie_ctrl_txpipe_powerdown,
        input [2:0] i_upper_quad_pcie_ctrl_txpipe_rate,
        input i_upper_quad_pcie_ctrl_txpipe_rxelecidle_disable_a,
        input i_upper_quad_pcie_ctrl_txpipe_rxeqclr,
        input i_upper_quad_pcie_ctrl_txpipe_rxeqeval,
        input i_upper_quad_pcie_ctrl_txpipe_rxeqinprogress,
        input i_upper_quad_pcie_ctrl_txpipe_rxeqtraining,
        input i_upper_quad_pcie_ctrl_txpipe_rxpolarity,
        input [2:0] i_upper_quad_pcie_ctrl_txpipe_rxpresethint,
        input i_upper_quad_pcie_ctrl_txpipe_rxstandby,
        input i_upper_quad_pcie_ctrl_txpipe_rxtermination,
        input i_upper_quad_pcie_ctrl_txpipe_srisenable,
        input i_upper_quad_pcie_ctrl_txpipe_txcmnmode_disable_a,
        input i_upper_quad_pcie_ctrl_txpipe_txcompliance,
        input [39:0] i_upper_quad_pcie_ctrl_txpipe_txdata,
        input [3:0] i_upper_quad_pcie_ctrl_txpipe_txdatak,
        input i_upper_quad_pcie_ctrl_txpipe_txdatavalid,
        input [17:0] i_upper_quad_pcie_ctrl_txpipe_txdeemph,
        input i_upper_quad_pcie_ctrl_txpipe_txdtctrx_lb,
        input i_upper_quad_pcie_ctrl_txpipe_txelecidle,
        input [2:0] i_upper_quad_pcie_ctrl_txpipe_txmargin,
        input i_upper_quad_pcie_ctrl_txpipe_txoneszeros,
        input i_upper_quad_pcie_ctrl_txpipe_txstartblock,
        input i_upper_quad_pcie_ctrl_txpipe_txswing,
        input [3:0] i_upper_quad_pcie_ctrl_txpipe_txsyncheader,
        input [2:0] i_upper_quad_pcie_ctrl_txpipe_width,
        output o_txpipe_asyncpowerchangeack,
        output o_txpipe_blockaligncontrol,
        output o_txpipe_cfg_hw_auto_sp_dis,
        output o_txpipe_dirchange,
        output o_txpipe_ebuf_mode,
        output o_txpipe_encodedecodebypass,
        output [5:0] o_txpipe_fs,
        output o_txpipe_getlocalpresetcoefficients,
        output o_txpipe_invalidrequest,
        output [5:0] o_txpipe_lf,
        output [4:0] o_txpipe_localpresetindex,
        output o_txpipe_lowpin_nt,
        output [7:0] o_txpipe_m2p_bus,
        output [2:0] o_txpipe_pclk_rate,
        output o_txpipe_pclkchangeack,
        output [3:0] o_txpipe_phy_mode_nt,
        output [3:0] o_txpipe_powerdown,
        output [2:0] o_txpipe_rate,
        output o_txpipe_rxelecidle_disable_a,
        output o_txpipe_rxeqclr,
        output o_txpipe_rxeqeval,
        output o_txpipe_rxeqinprogress,
        output o_txpipe_rxeqtraining,
        output o_txpipe_rxpolarity,
        output [2:0] o_txpipe_rxpresethint,
        output o_txpipe_rxstandby,
        output o_txpipe_rxtermination,
        output o_txpipe_srisenable,
        output o_txpipe_txcmnmode_disable_a,
        output o_txpipe_txcompliance,
        output [39:0] o_txpipe_txdata,
        output [3:0] o_txpipe_txdatak,
        output o_txpipe_txdatavalid,
        output [17:0] o_txpipe_txdeemph,
        output o_txpipe_txdtctrx_lb,
        output o_txpipe_txelecidle,
        output [2:0] o_txpipe_txmargin,
        output o_txpipe_txoneszeros,
        output o_txpipe_txstartblock,
        output o_txpipe_txswing,
        output [3:0] o_txpipe_txsyncheader,
        output [2:0] o_txpipe_width
    );

`ifdef DDM_BASED_COREIP_GENERATOR
    sm_hssi_pcie_pcs_tx_mux
`ifdef DEFINE_SF_RTL_MODULE_PARAMETERS
    #(
        .sel(sel)
    )
`endif // DEFINE_SF_RTL_MODULE_PARAMETERS
    x_sm_hssi_pcie_pcs_tx_mux (
        .i_hps_txpipe_asyncpowerchangeack(i_hps_txpipe_asyncpowerchangeack),
        .i_hps_txpipe_blockaligncontrol(i_hps_txpipe_blockaligncontrol),
        .i_hps_txpipe_cfg_hw_auto_sp_dis(i_hps_txpipe_cfg_hw_auto_sp_dis),
        .i_hps_txpipe_dirchange(i_hps_txpipe_dirchange),
        .i_hps_txpipe_ebuf_mode(i_hps_txpipe_ebuf_mode),
        .i_hps_txpipe_encodedecodebypass(i_hps_txpipe_encodedecodebypass),
        .i_hps_txpipe_fs(i_hps_txpipe_fs),
        .i_hps_txpipe_getlocalpresetcoefficients(i_hps_txpipe_getlocalpresetcoefficients),
        .i_hps_txpipe_invalidrequest(i_hps_txpipe_invalidrequest),
        .i_hps_txpipe_lf(i_hps_txpipe_lf),
        .i_hps_txpipe_localpresetindex(i_hps_txpipe_localpresetindex),
        .i_hps_txpipe_lowpin_nt(i_hps_txpipe_lowpin_nt),
        .i_hps_txpipe_m2p_bus(i_hps_txpipe_m2p_bus),
        .i_hps_txpipe_pclk_rate(i_hps_txpipe_pclk_rate),
        .i_hps_txpipe_pclkchangeack(i_hps_txpipe_pclkchangeack),
        .i_hps_txpipe_phy_mode_nt(i_hps_txpipe_phy_mode_nt),
        .i_hps_txpipe_powerdown(i_hps_txpipe_powerdown),
        .i_hps_txpipe_rate(i_hps_txpipe_rate),
        .i_hps_txpipe_rxelecidle_disable_a(i_hps_txpipe_rxelecidle_disable_a),
        .i_hps_txpipe_rxeqclr(i_hps_txpipe_rxeqclr),
        .i_hps_txpipe_rxeqeval(i_hps_txpipe_rxeqeval),
        .i_hps_txpipe_rxeqinprogress(i_hps_txpipe_rxeqinprogress),
        .i_hps_txpipe_rxeqtraining(i_hps_txpipe_rxeqtraining),
        .i_hps_txpipe_rxpolarity(i_hps_txpipe_rxpolarity),
        .i_hps_txpipe_rxpresethint(i_hps_txpipe_rxpresethint),
        .i_hps_txpipe_rxstandby(i_hps_txpipe_rxstandby),
        .i_hps_txpipe_rxtermination(i_hps_txpipe_rxtermination),
        .i_hps_txpipe_srisenable(i_hps_txpipe_srisenable),
        .i_hps_txpipe_txcmnmode_disable_a(i_hps_txpipe_txcmnmode_disable_a),
        .i_hps_txpipe_txcompliance(i_hps_txpipe_txcompliance),
        .i_hps_txpipe_txdata(i_hps_txpipe_txdata),
        .i_hps_txpipe_txdatak(i_hps_txpipe_txdatak),
        .i_hps_txpipe_txdatavalid(i_hps_txpipe_txdatavalid),
        .i_hps_txpipe_txdeemph(i_hps_txpipe_txdeemph),
        .i_hps_txpipe_txdtctrx_lb(i_hps_txpipe_txdtctrx_lb),
        .i_hps_txpipe_txelecidle(i_hps_txpipe_txelecidle),
        .i_hps_txpipe_txmargin(i_hps_txpipe_txmargin),
        .i_hps_txpipe_txoneszeros(i_hps_txpipe_txoneszeros),
        .i_hps_txpipe_txstartblock(i_hps_txpipe_txstartblock),
        .i_hps_txpipe_txswing(i_hps_txpipe_txswing),
        .i_hps_txpipe_txsyncheader(i_hps_txpipe_txsyncheader),
        .i_hps_txpipe_width(i_hps_txpipe_width),
        .i_same_quad_pcie_ctrl_txpipe_asyncpowerchangeack(i_same_quad_pcie_ctrl_txpipe_asyncpowerchangeack),
        .i_same_quad_pcie_ctrl_txpipe_blockaligncontrol(i_same_quad_pcie_ctrl_txpipe_blockaligncontrol),
        .i_same_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis(i_same_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis),
        .i_same_quad_pcie_ctrl_txpipe_dirchange(i_same_quad_pcie_ctrl_txpipe_dirchange),
        .i_same_quad_pcie_ctrl_txpipe_ebuf_mode(i_same_quad_pcie_ctrl_txpipe_ebuf_mode),
        .i_same_quad_pcie_ctrl_txpipe_encodedecodebypass(i_same_quad_pcie_ctrl_txpipe_encodedecodebypass),
        .i_same_quad_pcie_ctrl_txpipe_fs(i_same_quad_pcie_ctrl_txpipe_fs),
        .i_same_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients(i_same_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients),
        .i_same_quad_pcie_ctrl_txpipe_invalidrequest(i_same_quad_pcie_ctrl_txpipe_invalidrequest),
        .i_same_quad_pcie_ctrl_txpipe_lf(i_same_quad_pcie_ctrl_txpipe_lf),
        .i_same_quad_pcie_ctrl_txpipe_localpresetindex(i_same_quad_pcie_ctrl_txpipe_localpresetindex),
        .i_same_quad_pcie_ctrl_txpipe_lowpin_nt(i_same_quad_pcie_ctrl_txpipe_lowpin_nt),
        .i_same_quad_pcie_ctrl_txpipe_m2p_bus(i_same_quad_pcie_ctrl_txpipe_m2p_bus),
        .i_same_quad_pcie_ctrl_txpipe_pclk_rate(i_same_quad_pcie_ctrl_txpipe_pclk_rate),
        .i_same_quad_pcie_ctrl_txpipe_pclkchangeack(i_same_quad_pcie_ctrl_txpipe_pclkchangeack),
        .i_same_quad_pcie_ctrl_txpipe_phy_mode_nt(i_same_quad_pcie_ctrl_txpipe_phy_mode_nt),
        .i_same_quad_pcie_ctrl_txpipe_powerdown(i_same_quad_pcie_ctrl_txpipe_powerdown),
        .i_same_quad_pcie_ctrl_txpipe_rate(i_same_quad_pcie_ctrl_txpipe_rate),
        .i_same_quad_pcie_ctrl_txpipe_rxelecidle_disable_a(i_same_quad_pcie_ctrl_txpipe_rxelecidle_disable_a),
        .i_same_quad_pcie_ctrl_txpipe_rxeqclr(i_same_quad_pcie_ctrl_txpipe_rxeqclr),
        .i_same_quad_pcie_ctrl_txpipe_rxeqeval(i_same_quad_pcie_ctrl_txpipe_rxeqeval),
        .i_same_quad_pcie_ctrl_txpipe_rxeqinprogress(i_same_quad_pcie_ctrl_txpipe_rxeqinprogress),
        .i_same_quad_pcie_ctrl_txpipe_rxeqtraining(i_same_quad_pcie_ctrl_txpipe_rxeqtraining),
        .i_same_quad_pcie_ctrl_txpipe_rxpolarity(i_same_quad_pcie_ctrl_txpipe_rxpolarity),
        .i_same_quad_pcie_ctrl_txpipe_rxpresethint(i_same_quad_pcie_ctrl_txpipe_rxpresethint),
        .i_same_quad_pcie_ctrl_txpipe_rxstandby(i_same_quad_pcie_ctrl_txpipe_rxstandby),
        .i_same_quad_pcie_ctrl_txpipe_rxtermination(i_same_quad_pcie_ctrl_txpipe_rxtermination),
        .i_same_quad_pcie_ctrl_txpipe_srisenable(i_same_quad_pcie_ctrl_txpipe_srisenable),
        .i_same_quad_pcie_ctrl_txpipe_txcmnmode_disable_a(i_same_quad_pcie_ctrl_txpipe_txcmnmode_disable_a),
        .i_same_quad_pcie_ctrl_txpipe_txcompliance(i_same_quad_pcie_ctrl_txpipe_txcompliance),
        .i_same_quad_pcie_ctrl_txpipe_txdata(i_same_quad_pcie_ctrl_txpipe_txdata),
        .i_same_quad_pcie_ctrl_txpipe_txdatak(i_same_quad_pcie_ctrl_txpipe_txdatak),
        .i_same_quad_pcie_ctrl_txpipe_txdatavalid(i_same_quad_pcie_ctrl_txpipe_txdatavalid),
        .i_same_quad_pcie_ctrl_txpipe_txdeemph(i_same_quad_pcie_ctrl_txpipe_txdeemph),
        .i_same_quad_pcie_ctrl_txpipe_txdtctrx_lb(i_same_quad_pcie_ctrl_txpipe_txdtctrx_lb),
        .i_same_quad_pcie_ctrl_txpipe_txelecidle(i_same_quad_pcie_ctrl_txpipe_txelecidle),
        .i_same_quad_pcie_ctrl_txpipe_txmargin(i_same_quad_pcie_ctrl_txpipe_txmargin),
        .i_same_quad_pcie_ctrl_txpipe_txoneszeros(i_same_quad_pcie_ctrl_txpipe_txoneszeros),
        .i_same_quad_pcie_ctrl_txpipe_txstartblock(i_same_quad_pcie_ctrl_txpipe_txstartblock),
        .i_same_quad_pcie_ctrl_txpipe_txswing(i_same_quad_pcie_ctrl_txpipe_txswing),
        .i_same_quad_pcie_ctrl_txpipe_txsyncheader(i_same_quad_pcie_ctrl_txpipe_txsyncheader),
        .i_same_quad_pcie_ctrl_txpipe_width(i_same_quad_pcie_ctrl_txpipe_width),
        .i_unused_txpipe_asyncpowerchangeack(i_unused_txpipe_asyncpowerchangeack),
        .i_unused_txpipe_blockaligncontrol(i_unused_txpipe_blockaligncontrol),
        .i_unused_txpipe_cfg_hw_auto_sp_dis(i_unused_txpipe_cfg_hw_auto_sp_dis),
        .i_unused_txpipe_dirchange(i_unused_txpipe_dirchange),
        .i_unused_txpipe_ebuf_mode(i_unused_txpipe_ebuf_mode),
        .i_unused_txpipe_encodedecodebypass(i_unused_txpipe_encodedecodebypass),
        .i_unused_txpipe_fs(i_unused_txpipe_fs),
        .i_unused_txpipe_getlocalpresetcoefficients(i_unused_txpipe_getlocalpresetcoefficients),
        .i_unused_txpipe_invalidrequest(i_unused_txpipe_invalidrequest),
        .i_unused_txpipe_lf(i_unused_txpipe_lf),
        .i_unused_txpipe_localpresetindex(i_unused_txpipe_localpresetindex),
        .i_unused_txpipe_lowpin_nt(i_unused_txpipe_lowpin_nt),
        .i_unused_txpipe_m2p_bus(i_unused_txpipe_m2p_bus),
        .i_unused_txpipe_pclk_rate(i_unused_txpipe_pclk_rate),
        .i_unused_txpipe_pclkchangeack(i_unused_txpipe_pclkchangeack),
        .i_unused_txpipe_phy_mode_nt(i_unused_txpipe_phy_mode_nt),
        .i_unused_txpipe_powerdown(i_unused_txpipe_powerdown),
        .i_unused_txpipe_rate(i_unused_txpipe_rate),
        .i_unused_txpipe_rxelecidle_disable_a(i_unused_txpipe_rxelecidle_disable_a),
        .i_unused_txpipe_rxeqclr(i_unused_txpipe_rxeqclr),
        .i_unused_txpipe_rxeqeval(i_unused_txpipe_rxeqeval),
        .i_unused_txpipe_rxeqinprogress(i_unused_txpipe_rxeqinprogress),
        .i_unused_txpipe_rxeqtraining(i_unused_txpipe_rxeqtraining),
        .i_unused_txpipe_rxpolarity(i_unused_txpipe_rxpolarity),
        .i_unused_txpipe_rxpresethint(i_unused_txpipe_rxpresethint),
        .i_unused_txpipe_rxstandby(i_unused_txpipe_rxstandby),
        .i_unused_txpipe_rxtermination(i_unused_txpipe_rxtermination),
        .i_unused_txpipe_srisenable(i_unused_txpipe_srisenable),
        .i_unused_txpipe_txcmnmode_disable_a(i_unused_txpipe_txcmnmode_disable_a),
        .i_unused_txpipe_txcompliance(i_unused_txpipe_txcompliance),
        .i_unused_txpipe_txdata(i_unused_txpipe_txdata),
        .i_unused_txpipe_txdatak(i_unused_txpipe_txdatak),
        .i_unused_txpipe_txdatavalid(i_unused_txpipe_txdatavalid),
        .i_unused_txpipe_txdeemph(i_unused_txpipe_txdeemph),
        .i_unused_txpipe_txdtctrx_lb(i_unused_txpipe_txdtctrx_lb),
        .i_unused_txpipe_txelecidle(i_unused_txpipe_txelecidle),
        .i_unused_txpipe_txmargin(i_unused_txpipe_txmargin),
        .i_unused_txpipe_txoneszeros(i_unused_txpipe_txoneszeros),
        .i_unused_txpipe_txstartblock(i_unused_txpipe_txstartblock),
        .i_unused_txpipe_txswing(i_unused_txpipe_txswing),
        .i_unused_txpipe_txsyncheader(i_unused_txpipe_txsyncheader),
        .i_unused_txpipe_width(i_unused_txpipe_width),
        .i_upper_quad_pcie_ctrl_txpipe_asyncpowerchangeack(i_upper_quad_pcie_ctrl_txpipe_asyncpowerchangeack),
        .i_upper_quad_pcie_ctrl_txpipe_blockaligncontrol(i_upper_quad_pcie_ctrl_txpipe_blockaligncontrol),
        .i_upper_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis(i_upper_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis),
        .i_upper_quad_pcie_ctrl_txpipe_dirchange(i_upper_quad_pcie_ctrl_txpipe_dirchange),
        .i_upper_quad_pcie_ctrl_txpipe_ebuf_mode(i_upper_quad_pcie_ctrl_txpipe_ebuf_mode),
        .i_upper_quad_pcie_ctrl_txpipe_encodedecodebypass(i_upper_quad_pcie_ctrl_txpipe_encodedecodebypass),
        .i_upper_quad_pcie_ctrl_txpipe_fs(i_upper_quad_pcie_ctrl_txpipe_fs),
        .i_upper_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients(i_upper_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients),
        .i_upper_quad_pcie_ctrl_txpipe_invalidrequest(i_upper_quad_pcie_ctrl_txpipe_invalidrequest),
        .i_upper_quad_pcie_ctrl_txpipe_lf(i_upper_quad_pcie_ctrl_txpipe_lf),
        .i_upper_quad_pcie_ctrl_txpipe_localpresetindex(i_upper_quad_pcie_ctrl_txpipe_localpresetindex),
        .i_upper_quad_pcie_ctrl_txpipe_lowpin_nt(i_upper_quad_pcie_ctrl_txpipe_lowpin_nt),
        .i_upper_quad_pcie_ctrl_txpipe_m2p_bus(i_upper_quad_pcie_ctrl_txpipe_m2p_bus),
        .i_upper_quad_pcie_ctrl_txpipe_pclk_rate(i_upper_quad_pcie_ctrl_txpipe_pclk_rate),
        .i_upper_quad_pcie_ctrl_txpipe_pclkchangeack(i_upper_quad_pcie_ctrl_txpipe_pclkchangeack),
        .i_upper_quad_pcie_ctrl_txpipe_phy_mode_nt(i_upper_quad_pcie_ctrl_txpipe_phy_mode_nt),
        .i_upper_quad_pcie_ctrl_txpipe_powerdown(i_upper_quad_pcie_ctrl_txpipe_powerdown),
        .i_upper_quad_pcie_ctrl_txpipe_rate(i_upper_quad_pcie_ctrl_txpipe_rate),
        .i_upper_quad_pcie_ctrl_txpipe_rxelecidle_disable_a(i_upper_quad_pcie_ctrl_txpipe_rxelecidle_disable_a),
        .i_upper_quad_pcie_ctrl_txpipe_rxeqclr(i_upper_quad_pcie_ctrl_txpipe_rxeqclr),
        .i_upper_quad_pcie_ctrl_txpipe_rxeqeval(i_upper_quad_pcie_ctrl_txpipe_rxeqeval),
        .i_upper_quad_pcie_ctrl_txpipe_rxeqinprogress(i_upper_quad_pcie_ctrl_txpipe_rxeqinprogress),
        .i_upper_quad_pcie_ctrl_txpipe_rxeqtraining(i_upper_quad_pcie_ctrl_txpipe_rxeqtraining),
        .i_upper_quad_pcie_ctrl_txpipe_rxpolarity(i_upper_quad_pcie_ctrl_txpipe_rxpolarity),
        .i_upper_quad_pcie_ctrl_txpipe_rxpresethint(i_upper_quad_pcie_ctrl_txpipe_rxpresethint),
        .i_upper_quad_pcie_ctrl_txpipe_rxstandby(i_upper_quad_pcie_ctrl_txpipe_rxstandby),
        .i_upper_quad_pcie_ctrl_txpipe_rxtermination(i_upper_quad_pcie_ctrl_txpipe_rxtermination),
        .i_upper_quad_pcie_ctrl_txpipe_srisenable(i_upper_quad_pcie_ctrl_txpipe_srisenable),
        .i_upper_quad_pcie_ctrl_txpipe_txcmnmode_disable_a(i_upper_quad_pcie_ctrl_txpipe_txcmnmode_disable_a),
        .i_upper_quad_pcie_ctrl_txpipe_txcompliance(i_upper_quad_pcie_ctrl_txpipe_txcompliance),
        .i_upper_quad_pcie_ctrl_txpipe_txdata(i_upper_quad_pcie_ctrl_txpipe_txdata),
        .i_upper_quad_pcie_ctrl_txpipe_txdatak(i_upper_quad_pcie_ctrl_txpipe_txdatak),
        .i_upper_quad_pcie_ctrl_txpipe_txdatavalid(i_upper_quad_pcie_ctrl_txpipe_txdatavalid),
        .i_upper_quad_pcie_ctrl_txpipe_txdeemph(i_upper_quad_pcie_ctrl_txpipe_txdeemph),
        .i_upper_quad_pcie_ctrl_txpipe_txdtctrx_lb(i_upper_quad_pcie_ctrl_txpipe_txdtctrx_lb),
        .i_upper_quad_pcie_ctrl_txpipe_txelecidle(i_upper_quad_pcie_ctrl_txpipe_txelecidle),
        .i_upper_quad_pcie_ctrl_txpipe_txmargin(i_upper_quad_pcie_ctrl_txpipe_txmargin),
        .i_upper_quad_pcie_ctrl_txpipe_txoneszeros(i_upper_quad_pcie_ctrl_txpipe_txoneszeros),
        .i_upper_quad_pcie_ctrl_txpipe_txstartblock(i_upper_quad_pcie_ctrl_txpipe_txstartblock),
        .i_upper_quad_pcie_ctrl_txpipe_txswing(i_upper_quad_pcie_ctrl_txpipe_txswing),
        .i_upper_quad_pcie_ctrl_txpipe_txsyncheader(i_upper_quad_pcie_ctrl_txpipe_txsyncheader),
        .i_upper_quad_pcie_ctrl_txpipe_width(i_upper_quad_pcie_ctrl_txpipe_width),
        .o_txpipe_asyncpowerchangeack(o_txpipe_asyncpowerchangeack),
        .o_txpipe_blockaligncontrol(o_txpipe_blockaligncontrol),
        .o_txpipe_cfg_hw_auto_sp_dis(o_txpipe_cfg_hw_auto_sp_dis),
        .o_txpipe_dirchange(o_txpipe_dirchange),
        .o_txpipe_ebuf_mode(o_txpipe_ebuf_mode),
        .o_txpipe_encodedecodebypass(o_txpipe_encodedecodebypass),
        .o_txpipe_fs(o_txpipe_fs),
        .o_txpipe_getlocalpresetcoefficients(o_txpipe_getlocalpresetcoefficients),
        .o_txpipe_invalidrequest(o_txpipe_invalidrequest),
        .o_txpipe_lf(o_txpipe_lf),
        .o_txpipe_localpresetindex(o_txpipe_localpresetindex),
        .o_txpipe_lowpin_nt(o_txpipe_lowpin_nt),
        .o_txpipe_m2p_bus(o_txpipe_m2p_bus),
        .o_txpipe_pclk_rate(o_txpipe_pclk_rate),
        .o_txpipe_pclkchangeack(o_txpipe_pclkchangeack),
        .o_txpipe_phy_mode_nt(o_txpipe_phy_mode_nt),
        .o_txpipe_powerdown(o_txpipe_powerdown),
        .o_txpipe_rate(o_txpipe_rate),
        .o_txpipe_rxelecidle_disable_a(o_txpipe_rxelecidle_disable_a),
        .o_txpipe_rxeqclr(o_txpipe_rxeqclr),
        .o_txpipe_rxeqeval(o_txpipe_rxeqeval),
        .o_txpipe_rxeqinprogress(o_txpipe_rxeqinprogress),
        .o_txpipe_rxeqtraining(o_txpipe_rxeqtraining),
        .o_txpipe_rxpolarity(o_txpipe_rxpolarity),
        .o_txpipe_rxpresethint(o_txpipe_rxpresethint),
        .o_txpipe_rxstandby(o_txpipe_rxstandby),
        .o_txpipe_rxtermination(o_txpipe_rxtermination),
        .o_txpipe_srisenable(o_txpipe_srisenable),
        .o_txpipe_txcmnmode_disable_a(o_txpipe_txcmnmode_disable_a),
        .o_txpipe_txcompliance(o_txpipe_txcompliance),
        .o_txpipe_txdata(o_txpipe_txdata),
        .o_txpipe_txdatak(o_txpipe_txdatak),
        .o_txpipe_txdatavalid(o_txpipe_txdatavalid),
        .o_txpipe_txdeemph(o_txpipe_txdeemph),
        .o_txpipe_txdtctrx_lb(o_txpipe_txdtctrx_lb),
        .o_txpipe_txelecidle(o_txpipe_txelecidle),
        .o_txpipe_txmargin(o_txpipe_txmargin),
        .o_txpipe_txoneszeros(o_txpipe_txoneszeros),
        .o_txpipe_txstartblock(o_txpipe_txstartblock),
        .o_txpipe_txswing(o_txpipe_txswing),
        .o_txpipe_txsyncheader(o_txpipe_txsyncheader),
        .o_txpipe_width(o_txpipe_width)
        );
`else // ifdef DDM_BASED_COREIP_GENERATOR
    generate
        if ( "SEL_UPPER_QUAD_PCIE_CTRL" == sel ) begin : sel_is_UPPER_QUAD_PCIE_CTRL
            assign o_txpipe_asyncpowerchangeack = i_upper_quad_pcie_ctrl_txpipe_asyncpowerchangeack;
            assign o_txpipe_blockaligncontrol = i_upper_quad_pcie_ctrl_txpipe_blockaligncontrol;
            assign o_txpipe_cfg_hw_auto_sp_dis = i_upper_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis;
            assign o_txpipe_dirchange = i_upper_quad_pcie_ctrl_txpipe_dirchange;
            assign o_txpipe_ebuf_mode = i_upper_quad_pcie_ctrl_txpipe_ebuf_mode;
            assign o_txpipe_encodedecodebypass = i_upper_quad_pcie_ctrl_txpipe_encodedecodebypass;
            assign o_txpipe_fs = i_upper_quad_pcie_ctrl_txpipe_fs;
            assign o_txpipe_getlocalpresetcoefficients = i_upper_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients;
            assign o_txpipe_invalidrequest = i_upper_quad_pcie_ctrl_txpipe_invalidrequest;
            assign o_txpipe_lf = i_upper_quad_pcie_ctrl_txpipe_lf;
            assign o_txpipe_localpresetindex = i_upper_quad_pcie_ctrl_txpipe_localpresetindex;
            assign o_txpipe_lowpin_nt = i_upper_quad_pcie_ctrl_txpipe_lowpin_nt;
            assign o_txpipe_m2p_bus = i_upper_quad_pcie_ctrl_txpipe_m2p_bus;
            assign o_txpipe_pclk_rate = i_upper_quad_pcie_ctrl_txpipe_pclk_rate;
            assign o_txpipe_pclkchangeack = i_upper_quad_pcie_ctrl_txpipe_pclkchangeack;
            assign o_txpipe_phy_mode_nt = i_upper_quad_pcie_ctrl_txpipe_phy_mode_nt;
            assign o_txpipe_powerdown = i_upper_quad_pcie_ctrl_txpipe_powerdown;
            assign o_txpipe_rate = i_upper_quad_pcie_ctrl_txpipe_rate;
            assign o_txpipe_rxelecidle_disable_a = i_upper_quad_pcie_ctrl_txpipe_rxelecidle_disable_a;
            assign o_txpipe_rxeqclr = i_upper_quad_pcie_ctrl_txpipe_rxeqclr;
            assign o_txpipe_rxeqeval = i_upper_quad_pcie_ctrl_txpipe_rxeqeval;
            assign o_txpipe_rxeqinprogress = i_upper_quad_pcie_ctrl_txpipe_rxeqinprogress;
            assign o_txpipe_rxeqtraining = i_upper_quad_pcie_ctrl_txpipe_rxeqtraining;
            assign o_txpipe_rxpolarity = i_upper_quad_pcie_ctrl_txpipe_rxpolarity;
            assign o_txpipe_rxpresethint = i_upper_quad_pcie_ctrl_txpipe_rxpresethint;
            assign o_txpipe_rxstandby = i_upper_quad_pcie_ctrl_txpipe_rxstandby;
            assign o_txpipe_rxtermination = i_upper_quad_pcie_ctrl_txpipe_rxtermination;
            assign o_txpipe_srisenable = i_upper_quad_pcie_ctrl_txpipe_srisenable;
            assign o_txpipe_txcmnmode_disable_a = i_upper_quad_pcie_ctrl_txpipe_txcmnmode_disable_a;
            assign o_txpipe_txcompliance = i_upper_quad_pcie_ctrl_txpipe_txcompliance;
            assign o_txpipe_txdata = i_upper_quad_pcie_ctrl_txpipe_txdata;
            assign o_txpipe_txdatak = i_upper_quad_pcie_ctrl_txpipe_txdatak;
            assign o_txpipe_txdatavalid = i_upper_quad_pcie_ctrl_txpipe_txdatavalid;
            assign o_txpipe_txdeemph = i_upper_quad_pcie_ctrl_txpipe_txdeemph;
            assign o_txpipe_txdtctrx_lb = i_upper_quad_pcie_ctrl_txpipe_txdtctrx_lb;
            assign o_txpipe_txelecidle = i_upper_quad_pcie_ctrl_txpipe_txelecidle;
            assign o_txpipe_txmargin = i_upper_quad_pcie_ctrl_txpipe_txmargin;
            assign o_txpipe_txoneszeros = i_upper_quad_pcie_ctrl_txpipe_txoneszeros;
            assign o_txpipe_txstartblock = i_upper_quad_pcie_ctrl_txpipe_txstartblock;
            assign o_txpipe_txswing = i_upper_quad_pcie_ctrl_txpipe_txswing;
            assign o_txpipe_txsyncheader = i_upper_quad_pcie_ctrl_txpipe_txsyncheader;
            assign o_txpipe_width = i_upper_quad_pcie_ctrl_txpipe_width;
        end : sel_is_UPPER_QUAD_PCIE_CTRL
        if ( "SEL_SAME_QUAD_PCIE_CTRL" == sel ) begin : sel_is_SAME_QUAD_PCIE_CTRL
            assign o_txpipe_asyncpowerchangeack = i_same_quad_pcie_ctrl_txpipe_asyncpowerchangeack;
            assign o_txpipe_blockaligncontrol = i_same_quad_pcie_ctrl_txpipe_blockaligncontrol;
            assign o_txpipe_cfg_hw_auto_sp_dis = i_same_quad_pcie_ctrl_txpipe_cfg_hw_auto_sp_dis;
            assign o_txpipe_dirchange = i_same_quad_pcie_ctrl_txpipe_dirchange;
            assign o_txpipe_ebuf_mode = i_same_quad_pcie_ctrl_txpipe_ebuf_mode;
            assign o_txpipe_encodedecodebypass = i_same_quad_pcie_ctrl_txpipe_encodedecodebypass;
            assign o_txpipe_fs = i_same_quad_pcie_ctrl_txpipe_fs;
            assign o_txpipe_getlocalpresetcoefficients = i_same_quad_pcie_ctrl_txpipe_getlocalpresetcoefficients;
            assign o_txpipe_invalidrequest = i_same_quad_pcie_ctrl_txpipe_invalidrequest;
            assign o_txpipe_lf = i_same_quad_pcie_ctrl_txpipe_lf;
            assign o_txpipe_localpresetindex = i_same_quad_pcie_ctrl_txpipe_localpresetindex;
            assign o_txpipe_lowpin_nt = i_same_quad_pcie_ctrl_txpipe_lowpin_nt;
            assign o_txpipe_m2p_bus = i_same_quad_pcie_ctrl_txpipe_m2p_bus;
            assign o_txpipe_pclk_rate = i_same_quad_pcie_ctrl_txpipe_pclk_rate;
            assign o_txpipe_pclkchangeack = i_same_quad_pcie_ctrl_txpipe_pclkchangeack;
            assign o_txpipe_phy_mode_nt = i_same_quad_pcie_ctrl_txpipe_phy_mode_nt;
            assign o_txpipe_powerdown = i_same_quad_pcie_ctrl_txpipe_powerdown;
            assign o_txpipe_rate = i_same_quad_pcie_ctrl_txpipe_rate;
            assign o_txpipe_rxelecidle_disable_a = i_same_quad_pcie_ctrl_txpipe_rxelecidle_disable_a;
            assign o_txpipe_rxeqclr = i_same_quad_pcie_ctrl_txpipe_rxeqclr;
            assign o_txpipe_rxeqeval = i_same_quad_pcie_ctrl_txpipe_rxeqeval;
            assign o_txpipe_rxeqinprogress = i_same_quad_pcie_ctrl_txpipe_rxeqinprogress;
            assign o_txpipe_rxeqtraining = i_same_quad_pcie_ctrl_txpipe_rxeqtraining;
            assign o_txpipe_rxpolarity = i_same_quad_pcie_ctrl_txpipe_rxpolarity;
            assign o_txpipe_rxpresethint = i_same_quad_pcie_ctrl_txpipe_rxpresethint;
            assign o_txpipe_rxstandby = i_same_quad_pcie_ctrl_txpipe_rxstandby;
            assign o_txpipe_rxtermination = i_same_quad_pcie_ctrl_txpipe_rxtermination;
            assign o_txpipe_srisenable = i_same_quad_pcie_ctrl_txpipe_srisenable;
            assign o_txpipe_txcmnmode_disable_a = i_same_quad_pcie_ctrl_txpipe_txcmnmode_disable_a;
            assign o_txpipe_txcompliance = i_same_quad_pcie_ctrl_txpipe_txcompliance;
            assign o_txpipe_txdata = i_same_quad_pcie_ctrl_txpipe_txdata;
            assign o_txpipe_txdatak = i_same_quad_pcie_ctrl_txpipe_txdatak;
            assign o_txpipe_txdatavalid = i_same_quad_pcie_ctrl_txpipe_txdatavalid;
            assign o_txpipe_txdeemph = i_same_quad_pcie_ctrl_txpipe_txdeemph;
            assign o_txpipe_txdtctrx_lb = i_same_quad_pcie_ctrl_txpipe_txdtctrx_lb;
            assign o_txpipe_txelecidle = i_same_quad_pcie_ctrl_txpipe_txelecidle;
            assign o_txpipe_txmargin = i_same_quad_pcie_ctrl_txpipe_txmargin;
            assign o_txpipe_txoneszeros = i_same_quad_pcie_ctrl_txpipe_txoneszeros;
            assign o_txpipe_txstartblock = i_same_quad_pcie_ctrl_txpipe_txstartblock;
            assign o_txpipe_txswing = i_same_quad_pcie_ctrl_txpipe_txswing;
            assign o_txpipe_txsyncheader = i_same_quad_pcie_ctrl_txpipe_txsyncheader;
            assign o_txpipe_width = i_same_quad_pcie_ctrl_txpipe_width;
        end : sel_is_SAME_QUAD_PCIE_CTRL
        if ( "SEL_HPS" == sel ) begin : sel_is_HPS
            assign o_txpipe_asyncpowerchangeack = i_hps_txpipe_asyncpowerchangeack;
            assign o_txpipe_blockaligncontrol = i_hps_txpipe_blockaligncontrol;
            assign o_txpipe_cfg_hw_auto_sp_dis = i_hps_txpipe_cfg_hw_auto_sp_dis;
            assign o_txpipe_dirchange = i_hps_txpipe_dirchange;
            assign o_txpipe_ebuf_mode = i_hps_txpipe_ebuf_mode;
            assign o_txpipe_encodedecodebypass = i_hps_txpipe_encodedecodebypass;
            assign o_txpipe_fs = i_hps_txpipe_fs;
            assign o_txpipe_getlocalpresetcoefficients = i_hps_txpipe_getlocalpresetcoefficients;
            assign o_txpipe_invalidrequest = i_hps_txpipe_invalidrequest;
            assign o_txpipe_lf = i_hps_txpipe_lf;
            assign o_txpipe_localpresetindex = i_hps_txpipe_localpresetindex;
            assign o_txpipe_lowpin_nt = i_hps_txpipe_lowpin_nt;
            assign o_txpipe_m2p_bus = i_hps_txpipe_m2p_bus;
            assign o_txpipe_pclk_rate = i_hps_txpipe_pclk_rate;
            assign o_txpipe_pclkchangeack = i_hps_txpipe_pclkchangeack;
            assign o_txpipe_phy_mode_nt = i_hps_txpipe_phy_mode_nt;
            assign o_txpipe_powerdown = i_hps_txpipe_powerdown;
            assign o_txpipe_rate = i_hps_txpipe_rate;
            assign o_txpipe_rxelecidle_disable_a = i_hps_txpipe_rxelecidle_disable_a;
            assign o_txpipe_rxeqclr = i_hps_txpipe_rxeqclr;
            assign o_txpipe_rxeqeval = i_hps_txpipe_rxeqeval;
            assign o_txpipe_rxeqinprogress = i_hps_txpipe_rxeqinprogress;
            assign o_txpipe_rxeqtraining = i_hps_txpipe_rxeqtraining;
            assign o_txpipe_rxpolarity = i_hps_txpipe_rxpolarity;
            assign o_txpipe_rxpresethint = i_hps_txpipe_rxpresethint;
            assign o_txpipe_rxstandby = i_hps_txpipe_rxstandby;
            assign o_txpipe_rxtermination = i_hps_txpipe_rxtermination;
            assign o_txpipe_srisenable = i_hps_txpipe_srisenable;
            assign o_txpipe_txcmnmode_disable_a = i_hps_txpipe_txcmnmode_disable_a;
            assign o_txpipe_txcompliance = i_hps_txpipe_txcompliance;
            assign o_txpipe_txdata = i_hps_txpipe_txdata;
            assign o_txpipe_txdatak = i_hps_txpipe_txdatak;
            assign o_txpipe_txdatavalid = i_hps_txpipe_txdatavalid;
            assign o_txpipe_txdeemph = i_hps_txpipe_txdeemph;
            assign o_txpipe_txdtctrx_lb = i_hps_txpipe_txdtctrx_lb;
            assign o_txpipe_txelecidle = i_hps_txpipe_txelecidle;
            assign o_txpipe_txmargin = i_hps_txpipe_txmargin;
            assign o_txpipe_txoneszeros = i_hps_txpipe_txoneszeros;
            assign o_txpipe_txstartblock = i_hps_txpipe_txstartblock;
            assign o_txpipe_txswing = i_hps_txpipe_txswing;
            assign o_txpipe_txsyncheader = i_hps_txpipe_txsyncheader;
            assign o_txpipe_width = i_hps_txpipe_width;
        end : sel_is_HPS
        if ( "SEL_UNUSED" == sel ) begin : sel_is_UNUSED
            assign o_txpipe_asyncpowerchangeack = i_unused_txpipe_asyncpowerchangeack;
            assign o_txpipe_blockaligncontrol = i_unused_txpipe_blockaligncontrol;
            assign o_txpipe_cfg_hw_auto_sp_dis = i_unused_txpipe_cfg_hw_auto_sp_dis;
            assign o_txpipe_dirchange = i_unused_txpipe_dirchange;
            assign o_txpipe_ebuf_mode = i_unused_txpipe_ebuf_mode;
            assign o_txpipe_encodedecodebypass = i_unused_txpipe_encodedecodebypass;
            assign o_txpipe_fs = i_unused_txpipe_fs;
            assign o_txpipe_getlocalpresetcoefficients = i_unused_txpipe_getlocalpresetcoefficients;
            assign o_txpipe_invalidrequest = i_unused_txpipe_invalidrequest;
            assign o_txpipe_lf = i_unused_txpipe_lf;
            assign o_txpipe_localpresetindex = i_unused_txpipe_localpresetindex;
            assign o_txpipe_lowpin_nt = i_unused_txpipe_lowpin_nt;
            assign o_txpipe_m2p_bus = i_unused_txpipe_m2p_bus;
            assign o_txpipe_pclk_rate = i_unused_txpipe_pclk_rate;
            assign o_txpipe_pclkchangeack = i_unused_txpipe_pclkchangeack;
            assign o_txpipe_phy_mode_nt = i_unused_txpipe_phy_mode_nt;
            assign o_txpipe_powerdown = i_unused_txpipe_powerdown;
            assign o_txpipe_rate = i_unused_txpipe_rate;
            assign o_txpipe_rxelecidle_disable_a = i_unused_txpipe_rxelecidle_disable_a;
            assign o_txpipe_rxeqclr = i_unused_txpipe_rxeqclr;
            assign o_txpipe_rxeqeval = i_unused_txpipe_rxeqeval;
            assign o_txpipe_rxeqinprogress = i_unused_txpipe_rxeqinprogress;
            assign o_txpipe_rxeqtraining = i_unused_txpipe_rxeqtraining;
            assign o_txpipe_rxpolarity = i_unused_txpipe_rxpolarity;
            assign o_txpipe_rxpresethint = i_unused_txpipe_rxpresethint;
            assign o_txpipe_rxstandby = i_unused_txpipe_rxstandby;
            assign o_txpipe_rxtermination = i_unused_txpipe_rxtermination;
            assign o_txpipe_srisenable = i_unused_txpipe_srisenable;
            assign o_txpipe_txcmnmode_disable_a = i_unused_txpipe_txcmnmode_disable_a;
            assign o_txpipe_txcompliance = i_unused_txpipe_txcompliance;
            assign o_txpipe_txdata = i_unused_txpipe_txdata;
            assign o_txpipe_txdatak = i_unused_txpipe_txdatak;
            assign o_txpipe_txdatavalid = i_unused_txpipe_txdatavalid;
            assign o_txpipe_txdeemph = i_unused_txpipe_txdeemph;
            assign o_txpipe_txdtctrx_lb = i_unused_txpipe_txdtctrx_lb;
            assign o_txpipe_txelecidle = i_unused_txpipe_txelecidle;
            assign o_txpipe_txmargin = i_unused_txpipe_txmargin;
            assign o_txpipe_txoneszeros = i_unused_txpipe_txoneszeros;
            assign o_txpipe_txstartblock = i_unused_txpipe_txstartblock;
            assign o_txpipe_txswing = i_unused_txpipe_txswing;
            assign o_txpipe_txsyncheader = i_unused_txpipe_txsyncheader;
            assign o_txpipe_width = i_unused_txpipe_width;
        end : sel_is_UNUSED
    endgenerate
`endif // ifdef DDM_BASED_COREIP_GENERATOR

endmodule // tennm_sm_hssi_pcie_pcs_tx_mux
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "2sDhNbsqyAR6V4Cr1lf5sImhr2SjWD7Ex2tYxKHF+IxvEaFRxKZWMkPZ+k48k3iCoaf0nTwAsDUUBl4fvfgS/iXIsTcNBwqFtOVPv0fEQaH2Ijv+AAinwREFYY55f7RCJuh0iq2GHsLBOTgOE0kU30iJucqGnwoxratsmBGEVxsK1Izs9h2XGY0aoPdp+Y01o+YCRr6HpUFA9dc0zYENP38Wm5OfDCpQ/NiurtGu9I1LDvpNTq9W+iDsrPL2wc6P4+m+3pixWf2NjO6aegznPpVSBbQni7f/wxenw3JxYlYoNa+H7YSqY8yU/Rl3rZyz8vzLLVs6sLY0oArdMMNo0vfdkb7fY8KDhtRE2dREpzdbD3x7/9EkCqesGhSs1lJn3BPzFoRuT10uufFgGx5K0RDBurnJL+LbBIQiTZ39DPZvSwpM42XK1SkyUasEM4POaMjlzbSTg+U0kCRUxSQH6+3uAE1Xy68QwDbF0CvoOxNzN6baTJDaAeeIpvaqZgksPDqJEM9mRyDVatJNBhN0HmwEF+/EG32/eerEnJV+7WBCFjVp+ApBJyKIokF2Gh/ENGPnPlE0qLjebjsAn0UcrJO5yCdYErF/4+x8wHN7oc8PIZOc80Ur6BO69gPBc705flq6MOBvUO08mkKDtCvAx8INzwhCZvK24R3abCoCYQ0478m+Ueq/fat7PBLvIlztNpk+PTKtCDDJajEL1fDuqx7SC3nEc6JLqChKad0atO1eU77R5gLiDOWR/YVA1Js3VO64tvwSN+J1MIDrwNfnDxvbg5tVhAb9Bzln4HNmLTlrkluON8EF7x5+VP+DaP8qrP7eJy/l2DyL6Ku25obZN7KjEFn2MbCntVJnPuieNTm8DDKM6U24XpQO5bt+RboxG1RylNWqAxEgNfCGXnQiSsMOv1nbzr9vKkDN5LFJoXgw6E97cY0h5M/cm2ySCSnPd5CvpVOQTJlbbYTzl54I8uyFgsfiqQlHVEd1YntNzojRsC43x/EwZDSZLjyVYQSM"
`endif