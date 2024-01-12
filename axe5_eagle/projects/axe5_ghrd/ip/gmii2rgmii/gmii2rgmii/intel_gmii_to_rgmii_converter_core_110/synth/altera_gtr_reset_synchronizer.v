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
`timescale 1ns / 1ps
// synthesis translate_on

module altera_gtr_reset_synchronizer /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"R105\"" */ ( // Disable R105 rule check. This module itself is a reset synchronizer.
    input   clk,
    input   rst_n,

    output  rst_sync_n

);

reg     din_sync_1;
reg     din_sync_2;


always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        din_sync_1  <= 1'b0;
        din_sync_2  <= 1'b0;
    end
    else begin
        din_sync_1  <= 1'b1;
        din_sync_2  <= din_sync_1;
    end
end

assign rst_sync_n = din_sync_2;


endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "rFam2OOQSshuL+eeTiF6ovooTHga3FuxmJ0pGFI8SKCGKNEi4UF+Yt52NudiSCyaGSStr7FjkcAoqYKcK1vS3TQ6nd+F44N8wwC4jERQwAMz1RyCnspOJFyY7ZydcqcL7fsC0OhmlJ7CZJagkFMvQx4ZHRwPmfljjuQuRdl6AhiFLcvLOAlyFTzIwPJT9tGS+HYBUgUrfd/E8t6Tk4Kqxhpr4e3e7hX3nJhRsac5d86hHSW60lLlFeFIxO+3JYZ1k1bYe92NMU5MLsr2eU+FtMST/h4/pQw7Yd5aRHqe4R8djwJYfWy0Lf7kc/vOeetVuthuRZn88DGUJ6ljma+EMtCNJ94AqpzLT/zOHD+TW40NAdm87FIxagB+FR1XfgE+JLbxuR7j4SO6KxG1Rm7Cm/IAYCTiz7YbSXw6pRnrlM+C8YgSZtgVsBpf7LUu3hl5v/sdkPgMTsaOnv8VsOTGZv8TmQs+KcFLKoC+vR6UuNFYGOuuWIzZySkMU71y67dm/W2602tL9n+2YypxL9lHRvmGDD1dm6z2rHlE9s9pNY49gMR3Yb/1gxJeR1pSSfFeGx2yYSVovnPLY47towAnea1vK6O92dnFcT5SaqmHVAShMRvYLd5EkvYhW/ZWZ+dCmQp+7V2fj93D/aEnpza7Jgz82HUpfPFibWOYXwdi7d+wDucOrq5s2MaydeVZAlg8OqrdY9+P2MgwnecfgBxCScn9e3clPQr45ulHz8IwVhaQAPlp/syZnyZJj1S2eH/PQ7PncubTI4/PxXJ99AH/78w2TJ6Udp/+zHaTd3Yf16BwRF5jfpJsPiXz4UtWePHEveGwGo+d1O3NfCyrZXzNI3UkcJdPj3bnd9S92R/vVnSZo5r4TGWmWSeBOK9aiPTrMcm2SCoMLOXxNeN+rCMVlZy7LwJqY0HPTZjIWGunIKZjlHuUlbQKouedM84Xx/cOwPxme8yD4LcqYJfh10OBt+1Q1jrpOdO2AF0Gg0tARk7lr31Lat2tamjwTuN91OzZ"
`endif