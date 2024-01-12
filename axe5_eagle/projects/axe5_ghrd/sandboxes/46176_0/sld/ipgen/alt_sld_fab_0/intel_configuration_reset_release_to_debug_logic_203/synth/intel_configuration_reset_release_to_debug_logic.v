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


module intel_configuration_reset_release_to_debug_logic
(
    input wire conf_reset
);
    altera_debug_config_reset_release_source_endpoint conf_reset_endpoint
    (
        .conf_reset(conf_reset)
    );
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "oCGSH374621Hb8Vdx1zpbGFDRRlR/iQFxq4u9eFZ1vs535komH6o0gG3DAt3GoHyIEaf6dyx8DLuUuqMQslQs9etyMjXbnhsqJKBH0EjctlI8aAkXUqpZV/kCXYGyVHmbrsCK0w9cX9s5bqb0g2KbMqkWxOJnTmwkTBX8Q2A0c90YP13D4uZ9IEEfvQhN+GXXVTb7xbFtY0q1JjH/1OB6YQdi+xjgtxcotYzs1N1gR2v2M1MWLt2WQ8F9wzN/9q7HfGvtoX2BwjvwbZnaj6W3R7xBlaK2X42AqcyXXI8NEep1u8Xs89yAZ/h1ub3/3SZCfh4Kli0flenjfNExjOVL9zTTOzlKiBp+kDDRhWWVWKHovrHl66fLqXLnC0bzjnHTsvz7t8IU3iZP3wKYQePiQa3jaCrVDdgbunvWAVnJb38+e21V8DPEpKpHng+9adnZAerU/QDLbqUiaSEFoZCNZ1+LDrOzIiOyboDnb2iJqYi40T6MbhRTdtGPCpFiEyQve25vzGIl/HYJJGRugO2X2qKMYZacTQnws0MKVB3C8Ly5d2I7JL9taAa7qwOiaH5qZpsTZp+xnOAXxKOSjm/H20xRuunmZSa3Yn6xV9uRFLWAaRDWvk2oTic0wf97yUUH9CPBOlz2k04WDu1tFbI2u06xg67pH+hPUf8DyacmEsMg3KqPYm7dWgijnxDh9Vn9Ia9Qmdel+4uH7D+dt11FMGjc6O83fwCDa2LbxsMNvQlHgOXecc8vFB4OSTl9WedJ4qzqWrV4Hx5gJ5YqaJJ7pZgO8bJzUnb3qtiM5O76Xufix3mCKgC7+gLBjz2NogMvWrXQ8vuoxiwS16m85/9juQmB5qiSlfy1lzJ5M7+0DJXSy9RtddYrNmVzPigP6YVTCFO8LZra+Hj8kKFvtnxyeKNQfUTodqP27sB9DWEKZJMyn/Bj0mp9HNmrDBwJszz7oZliaOUZUg3ZCFqkSUn90cZ5k6IBXEx2Qwob1UjIPyLUDi94jn6Sai2taAQ4zy4"
`endif