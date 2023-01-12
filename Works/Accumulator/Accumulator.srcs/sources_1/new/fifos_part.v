`timescale 1ns / 1ps
module fifos_part (CLK, RESET, I_PUSH, I_REAR, I_R_EN, DATA_OUT, EMPTY, FULL);
    parameter 	NO_FIFO	= 4;
	parameter	WIDTH		= 16;	
	
	input								CLK, RESET;
	input		[NO_FIFO-1:0]			I_R_EN;
	input		[NO_FIFO-1:0]			I_PUSH;
	input		[NO_FIFO*WIDTH-1:0]	I_REAR;

	output	    [NO_FIFO*WIDTH-1:0]	DATA_OUT;
	output	    [NO_FIFO-1:0] 			FULL;
	output	    [NO_FIFO-1:0]			EMPTY;
    multi_fifo INST0 (
                        CLK, 
                        RESET, 
                        I_PUSH, 
                        I_REAR, 
                        I_R_EN, 
                        DATA_OUT, 
                        EMPTY, 
                        FULL
                   );
endmodule
