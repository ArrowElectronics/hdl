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


module  intel_agilex_reset_release_from_sdm_atom 
(
    output wire conf_reset
);
    fourteennm_sdm_gpio_out 
    #(
        .bitpos       (15),
        .role         ("USER_RESET")
    ) 
    sdm_gpo_out_user_reset 
    (
        .gpio_o        (conf_reset)
    );
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "oCGSH374621Hb8Vdx1zpbGFDRRlR/iQFxq4u9eFZ1vs535komH6o0gG3DAt3GoHyIEaf6dyx8DLuUuqMQslQs9etyMjXbnhsqJKBH0EjctlI8aAkXUqpZV/kCXYGyVHmbrsCK0w9cX9s5bqb0g2KbMqkWxOJnTmwkTBX8Q2A0c90YP13D4uZ9IEEfvQhN+GXXVTb7xbFtY0q1JjH/1OB6YQdi+xjgtxcotYzs1N1gR0hI5LeLWIPUq5MuAobEpFhv/p1Vsb0h19kj4auZRLmy2lcVc9SSIU4z5xqVnD+pdfzSadqCUbdj586AS4U2UUzQm6/3oTPy3B+aj/GvT7Bvc1RxgU20smYk/sEDZ7JUmmziPUJ0xYvok579vNk0OBTouqPeSa3m60ZwQSy/tJxxHP7RwDf2kTwlT6bjZLehpbRx9i8l/cth4rDKekqkiBACNXT6/l5p6R0kNDwY0tKPqx1XUT6cxY7mplJ1YhAC+1pF9FwybinegHkHlOPFbkUGhTcB/kIl7YwpXOqgXcQ7Wp9bO2spMH58u09DF0htDGRx07qC3VcmgJJ5wzLqzD/0fjhBJOpPzMTE63eeEaJcWjtRI8xdUF7NGQCSAKi1mu1a9BtfCIy2bCve+zsU0XMC2DvS6mjHEnL44a3PwPXlF3Hw2vNTbuU4oRY4NT81h1L/nFlkvkHWreHnu8CRCoavX6xXuJOmfGxWlR2/m9cVgf6INrgTazpXMFGsVLlqlsf0GxBVksh4AomtYr5+FfuMclAD2J5xAwIPMaFsRk/U5dsM3SAiXO64Z8Muop3FnTSDu9gBhlbRt88RwmncdQ714EWEKuwab4f8ZjotIasELZiMFi2novVtRDlqcprhhEWWZBCmV6VFCF4nDIY8JvVGx4JIE8/V3P7DjRdFMdOuq/V3xB7EGy3xQKDeSc6iallYv7+8UVF4jLO0WN9WZUBWHxUbD+9Odsmmjm4S78xWzQrlxnQEmNGxsvhuBJSMSLccr68GJTjuzCQFgjxyT6R"
`endif