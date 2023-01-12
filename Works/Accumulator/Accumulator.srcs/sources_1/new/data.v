`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2023 05:15:10 PM
// Design Name: 
// Module Name: data
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


module data(
    CLK, RESET, IS_EMPTY, RD_EN, DATA_IN, DATA_OUT
    );
    
    parameter	NO_FIFO	    = 4;
	parameter	NO_LABEL	= 4;
	parameter 	WIDTH		= 16;
	parameter	BITS		= 2;
	
	input									CLK, RESET;
	input			[NO_FIFO-1:0]			IS_EMPTY;
	input			[NO_FIFO*WIDTH-1:0]		DATA_IN;
	
	output			[NO_LABEL-1:0]			DATA_OUT;
	output reg		[NO_FIFO-1:0]			RD_EN;
	
	process_data INTS0 (
                            CLK, 
                            RESET, 
                            IS_EMPTY, 
                            RD_EN, 
                            DATA_IN, 
                            DATA_OUT
                        );
endmodule
