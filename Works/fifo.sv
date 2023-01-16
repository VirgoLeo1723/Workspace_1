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


module fifo(clk, rst_n, in_fifo, out_fifo, i_push, is_fifo_empty, is_fifo_full);
    parameter FIFO_WIDTH    = 16;
    parameter FIFO_DEPTH    = 8;
    parameter BIT_WIDTH     = 4; 
         
    input       clk;
    input       rst_n;
    input       i_push;
    input       i_pop;
    input       [FIFO_WIDTH-1:0] in_fifo;
    output reg  [FIFO_WIDTH-1:0] out_fifo;
    output      is_fifo_empty;
    output      is_fifo_full;
    
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
            if(!i_push & re_fifo)
            begin
                rd_pt <= rd_pt + 1;
                wr_pt <= wr_pt;
            end
            if(i_push & i_pop)
            begin
                if(is_fifo_full)
                begin
                    rd_pt <= rd_pt + 1;
                end
                if(is_fifo_empty)
                begin
                    wr_pt <= wr_pt + 1;
                end
            end
        end
    end
endmodule
