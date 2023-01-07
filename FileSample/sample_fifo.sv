`timescale 1ns / 1ps

module sample_fifo #(
     parameter FIFO_WIDTH = 16
    ,parameter FIFO_DEPTH = 1000 // number of label for classification problem
) (
     input                            clk
    ,input                            rst_n

    ,input                            i_flush // empty the FIFO
    ,input                            i_read_rst // reset read pointer
    ,input                            i_mark_read_rst // mark the reset point of read pointer

    ,input                            i_push
    ,input  [FIFO_WIDTH-1:0]          i_rear
    ,output                           o_is_full

    ,input                            i_pop
    ,output [FIFO_WIDTH-1:0]          o_front
    ,output                           o_vld 
    ,output                           o_empty
);
endmodule