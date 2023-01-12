`timescale 1ns / 1ps
module multiplexer(SELECT, DATA_IN, DATA_OUT);
	parameter	NO_INPUT	= 4;
	parameter	WIDTH		= 16;
	parameter	BITS		= 2;
	input		[NO_INPUT*WIDTH-1:0]    DATA_IN;
	input		[BITS-1:0]              SELECT;
	
	output	    [WIDTH-1:0]				DATA_OUT;
	
	assign DATA_OUT = (WIDTH'(DATA_IN[(SELECT)*WIDTH+:WIDTH]));
endmodule