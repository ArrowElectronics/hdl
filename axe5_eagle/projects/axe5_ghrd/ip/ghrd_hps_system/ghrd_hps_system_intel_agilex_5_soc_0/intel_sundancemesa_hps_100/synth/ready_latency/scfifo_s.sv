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


// Copyright 2021 Intel Corporation. 
//
// This reference design file is subject licensed to you by the terms and 
// conditions of the applicable License Terms and Conditions for Hardware 
// Reference Designs and/or Design Examples (either as signed by you or 
// found at https://www.altera.com/common/legal/leg-license_agreement.html ).  
//
// As stated in the license, you agree to only use this reference design 
// solely in conjunction with Intel FPGAs or Intel CPLDs.  
//
// THE REFERENCE DESIGN IS PROVIDED "AS IS" WITHOUT ANY EXPRESS OR IMPLIED
// WARRANTY OF ANY KIND INCLUDING WARRANTIES OF MERCHANTABILITY, 
// NONINFRINGEMENT, OR FITNESS FOR A PARTICULAR PURPOSE. Intel does not 
// warrant or assume responsibility for the accuracy or completeness of any
// information, links or other items within the Reference Design and any 
// accompanying materials.
//
// In the event that you do not agree with such terms and conditions, do not
// use the reference design file.
/////////////////////////////////////////////////////////////////////////////

// scfifo_s is designed as a faster and smaller replacement of scfifo
// 
// Notes
// 1. The only scfifo port not supported by scfifo_s is "eccstatus".
//    All the other ports are identical to scfifo.
//
// 2. Both "normal" and "show-ahead" modes are supported. (parameter SHOW_AHEAD)
//
// 3. almost_empty and almost_full thresholds are supported 
//    See parameters ALMOST_EMPTY_VALUE and ALMOST_FULL_VALUE
//
// 4. scfifo_s is MLAB-based and is able to store up to 31 words.
//
// 5. All MLABs are fully registered in every mode.
//    This is different from scfifo which has unregistered MLAB in show-ahead mode

module scfifo_s #(
    parameter LOG_DEPTH      = 5,
    parameter WIDTH          = 20,
    parameter ALMOST_FULL_VALUE = 30,
    parameter ALMOST_EMPTY_VALUE = 2,
    parameter SHOW_AHEAD = 0, // Show-ahead mode is using a lot of area. Use Normal mode if possible  
    parameter FAMILY = "S10", // Agilex, S10, or Other
    parameter OVERFLOW_CHECKING = 0, // Overflow checking circuitry is using extra area. Use only if you need it
    parameter UNDERFLOW_CHECKING = 0 // Underflow checking circuitry is using extra area. Use only if you need it
)(
    input clock,
    input aclr,
    input sclr,
    input [WIDTH-1:0] data,
    input wrreq,
    input rdreq,
    output [WIDTH-1:0] q,
    output [LOG_DEPTH-1:0] usedw,
    output empty,
    output full,
    output almost_empty,
    output almost_full    
);

initial begin
    if ((LOG_DEPTH >= 6) || (LOG_DEPTH <= 2))
        $error("Invalid parameter value: LOG_DEPTH = %0d; valid range is 2 < LOG_DEPTH < 6", LOG_DEPTH);

    if (WIDTH <= 0)
        $error("Invalid parameter value: WIDTH = %0d; it must be greater than 0", WIDTH);
        
    if ((ALMOST_FULL_VALUE >= 2 ** LOG_DEPTH - 1) || (ALMOST_FULL_VALUE < 4))
        $error("Incorrect parameter value: ALMOST_FULL_VALUE = %0d; valid range is 3 < ALMOST_FULL_VALUE < %0d", 
            ALMOST_FULL_VALUE, 2 ** LOG_DEPTH - 1);     

    if ((ALMOST_EMPTY_VALUE >= 2 ** LOG_DEPTH - 4) || (ALMOST_EMPTY_VALUE < 1))
        $error("Incorrect parameter value: ALMOST_EMPTY_VALUE = %0d; valid range is 0 < ALMOST_EMPTY_VALUE < %0d", ALMOST_EMPTY_VALUE, 2 ** LOG_DEPTH - 4);  

    if ((FAMILY != "Agilex") && (FAMILY != "S10") && (FAMILY != "Other"))
        $error("Incorrect parameter value: FAMILY = %s; must be one of {Agilex, S10, Other}", FAMILY);  
