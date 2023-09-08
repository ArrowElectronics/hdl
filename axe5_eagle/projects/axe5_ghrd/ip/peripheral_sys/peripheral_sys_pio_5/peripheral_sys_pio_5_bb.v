module peripheral_sys_pio_5 (
		input  wire        clk,        //                 clk.clk
		input  wire        reset_n,    //               reset.reset_n
		input  wire [1:0]  address,    //                  s1.address
		input  wire        write_n,    //                    .write_n
		input  wire [31:0] writedata,  //                    .writedata
		input  wire        chipselect, //                    .chipselect
		output wire [31:0] readdata,   //                    .readdata
		output wire [2:0]  out_port    // external_connection.export
	);
endmodule

