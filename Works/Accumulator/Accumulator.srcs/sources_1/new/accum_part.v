`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2023 10:02:11 PM
// Design Name: 
// Module Name: accum_part
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module accum_part(CLK, RESET, IS_CLF, IS_ACCUM_FIN, DATA_IN, DATA_OUT);
    parameter   NO_LABEL = 4;
    parameter   WIDTH    = 16;
    parameter   BITS     = 2;
    
    input                               CLK, RESET, IS_CLF, IS_ACCUM_FIN;
    input       [NO_LABEL-1:0]          DATA_IN;
    output      [NO_LABEL*WIDTH-1:0]    DATA_OUT;
    
    accumulator_label INST0 (CLK, RESET, IS_CLF, IS_ACCUM_FIN, DATA_IN, DATA_OUT);
endmodule
