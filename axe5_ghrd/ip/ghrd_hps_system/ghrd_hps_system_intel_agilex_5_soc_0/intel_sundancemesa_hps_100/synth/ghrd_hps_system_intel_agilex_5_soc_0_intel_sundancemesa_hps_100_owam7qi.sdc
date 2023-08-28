if {[get_collection_size [get_nodes -nowarn sundancemesa_hps_inst~l4_main_clk]  ] > 0} { 
	 create_clock -name l4_main_clk_src -period 2.5 [get_nodes -nowarn sundancemesa_hps_inst~l4_main_clk] 
	 create_generated_clock -divide_by 1 -name l4_main_clk [get_registers sundancemesa_hps_inst~l4_main_clk.reg] -master_clock [get_clocks l4_main_clk_src] -source [get_nodes sundancemesa_hps_inst~l4_main_clk] 
} 
if {[get_collection_size [get_nodes -nowarn sundancemesa_hps_inst~l4_mp_clk]  ] > 0} { 
	 create_clock -name l4_mp_clk_src -period 2.5 [get_nodes -nowarn sundancemesa_hps_inst~l4_mp_clk] 
	 create_generated_clock -divide_by 2 -name l4_mp_clk [get_registers sundancemesa_hps_inst~l4_mp_clk.reg] -master_clock [get_clocks l4_mp_clk_src] -source [get_nodes sundancemesa_hps_inst~l4_mp_clk] 
} 
if {[get_collection_size [get_nodes -nowarn sundancemesa_hps_inst~l4_sp_clk]  ] > 0} { 
	 create_clock -name l4_sp_clk_src -period 2.5 [get_nodes -nowarn sundancemesa_hps_inst~l4_sp_clk] 
	 create_generated_clock -divide_by 4 -name l4_sp_clk [get_registers sundancemesa_hps_inst~l4_sp_clk.reg] -master_clock [get_clocks l4_sp_clk_src] -source [get_nodes sundancemesa_hps_inst~l4_sp_clk] 
} 
if {[get_collection_size [get_nodes sundancemesa_hps_inst~emac0_rgmii_txclk_cm]  ] > 0} { 
	 create_clock -name hps_emac0_gtx_clk_src -period 8.0 [get_nodes sundancemesa_hps_inst~emac0_rgmii_txclk_cm] 
	 create_generated_clock -divide_by 1 -name emac0_phy_txclk_o_hio [get_registers sundancemesa_hps_inst~emac0_rgmii_txclk_cm.reg] -master_clock [get_clocks hps_emac0_gtx_clk_src] -source [get_nodes sundancemesa_hps_inst~emac0_rgmii_txclk_cm] 
} 
if {[get_collection_size [get_nodes sundancemesa_hps_inst~l4_sp_clk]  ] > 0} { 
	 create_clock -add -name hps_emac0_mdc_clk_src -period 400.0 [get_nodes sundancemesa_hps_inst~l4_sp_clk] 
	 create_generated_clock -add -divide_by 1 -name emac0_gmii_mdc_o [get_registers sundancemesa_hps_inst~l4_sp_clk.reg] -master_clock [get_clocks hps_emac0_mdc_clk_src] -source [get_nodes sundancemesa_hps_inst~l4_sp_clk] 
} 
if {[get_collection_size [get_ports intel_agilex_5_soc_0_emac0_mac_rx_clk]  ] > 0} { 
	 create_clock -name intel_agilex_5_soc_0_emac0_mac_rx_clk -period 8.0 [get_ports intel_agilex_5_soc_0_emac0_mac_rx_clk] 
} 
if {[get_collection_size [get_ports intel_agilex_5_soc_0_emac0_mac_tx_clk_i]  ] > 0} { 
	 create_clock -name intel_agilex_5_soc_0_emac0_mac_tx_clk_i -period 8.0 [get_ports intel_agilex_5_soc_0_emac0_mac_tx_clk_i] 
} 
if {[get_collection_size [get_nodes sundancemesa_hps_inst~l4_main_clk]  ] > 0} { 
	 create_clock -add -name spim0_clk_src -period 8.0 [get_nodes sundancemesa_hps_inst~l4_main_clk] 
	 create_generated_clock -add -divide_by 1 -name spim0_sclk_out_hio [get_registers sundancemesa_hps_inst~l4_main_clk.reg] -master_clock [get_clocks spim0_clk_src] -source [get_nodes sundancemesa_hps_inst~l4_main_clk] 
} 
if {[get_collection_size [get_pins sundancemesa_hps_inst|s2f_user_clk0_hio]  ] > 0} { 
	 create_clock -add -name h2f_user0_clk_src -period 4.0 [get_pins sundancemesa_hps_inst|s2f_user_clk0_hio] 
} 
if {[get_collection_size [get_pins sundancemesa_hps_inst|s2f_user_clk1_hio]  ] > 0} { 
	 create_clock -add -name h2f_user1_clk_src -period 10.0 [get_pins sundancemesa_hps_inst|s2f_user_clk1_hio] 
} 
if {[get_collection_size [get_pins -nowarn -compatibility_mode  sundancemesa_hps_inst|f2s*irq*]  ] > 0} { 
 	 set_false_path -through [get_pins -nowarn -compatibility_mode  sundancemesa_hps_inst|f2s*irq*] -to [get_registers *clk*.reg]  
} 
if {[get_collection_size [get_pins -nowarn -compatibility_mode  sundancemesa_hps_inst|s2f*irq*]  ] > 0} { 
 	 set_false_path -through [get_pins -nowarn -compatibility_mode  sundancemesa_hps_inst|s2f*irq*] -from [get_registers *clk*.reg]  
} 
if {[get_collection_size [get_pins -compatibility_mode  sundancemesa_hps_inst|emac*rst_clk*]  ] > 0} { 
 	 set_false_path -through [get_pins -compatibility_mode  sundancemesa_hps_inst|emac*rst_clk*] -from [get_registers *clk*.reg]  
} 
if {[get_collection_size [get_pins -compatibility_mode  sundancemesa_hps_inst|emac*_phy_crs_i]  ] > 0} { 
 	 set_false_path -through [get_pins -compatibility_mode  sundancemesa_hps_inst|emac*_phy_crs_i] -to [get_registers *clk*.reg]  
} 
if {[get_collection_size [get_pins -compatibility_mode  sundancemesa_hps_inst|emac*_phy_col_i]  ] > 0} { 
 	 set_false_path -through [get_pins -compatibility_mode  sundancemesa_hps_inst|emac*_phy_col_i] -to [get_registers *clk*.reg]  
} 
if {[get_collection_size [get_pins -compatibility_mode  sundancemesa_hps_inst|f2s_pending_rst_ack]  ] > 0} { 
 	 set_false_path -through [get_pins -compatibility_mode  sundancemesa_hps_inst|f2s_pending_rst_ack] -to [get_registers *clk*.reg]  
} 
if {[get_collection_size [get_pins -compatibility_mode  sundancemesa_hps_inst|s2f_pending_rst_req]  ] > 0} { 
 	 set_false_path -through [get_pins -compatibility_mode  sundancemesa_hps_inst|s2f_pending_rst_req] -from [get_registers *clk*.reg]  
} 
