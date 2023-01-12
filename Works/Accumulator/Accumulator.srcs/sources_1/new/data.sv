`timescale 1ns / 1ps
module data (CLK, RESET, IS_EMPTY, RD_EN, DATA_IN, DATA_OUT);
    parameter	NO_FIFO	    = 4;
	parameter	NO_LABEL	= 4;
	parameter 	WIDTH		= 16;
	parameter	BITS		= 2;
	
	
	input									CLK, RESET;
	input			[NO_FIFO-1:0]			IS_EMPTY;
	input			[NO_FIFO*WIDTH-1:0]		DATA_IN;
	
	output			[NO_LABEL-1:0]			DATA_OUT;
	output reg		[NO_FIFO-1:0]			RD_EN;
    
    process_data INST0 (
                            .CLK        (CLK), 
                            .RESET      (RESET), 
                            .IS_EMPTY   (IS_EMPTY), 
                            .RD_EN      (RD_EN), 
                            .DATA_IN    (DATA_IN), 
                            .DATA_OUT   (DATA_OUT)
                        );
endmodule
