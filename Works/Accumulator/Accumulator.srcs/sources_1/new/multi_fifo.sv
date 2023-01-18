`timescale 1ns / 1ps
//module multi_fifo(CLK, RESET, I_PUSH, I_REAR, I_R_EN, DATA_OUT, EMPTY, FULL);
//	parameter 	NO_FIFO	= 4;
//	parameter	WIDTH		= 16;	
	
//	input								CLK, RESET;
//	input		[NO_FIFO-1:0]			I_R_EN;
//	input		[NO_FIFO-1:0]			I_PUSH;
//	input		[NO_FIFO*WIDTH-1:0]	I_REAR;

//	output	    [NO_FIFO*WIDTH-1:0]	DATA_OUT;
//	output	    [NO_FIFO-1:0] 			FULL;
//	output	    [NO_FIFO-1:0]			EMPTY;
		
//	genvar index;
//	generate
//			for (index=0; index<NO_FIFO; index=index+1) begin: FIFO
//				fifo INST0 (	
//									.CLK		(CLK), 
//									.RESET	    (RESET), 
//									.RD_EN	    (I_R_EN[index]),
//									.WR_EN	    (I_PUSH[index]),
//									.DATA_IN	(I_REAR[(index+1)*WIDTH-1:index*WIDTH]), 
//									.DATA_OUT   (DATA_OUT[(index+1)*WIDTH-1:index*WIDTH]), 
//									.FULL	    (FULL[index]), 
//									.EMPTY	    (EMPTY[index])
//								);
//			end
//	endgenerate
//endmodule
module multi_fifo(clk, rst_n, in_fifo, out_fifo, i_push, i_pop, is_fifo_full, is_fifo_empty);
	parameter	N_DTPS 	     = 4;
	parameter	FIFO_WIDTH 	 = 16;
	
	input		clk, rst_n; 
	input       [N_DTPS*FIFO_WIDTH-1:0] in_fifo;      //i_in_fifo_rear
    output      [N_DTPS*FIFO_WIDTH-1:0] out_fifo;
    input       [N_DTPS-1:0] i_push, i_pop;                  //i_in_fifo_push
	output      [N_DTPS-1:0] is_fifo_full;
	output      [N_DTPS-1:0] is_fifo_empty;
	
	genvar 	index;
	generate 
		for (index=0; index<N_DTPS; index=index+1) begin : FIFO
			fifo INST0 (
						.clk		   (clk), 
						.rst_n	       (rst_n), 
						.in_fifo	   (in_fifo[(index+1)*FIFO_WIDTH-1:index*FIFO_WIDTH]),
						.out_fifo	   (out_fifo[(index+1)*FIFO_WIDTH-1:index*FIFO_WIDTH]),
						.i_push	       (i_push[index]),
						.i_pop         (i_pop[index]),
						.is_fifo_full  (is_fifo_full[index]),
						.is_fifo_empty (is_fifo_empty[index])
						);
		end
	endgenerate
endmodule