end

generate
if (SHOW_AHEAD == 1)
    scfifo_s_showahead #(
        .LOG_DEPTH(LOG_DEPTH),
        .WIDTH(WIDTH),
        .ALMOST_FULL_VALUE(ALMOST_FULL_VALUE),
        .ALMOST_EMPTY_VALUE(ALMOST_EMPTY_VALUE),
        .FAMILY(FAMILY),
        .OVERFLOW_CHECKING(OVERFLOW_CHECKING),
        .UNDERFLOW_CHECKING(UNDERFLOW_CHECKING)
    ) a1 (
        .clock(clock),
        .aclr(aclr),
        .sclr(sclr),
        .data(data),
        .wrreq(wrreq),
        .rdreq(rdreq),
        .q(q),
        .usedw(usedw),
        .empty(empty),
        .full(full),
        .almost_empty(almost_empty),
        .almost_full(almost_full)    
    );
else
    scfifo_s_normal #(
        .LOG_DEPTH(LOG_DEPTH),
        .WIDTH(WIDTH),
        .ALMOST_FULL_VALUE(ALMOST_FULL_VALUE),
        .ALMOST_EMPTY_VALUE(ALMOST_EMPTY_VALUE),
        .FAMILY(FAMILY),
        .OVERFLOW_CHECKING(OVERFLOW_CHECKING),
        .UNDERFLOW_CHECKING(UNDERFLOW_CHECKING)
    ) a2 (
        .clock(clock),
        .aclr(aclr),
        .sclr(sclr),
        .data(data),
        .wrreq(wrreq),
        .rdreq(rdreq),
        .q(q),
        .usedw(usedw),
        .empty(empty),
        .full(full),
        .almost_empty(almost_empty),
        .almost_full(almost_full)    
    );
endgenerate
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "0SkZjS+9fJ+j5t/1eRLDSmYlrEk+/fn1n04GXW77wQ6zIb2xNDDUSUKHuq8xgUU/x5fl5HnvXE40EQiNtcreHpQdBYyewrwz5u+N8AriKl/2eSG4Sud1BOsd+Be6VZ8eApDF6OzCBILugtUNPEmRHtAKu+6veVGtcI3VxpZp3VYIvTgRcLreIH1gSgJC0aDXHf3J/4bUCmCuzXKdIIT7JazIrfwbYZHtjFylQuGPvoaGydyygX8WA4F8DlR58weKxGC/TKk0TRDVyP+DA1LLrRh0MOLGeta0zuJZAm2hBdKAtPPatSbAMsGxG9zHOdRYZTHEWzIxxwO0pFLauYjOhLEBCrLE/pCYuaQ3/BJFbVnXk1Djd+nhs1H1VXNkSWtP9rb4cujBv8MKSE0cX33yNrlugyVfZPMhINwmiuleJCBQkTnAs27jpSGUI4jdAD9HMOo96cduCqpXyskTs1YO3Ft7FXqBGpgysxOOoiAUxXDhDsoNijCZSoi2dA93slIPH7V+cq6/pOteRYIsHp0RIgStOkQTXaM3wjW7Mzlq6pbJQmlmqVy+F+kvD/RS3M36Z+CnuL3VsI2bISxLGRcI6fKUFVMnEO390LzWqklNlda7AVdt8QkYJd0E5CWK4cayRapGk6V19XIeQaw6eZloU9wQylfLFb0WQAYLFEHu10hweEw7XDNCGCnLqZLZ/6SQJpLNJZs0tyjhB+ljMtw9Wq9XJanx9UYWhmF6gt9ifqKMQx3pEvSH6eiJNSc82pUpxZqfzsIJwysi5Sc3izODXGBP9WjYbTEVpyEJB8GezBN81JStMTGM5wjtd3swRIe40MiCiZX0kwwsv4x9nV7dfeJy5s9V4Zzfo+cJgMb+r7W56/fN6ORxgH3lxAqSbi/k4i7iF4ASsWrTLOhnk3AHgjBa9KUyrSIVIvIA3R6+60URdcE3w8cXdBiFhZiPC5gUqhWIIjuWjWCElT/xU8KNm9UrCeo8lj3MYe8E5p3uERvmXcwnusGWGZ30E9Hmr6ZU"
`endif