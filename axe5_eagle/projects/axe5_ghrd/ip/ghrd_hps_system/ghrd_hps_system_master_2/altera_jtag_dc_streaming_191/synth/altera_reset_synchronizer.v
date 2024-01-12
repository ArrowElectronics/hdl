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


// $Id: //acds/rel/23.4/ip/iconnect/merlin/altera_reset_controller/altera_reset_synchronizer.v#1 $
// $Revision: #1 $
// $Date: 2023/10/12 $

// -----------------------------------------------
// Reset Synchronizer
// -----------------------------------------------
`timescale 1 ns / 1 ns

module altera_reset_synchronizer
#(
    parameter ASYNC_RESET = 1,
    parameter DEPTH       = 2
)
(
    input   reset_in /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101" */,

    input   clk,
    output  reset_out
);

    // -----------------------------------------------
    // Synchronizer register chain. We cannot reuse the
    // standard synchronizer in this implementation 
    // because our timing constraints are different.
    //
    // Instead of cutting the timing path to the d-input 
    // on the first flop we need to cut the aclr input.
    // 
    // We omit the "preserve" attribute on the final
    // output register, so that the synthesis tool can
    // duplicate it where needed.
    // -----------------------------------------------
    (*preserve*) reg [DEPTH-1:0] altera_reset_synchronizer_int_chain;
    reg altera_reset_synchronizer_int_chain_out;

    generate if (ASYNC_RESET) begin

        // -----------------------------------------------
        // Assert asynchronously, deassert synchronously.
        // -----------------------------------------------
        always @(posedge clk or posedge reset_in) begin
            if (reset_in) begin
                altera_reset_synchronizer_int_chain <= {DEPTH{1'b1}};
                altera_reset_synchronizer_int_chain_out <= 1'b1;
            end
            else begin
                altera_reset_synchronizer_int_chain[DEPTH-2:0] <= altera_reset_synchronizer_int_chain[DEPTH-1:1];
                altera_reset_synchronizer_int_chain[DEPTH-1] <= 0;
                altera_reset_synchronizer_int_chain_out <= altera_reset_synchronizer_int_chain[0];
            end
        end

        assign reset_out = altera_reset_synchronizer_int_chain_out;
     
    end else begin

        // -----------------------------------------------
        // Assert synchronously, deassert synchronously.
        // -----------------------------------------------
        always @(posedge clk) begin
            altera_reset_synchronizer_int_chain[DEPTH-2:0] <= altera_reset_synchronizer_int_chain[DEPTH-1:1];
            altera_reset_synchronizer_int_chain[DEPTH-1] <= reset_in;
            altera_reset_synchronizer_int_chain_out <= altera_reset_synchronizer_int_chain[0];
        end

        assign reset_out = altera_reset_synchronizer_int_chain_out;
 
    end
    endgenerate

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "Gwt3whRcE3+dmXyqrSB7tq2BawD3oh9aWud7Z4eAN187O43IWvM/KG8cuzSO3rcLdOg/6M8a5bUzV8fSCamrY3rLfHnQy43nef+FViJgCalid4DqTidvdzU87e5ZQ/v7HVm3olDBJc6LsbYrqiDrF0RkIcqQRi4zpc6Rtw0M2aW8FBhW2R9GBM/OcdpnaI+Km4xIFjjLOMKR0kXUH+3JyiE6l+btThmGIC55ugx3xhpGfzZ7Gj+UdFLnQw3NeTxpMHF4p1IrqkQ68+tgIFJZiOoy7WBV6OF0FFL6nsltxFMLd3OZdmulYHGpGJqkSO6QNvDddo+JBiBcLsYKMVFXYXGfxt7aumDSE8ADGfULJLAT+2O+ITsth9UHJ0HuEcZu1uLcFCLUh31rFGhAyAci3cpxOZUqatjMJCmK0S8kcSgomPyNQOMKQ3gOa326K4pcUfkajFDL79nNaS8Zk5U9VhpaKuors0/CwaIJe5f48VkNW85eC/nq6SY/zEH7hrjFamGyJxp5hLMa0k8jnRWuplJQ4BhBKBR8N/H0Oj/MyvdvE82u+JBoWrCi9Y1Fcwmc//IHILrxisgrEtBrrFpybsSgJpQ3oLkUSQXG16ca+xiUMW/ZKCukFNyH7RoAjQJGcttIhzxikfS73iup1B/WW3oV6cTur0DdfVNy4COQ7dK25yGguXmo5vmmeDN3OqcULcUcM0JrvsdITLBqOKBC5hfOaxLIV84QnumyNxSH5ixZYluXbzIlYHfWgsulEALWGhmwIWOEO+M9uolcqjIvluNjemkXl5L5Y0nzLqRRpG9o7su5qCBPG9it11kEnHvbDaOg4cRYrTdVRfqIySLNm9zel9yxNXWZuAbOjdv41gThH+wH1c/+6rStymy8uaggh5LHkx3Ht8G42RTMvbxBTvlCies2qyO/BBlHsVj35c1oj8mwNHp4iPjGelTHgtjR9FbS9/lfUd3LOM7AP29S5xpc44EAbAjLVxKyAXhdVjI1pcsi4lBi+Zr5s6r2XwUt"
`endif