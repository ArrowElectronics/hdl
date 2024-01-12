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


// --------------------------------------------------------------------------------
//| Avalon ST Idle Remover 
// --------------------------------------------------------------------------------

`timescale 1ns / 100ps
module altera_avalon_st_idle_remover (

      // Interface: clk
      input              clk,
      input              reset_n,
      // Interface: ST in
      output reg         in_ready,
      input              in_valid,
      input      [7: 0]  in_data,

      // Interface: ST out 
      input              out_ready,
      output reg         out_valid,
      output reg [7: 0]  out_data
);

   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------

   reg  received_esc;
   wire escape_char, idle_char;

   // ---------------------------------------------------------------------
   //| Thingofamagick
   // ---------------------------------------------------------------------

   assign idle_char = (in_data == 8'h4a);
   assign escape_char = (in_data == 8'h4d);

   always @(posedge clk or negedge reset_n) begin
      if (!reset_n) begin
         received_esc <= 0; 
      end else begin
         if (in_valid & in_ready) begin
            if (escape_char & ~received_esc) begin
                 received_esc <= 1;
            end else if (out_valid) begin
                 received_esc <= 0;
            end
         end
      end
   end

   always @* begin
      in_ready = out_ready;
      //out valid when in_valid.  Except when we get idle or escape
      //however, if we have received an escape character, then we are valid
      out_valid = in_valid & ~idle_char & (received_esc | ~escape_char);
      out_data = received_esc ? (in_data ^ 8'h20) : in_data;
   end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Gwt3whRcE3+dmXyqrSB7tq2BawD3oh9aWud7Z4eAN187O43IWvM/KG8cuzSO3rcLdOg/6M8a5bUzV8fSCamrY3rLfHnQy43nef+FViJgCalid4DqTidvdzU87e5ZQ/v7HVm3olDBJc6LsbYrqiDrF0RkIcqQRi4zpc6Rtw0M2aW8FBhW2R9GBM/OcdpnaI+Km4xIFjjLOMKR0kXUH+3JyiE6l+btThmGIC55ugx3xhquYjzfi4CyhtJ1WXs6y41QvHbtls45RBEY6brIQrec3ozk7XxvgCusPjElGwRFaI0ZNWcosUGWcPVRxjsithmHwK+hkcY5X0pB0PcTs2T/8Ka2dAFwDOsgrnxhF0t4t0FaDI8WjmeafN5NedKu+OMsAi5eQBT/hWq5o7xcSjo45tPrqhLpQDOwC6/O1XllYPjgmo8qdVd1p14U6Jv6qv5HLyZno2Xn0xjivf8hcHiIRzJlPOlqMThU+u8DYFL759DcQBvAWsM6x1v7ezqNFvnHtF6qphCaYCKAYZfVWjkFjx560pU+QfuSg9buaUHClhEUv0TV5ITCWHuyFyUWyt/nXHU2u1vRbD1Ww6Drd79sL/7Dc67jS9pbxsXZeJPsn+7JWxw8BcJxQE/Zyjc1XCDHPjp1HQ80oNwIGFYUYYgxvuZAvwbWPHanO6LfeIl6khMfxDxL3fRveRcNQxylsP/4ODWel4fVqN6o3FNvW3LlVHXMKjQ2u4iTBZZ63s/n4hvlnzOiq/9aLHRefZ3U35nMxpAW5MXuklpgLHj7No7mUp3bOHyaeVVLSI47ogMa+r50Z89/LCR4yheFa3vzw3nEJSNoYc/Uuic+E3xRyz2TscyoR8EZPWatbM6/zGQiUASpuLQMFsSWuVCaSueRi70IcyAXgraU1P6b+ChIz+Je40RP3aQDzHb6Egsc4RAU88WT2tidMY+mI3ArOT2EVFWC4PlYomI5Odo38IyOI4CyK/aeN7/c/+rZay4JGdQDXhphi3qpb/a2Rm4M55l2SQMN"
`endif