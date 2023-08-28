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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module intel_gmii_to_rgmii_adapter #(
    parameter TX_PIPELINE_DEPTH = 0,
    parameter RX_PIPELINE_DEPTH = 0,
    parameter USE_ALTGPIO       = 0
) (
    input           clk,            // peri_clock
    input           rst_n,          // peri_reset

    input           pll_25m_clk,    // pll_25m_clock
    input           pll_2_5m_clk,   // pll_2_5m_clock
    input           pll_50m_tx_clk,
    input           pll_5m_tx_clk,
    input           pll_250m_tx_clk,
    input           locked_pll_250m_tx,
    output          pll_tx_clk_ref,

    input           pll_rx_clk_2x,  // PLL 2x rxclk for RGMII_I c2pclk
    output          pll_rx_clk_ref, // Duplicate of RGMII RXCLK for RXCLK_2X generation
 
    // Disable R102 rule check
    // Both reset from HPS is synchronous to tx and rx clock
    input           mac_rst_tx_n    /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"R102\"" */,   // hps_gmii
    input           mac_rst_rx_n    /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"R102\"" */,   // hps_gmii
    
    output          mac_tx_clk_i,   // hps_gmii
	input           mac_tx_clk_o,   // hps_gmii
    input [7:0]     mac_txd,        // hps_gmii
    input           mac_txen,       // hps_gmii
    input           mac_txer,       // hps_gmii
    input [2:0]     mac_speed,      // hps_gmii
    
    output          mac_rx_clk,     // hps_gmii
    output          mac_rxdv,       // hps_gmii
    output          mac_rxer,       // hps_gmii
    output [7:0]    mac_rxd,        // hps_gmii
    output          mac_col,        // hps_gmii
    output          mac_crs,        // hps_gmii

    input           rgmii_rx_clk,   // rgmii
    input [3:0]     rgmii_rxd,      // rgmii
    input           rgmii_rx_ctl,   // rgmii

    output          rgmii_tx_clk,   // rgmii
    output [3:0]    rgmii_txd,      // rgmii
    output          rgmii_tx_ctl,   // rgmii

    input [3:0]     rgmii_out4_pad,
    input           rgmii_out1_pad,
    input [7:0]     rgmii_in4_dout,
    input [1:0]     rgmii_in1_dout,

    output [7:0]    rgmii_out4_din,
    output          rgmii_out4_ck,
    output          rgmii_out4_aclr,
    output [1:0]    rgmii_out1_din,
    output          rgmii_out1_ck,
    output          rgmii_out1_aclr,
    output [3:0]    rgmii_in4_pad,
    output          rgmii_in4_ck,
    output          rgmii_in1_pad,
    output          rgmii_in1_ck


);

wire [7:0]                      mac_txd_p [0:TX_PIPELINE_DEPTH];
wire [TX_PIPELINE_DEPTH:0]      mac_txen_p;
wire [TX_PIPELINE_DEPTH:0]      mac_txer_p;
    
wire [7:0]                      mac_rxd_p [0:RX_PIPELINE_DEPTH];
wire [RX_PIPELINE_DEPTH:0]      mac_rxdv_p;
wire [RX_PIPELINE_DEPTH:0]      mac_rxer_p;

wire                            rst0_sync_n;
wire                            rst1_sync_n;
wire [2:0]                      mac_speed_filtered;
// wire                            rgmii_o_txc;
wire                            tx_c2p_clk;


// Pass through assignment
assign mac_rx_clk       = rgmii_rx_clk;
assign rgmii_tx_clk     = mac_tx_clk_o;  
  

assign pll_tx_clk_ref   = mac_tx_clk_o; 
assign pll_rx_clk_ref   = rgmii_rx_clk;


// TX Pipeline
assign mac_txd_p[0]     = mac_txd;
assign mac_txen_p[0]    = mac_txen;
assign mac_txer_p[0]    = mac_txer;

genvar i;
generate
    for (i=0; i<TX_PIPELINE_DEPTH; i=i+1) begin : tx_pipeline
        altera_gtr_pipeline_stage #(
            .DATA_WIDTH (8)
        ) u_txd_pipeline_stage (
            .clk        (mac_tx_clk_o),
            .rst_n      (mac_rst_tx_n),
            .datain     (mac_txd_p[i]),
            .dataout    (mac_txd_p[i+1])
        );

        altera_gtr_pipeline_stage #(
            .DATA_WIDTH (1)
        ) u_txen_pipeline_stage (
            .clk        (mac_tx_clk_o), 
            .rst_n      (mac_rst_tx_n),
            .datain     (mac_txen_p[i]),
            .dataout    (mac_txen_p[i+1])
        );
        
        altera_gtr_pipeline_stage #(
            .DATA_WIDTH (1)
        ) u_txer_pipeline_stage (
            .clk        (mac_tx_clk_o), 
            .rst_n      (mac_rst_tx_n),
            .datain     (mac_txer_p[i]),
            .dataout    (mac_txer_p[i+1])
        );
    end
endgenerate



// RX Pipeline
genvar j;
generate
    for (j=0; j<RX_PIPELINE_DEPTH; j=j+1) begin : rx_pipeline
        altera_gtr_pipeline_stage #(
            .DATA_WIDTH (8)
        ) u_rxd_pipeline_stage (
            .clk        (rgmii_rx_clk),
            .rst_n      (mac_rst_rx_n),
            .datain     (mac_rxd_p[j]),
            .dataout    (mac_rxd_p[j+1])
        );

        altera_gtr_pipeline_stage #(
            .DATA_WIDTH (1)
        ) u_rxdv_pipeline_stage (
            .clk        (rgmii_rx_clk),
            .rst_n      (mac_rst_rx_n),
            .datain     (mac_rxdv_p[j]),
            .dataout    (mac_rxdv_p[j+1])
        );
        
        altera_gtr_pipeline_stage #(
            .DATA_WIDTH (1)
        ) u_rxer_pipeline_stage (
            .clk        (rgmii_rx_clk),
            .rst_n      (mac_rst_rx_n),
            .datain     (mac_rxer_p[j]),
            .dataout    (mac_rxer_p[j+1])
        );
    end
