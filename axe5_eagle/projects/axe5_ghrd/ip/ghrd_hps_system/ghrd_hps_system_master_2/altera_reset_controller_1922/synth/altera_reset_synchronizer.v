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
`pragma questa_oem_00 "bfJJGqHwlkOIjUtfUmDE+3eVyIA1yD0axr/dj7ge4ZFITQ9CM1myKwKNIlVxszvFXuyMLvpA9xtBLLK7ngyCdyGN6C54eCPe93Ak1VLcGVgDgA4d2pRuDYg8WDVzx8BbZIFQhiXUO1FdYlZdi60I07W5PSSJMMr1aXj9VelcLI/KFjRjdquJ7S27k4+VpNQQiHjmOiAcN0nWqmUVc6wGR6CjLOHbNQMqOt2tD6CE1zijRvl6WrtR+oh5fPw7c1wm/d+HswVXgIrZKkhDxfxQKgf0d9HK2ffNvAka/l8bx8Ga/ien5cuDIZ2Jbh3YggHKWZv9lkmG+y35O5/CXKlXpDGeggDSWv+Z2oYor7z+YorzmI1xdhQF4P6aq+y1TME8TjQGljLByJ34W6Pz3X/dLYd8N8YFoK66XmIVphZdsWD9PTBbSsAEeb6looJjw9xEjD/EesAe9ETTy9B6SBWbvONQCJxZ8CY85w0UtyK9Ld775+f775HTI9e1A4MwaSLLtKRApxTFZoQ19Db7tAi29LjOEoq7mJUvtQc/lGsPVTnVrJv8LKSCqPhANW0vfoOBUEof5rdVPaWP9q6qrwMvQB02u0iaiW0xFpglpAJ7lKrOdumyoa8+03kP8JaFd1WQauICONgb6Qmo5LtSF2Kh6eHfxqp4O2A+a0e3GMWhCMgFTubK1NIOs1YTsu2nkTebtjzHug971DmvejmntLZJEhvtm6zKEI+rK1aKvL5qExHg8O2wc7Y6eBSdN34T4/k/qdnrYa8ZQmjNar6/MW/IdR49zUn1Q/XH8Z3E7sWp11o/ZhSX7wjwUxAaGrmO57I9RVUs4uVqJcY9Yh6Dvvq4Fw/uIUpDWsYa0mNror7l9Hz16rel8CdtafwWDTIttj0MWd5arp3JN1e3UoNhVJGqvxt4SZyVc5P2hJIwx48kVpkYY45k82TwyMUbqqvPBt0JbBiAp6+NxSiEH6pWONU7KvlWHgQnCwYlyqlBSF5MJD9nl5DUINTp410puzay1uIb"
`endif