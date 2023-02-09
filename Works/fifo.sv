`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 05:54:26 PM
// Design Name: 
// Module Name: fifo
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


module fifo(clk, rst_n, in_fifo, out_fifo, i_push, i_pop, i_flush, is_fifo_empty, is_fifo_full);
    parameter FIFO_WIDTH    = 16;
    parameter FIFO_DEPTH    = 8;
    parameter BIT_WIDTH     = 3; 
         
    input       clk;
    input       rst_n;
    input       i_push;
    input       i_pop;
    input       i_flush;
    input       [FIFO_WIDTH-1:0] in_fifo;
    output reg  [FIFO_WIDTH-1:0] out_fifo;
    output reg     is_fifo_empty;
    output reg     is_fifo_full;
    
    logic [FIFO_WIDTH-1:0] ram [FIFO_DEPTH-1:0];
    logic [BIT_WIDTH:0] rd_pt, wr_pt;
    logic re_fifo, we_fifo;
    //assign pt_run   = (wr_pt > rd_pt) ? wr_pt - rd_pt : rd_pt - wr_pt;
    assign re_fifo  = (~is_fifo_empty) & i_pop;
    assign we_fifo  = (~is_fifo_full) & i_push;
    
    //-------------------------------------THRESHOLD-----------------------------------------//
    always @(*)
    begin
       is_fifo_full     =   ({~wr_pt[BIT_WIDTH], wr_pt[BIT_WIDTH-1:0]} == rd_pt);
       is_fifo_empty    =   (wr_pt == rd_pt);
    end 
    //----------------------------WRITE: LOAD DATA FROM DTP TO FIFO--------------------------//
    always_ff @(posedge clk)
    begin
        if(!rst_n  || i_flush)
        begin
            wr_pt <= 0;
        end
        else if (we_fifo || (i_push & i_pop & is_fifo_empty))
        begin
            ram[wr_pt] <= in_fifo;
            wr_pt <= wr_pt + 1;
        end 
    end
    
    //-------------------------------READ: LOAD DATA FROM FIFO TO MUX------------------------------//
    always_ff @(posedge clk)
    begin
        if(!rst_n  || i_flush)
        begin
            rd_pt <= 0;
        end
        else if (re_fifo || (i_push & i_pop & is_fifo_full))
        begin
            out_fifo <= ram[rd_pt];
            rd_pt <= rd_pt + 1;
        end
    end 
    
endmodule
