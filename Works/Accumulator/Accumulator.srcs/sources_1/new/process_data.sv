`timescale 1ns / 1ps
module process_data(
    CLK, RESET, IS_EMPTY, RD_EN, DATA_IN, DATA_OUT
    );
    parameter	NO_FIFO	    = 4;
	parameter	NO_LABEL	= 4;
	parameter 	WIDTH		= 16;
	parameter	BITS		= 2;

    input									CLK, RESET;
	input			[NO_FIFO-1:0]			IS_EMPTY;
	input			[NO_FIFO*WIDTH-1:0]		DATA_IN;
	
	output			[NO_LABEL-1:0]			DATA_OUT;
	output reg		[NO_FIFO-1:0]			RD_EN;
    
    reg			[BITS-1:0]		index_of_fifo;
	reg			[BITS-1:0]		select;
	wire		[WIDTH-1:0]		sample_result;
	
    multiplexer	inst1   ( 
                            .SELECT		(index_of_fifo), 
                            .DATA_IN	(DATA_IN), 
                            .DATA_OUT	(sample_result)
                        );
	demultiplexer inst2 (
                            .SELECT		(sample_result[BITS-1:0]),
                            .DATA_OUT	(DATA_OUT)
                        );
                        
	defparam inst1.NO_INPUT		= 4;
	defparam inst1.BITS			= 2;
	
	defparam inst2.NO_OUTPUT 	= 4;
	defparam inst2.BITS			= 2;
	
	
	always_ff @(posedge CLK) begin
		if (!RESET || index_of_fifo == NO_FIFO)  index_of_fifo <= 0;
		else index_of_fifo <= index_of_fifo + 1;
	end
	always_ff @(index_of_fifo) begin
		if (!IS_EMPTY[index_of_fifo]) begin
			RD_EN 	<= (NO_FIFO'(1<<index_of_fifo));
		end
	end
endmodule
