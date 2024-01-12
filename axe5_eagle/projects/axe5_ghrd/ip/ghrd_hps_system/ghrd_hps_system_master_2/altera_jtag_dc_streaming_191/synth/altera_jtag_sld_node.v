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


// synopsys translate_off
`timescale 1 ns / 1 ns
// synopsys translate_on
module altera_jtag_sld_node (
    ir_out,
    tdo,
    ir_in,
    tck,
    tdi,
    virtual_state_cdr,
    virtual_state_cir,
    virtual_state_e1dr,
    virtual_state_e2dr,
    virtual_state_pdr,
    virtual_state_sdr,
    virtual_state_udr,
    virtual_state_uir
);

parameter TCK_FREQ_MHZ = 20;
localparam TCK_HALF_PERIOD_US = (1000/TCK_FREQ_MHZ)/2;
localparam IRWIDTH = 3;

input [IRWIDTH - 1:0] ir_out;
input tdo;
output reg [IRWIDTH - 1:0] ir_in;
output tck;
output reg tdi = 1'b0;
output virtual_state_cdr;
output virtual_state_cir;
output virtual_state_e1dr;
output virtual_state_e2dr;
output virtual_state_pdr;
output virtual_state_sdr;
output virtual_state_udr;
output virtual_state_uir;

// PHY Simulation signals
`ifndef ALTERA_RESERVED_QIS
    reg simulation_clock;
    reg sdrs;
    reg cdr;
    reg sdr;
    reg e1dr;
    reg udr;
    reg [7:0] bit_index;
`endif


// PHY Instantiation
`ifdef ALTERA_RESERVED_QIS
    wire tdi_port;
    wire [IRWIDTH - 1:0] ir_in_port;
    always @(tdi_port)
      tdi = tdi_port;
    always @(ir_in_port)
      ir_in = ir_in_port;
    sld_virtual_jtag_basic  sld_virtual_jtag_component (
                .ir_out (ir_out),
                .tdo (tdo),
                .tdi (tdi_port),
                .tck (tck),
                .ir_in (ir_in_port),
                .virtual_state_cir (virtual_state_cir),
                .virtual_state_pdr (virtual_state_pdr),
                .virtual_state_uir (virtual_state_uir),
                .virtual_state_sdr (virtual_state_sdr),
                .virtual_state_cdr (virtual_state_cdr),
                .virtual_state_udr (virtual_state_udr),
                .virtual_state_e1dr (virtual_state_e1dr),
                .virtual_state_e2dr (virtual_state_e2dr)
                // synopsys translate_off
                ,
                .jtag_state_cdr (),
                .jtag_state_cir (),
                .jtag_state_e1dr (),
                .jtag_state_e1ir (),
                .jtag_state_e2dr (),
                .jtag_state_e2ir (),
                .jtag_state_pdr (),
                .jtag_state_pir (),
                .jtag_state_rti (),
                .jtag_state_sdr (),
                .jtag_state_sdrs (),
                .jtag_state_sir (),
                .jtag_state_sirs (),
                .jtag_state_tlr (),
                .jtag_state_udr (),
                .jtag_state_uir (),
                .tms ()
                // synopsys translate_on
                );
    defparam
        sld_virtual_jtag_component.sld_mfg_id = 110,
        sld_virtual_jtag_component.sld_type_id = 132,
        sld_virtual_jtag_component.sld_version = 1,
        sld_virtual_jtag_component.sld_auto_instance_index = "YES",
        sld_virtual_jtag_component.sld_instance_index = 0,
        sld_virtual_jtag_component.sld_ir_width = IRWIDTH,
        sld_virtual_jtag_component.sld_sim_action = "",
        sld_virtual_jtag_component.sld_sim_n_scan = 0,
        sld_virtual_jtag_component.sld_sim_total_length = 0;
