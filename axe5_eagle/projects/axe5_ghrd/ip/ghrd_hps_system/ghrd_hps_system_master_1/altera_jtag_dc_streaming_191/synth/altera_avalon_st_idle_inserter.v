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
//| Avalon ST Idle Inserter 
// --------------------------------------------------------------------------------

`timescale 1ns / 100ps
module altera_avalon_st_idle_inserter (

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
         if (in_valid & out_ready) begin
            if ((idle_char | escape_char) & ~received_esc & out_ready) begin
                 received_esc <= 1;
            end else begin
                 received_esc <= 0;
            end
         end
      end
   end

   always @* begin
      //we are always valid
      out_valid = 1'b1;
      in_ready = out_ready & (~in_valid | ((~idle_char & ~escape_char) | received_esc));
      out_data = (~in_valid) ? 8'h4a :    //if input is not valid, insert idle
                 (received_esc) ? in_data ^ 8'h20 : //escaped once, send data XOR'd
                 (idle_char | escape_char) ? 8'h4d : //input needs escaping, send escape_char
                 in_data; //send data
   end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Gwt3whRcE3+dmXyqrSB7tq2BawD3oh9aWud7Z4eAN187O43IWvM/KG8cuzSO3rcLdOg/6M8a5bUzV8fSCamrY3rLfHnQy43nef+FViJgCalid4DqTidvdzU87e5ZQ/v7HVm3olDBJc6LsbYrqiDrF0RkIcqQRi4zpc6Rtw0M2aW8FBhW2R9GBM/OcdpnaI+Km4xIFjjLOMKR0kXUH+3JyiE6l+btThmGIC55ugx3xhob7WcLVFTOopHGar0ZrJlEtQJeTn3kgjA/8k3OieNZtAVyKZGsqsJXwCrhYoeuac5tdA55lWAeTZDtoxa2pV+Q5ZUDu2G0rsgKO/RRPHXYeR7NPlYHTimyIf5BotioUyMVd/0YGVgPu3fzRVkGM3N0B0AiUZ2wknUfQNPGKU6qYXKxAf5/prNppzvgTpYEKSaj7PK/UDkMFKQEPzEwPGlR+jnHxW10prMmGLOggGkzaR2DNojAtDJvFfMUNdJFQfWb2FQOLHuuNgKQ7+x/0kddqyEynH4uDpg/H09NOP3c9UtL8Z6ldhr9SqNLJfITE6Mkn6bm/52cd6EMo7BKYmXRFF5CXaWJABFpmp4+CdNWbnOgfi2QXQazsROi3lpJKsmATAniyAe9N1GvWTLB/1eSP4TKJwBr3mc/AFFZflovCyBY0jwUdWBeQw3C7sGzxZwhiNan256hXfKy3/adQk+LrMkT3rZ6EUwuF9jkopHeRQPbUa6Uewg2G6u+EEwlAztc1by4gyrz/Ipf7k7wyisgyXIQQVMVxNVZ2adSqra0HxDaSdykBJQ8CzEQRdDAnGLwl/P0ZGZpHGt1WRrUlS/UEt2Yf5ISCwe/Hv14aJd4GrmOaEBfHeVB5LAJ8HCZ9QiPRP7UuY5lDuNOF8Vjw6t8VAKWwmh3lT9pwX0+8L7N5PUPeMbULBC31t5HuCQULNN7BOgh+AptmBhvyzzVpkEDLPfQoAumOs8vynFtoL/6QWuwfqmkPPdzbUedPFiweGaGMpkZloLj50QNoHt81wiK"
`endif