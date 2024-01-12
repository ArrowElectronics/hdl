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
`timescale 1ns / 100ps
// synthesis translate_on
module intel_rgmii_module /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D103\"" */ (   // new ports to cater for mii with RGMII interface are added 
	// TX path GMII/MII
	//data
	gm_tx_d,
	m_tx_d,  
	//control
	gm_tx_en,
	gm_tx_err,
	m_tx_en,
	m_tx_err,
	//clocks, reset
	tx_clk,
	tx_clk_2x,
	reset_tx_clk,
    reset_tx_clk_2x_n,
	reset_rx_clk,
	reset_rx_clk_2x_n,
    
	// TX path RGMII
	// data & ctrl & Clock
	rgmii_out,
	tx_control,
	rgmii_o_divclk,
	// rgmii_tx_clk,
	
	// RX path GMII/MII
	//data
	gm_rx_d,
	m_rx_d,
	//control
	gm_rx_dv,
	gm_rx_err,
	m_rx_en,
	m_rx_err,
	m_rx_col,
	m_rx_crs,
	//Clock, reset
	rx_clk,
	rx_clk_2x,
	
	// RX path RGMII
	//data & ctrl & Clock
	rgmii_in,
	rx_control,
	rgmii_i_divclk,

	//Enet speed select
	speed
	
	
	
                    );
					
  parameter SYNCHRONIZER_DEPTH 	= 3;	  	    //  Number of synchronizer
	
  output [3:0] rgmii_out;
  // output          rgmii_tx_clk;
  output [7:0] gm_rx_d;
  output [3:0] m_rx_d;
  output       gm_rx_dv;
  output       m_rx_en;
  output       gm_rx_err;
  output       m_rx_err;
  output       m_rx_col;
  output       m_rx_crs;
  output       tx_control;
  
  input  [3:0] rgmii_in;
  input        speed;
  input  [7:0] gm_tx_d;
  input  [3:0] m_tx_d; 
  input        gm_tx_en;
  input        m_tx_en;
  input        gm_tx_err;
  input        m_tx_err;
  input        reset_rx_clk;
  input        reset_tx_clk;
  input        rx_clk;
  input        rx_clk_2x;
  input        rx_control;
  input        tx_clk;
  input        tx_clk_2x;
  input        reset_tx_clk_2x_n;
  input        reset_rx_clk_2x_n;
  output       rgmii_o_divclk;
  output       rgmii_i_divclk;

  wire   [3:0] rgmii_out;
  wire   [7:0] gm_rx_d;
  wire         gm_rx_dv;
  wire         m_rx_en;
  wire         gm_rx_err;
  wire         m_rx_err;
  wire 	       m_rx_col;
  reg          m_rx_col_reg;
  reg          m_rx_crs;
  
  wire         rx_dv;
  wire         rx_err;
  wire         tx_control;
  //wire         tx_err;
  reg    [7:0] rgmii_out_4_wire;
  wire   [3:0] c2p_data;
  reg          rgmii_out_1_wire_inp1;
  reg          rgmii_out_1_wire_inp2;
  
  wire   [7:0] rgmii_in_4_wire;
  wire   [7:0] rgmii_in_4_reg;
  reg    [7:0] rgmii_in_4_temp_reg;
  wire   [1:0] rgmii_in_1_wire;
  reg    [1:0] rgmii_in_1_temp_reg;

  wire         speed_reg;
              
  reg          m_tx_en_reg1;
  reg          m_tx_en_reg2;
  reg          m_tx_en_reg3;
  reg          m_tx_en_reg4;
              
  wire   [3:0] rx_odd_data;
  wire   [3:0] rx_even_data;
  wire         rx_odd_ctrl;
  wire         rx_even_ctrl;
  wire   [3:0] p2c_data;
  wire         p2c_ctrl;
  wire    [3:0] p2c_data_pipe;
  wire          p2c_ctrl_pipe;
  reg    [3:0] p2c_data_reg;
  reg          p2c_ctrl_reg;
  reg    [3:0] p2c_data_reg_1;
  reg          p2c_ctrl_reg_1;
  reg    [3:0] c2p_data_reg;
  reg          c2p_ctrl_reg;
  reg    [3:0] c2p_data_reg_1;
  reg          c2p_ctrl_reg_1;

  
  wire   [4:0] rx_clk_2x_div;
  wire   [4:0] tx_clk_2x_div;
  wire   [3:0] c2p_odd_data;
  wire   [3:0] c2p_even_data;
  wire         post_rst_low_nib_write;

  wire tx_bond_0_1, tx_bond_1_2, tx_bond_2_3, tx_bond_3_4;
  wire rx_bond_0_1, rx_bond_1_2, rx_bond_2_3, rx_bond_3_4;
  
  
  assign rgmii_o_divclk = tx_clk_2x_div[4];
  assign rgmii_i_divclk = rx_clk_2x_div[4];
  assign gm_rx_d = rgmii_in_4_reg;
  assign m_rx_d  = rgmii_in_4_reg[3:0];  // mii is only 4 bits, data are duplicated so we only take one nibble
  
  // --------- Receive Path ------------------
  //
  // DDIO instantiation
  tennm_ph2_ddio_in #(
	.mode("MODE_DDR"),
	// .asclr_ena("ASCLR_ENA_NONE")
	.asclr_ena("ASCLR_ENA_CLEAR")
	) rxd_i0 (
    .areset(reset_rx_clk_2x_n),
	.datain(rgmii_in[0]),
	.regoutlo(rx_odd_data[0]),
	.regouthi(rx_even_data[0]),
	.clk(rx_clk_2x_div[0])
	); 
	
  tennm_ph2_ddio_in #(
	.mode("MODE_DDR"),
	// .asclr_ena("ASCLR_ENA_NONE")
	.asclr_ena("ASCLR_ENA_CLEAR")
	) rxd_i1 (
    .areset(reset_rx_clk_2x_n),
	.datain(rgmii_in[1]),
	.regoutlo(rx_odd_data[1]),
	.regouthi(rx_even_data[1]),
	.clk(rx_clk_2x_div[1])
	); 
	
  tennm_ph2_ddio_in #(
	.mode("MODE_DDR"),
	// .asclr_ena("ASCLR_ENA_NONE")
	.asclr_ena("ASCLR_ENA_CLEAR")
	) rxd_i2 (
    .areset(reset_rx_clk_2x_n),
	.datain(rgmii_in[2]),
	.regoutlo(rx_odd_data[2]),
	.regouthi(rx_even_data[2]),
	.clk(rx_clk_2x_div[2])
	); 
	
  tennm_ph2_ddio_in #(
	.mode("MODE_DDR"),
	// .asclr_ena("ASCLR_ENA_NONE")
	.asclr_ena("ASCLR_ENA_CLEAR")
	) rxd_i3 (
    .areset(reset_rx_clk_2x_n),
	.datain(rgmii_in[3]),
	.regoutlo(rx_odd_data[3]),
	.regouthi(rx_even_data[3]),
	.clk(rx_clk_2x_div[3])
	); 

  // RX Control
  tennm_ph2_ddio_in #(
	.mode("MODE_DDR"),
	// .asclr_ena("ASCLR_ENA_NONE")
	.asclr_ena("ASCLR_ENA_CLEAR")
	) rx_ctrl_inst (
    .areset(reset_rx_clk_2x_n), // told that areset is active LOW in SM
	.datain(rx_control),
	.regoutlo(rx_odd_ctrl),
	.regouthi(rx_even_ctrl),
	.clk(rx_clk_2x_div[4])
	);  
 
  // data 
  tennm_rgmii_i rxd_int0 (
	.rst(reset_rx_clk_2x_n), // shall be using rx_clk_2s synced reset
	.clk_in(rx_clk_2x), 
	.din0(rx_odd_data[0]),
	.din1(rx_even_data[0]),
	// .din1(rx_odd_data[0]),
	// .din0(rx_even_data[0]),
	.dout(p2c_data_pipe[0]),
	.div_clk_out(rx_clk_2x_div[0])//,  
	//.i_b(),
	//.o_b(rx_bond_0_1)
	//.sync()
	);
	
  tennm_rgmii_i rxd_int1 (
	.rst(reset_rx_clk_2x_n), // shall be using rx_clk_2s synced reset
//	.rst(~reset_rx_clk), // shall be using rx_clk_2s synced reset
	.clk_in(rx_clk_2x), 
	.din0(rx_odd_data[1]),
	.din1(rx_even_data[1]),
	// .din1(rx_odd_data[1]),
	// .din0(rx_even_data[1]),
	.dout(p2c_data_pipe[1]),
	.div_clk_out(rx_clk_2x_div[1])//,  
	//.i_b(rx_bond_0_1),
	//.o_b(rx_bond_1_2)
	//.sync()
	);
	
  tennm_rgmii_i rxd_int2 (
	.rst(reset_rx_clk_2x_n), // shall be using rx_clk_2s synced reset
//	.rst(~reset_rx_clk), // shall be using rx_clk_2s synced reset
	.clk_in(rx_clk_2x), 
	.din0(rx_odd_data[2]),
	.din1(rx_even_data[2]),
	// .din1(rx_odd_data[2]),
	// .din0(rx_even_data[2]),
	.dout(p2c_data_pipe[2]),
	.div_clk_out(rx_clk_2x_div[2])//,  
	//.i_b(rx_bond_1_2),
	//.o_b(rx_bond_2_3)
	//.sync()
	);
	
  tennm_rgmii_i rxd_int3 (
	.rst(reset_rx_clk_2x_n), // shall be using rx_clk_2s synced reset
//	.rst(~reset_rx_clk), // shall be using rx_clk_2s synced reset
	.clk_in(rx_clk_2x), 
	.din0(rx_odd_data[3]),
	.din1(rx_even_data[3]),
	// .din1(rx_odd_data[3]),
	// .din0(rx_even_data[3]),
	.dout(p2c_data_pipe[3]),
	.div_clk_out(rx_clk_2x_div[3])//,  
	//.i_b(rx_bond_2_3),
	//.o_b()
	//.sync()
	);
	
  tennm_rgmii_i rxd_ctrl_inst (
	.rst(reset_rx_clk_2x_n), // shall be using rx_clk_2s synced reset
//	.rst(~reset_rx_clk), // shall be using rx_clk_2s synced reset
	.clk_in(rx_clk_2x), 
	.din0(rx_odd_ctrl),
	.din1(rx_even_ctrl),
	// .din1(rx_odd_ctrl),
	// .din0(rx_even_ctrl),
	.dout(p2c_ctrl_pipe),
	.div_clk_out(rx_clk_2x_div[4])//,  
	//.i_b(rx_bond_3_4),
	//.o_b()
	//.sync()
	);


tennm_p2c_pipe_reg p2c_data_pipe0_i (
    .d(p2c_data_pipe[0]),
    .clk(rx_clk_2x),
    .q(p2c_data[0])
);

tennm_p2c_pipe_reg p2c_data_pipe1_i (
    .d(p2c_data_pipe[1]),
    .clk(rx_clk_2x),
    .q(p2c_data[1])
);

tennm_p2c_pipe_reg p2c_data_pipe2_i (
    .d(p2c_data_pipe[2]),
    .clk(rx_clk_2x),
    .q(p2c_data[2])
);

tennm_p2c_pipe_reg p2c_data_pipe3_i (
    .d(p2c_data_pipe[3]),
    .clk(rx_clk_2x),
    .q(p2c_data[3])
);

tennm_p2c_pipe_reg p2c_ctrl_pipe_i (
    .d(p2c_ctrl_pipe),
    .clk(rx_clk_2x),
    .q(p2c_ctrl)
);




reg [3:0] q_delay;
//altera_gtr_reset_synchronizer u_rx_con_wr_inst (
//    .clk            (rx_clk_2x),
//    .rst_n          (reset_rx_clk_2x_n),
//    .rst_sync_n     (post_rst_low_nib_write)
//);
always @(posedge rx_clk_2x) begin
    if (!reset_rx_clk_2x_n)
        q_delay <= 4'b0;
    else
        q_delay <= {q_delay[2:0],reset_rx_clk_2x_n};
end
assign post_rst_low_nib_write = q_delay[2];


  dcfifo_1to2 #(
  .DWIDTH_IN (4)
  ) data_up_conv_inst (
  .wrclk   (rx_clk_2x),
  // .wrreq   (1'b1),
  // .wrreq   (post_rst_low_nib_write),
  .wrreq   (reset_rx_clk_2x_n),
  .data    (p2c_data_reg),
  .rdclk   (rx_clk),
  .rdreq   (1'b1),
  .q       (rgmii_in_4_reg),
  .aclr    (reset_rx_clk),
  // .aclr    (~reset_rx_clk_2x_n),
  .rdempty (),
  .wrfull  ()
  );  
  
  dcfifo_1to2 #(
  .DWIDTH_IN (1)
  ) ctrl_up_conv_inst (
  .wrclk   (rx_clk_2x),
  // .wrreq   (post_rst_low_nib_write),
  .wrreq   (reset_rx_clk_2x_n),
  .data    (p2c_ctrl_reg),
  .rdclk   (rx_clk),
  .rdreq   (1'b1),
  .q       (rgmii_in_1_wire),
  .aclr    (reset_rx_clk),
  // .aclr    (~reset_rx_clk_2x_n),
  .rdempty (),
  .wrfull  ()
  );  
  
	
// always@(posedge rx_clk_2x or negedge reset_rx_clk_2x_n) begin
always@(posedge rx_clk_2x) begin
    if(!reset_rx_clk_2x_n) begin
        p2c_data_reg <= 4'b0;
        p2c_data_reg_1 <= 4'b0;
    end else begin
        p2c_data_reg_1 <= p2c_data;
        p2c_data_reg <= p2c_data_reg_1;
    end
    end

// always@(posedge rx_clk_2x or negedge reset_rx_clk_2x_n) begin
always@(posedge rx_clk_2x) begin
    if(!reset_rx_clk_2x_n) begin
        p2c_ctrl_reg_1 <= 1'b0;
        p2c_ctrl_reg <= 1'b0;
    end else begin
        p2c_ctrl_reg_1 <= p2c_ctrl;
        p2c_ctrl_reg <= p2c_ctrl_reg_1;
    end
    end
    
assign rx_err = rgmii_in_1_wire[1];
assign rx_dv  = rgmii_in_1_wire[0];
assign gm_rx_err = rx_err ^ rx_dv;
assign gm_rx_dv = rx_dv;
assign m_rx_err = rx_err ^ rx_dv;
assign m_rx_en = rx_dv;
  
always @(rx_dv or rx_err or rgmii_in_4_reg)
  begin
		m_rx_crs = 1'b0;
		if ((rx_dv == 1'b1) || (rx_dv == 1'b0 && rx_err == 1'b1 && rgmii_in_4_reg == 8'hFF ) || (rx_dv == 1'b0 && rx_err == 1'b1 && rgmii_in_4_reg == 8'h0E ) || (rx_dv == 1'b0 && rx_err == 1'b1 && rgmii_in_4_reg == 8'h0F ) || (rx_dv == 1'b0 && rx_err == 1'b1 && rgmii_in_4_reg == 8'h1F ) )
		begin
			m_rx_crs = 1'b1;   // read RGMII specification data sheet , table 4 for the conditions where CRS should go high
		end
  end

    // mux for Out 4
always @(*)
  begin
    case (speed_reg)
      1'b1:  rgmii_out_4_wire = gm_tx_d;
      1'b0:  rgmii_out_4_wire = {gm_tx_d[3:0],gm_tx_d[3:0]};
      // 1'b0:  rgmii_out_4_wire = {m_tx_d,m_tx_d}; 
    endcase
  end
  
   // mux for Out 1
always @(*)
  begin
    case (speed_reg)
      1'b1: 
		begin
			rgmii_out_1_wire_inp1 = gm_tx_en; // gigabit
			rgmii_out_1_wire_inp2 = gm_tx_en ^ gm_tx_err;
		end	
      1'b0:  
		begin
			rgmii_out_1_wire_inp1 = m_tx_en;
			rgmii_out_1_wire_inp2 = m_tx_en ^ m_tx_err;
		end
    endcase
  end

always @(posedge tx_clk or posedge reset_tx_clk)
begin
	if(reset_tx_clk == 1'b1)
	begin
		m_tx_en_reg1 <= 1'b0;
		m_tx_en_reg2 <= 1'b0;
		m_tx_en_reg3 <= 1'b0;
		m_tx_en_reg4 <= 1'b0;

	end
	else
	begin
		m_tx_en_reg1 <= m_tx_en;
		m_tx_en_reg2 <= m_tx_en_reg1;
		m_tx_en_reg3 <= m_tx_en_reg2;
		m_tx_en_reg4 <= m_tx_en_reg3;
	end

end  


always @(m_tx_en_reg4 or m_rx_crs or rx_dv)
begin
	m_rx_col_reg = 1'b0;
	if ( m_tx_en_reg4 == 1'b1 & (m_rx_crs == 1'b1 | rx_dv == 1'b1))
	begin
		m_rx_col_reg = 1'b1;
	end
end
 
altera_std_synchronizer #(SYNCHRONIZER_DEPTH) U_SYNC_1(
			.clk(tx_clk), // INPUT
			.reset_n(~reset_tx_clk), //INPUT
			.din(m_rx_col_reg), //INPUT
			.dout(m_rx_col));// OUTPUT

altera_std_synchronizer #(SYNCHRONIZER_DEPTH) U_SYNC_2(
			.clk(tx_clk), // INPUT
			.reset_n(~reset_tx_clk), //INPUT
			.din(speed), //INPUT
			.dout(speed_reg));// OUTPUT

  
  // --------------- Transmit Path -----------------
  //                                               

  
  dcfifo_2to1 #(
  .DWIDTH_IN (8)
  ) data_down_conv_inst (
  .wrclk   (tx_clk),
  .wrreq   (1'b1),
  .data    (rgmii_out_4_wire),
  .rdclk   (tx_clk_2x),
  .rdreq   (1'b1),
  .q       (c2p_data),
  // .aclr    (reset_tx_clk), //to use reset_tx_clk_2x_n
  .aclr    (~reset_tx_clk_2x_n), 
  .rdempty (),
  .wrfull  ()
  );  
  
  dcfifo_2to1 #(
  .DWIDTH_IN (2)
  ) ctrl_down_conv_inst (
  .wrclk   (tx_clk),
  .wrreq   (1'b1),
  .data    ({rgmii_out_1_wire_inp2, rgmii_out_1_wire_inp1}),
  .rdclk   (tx_clk_2x),
  .rdreq   (1'b1),
  .q       (c2p_ctrl),
  // .aclr    (reset_tx_clk), // to use reset_tx_clk_2x_n
  .aclr    (~reset_tx_clk_2x_n), 
  .rdempty (),
  .wrfull  ()
  );
  
  always@(posedge tx_clk_2x) begin
    if(!reset_tx_clk_2x_n) begin
        c2p_ctrl_reg <= 1'b0;
        c2p_ctrl_reg_1 <= 1'b0;
    end else begin
        c2p_ctrl_reg_1 <= c2p_ctrl;
        c2p_ctrl_reg <= c2p_ctrl_reg_1;
    end
    end  
    
  always@(posedge tx_clk_2x) begin
    if(!reset_tx_clk_2x_n) begin
        c2p_data_reg <= 4'b0;
        c2p_data_reg_1 <= 4'b0;
    end else begin
        c2p_data_reg_1 <= c2p_data;
        c2p_data_reg <= c2p_data_reg_1;
    end
    end
  
  
  
  
  /*
  tennm_c2p_pipe_reg c2p_data_pipe0_i (
    .d(p2c_data_pipe[0]),
    .clk(rx_clk_2x),
    .q(p2c_data[0])
);*/

  
  tennm_rgmii_o txd_int0
	(
		.rst(reset_tx_clk_2x_n),
		.clk_in(tx_clk_2x),
		.din(c2p_data_reg[0]),
		.dout0(c2p_odd_data[0]),
		.dout1(c2p_even_data[0]),
		.div_clk_out(tx_clk_2x_div[0])//, // this output may not be used, instead, use tx_clk for downstream ddio
		// .i_b(),
		// .o_b(tx_bond_0_1)
		//.sync()
	);
	
  tennm_rgmii_o txd_int1
	(
		.rst(reset_tx_clk_2x_n), 
		.clk_in(tx_clk_2x),
		.din(c2p_data_reg[1]),
		.dout0(c2p_odd_data[1]),
		.dout1(c2p_even_data[1]),
		.div_clk_out(tx_clk_2x_div[1])//,
		// .i_b(tx_bond_0_1),
		// .o_b(tx_bond_1_2)
		// .sync()
	);
	
  tennm_rgmii_o txd_int2
	(
		.rst(reset_tx_clk_2x_n), 
		.clk_in(tx_clk_2x),
		.din(c2p_data_reg[2]),
		.dout0(c2p_odd_data[2]),
		.dout1(c2p_even_data[2]),
		.div_clk_out(tx_clk_2x_div[2])//,
		// .i_b(tx_bond_1_2),
		// .o_b(tx_bond_2_3)
		// .sync()
	);
	
  tennm_rgmii_o txd_int3
	(
		.rst(reset_tx_clk_2x_n), 
		.clk_in(tx_clk_2x),
		.din(c2p_data_reg[3]),
		.dout0(c2p_odd_data[3]),
		.dout1(c2p_even_data[3]),
		.div_clk_out(tx_clk_2x_div[3])//,
		// .i_b(tx_bond_2_3),
		// .o_b(tx_bond_3_4)
		// .sync()
	);
	
	tennm_rgmii_o tx_ctrl_int
	(
		.rst(reset_tx_clk_2x_n), 
		.clk_in(tx_clk_2x),
		.din(c2p_ctrl_reg),
		.dout0(c2p_odd_ctrl),
		.dout1(c2p_even_ctrl),
		.div_clk_out(tx_clk_2x_div[4])//,
		// .i_b(tx_bond_3_4),
		// .o_b()
		// .sync()
	);
    
	
  // DDIO instantiation

//  tennm_ph2_ddio_out #(
//  	.mode("MODE_DDR"),
//	.asclr_ena("ASCLR_ENA_PRESET")
//  ) tx_clk_rgmii_ddio (
    // .areset(1'b0),
    // .sreset(1'b0),
    // .ena(1'b1),
    // .clkhi(1'b1),
    // .clklo(1'b0),
    // .muxsel(1'b0),
    // .dfflo(1'b0),
    // .dffhi(1'b1),
    // .devpor(1'b0),
    // .hrbypass(1'b0),
    // .devclrn(1'b1),
//	.dataout(rgmii_clk_int),
//	.datainlo(1'b0),
//	.datainhi(1'b1),
//	.clk(tx_clk_2x_div[0]) // this may use tx_clk for better delay than div2 clk
//	);

  tennm_ph2_ddio_out #(
  	.mode("MODE_DDR"),
	.asclr_ena("ASCLR_ENA_NONE")
  ) txd_o0 (
	.dataout(rgmii_out[0]),
	.datainlo(c2p_odd_data[0]),
	.datainhi(c2p_even_data[0]),
	.clk(tx_clk_2x_div[0]) // this may use tx_clk for better delay than div2 clk
	);

  tennm_ph2_ddio_out #(
  	.mode("MODE_DDR"),
	.asclr_ena("ASCLR_ENA_NONE")
  ) txd_o1 (
	.dataout(rgmii_out[1]),
	.datainlo(c2p_odd_data[1]),
	.datainhi(c2p_even_data[1]),
	.clk(tx_clk_2x_div[1]) // this may use tx_clk for better delay than div2 clk
	);

  tennm_ph2_ddio_out #(
  	.mode("MODE_DDR"),
	.asclr_ena("ASCLR_ENA_NONE")
  ) txd_o2 (
	.dataout(rgmii_out[2]),
	.datainlo(c2p_odd_data[2]),
	.datainhi(c2p_even_data[2]),
	.clk(tx_clk_2x_div[2]) // this may use tx_clk for better delay than div2 clk
	);

  tennm_ph2_ddio_out #(
  	.mode("MODE_DDR"),
	.asclr_ena("ASCLR_ENA_NONE")
  ) txd_o3 (
	.dataout(rgmii_out[3]),
	.datainlo(c2p_odd_data[3]),
	.datainhi(c2p_even_data[3]),
	.clk(tx_clk_2x_div[3]) // this may use tx_clk for better delay than div2 clk
	);

  // TX Control 
  tennm_ph2_ddio_out #(
  	.mode("MODE_DDR"),
	.asclr_ena("ASCLR_ENA_NONE")
  ) tx_ctrl_inst (
	.dataout(tx_control),
	// .datainlo(rgmii_out_1_wire_inp1),
	// .datainhi(rgmii_out_1_wire_inp2),
	.datainlo(c2p_odd_ctrl),
	.datainhi(c2p_even_ctrl),
	.clk(tx_clk_2x_div[4])
	);



endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "rFam2OOQSshuL+eeTiF6ovooTHga3FuxmJ0pGFI8SKCGKNEi4UF+Yt52NudiSCyaGSStr7FjkcAoqYKcK1vS3TQ6nd+F44N8wwC4jERQwAMz1RyCnspOJFyY7ZydcqcL7fsC0OhmlJ7CZJagkFMvQx4ZHRwPmfljjuQuRdl6AhiFLcvLOAlyFTzIwPJT9tGS+HYBUgUrfd/E8t6Tk4Kqxhpr4e3e7hX3nJhRsac5d87FoQEylVEEsyVZT2EihmnBFNNsuFZFQpe9Ty+0JDO349zWFdYTBNouvaWIkI4VUdeStlDrBfhU91KOGwP5E/RoCUGWVigWlyf6kBNHPzx7J+zcm1JMdJ97K5FqbY68C9mQNlIT9MDMQY6bWFkLEbGXQ2i7wfRBD7Unkev8G+iwq23zmcWe4wJmmjqsUstLR4P8FmnMQ09gWKTc2wZ94AVCXAk0hvjPOMJ2Xt8AXpwpclHllR/cPYnyyYLbui57Y9T6fYt56M7Vo6kdpgvRpJz8zctqNe5jpPmfPSdBCnkxdL/bcI8yecpMStbkTB3RHhpyd29VkfPdjZCFtEL4oDyJKw6Dc/0Wh+dS2qkEClaEtnLjCuI2mKYUmtj8ZcWo+bGALswkK3NESCFSQlhlByZNwb8Yem7ElLEGuxwarFSMYOrjP0jYspfd3S03In4/TFYh+erbnvoWsZ5q13jPu1u+EU7vUamuwxrhq5WwmQhfwzFlvSVljICu1fP9Qd12tddVNU5gEOOAdtQfCGOtAYaufLPcWgNJlf4x3DEGHOsPF6JArbaxggP9AuUu1yMSaKxGqxwlVynysBGuy2R7V7woXy9lsd7nlMKBuT6pcRuq0E6cC5nPyFeSaGhbFycAuA/qSEdsjr54Uuo0nx7sCmtWehlZD3/rvzeWLpAbC62Z7hJWv7AqyxcXdl+fyjegBca9qsd3k6qYN5ztqq+ORKFBmcrrDpTeZz6LnTLWmSKSTdujgZnWbxnMQpIQ4nf9mK5izd3YoAl0dZ9stmfY7Mli"
`endif