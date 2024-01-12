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


module ff_macro # (
 parameter DATA_WIDTH = 256,
 parameter NUM_FLOPS = 1 // based on number of flops you need in 1 dir 
 ) (
 input logic clk,

 input [DATA_WIDTH -1:0] in_data ,

 output [DATA_WIDTH -1:0] out_data

);


 (* altera_attribute = "-name FORCE_HYPER_REGISTER_FOR_CORE_PERIPHERY_TRANSFER ON" *)
    reg [DATA_WIDTH-1:0] in_data_reg [NUM_FLOPS:0];    

    assign in_data_reg[0] = in_data;


    genvar i;
    
    generate 
    for (i=0 ; i<NUM_FLOPS ; i=i+1 ) begin
      always @(posedge clk) begin
          in_data_reg[i+1] <= in_data_reg[i];
      end
    end
    endgenerate

    assign out_data = in_data_reg[NUM_FLOPS];



    
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "0SkZjS+9fJ+j5t/1eRLDSmYlrEk+/fn1n04GXW77wQ6zIb2xNDDUSUKHuq8xgUU/x5fl5HnvXE40EQiNtcreHpQdBYyewrwz5u+N8AriKl/2eSG4Sud1BOsd+Be6VZ8eApDF6OzCBILugtUNPEmRHtAKu+6veVGtcI3VxpZp3VYIvTgRcLreIH1gSgJC0aDXHf3J/4bUCmCuzXKdIIT7JazIrfwbYZHtjFylQuGPvoZP19BJl8GjLNxvXZAry8ktNN7dZ1HxU8swy3wn2Rwl4HxjyVfkJemYPEN47FJY8atszpO/KF5xRRl6r90vgE0m5mtudeOViwUbj/UH8HOxskwDKDDqvjGG84TF/XlJP0vwaVWWCAJVp/pfUiGwp0RcnWQLFdfV24pcnG8KeAfm5D739H9Baaa6LBR7xhwbWICXKG6OD+SDO3HbjUYcMbieqxR4/Gs2IUMISFvSjmCAqdlRh+5Bs0cmuv7BLTepyrDJ2Aj37P+0Q9JBYF18WCKFZfKpgWWzq7Epfv/vk6Gs5voQEX79qaSI5d/eFgJ2QdOyhOj8eKEHbSCNPC+Qkhvr+vAWdF41jaULgyuHrN0GgfCkTaTYd7oLW0w2XinRO2689wTzZGzgQtrExtJRyJ6md8VMBAOnI5tuFwzm59u775K9iQ4YS9vsLsiDcKNuVVakbinjf+tCt/zA3MSVgHSyiAaIfDmJnsGIS4EL6bA28eWYgLQTzoag/vfiqZPwPTNKWtjgwXWXmZOgghVzBa8/sRpbjC7bo+mC033tCjA9Vnr/oh7sIGRw4c4WbcMOyQLu9nI0LV9l0EuHAvNS9cWu7rZckpRaMOxcei7IzmXjbuPW6d12CMWZt/hSW0YYhqI6zdiUP8SzloId8uaSPNodVYexKZQ2sey0LnAxUOL5DMxUu6svZQmHFQ8Yvli4fyY6+FPJhFmta+NxWp378oMvmSMzMQxpzMhOIq7rMD11J98hSTn5TPEPVa5e37h0Rl1bpWoo6G4c6KBRLLmZoqGE"
`endif