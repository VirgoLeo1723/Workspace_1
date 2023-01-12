`timescale 1ns / 1ps
module multi_fifo(CLK, RESET, I_PUSH, I_REAR, I_R_EN, DATA_OUT, EMPTY, FULL);
	parameter 	NO_FIFO	= 4;
	parameter	WIDTH		= 16;	
	
	input								CLK, RESET;
	input		[NO_FIFO-1:0]			I_R_EN;
	input		[NO_FIFO-1:0]			I_PUSH;
	input		[NO_FIFO*WIDTH-1:0]	I_REAR;

	output	    [NO_FIFO*WIDTH-1:0]	DATA_OUT;
	output	    [NO_FIFO-1:0] 			FULL;
	output	    [NO_FIFO-1:0]			EMPTY;
		
	genvar index;
	generate
			for (index=0; index<NO_FIFO; index=index+1) begin: FIFO
				fifo INST0 (	
									.CLK		(CLK), 
									.RESET	    (RESET), 
									.RD_EN	    (I_R_EN[index]),
									.WR_EN	    (I_PUSH[index]),
									.DATA_IN	(I_REAR[(index+1)*WIDTH-1:index*WIDTH]), 
									.DATA_OUT   (DATA_OUT[(index+1)*WIDTH-1:index*WIDTH]), 
									.FULL	    (FULL[index]), 
									.EMPTY	    (EMPTY[index])
								);
			end
	endgenerate
endmodule