`endif

// PHY Simulation
`ifndef ALTERA_RESERVED_QIS

    localparam DATA     = 0;
    localparam LOOPBACK = 1;
    localparam DEBUG    = 2;
    localparam INFO     = 3;
    localparam CONTROL  = 4;
    localparam MGMT     = 5;

    always
        //#TCK_HALF_PERIOD_US simulation_clock = $random;
        #TCK_HALF_PERIOD_US simulation_clock = ~simulation_clock;
    
    assign tck = simulation_clock;
    assign virtual_state_cdr = cdr;
    assign virtual_state_sdr = sdr;
    assign virtual_state_e1dr = e1dr;
    assign virtual_state_udr = udr;
    
    task reset_jtag_state;
      begin
        simulation_clock = 0;
        enter_data_mode;
        clear_states_async;
      end
    endtask
    
    task enter_data_mode;
      begin
        ir_in = DATA;
        clear_states;
      end
    endtask
    
    task enter_loopback_mode;
      begin
        ir_in = LOOPBACK;
        clear_states;
      end
    endtask
    
    task enter_debug_mode;
      begin
        ir_in = DEBUG;
        clear_states;
      end
    endtask
    
    task enter_info_mode;
      begin
        ir_in = INFO;
        clear_states;
      end
    endtask
    
    task enter_control_mode;
      begin
        ir_in = CONTROL;
        clear_states;
      end
    endtask
    
    task enter_mgmt_mode;
      begin
        ir_in = MGMT;
        clear_states;
      end
    endtask
    
    task enter_sdrs_state;
      begin
        {sdrs, cdr, sdr, e1dr, udr} = 5'b10000;
        tdi = 1'b0;
        @(posedge tck);
      end
    endtask
    
    task enter_cdr_state;
      begin
        {sdrs, cdr, sdr, e1dr, udr} = 5'b01000;
        tdi = 1'b0;
        @(posedge tck);
      end
    endtask

    task enter_e1dr_state;
      begin
        {sdrs, cdr, sdr, e1dr, udr} = 5'b00010;
        tdi = 1'b0;
        @(posedge tck);
      end
    endtask
    
    task enter_udr_state;
      begin
        {sdrs, cdr, sdr, e1dr, udr} = 5'b00001;
        tdi = 1'b0;
        @(posedge tck);
      end
    endtask
    
    task clear_states;
      begin
        clear_states_async;
        @(posedge tck);
      end
    endtask
    
    task clear_states_async;
      begin
        {cdr, sdr, e1dr, udr} = 4'b0000;
      end
    endtask
    
    task shift_one_bit;
      input bit_to_send;
      output reg bit_received;
      begin
        {cdr, sdr, e1dr, udr} = 4'b0100;
        tdi = bit_to_send;
        @(posedge tck);
        bit_received = tdo;
      end
    endtask
    
    task shift_one_byte;
      input [7:0] byte_to_send;
      output reg [7:0] byte_received;
      integer i;
      reg bit_received;
      begin
        for (i=0; i<8; i=i+1)
        begin
          bit_index = i;
          shift_one_bit(byte_to_send[i], bit_received);
          byte_received[i] = bit_received;
        end
      end
    endtask

`endif

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Gwt3whRcE3+dmXyqrSB7tq2BawD3oh9aWud7Z4eAN187O43IWvM/KG8cuzSO3rcLdOg/6M8a5bUzV8fSCamrY3rLfHnQy43nef+FViJgCalid4DqTidvdzU87e5ZQ/v7HVm3olDBJc6LsbYrqiDrF0RkIcqQRi4zpc6Rtw0M2aW8FBhW2R9GBM/OcdpnaI+Km4xIFjjLOMKR0kXUH+3JyiE6l+btThmGIC55ugx3xhpFlRznGdtCUZgumcXPEv40rvA9E3Gm5jghGR3zzYah9oSd7PLc8DnOEAT9BxxKRNJhk7L+o5b59vw7hGD9G/9VzYJ7neKSi75r22ogSnIs3YZarVascDpXPXu6oHv+CoVcKepV3Gyz3QsMsZzRXOFBSsmG4CozY+lDuTgoq3qwBfNA+fcZpqCAfN/LfrKtvkoWiLmRISKZ10wpp0iLF0I9Ir9HUUHwri3hYk8bUSOl+SCWVziXy8zpJwfd5UI/LcO+MKV+LaGDZq0JqTfAxrPb14KycDRY0jlbIIfOk27kS8XPmkDjLfahkIsdVRWIjcUuQeO5y3WSTuXhmH6bQvWL96Oi8fLHxNP0DLNfqkeXv+yEvGcMe1NXqsHia6tgKylJp/jOapvdS66H6d1fVsenLu+yA9kmG3yl/VelNIO7Ml/kEqw8c+8ZWxZ1H0MkZrrgrq1kjPnwjyrgLjH2ueAs6t+LRBISvpOKazELybSB1u/Duv0ihhcHBidyDbzw0dH/4V9NcvPsubmVujhbpDwNfa3bWDYlYBFYt14+6VirzXz8+Wd2xfZvLSd3yvAm5/91GTj4BbwC7wS0XlE9Uws5p5JJH6EFkWHiMs0eZr1P+wSXezCt1wERKJpIhdSLgbT35RxB4UeVKLA1TOKzebvwAF8ZIs32n+tAudygkiT17iQwMri8ky/ikh806o9Ac8L2C3mqcDBDGZM78Q8yfyUAMjGsbqZnc5qmCGcAJ3zVKl0LIPq7NYj46mmh2DZn+ZyPpaRQJOpLW5vgWqwX38n3"
`endif