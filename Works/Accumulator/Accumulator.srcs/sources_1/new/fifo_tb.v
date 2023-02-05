`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2023 04:29:30 PM
// Design Name: 
// Module Name: fifo_tb
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


module fifo_tb(
        input clk, rst_n
        ,input i_in_fifo_rear
        ,input i_in_fifo_push 
    );
    fifo_gen multi_fifo (
                        .clk            (clk), 
                        .rst_n          (rst_n), 
                        .in_fifo        (i_in_fifo_rear), 
                        .out_fifo       (o_fifo_out), 
                        .i_push         (i_in_fifo_push), 
                        .i_pop          (i_fifo_rd_en), 
                        .is_fifo_full   (o_in_fifo_is_full), 
                        .is_fifo_empty  (o_in_fifo_is_empty)
                     );
endmodule
