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


module intel_configuration_reset_release_for_debug
#(
   parameter DEVICE_FAMILY_ID = 2
)
(
   output wire conf_reset
);
   if(DEVICE_FAMILY_ID == 2) begin: s10 //stratix 10
      fourteennm_lsm_gpio_out 
      #(
         .bitpos       (19),
         .role         ("postuser"),
         .timingseq    (0)
      ) 
      lsm_gpo_out_user_reset 
      (
         .gpio_o        (conf_reset)
      );
   end
   else if(DEVICE_FAMILY_ID == 3) begin: ag //agilex
        fourteennm_sdm_gpio_out 
        #(
           .bitpos       (14),
           .role         ("USER_RESET")
        ) 
        sdm_gpo_out_user_reset 
        (
           .gpio_o        (conf_reset)
        );
   end
   else begin: universal
      lcell lc
      ( 
         .in(1'b0), 
         .out(conf_reset) 
      )/* synthesis altera_attribute = "-name PRESERVE_FANOUT_FREE_WYSIWYG ON" */;
   end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "oCGSH374621Hb8Vdx1zpbGFDRRlR/iQFxq4u9eFZ1vs535komH6o0gG3DAt3GoHyIEaf6dyx8DLuUuqMQslQs9etyMjXbnhsqJKBH0EjctlI8aAkXUqpZV/kCXYGyVHmbrsCK0w9cX9s5bqb0g2KbMqkWxOJnTmwkTBX8Q2A0c90YP13D4uZ9IEEfvQhN+GXXVTb7xbFtY0q1JjH/1OB6YQdi+xjgtxcotYzs1N1gR2cCzG72/HYrmH/JRQQGrmsTQxH0DyA2WYxbbYLxSqzT5pOuBGbHMP4xYKMgpRXhWPR+wijwIY4posPDJkascZHGWKqVCedyCREwjC2/z7pp86rGT1YSJoCoqj33A/fKK5WmYEweeQm8ScdON6o8rmImqJYWEdkuh7CE3iBAIed5lt5Z0STcE2PserMFHF3Q7iInIUcyd6kjBPHxLV+gj+SEsMG+M5XF6B7oocdK7sonkehDGyvmttf0rWOpEr0+BYUSORHY5ufNBfC+CXMXr4Y7VIfG1g467HIohY2RFRfa1+LjIYitMiJkGEzuboeNLLnDUIwnVMiRRT78pDrUk7vEnLjl16lNRym3vPtsd4glDbdMsWzp123Xss/ATyuzvQ4xBa6ok/WU96ebXTWiJPl8HWGx/VEp7BYUaq3iM5BaL8iIOCGMk2AqPb2HJOydbXB9HkXiICnBBqKUkdLpewEzNjaKm+2ceI5CkXBLS6FhGpbVKKNKQLIQySELU/oU5dbDC9VF20uEUQL8L+0P1NojOqzsEwc/nezHNiV2mczQf9PKRZcVFrilrZIeN0YUf6wv0GxvHczBY17iJ7JYylgYmbc4aeblwi1/TzijkDv+GoJ2gh1y9w+pXn8TZdf/F7u4wrCPyAvsevf/oA9gR2cEUzPggJYxKLqUElB7YKADf0aqSpGmVxoaRqaB6mZK6OJsk8AXeE6A/vCP6STrEB48FWlO6glzX22ND8JqgbKhtLxrdqQJcp8L91wS/8UGX9m4K9auQuHPH9oKF+NZGT4"
`endif