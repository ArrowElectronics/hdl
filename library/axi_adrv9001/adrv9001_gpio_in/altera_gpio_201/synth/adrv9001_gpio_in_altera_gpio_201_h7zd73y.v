// adrv9001_gpio_in_altera_gpio_201_h7zd73y.v

// This file was auto-generated from altera_gpio_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 20.1 720

`timescale 1 ps / 1 ps
module adrv9001_gpio_in_altera_gpio_201_h7zd73y (
		input  wire       ck,     //     ck.export
		output wire [1:0] dout,   //   dout.export
		input  wire [0:0] pad_in  // pad_in.export
	);

	altera_gpio #(
		.SIZE                (1),
		.PIN_TYPE            ("input"),
		.REGISTER_MODE       ("ddr"),
		.HALF_RATE           ("false"),
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
		.ck                         (ck),                   //     ck.export
		.dout                       (dout),                 //   dout.export
		.pad_in                     (pad_in),               // pad_in.export
		.cke                        (1'b1),                 // (terminated)
		.ck_fr_in                   (1'b0),                 // (terminated)
		.ck_fr_out                  (1'b0),                 // (terminated)
		.ck_in                      (1'b0),                 // (terminated)
		.ck_out                     (1'b0),                 // (terminated)
		.ck_fr                      (1'b0),                 // (terminated)
		.ck_hr_in                   (1'b0),                 // (terminated)
		.ck_hr_out                  (1'b0),                 // (terminated)
		.ck_hr                      (1'b0),                 // (terminated)
		.din                        (2'b00),                // (terminated)
		.oe                         (1'b0),                 // (terminated)
		.pad_io                     (),                     // (terminated)
		.pad_io_b                   (),                     // (terminated)
		.pad_in_b                   (1'b0),                 // (terminated)
		.pad_out                    (),                     // (terminated)
		.pad_out_b                  (),                     // (terminated)
		.seriesterminationcontrol   (16'b0000000000000000), // (terminated)
		.parallelterminationcontrol (16'b0000000000000000), // (terminated)
		.aclr                       (1'b0),                 // (terminated)
		.aset                       (1'b0),                 // (terminated)
		.sclr                       (1'b0),                 // (terminated)
		.sset                       (1'b0)                  // (terminated)
	);

endmodule