endgenerate

assign mac_rxd  = mac_rxd_p[RX_PIPELINE_DEPTH];
assign mac_rxdv = mac_rxdv_p[RX_PIPELINE_DEPTH];
assign mac_rxer = mac_rxer_p[RX_PIPELINE_DEPTH];

intel_rgmii_module u_rgmii_module (
   .rgmii_out      (rgmii_txd),
   .gm_rx_d        (mac_rxd_p[0]),
   .m_rx_d         (),
   .gm_rx_dv       (mac_rxdv_p[0]),
   .m_rx_en        (),
   .gm_rx_err      (mac_rxer_p[0]),
   .m_rx_err       (),
   .m_rx_col       (mac_col),
   .m_rx_crs       (mac_crs),
   .tx_control     (rgmii_tx_ctl),
   .rgmii_in       (rgmii_rxd),
   .speed          (~mac_speed_filtered[2]),   // Inversion is needed due to different polarity definition between HPS EMAC/TSE
   .gm_tx_d        (mac_txd_p[TX_PIPELINE_DEPTH]),
   .m_tx_d         (mac_txd_p[TX_PIPELINE_DEPTH][3:0]), 
   .gm_tx_en       (mac_txen_p[TX_PIPELINE_DEPTH]),
   .m_tx_en        (mac_txen_p[TX_PIPELINE_DEPTH]),
   .gm_tx_err      (mac_txer_p[TX_PIPELINE_DEPTH]),
   .m_tx_err       (mac_txer_p[TX_PIPELINE_DEPTH]),
   .reset_rx_clk   (~mac_rst_rx_n),    
   .reset_tx_clk   (~mac_rst_tx_n),   
   .reset_tx_clk_2x_n (rst4_sync_n),   
   .rx_clk         (rgmii_rx_clk),
   .rx_clk_2x      (pll_rx_clk_2x),
   .rx_control     (rgmii_rx_ctl),
   .tx_clk_2x      (tx_c2p_clk),
   .tx_clk         (mac_tx_clk_o),
   .rgmii_i_divclk ()
   );

        assign rgmii_out4_din   = 8'h0;
        assign rgmii_out4_ck    = 1'b0;
        assign rgmii_out4_aclr  = ~mac_rst_tx_n;

        assign rgmii_out1_din   = 2'h0;
        assign rgmii_out1_ck    = 1'b0;
        assign rgmii_out1_aclr  = ~mac_rst_tx_n;

        assign rgmii_in4_pad    = 4'h0;
        assign rgmii_in4_ck     = 1'b0;

        assign rgmii_in1_pad    = 1'b0;
        assign rgmii_in1_ck     = 1'b0;


// mac_tx_clk_i clock mux
// mac_speed encoding: 
// 3'b011 1000 Mbps (GMII)
// 3'b100 100 Mbps (MII)
// 3'b111 10 Mbps (MII)
altera_gtr_clock_mux u_mac_tx_clock_input_mux (
    .outclk     (mac_tx_clk_i),
    .clksel     (~mac_speed_filtered[0]),
    .inclk0     (pll_2_5m_clk),
    .inclk1     (pll_25m_clk),
    .rst0_n     (rst0_sync_n),
    .rst1_n     (rst1_sync_n)
);

intel_clock_mux_3to1 u_rgmii_o_c2p_clock_mux (
    .outclk     (tx_c2p_clk),
    .clksel     (~mac_speed_filtered[2:1]),
    .inclk0     (pll_5m_tx_clk),
    .inclk1     (pll_50m_tx_clk),
    .inclk2     (pll_250m_tx_clk),
    .rst0_n     (rst2_sync_n),
    .rst1_n     (rst3_sync_n),
    .rst2_n     (rst4_sync_n)
);



altera_gtr_reset_synchronizer u_2_5m_clk_reset_sync (
    .clk            (pll_2_5m_clk),
    .rst_n          (rst_n),
    .rst_sync_n     (rst0_sync_n)
);

altera_gtr_reset_synchronizer u_25m_clk_reset_sync (
    .clk            (pll_25m_clk),
    .rst_n          (rst_n),
    .rst_sync_n     (rst1_sync_n)
);

altera_gtr_reset_synchronizer u_5m_clk_reset_sync (
    .clk            (pll_5m_tx_clk),
    .rst_n          (rst_n),
    .rst_sync_n     (rst2_sync_n)
);

altera_gtr_reset_synchronizer u_50m_clk_reset_sync (
    .clk            (pll_50m_tx_clk),
    .rst_n          (rst_n),
    .rst_sync_n     (rst3_sync_n)
);

altera_gtr_reset_synchronizer u_250m_clk_reset_sync (
    .clk            (pll_250m_tx_clk),
    .rst_n          (rst_n & mac_rst_tx_n & locked_pll_250m_tx),
    .rst_sync_n     (rst4_sync_n)
);



// Mac Speed Synchronization and Filter Block
altera_gtr_mac_speed_filter u_mac_speed_filter (
    .clk                    (clk),
    .rst_n                  (rst_n),
    .mac_speed              (mac_speed),
    .mac_speed_filtered     (mac_speed_filtered)
);


endmodule
