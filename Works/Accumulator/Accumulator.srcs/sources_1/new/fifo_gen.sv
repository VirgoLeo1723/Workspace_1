`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/13/2023 04:44:49 PM
// Design Name: 
// Module Name: fifo_gen
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


module fifo_gen(clk, rst_n, in_fifo, out_fifo, i_push, i_pop, i_flush, is_fifo_full, is_fifo_empty);
	parameter	N_DTPS 	     = 4;
	parameter	FIFO_WIDTH 	 = 16;
	
	input		clk, rst_n; 
	input       [N_DTPS*FIFO_WIDTH-1:0] in_fifo;      //i_in_fifo_rear
    output reg  [N_DTPS*FIFO_WIDTH-1:0] out_fifo;
    input       [N_DTPS-1:0] i_push,i_pop;
    input                    i_flush;                  
	output      [N_DTPS-1:0] is_fifo_full;
	output      [N_DTPS-1:0] is_fifo_empty;
	
	// generate instance for counter
	// in this example i tried to create 5 counter connected serially
	// after previous counter count to MAX value, it allow the next counter start to count
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
						.i_flush       (i_flush),
						.is_fifo_full  (is_fifo_full[index]),
						.is_fifo_empty (is_fifo_empty[index])
						);
		end
	endgenerate
endmodule
