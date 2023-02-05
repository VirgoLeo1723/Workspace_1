`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 02:05:18 PM
// Design Name: 
// Module Name: multi_fifo
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


module fifo_gen(clk, rst_n, in_fifo, out_fifo, i_push, i_pop, is_fifo_full, is_fifo_empty);
	parameter	N_DTPS 	     = 4;
	parameter	FIFO_WIDTH 	 = 16;
	
	input		clk, rst_n; 
	input       [N_DTPS*FIFO_WIDTH-1:0] in_fifo;      //i_in_fifo_rear
    output      [N_DTPS*FIFO_WIDTH-1:0] out_fifo;
    input       [N_DTPS-1:0] i_push;                  //i_in_fifo_push
    input       [N_DTPS-1:0] i_pop;
	output      [N_DTPS-1:0] is_fifo_full;
	output      [N_DTPS-1:0] is_fifo_empty;
	
	// generate instance for counter
	// in this example i tried to create 5 counter connected serially
	// after previous counter count to MAX value, it allow the next counter start to count
	generate 
		for (genvar index=0; index<N_DTPS; index=index+1) begin : FIFO
			fifo ins (
						.clk		   (clk), 
						.rst_n	       (rst_n), 
						.in_fifo	   (in_fifo[index*FIFO_WIDTH  +: FIFO_WIDTH]),
						.out_fifo	   (out_fifo[index*FIFO_WIDTH +: FIFO_WIDTH]),
						.i_push	       (i_push[index]),
						.i_pop         (i_pop[index]),
						.is_fifo_full  (is_fifo_full[index]),
						.is_fifo_empty (is_fifo_empty[index])
						);
		end
	endgenerate
endmodule
