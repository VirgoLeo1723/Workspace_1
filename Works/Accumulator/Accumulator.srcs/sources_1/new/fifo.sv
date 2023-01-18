`timescale 1ns / 1ps
//module fifo(CLK, RESET, WR_EN, RD_EN, DATA_IN, DATA_OUT, FULL, EMPTY);
//	parameter	DEPTH = 8;
//	parameter	WIDTH = 16;
//	parameter	BITS 	= 3;
//	input		CLK;
//	input		RESET;
	
//	input							WR_EN;
//	input		[WIDTH-1:0] 		DATA_IN;
//	output							FULL;
	
//	input								RD_EN;
//	output	reg	[WIDTH-1:0] DATA_OUT;
//	output							EMPTY;

	
//	reg 		[WIDTH-1:0]	mem [0:DEPTH-1];
//	reg		[BITS-1:0] 	wr_ptr /*synthesis keep*/;
//	reg		[BITS-1:0] 	rd_ptr /*synthesis keep*/;
//	reg		[BITS  :0] 	count	 /*synthesis keep*/;
	
//	assign 	FULL 	= (count == DEPTH);
//	assign 	EMPTY	= (count == 0);
	

	
////----------------------WRITE----------------------
//	always_ff @(posedge CLK or negedge RESET) begin
//		if (!RESET) begin 
//			wr_ptr <= 0;
//		end
//		else if (WR_EN & !FULL) begin
//			mem[wr_ptr] <= DATA_IN;
//			wr_ptr 		<= wr_ptr + 1;
//		end
//	end
////----------------------READ----------------------	
//	always_ff @(posedge CLK or negedge RESET) begin
//		if (!RESET) begin
//			rd_ptr 		<= 0;
//		end
//		else if (RD_EN & !EMPTY) begin
//			DATA_OUT 	<= mem[rd_ptr];
//			rd_ptr 		<= rd_ptr + 1;
//		end 
//	end
////-------------------N.o_element-------------------	
//	always_ff @(posedge CLK or negedge RESET) begin
//		if (!RESET) count <=0;
//		else begin
//			if (WR_EN & !RD_EN & !FULL) 	count <= count + 1;
//			if (RD_EN & !WR_EN & !EMPTY)	count <= count - 1;
//			if (WR_EN & RD_EN & FULL) 		count <= count - 1;
//			if (RD_EN & WR_EN & EMPTY)		count <= count + 1;
//		end
//	end
//endmodule
module fifo(clk, rst_n, in_fifo, out_fifo, i_push, i_pop, is_fifo_empty, is_fifo_full);
    parameter FIFO_WIDTH    = 16;
    parameter FIFO_DEPTH    = 8;
    parameter BIT_WIDTH     = 4; 
         
    input       clk;
    input       rst_n;
    input       i_push;
    input       i_pop;
    input       [FIFO_WIDTH-1:0] in_fifo;
    output reg  [FIFO_WIDTH-1:0] out_fifo;
    output reg                   is_fifo_empty;
    output reg                   is_fifo_full;
    
    logic [FIFO_WIDTH-1:0] ram [FIFO_DEPTH-1:0];
    logic [BIT_WIDTH-1:0] rd_pt, wr_pt;
    logic re_fifo, we_fifo;
   
    assign pt_run   = wr_pt - rd_pt;
    assign re_fifo  = (~is_fifo_empty) & i_pop;
    assign we_fifo  = (~is_fifo_full) & i_push;
    
    //-------------------------------------THRESHOLD-----------------------------------------//
    always @(*)
    begin
       is_fifo_full     =   (pt_run == FIFO_DEPTH);
       is_fifo_empty    =   (pt_run == 0);
    end
    
    //----------------------------WRITE: LOAD DATA FROM DTP TO FIFO--------------------------//
    always_ff @(posedge clk)
    begin
        if(!rst_n)
        begin
            wr_pt <= 0;
        end
        else if (we_fifo)
        begin
            ram[wr_pt] <= in_fifo;
            wr_pt <= wr_pt + 1;
        end 
    end
    
    //-------------------------------READ: LOAD DATA FROM FIFO TO MUX------------------------------//
    always_ff @(posedge clk)
    begin
        if(!rst_n)
        begin
            rd_pt <= 0;
        end
        else if (re_fifo)
        begin
            out_fifo <= ram[rd_pt];
            rd_pt <= rd_pt + 1;
        end 
    end
    
    always_ff @(posedge clk)
    begin
        if(!rst_n)
        begin
            rd_pt <= 0;
            wr_pt <= 0;
        end
        else
        begin
            if(!i_pop & i_push & !is_fifo_full)
            begin
                wr_pt <= wr_pt + 1;
                rd_pt <= rd_pt;
            end
            if(!i_push & i_pop & !is_fifo_empty)
            begin
                rd_pt <= rd_pt + 1;
                wr_pt <= wr_pt;
            end
            if(i_push & i_pop & is_fifo_full)
            begin
                rd_pt <= rd_pt + 1;
            end
            if(i_push & i_pop & is_fifo_empty)
            begin
                wr_pt <= wr_pt + 1;
            end
        end
    end
endmodule