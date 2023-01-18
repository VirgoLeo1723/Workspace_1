`timescale 1ns / 1ps
//module fifos_part (CLK, RESET, I_PUSH, I_REAR, I_R_EN, DATA_OUT, EMPTY, FULL);
//    parameter 	NO_FIFO	= 4;
//	parameter	WIDTH		= 16;	
	
//	input								CLK, RESET;
//	input		[NO_FIFO-1:0]			I_R_EN;
//	input		[NO_FIFO-1:0]			I_PUSH;
//	input		[NO_FIFO*WIDTH-1:0]	    I_REAR;

//	output	    [NO_FIFO*WIDTH-1:0]	    DATA_OUT;
//	output	    [NO_FIFO-1:0] 			FULL;
//	output	    [NO_FIFO-1:0]			EMPTY;
//    multi_fifo INST0 (
//                        CLK, 
//                        RESET, 
//                        I_PUSH, 
//                        I_REAR, 
//                        I_R_EN, 
//                        DATA_OUT, 
//                        EMPTY, 
//                        FULL
//                   );
//endmodule

module fifos_part (clk, rst_n, in_fifo, out_fifo, i_push, i_pop, is_fifo_full, is_fifo_empty);
	parameter	N_DTPS 	     = 4;
	parameter	FIFO_WIDTH 	 = 16;
	
	input		clk, rst_n; 
	input       [N_DTPS*FIFO_WIDTH-1:0] in_fifo;      //i_in_fifo_rear
    output      [N_DTPS*FIFO_WIDTH-1:0] out_fifo;
    input       [N_DTPS-1:0] i_push, i_pop;           //i_in_fifo_push
	output      [N_DTPS-1:0] is_fifo_full;
	output      [N_DTPS-1:0] is_fifo_empty;
	
	multi_fifo INST0 (clk, rst_n, in_fifo, out_fifo, i_push, i_pop, is_fifo_full, is_fifo_empty);

endmodule
