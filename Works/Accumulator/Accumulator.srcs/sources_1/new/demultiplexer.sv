`timescale 1ns / 1ps
module demultiplexer(SELECT, DATA_OUT);
	parameter	NO_OUTPUT	= 4;
	parameter	BITS		= 2;
	
	input		[BITS-1:0]			SELECT;
	output	    [NO_OUTPUT-1:0]	    DATA_OUT;
	assign	    DATA_OUT = (NO_OUTPUT'(1<<SELECT));
endmodule