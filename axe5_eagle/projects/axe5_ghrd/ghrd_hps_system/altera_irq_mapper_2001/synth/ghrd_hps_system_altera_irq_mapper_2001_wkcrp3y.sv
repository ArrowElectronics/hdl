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


// $Id: //acds/rel/23.4/ip/iconnect/merlin/altera_irq_mapper/altera_irq_mapper.sv.terp#1 $
// $Revision: #1 $
// $Date: 2023/10/12 $

// -------------------------------------------------------
// Altera IRQ Mapper
//
// Parameters
//   NUM_RCVRS        : 4
//   SENDER_IRW_WIDTH : 63
//   IRQ_MAP          : 0:1,1:0,2:2,3:3
//
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module ghrd_hps_system_altera_irq_mapper_2001_wkcrp3y
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,
    // -------------------
    // IRQ Receivers
    // -------------------
    input                receiver0_irq,
    input                receiver1_irq,
    input                receiver2_irq,
    input                receiver3_irq,

    // -------------------
    // Command Source (Output)
    // -------------------
    output reg [62 : 0] sender_irq
);


    always @* begin
      sender_irq = 0;

        sender_irq[1] = receiver0_irq;
        sender_irq[0] = receiver1_irq;
        sender_irq[2] = receiver2_irq;
        sender_irq[3] = receiver3_irq;
    end

endmodule

