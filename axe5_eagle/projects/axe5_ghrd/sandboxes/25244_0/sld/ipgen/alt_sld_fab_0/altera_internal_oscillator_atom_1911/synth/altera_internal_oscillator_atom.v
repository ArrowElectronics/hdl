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


// $Id: //acds/main/ip/pgm/altera_nd_mailbox_avst_adap/altera_nd_mailbox_avst_adap.sv#2 $
// $Revision: #2 $
// $Date: 2015/10/19 $
// $Author: tgngo $

`timescale 1 ps / 1 ps
(*altera_attribute = "-name INTERFACES \"\
{\
    'version' : '1',\
    'interfaces' : [\
        {\
            'type' : 'altera:instrumentation:generic_bp_promote:1.0',\
            'ports' : [\
                {\
                    'name' : 'clk',\
                    'role' : 's10_osc_clk'\
                }\
            ],\
            'parameters' : [\
                {\
                    'name' : 'SECTION_ID',\
                    'value' : '***reserved_s10_xcvr***'\
                }\
            ]\
        }\
    ]\
}\
\" -to |" *)
module  altera_internal_oscillator_atom
    ( 
    clk
    );

    parameter DEVICE_FAMILY   = " Stratix 10";
    output   clk;
    wire  wire_clk;
    assign clk = wire_clk;
        
    // -----------------------------------
    // Instantiate wysiwyg for oscillator
    // -----------------------------------
    fourteennm_sdm_oscillator oscillator_dut ( 
        .clkout(wire_clk),
        .clkout1()
    );
    
endmodule //altera_int_osc
//VALID FILE
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "cIkW1e1yn70pv3rzQcdW84yfC0pUHFaLhwIH7SIVLXL5JtzslqfIJyQ1VCqJYjwxWaa533dobUL5YFoQlZ+syNEV9FhvuzCwjOzcAZRkgeKmmJLciMW+fuHJvbcY0bLTKS8mes2f+sx0ZrCFx2CG/0my6fSnGKpsiW4NJQAAvAP3eijwHoLwTw8uETVIp23JiKkSUWXcDq7KsrWkEH25zJvkku+qk9+PQLpI/0FRiHu3TVeBw6QbMCVHSqr9NCIRMK8h4IXZ/ntRiP/LAz44cIFqRdjoo6bm3OFZXptBre07dUXUZ3335IF83XqPp3d0i7h7sg+tZEgagVaJKdYoYW0Wa54zSChVXdGsd8ezTJi+z622Q4ZSKpIZBpgIHVX3TQdk6lJTbJoqRED7HlPlK6hF8wre5akhUhWz2AwqUUKVThUqVvguQ+XDc/BrHNovAkjaAZ7rLEIursHSEuauSp/hz+cgXMIJEyx2/au0z1mmY9b3e8c7QOIRnNiaptPKQXzCArcjjG3dTMQfe5f/VyrruMKZckRNXvJeFF8oXMGEVYXTlWm5mDdtqYNR1e68c6IMuRXJnL7Bnyu0CLE2FBvNXJRPstp2mmi3OvcUniyZDqJVPufdMpgH0RWx6213T5UXPKWCrR2LO6lT8EfS9+YjKUmpTBhyHX5tLDkrNuU75/GazOD3DnH6v0wNdYmbi+pFhxBN4grTx5J/K6Cpp2UESGkI9v6ilk5WA10nS/v4wwKBbpTtFUMPg51CbbO+CnOMInfXmXl9MIlTfVNYaDuyQ8wBjnxsSrXfmQ3Y+PfBLqFzOPveQ20WY+4E0j6+ZpJTMeP21M2suTI24rakEuQR8WaxZv3iz64aj0CzsOpkWacC6dTWfk4CdsxZu1rAcVx5m7NBxNEyUmkZ8OYdWzodTTYDPphdm6vhSSGrgOhyHQYyh1oHE+TQJNTD8d9O9fOQT/Qc9pnjoRziDTDuqnbNA9rNF+ohijHWrg6otDpzvNOcruFUTZUtihN5fkKL"
`endif