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



module stdfn_inst_fa_c2p_ssm #(
   parameter IS_USED  = 0,

   parameter SSM_C2P_DATA_MODE                               = "SSM_C2P_DATA_MODE_BYPASS",
   parameter FA_CORE_PERIPH_CLK_SEL_DATA_MODE                = "FA_CORE_PERIPH_CLK_SEL_DATA_MODE_UNUSED",
   parameter SSM_P2C_DATA_MODE                               = "SSM_P2C_DATA_MODE_BYPASS",
   localparam PORT_I_SSM_C2P_WIDTH                            = 40,
   localparam PORT_O_SSM_C2P_WIDTH                            = 40,
   localparam PORT_I_SSM_P2C_WIDTH                            = 20,
   localparam PORT_O_SSM_P2C_WIDTH                            = 20
) (
   input                                                      i_core_clk,
   input [PORT_I_SSM_C2P_WIDTH-1:0]                           i_ssm_c2p,
   output [PORT_O_SSM_C2P_WIDTH-1:0]                           o_ssm_c2p,
   input                                                      i_phy_clk_fr,
   input                                                      i_phy_clk_sync,
   input [PORT_I_SSM_P2C_WIDTH-1:0]                           i_ssm_p2c,
   output [PORT_O_SSM_P2C_WIDTH-1:0]                           o_ssm_p2c
);
   timeunit 1ns;
   timeprecision 1ps;

   tennm_ssm_c2p_fabric_adaptor # (
      .ssm_c2p_data_mode                                    (SSM_C2P_DATA_MODE),
      .fa_core_periph_clk_sel_data_mode                     (FA_CORE_PERIPH_CLK_SEL_DATA_MODE)
   ) fa_c2p_ssm (
      .i_core_clk                                           (i_core_clk),
      .i_phy_clk_fr                                         (i_phy_clk_fr),
      .i_phy_clk_sync                                       (i_phy_clk_sync),
      .i_ssm_c2p                                            (i_ssm_c2p),
      .o_ssm_c2p                                            (o_ssm_c2p)
   );
   tennm_ssm_p2c_fabric_adaptor # (
      .ssm_p2c_data_mode                                    (SSM_P2C_DATA_MODE),
      .fa_core_periph_clk_sel_data_mode                     (FA_CORE_PERIPH_CLK_SEL_DATA_MODE)
   ) fa_p2c_ssm (
      .i_core_clk                                           (i_core_clk),
      .i_phy_clk_fr                                         (i_phy_clk_fr),
      .i_phy_clk_sync                                       (i_phy_clk_sync),
      .i_ssm_p2c                                            (i_ssm_p2c),
      .o_ssm_p2c                                            (o_ssm_p2c)
   );

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "PAKAqr0/rSw7+kfJfXCARTdV0/bONREMXWg8LC2L8b/exXay+F559T75vnGVMtCSGyipt1cz8IjHylxCHF44OF3g2jY6PdxIsggEQB1exgqc4X0EbuXOAxxG8bbuSnkHrXna59jcSdRwQIk6VubhcnrciKBt8D79KN7fni2oAwYhFX/2EYXJJjduvcx5XtUNTYg9b5xp3jnSiT+xaCyuOxQNaL0zOsssj2nHLaDvS7VYurx/2ARHBJt/yyfSSOUsZUH597gJHqMzFanjaXE4VRdrj8k3mLkIK4FhWlPOJxiUpRpcGmYlgjqjvOaUdIIa3T9ik7uhCVCczWMw1iuJ2MeHh5h1pzhTEHo9F1SLraQf/BgMH/x/5svmaGZEMk3NcCMyO1eGEVnTLbQUPZKrvKe4tVTT3p3FXmXJSzYX/5ekJTEizSAb/sLVJdyBwGSmcsToIeoQVs9oLLsSmX2RDPCyT7nw0OseY9sFayrUdOCeKc3cFRYyX+tZMQcgFCP5vNXWTYkTNSEedGcia43ANauYV0fFzXuWxBI40oyptPTYC4oVySpcZXm0iSjwqkmBSdjFAEJ9jxA5SksysXSvwwsZpetfjFigamZegNSf8a8/UaXsZjkEfz7Rpn3AYM6wceobZULp1RwjQX+aZP9JpwZrqzRHgSUY4T6SU38IOiXnIf5z8R7GOId7Ll5+MuOgmd9cuED9MjXi16YDeRTz0LRPmgwfRekPib4x35I/Xv7xS+2IEn8TfnAMmN7wkJ1DaMGTjKx6kKtdSRHprGjN3ndC3wAxn7EWdUpfs0I+/1xifNKUljZNGdGYrfkuE6dUnvQFvHUMftSl+Ar2+csMk5MavUueZOYO5qOlw73EGTMGhlYDE6Jv0pxBVXkygCNAKLawb29KRVQPcCPxhTtxvI9Q0Hw9VuIENEMkwLSkWyKGvAQjcK/MhCEBLRoJL90tFxF324Lc8dnp29HW58drtrt1fCH9iu8hNrO4DFcgjxiVCYw9ww/+SyG4jYA0uHpf"
`endif