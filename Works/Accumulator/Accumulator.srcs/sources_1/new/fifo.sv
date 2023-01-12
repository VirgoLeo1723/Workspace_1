`timescale 1ns / 1ps
module fifo(CLK, RESET, WR_EN, RD_EN, DATA_IN, DATA_OUT, FULL, EMPTY);
	parameter	DEPTH = 8;
	parameter	WIDTH = 16;
	parameter	BITS 	= 3;
	input		CLK;
	input		RESET;
	
	input							WR_EN;
	input		[WIDTH-1:0] 		DATA_IN;
	output							FULL;
	
	input								RD_EN;
	output	reg	[WIDTH-1:0] DATA_OUT;
	output							EMPTY;

	
	reg 		[WIDTH-1:0]	mem [0:DEPTH-1];
	reg		[BITS-1:0] 	wr_ptr /*synthesis keep*/;
	reg		[BITS-1:0] 	rd_ptr /*synthesis keep*/;
	reg		[BITS  :0] 	count	 /*synthesis keep*/;
	
	assign 	FULL 	= (count == DEPTH);
	assign 	EMPTY	= (count == 0);
	
//----------------------WRITE----------------------
	always_ff @(posedge CLK or negedge RESET) begin
		if (!RESET) begin 
			wr_ptr <= 0;
		end
		else if (WR_EN & !FULL) begin
			mem[wr_ptr] <= DATA_IN;
			wr_ptr 		<= wr_ptr + 1;
		end
	end
//----------------------READ----------------------	
	always_ff @(posedge CLK or negedge RESET) begin
		if (!RESET) begin
			rd_ptr 		<= 0;
		end
		else if (RD_EN & !EMPTY) begin
			DATA_OUT 	<= mem[rd_ptr];
			rd_ptr 		<= rd_ptr + 1;
		end 
	end
//-------------------N.o_element-------------------	
	always_ff @(posedge CLK or negedge RESET) begin
		if (!RESET) count <=0;
		else begin
			if (WR_EN & !RD_EN & !FULL) 	count <= count + 1;
			if (RD_EN & !WR_EN & !EMPTY)	count <= count - 1;
			if (WR_EN & RD_EN & FULL) 		count <= count - 1;
			if (RD_EN & WR_EN & EMPTY)		count <= count + 1;
		end
	end
endmodule