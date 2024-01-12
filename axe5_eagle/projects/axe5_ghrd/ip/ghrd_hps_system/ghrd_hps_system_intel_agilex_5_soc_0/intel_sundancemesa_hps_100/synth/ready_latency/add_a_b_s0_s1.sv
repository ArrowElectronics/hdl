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


// Copyright 2021 Intel Corporation. 
//
// This reference design file is subject licensed to you by the terms and 
// conditions of the applicable License Terms and Conditions for Hardware 
// Reference Designs and/or Design Examples (either as signed by you or 
// found at https://www.altera.com/common/legal/leg-license_agreement.html ).  
//
// As stated in the license, you agree to only use this reference design 
// solely in conjunction with Intel FPGAs or Intel CPLDs.  
//
// THE REFERENCE DESIGN IS PROVIDED "AS IS" WITHOUT ANY EXPRESS OR IMPLIED
// WARRANTY OF ANY KIND INCLUDING WARRANTIES OF MERCHANTABILITY, 
// NONINFRINGEMENT, OR FITNESS FOR A PARTICULAR PURPOSE. Intel does not 
// warrant or assume responsibility for the accuracy or completeness of any
// information, links or other items within the Reference Design and any 
// accompanying materials.
//
// In the event that you do not agree with such terms and conditions, do not
// use the reference design file.
/////////////////////////////////////////////////////////////////////////////

module add_a_b_s0_s1 #(
    parameter SIZE = 5
)(
    input [SIZE-1:0] a,
    input [SIZE-1:0] b,
    input s0,
    input s1,
    output [SIZE-1:0] out
);
    wire [SIZE:0] left;
    wire [SIZE:0] right;
    wire temp;
    
    assign left = {a ^ b, s0};
    assign right = {a[SIZE-2:0] & b[SIZE-2:0], s1, s0};
    assign {out, temp} = left + right;
    
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "cYUAutiPbJ9eAYHEYZJ4jDklBHhf9bnIlALIdgBLX6Jaa49G8B73gYgUIrgIPVNXKXW2JgLn+sUuCX3vFHQmNVHazCLl+Q3pYnSSyJ+VeEBUuTsCYk4WyHVUoFLNJh3h9mwfe0M7KTTBH7CKYKU8pXSi+wdSpKKjUH4aaEHr62cgHz51pqktBtVw2k+aF+gJpGfaDgdM8hrvt8QCIwb7/6NZZ+I55UQUfSDFG/PYg6n3mzBqiQtWvKEwOrUlFG1sM8+1F2rkhSGOMvbSNYMuAUO1gue9K5UKUEtxwpxsb7vEyPR9qQXc9v0IU1+EOU7f08G6LquKSJ+4BKShrQg/xXqoJ8GoWgAPA6jZGYOMt4dr4+blvoMRDL/3ZgwRjjAD9J6QDGtM3thYiih2mVVwGZnZI97kfO6cBS1ooSYXkYz56e7TUXRaDqBzvT6KArNmIiCpaRC9vAxqYLRFZhyZYEctzmpyYvphxTSmBDq2JT+hRxL38D7G0Eb2ltIAKVkcLZxpSvtwLzNTO6/s0tM8AqELbVA2DNrpTTkiviPt4fY6XB239iugY3yeBE7SL3PCahlj87yrauiqrYqnOHRK2watkmC26L8af1yEbBCjJszdqC5OqZLzCGVepQAv8XK5Mx5Jwam9ZG7NYQFCjIF+QjFPQ8o27PovVdRop2E+DVecEfYmoBy6cN+X0w+8KocbzLs9T5KvQrsrkISUiKUbObVX5RZbwi96hcc61m19pPpesuhYOAsCdSlWRfTiNTsquKbfpXz6b4k/6bj0dOsefNbQrXQQ3YG1J/VgTdYvzlMBISdSvgyaLZBf70PGsTPUa7AULZSCIKSIp7NYzBb4o3na6q+vlIReBsIu3O79bKrt3qoXm0oD5eCQiLzu8JY+gFLUPpzS2Vz0rjAzZ4MKWrxX18IFV3mqnB+zE9Y5B1ktgk1SAu5z4znWP1xA0oR9CuCktsLv3m5nq/5hHb7IXznI1rIJIRu4pPzHEHZgr1GrlZCz1HtaCKqPCMVmcC/x"
`endif