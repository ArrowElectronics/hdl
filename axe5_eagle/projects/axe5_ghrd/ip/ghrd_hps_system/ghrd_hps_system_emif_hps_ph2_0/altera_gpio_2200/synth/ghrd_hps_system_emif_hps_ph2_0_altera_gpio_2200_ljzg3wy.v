// ghrd_hps_system_emif_hps_ph2_0_altera_gpio_2200_ljzg3wy.v

// This file was auto-generated from altera_gpio_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 23.4 79

`timescale 1 ps / 1 ps
module ghrd_hps_system_emif_hps_ph2_0_altera_gpio_2200_ljzg3wy (
		output wire [0:0] dout,   //   dout.export
		input  wire [0:0] pad_in  // pad_in.export
	);

	altera_gpio #(
		.SIZE                (1),
		.PIN_TYPE            ("input"),
		.REGISTER_MODE       ("none"),
		.HALF_RATE           ("false"),
		.DDIO_WITH_DELAY     ("false"),
		.SEPARATE_I_O_CLOCKS ("false"),
		.BUFFER_TYPE         ("single-ended"),
		.PSEUDO_DIFF         ("false"),
		.ARESET_MODE         ("none"),
		.SRESET_MODE         ("none"),
		.OPEN_DRAIN          ("false"),
		.BUS_HOLD            ("false"),
		.ENABLE_OE           ("false"),
		.ENABLE_CKE          ("false"),
		.ENABLE_TERM         ("false")
	) core (
		.dout               (dout),   //  output,  width = 1,   dout.export
		.pad_in             (pad_in), //   input,  width = 1, pad_in.export
		.cke                (1'b1),   // (terminated),                    
		.ck_fr_in           (1'b0),   // (terminated),                    
		.ck_fr_out          (1'b0),   // (terminated),                    
		.ck_in              (1'b0),   // (terminated),                    
		.ck_out             (1'b0),   // (terminated),                    
		.ck_fr              (1'b0),   // (terminated),                    
		.ck                 (1'b0),   // (terminated),                    
		.ck_hr_in           (1'b0),   // (terminated),                    
		.ck_hr_out          (1'b0),   // (terminated),                    
		.ck_hr              (1'b0),   // (terminated),                    
		.din                (1'b0),   // (terminated),                    
		.oe                 (1'b0),   // (terminated),                    
		.pad_io             (),       // (terminated),                    
		.pad_io_b           (),       // (terminated),                    
		.pad_in_b           (1'b0),   // (terminated),                    
		.pad_out            (),       // (terminated),                    
		.pad_out_b          (),       // (terminated),                    
		.terminationcontrol (1'b0),   // (terminated),                    
		.aclr               (1'b0),   // (terminated),                    
		.aset               (1'b0),   // (terminated),                    
		.sclr               (1'b0),   // (terminated),                    
		.sset               (1'b0)    // (terminated),                    
	);

endmodule