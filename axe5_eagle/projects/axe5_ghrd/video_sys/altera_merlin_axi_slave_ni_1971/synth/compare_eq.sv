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


`timescale 1ps/1ps

module compare_eq #(
    parameter WIDTH=10
) (
    input [WIDTH-1:0]  in_a,
    input [WIDTH-1:0]  in_b,
    output             equal
);

assign equal = (in_a==in_b);

endmodule 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "bfJJGqHwlkOIjUtfUmDE+3eVyIA1yD0axr/dj7ge4ZFITQ9CM1myKwKNIlVxszvFXuyMLvpA9xtBLLK7ngyCdyGN6C54eCPe93Ak1VLcGVgDgA4d2pRuDYg8WDVzx8BbZIFQhiXUO1FdYlZdi60I07W5PSSJMMr1aXj9VelcLI/KFjRjdquJ7S27k4+VpNQQiHjmOiAcN0nWqmUVc6wGR6CjLOHbNQMqOt2tD6CE1zhBKcl67/UtFG4oiRoiKcM8C19Nr/tPsB7xyXnybMjBYuhNp3+yqAdNuqJoru/QRBcYs1GqT2Uqqm/2qgo43G16miXXg0NloLpCRQwdIVydm6Aswq/nmarZlaADk/bzNujCnM10mpdOgOan+hqKJZ8fOnM/bMYt6bW0hMmJY3Fxq91NbxMQFIHSXnpw/eShUK2bEm/1RuzekCsKRCyjn2gepOkRbI3Q81NZmCzOj/3xjhUiFmQLf1+35fEWtBODIVG4nnyp9q4vobujAuRJRGVgWDvwKN8Prl1lbg+jlzfdokXMxpV5qVK6SvEusfUGRH+PsVars5IjJktYu9bTEm4jrxfWDiaVf9mrmF/HykpFyzwT4n3U/wJbWUT24/SwU0Lcyzhnj+1llz2ukQJpZuy+yNDjJ5yponYsVwHJc4f6hX3+Wy1ZnmHfb4933G1amsAF+wN0VSxN3cgS7fHWFbotfonh0If6nO5j9YF5LzeRDyXf/RHe8R5T6IohLXV5sm2/34N5ElRJK3GIou3bQOhyvujt7zBNDFajPA3ot3bpsbLvqHJvRJX7xpYT3fuYs3lZ6nKU1AKR00N6MNS2aJ1q11LBSmm1OT2npC1RE1kvw1dFTG3keUUYQbGVAzqUiMInEDF4mG1xFQ6bcE18AWLxnwXjKnP3+eA+DzvKaXArLCrwhb5snLmaK+0urdIwCZDRVwwpq4DF6B1P3U0kl6BTkj6HjvFDb0tyj36Bw4KFfUwx8oVChtFiDwM8bhK4BuSe9ka8MZRoAlsOK5RdVzwB"
`endif