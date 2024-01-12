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

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module altera_avalon_sysid_qsys #(
    parameter ID_VALUE   = 1,
    parameter TIMESTAMP  = 1
)(
    // inputs:
     address,
     clock,
     reset_n,
    
    // outputs:
     readdata
)
;

  output  [ 31: 0] readdata;
  input            address;
  input            clock;
  input            reset_n;

  wire    [ 31: 0] readdata;
  //control_slave, which is an e_avalon_slave
  assign readdata = address ? TIMESTAMP : ID_VALUE;

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Oy3QR2mKNgmhEfGL3SW6HQfCmb79srhD44IOaAtUlH8/pTgcm9t2UrXActBjPTmN4Bv4NNlGdb4P/mc3rtoPRgAFqt2AVMJX3s0AQGiv7LFugS4Idf0kbtvb54pTXH+zn++Y2B/CghSRss/8348bn4PK6K78kVges9jyNixGVIibFRB8G5IWj5cfOPmgt+ydiX4ZjY+CtMVd406Jcd+oQRODgD4T+W1CBwJueCo1/aJLTetX5uhmDD1YFisgiOIiFJDoDOoleTb8O6FydpNYAklHlPEwPpbPAqXfJp2Yz3me2ug/a79OHZIx4OUEJakRpRa2TwWXSCOctCBBskKgz9Xn3GUiwZzyuvrqQEe1ana9wDV+NBsJgeHd6amrmRgNfBxiNE9Yrhc1zB8xKc1HWw2cTDIcTSlTSJvQJYyFBqBSMHW/F0q4kVykfDz3x4bID7HaLaBAsvdEPnqy3l4MkLoEJEZv4uGBJP8ygGZ1ps2bvhYk/MZdS91PBIU0gNsJTwkuw4OwZ2j6xFHXt2oqVRl4xRJ7LHcRXGNE6RS55UDmor6xR5Sfq0SyPWE5uTeI2L3v2Yrg6Tg3Auj6pMq7r1L7+fe8d0CHOL5uIzRAO2GpoQcIPaWuDe2N71M0UAGELA+THtFtshptJJW2fwnBD+61ZA0Eg6/PNLJeAjzLI6+p4Dbobv3u1zQilrmxd9cF86rr5MGssq+fP64bCZlVRSdal6QeIDL5VHT+Iv5mGELyqzbnZeZphRNWKqirAGO3wa7M5UtG9nGEz/I5ZdoHJ7+21wqF9yeYkOQjVJzi9xCu/drsoHhD9zyroJ/YApbfcekdBnkG0RclKQc9pt/gHrbLCLD82c0ryUF1EjCf+tLKp7rGRZj6gBSvd39eBxJ1v/zs86dyFmP85BCVDvH2ccTTHczr3BAtvtaa2rivi25VAYPgLDe8LEO3n73PQva/v0Bt8q5sx5coHlk/MvBiwCjeTKYWudFggTVF/ZDi62vVUb4GUdAGbhP6ft7s8Udk"
`endif