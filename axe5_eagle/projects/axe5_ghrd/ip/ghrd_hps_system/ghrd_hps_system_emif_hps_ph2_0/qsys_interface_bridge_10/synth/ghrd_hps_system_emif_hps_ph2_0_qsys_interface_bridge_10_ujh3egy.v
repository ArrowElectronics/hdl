module ghrd_hps_system_emif_hps_ph2_0_qsys_interface_bridge_10_ujh3egy (
    input wire  ref_clk_0, 
    output wire  ref_clk_ext_to_gpio, 
    input wire  ref_clk_to_emif, 
    output wire  ref_clk_ext_to_emif
);
    assign ref_clk_ext_to_gpio = ref_clk_0; 
    assign ref_clk_ext_to_emif = ref_clk_to_emif; 
endmodule