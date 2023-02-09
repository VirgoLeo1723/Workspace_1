`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 02:51:23 PM
// Design Name: 
// Module Name: fifo_test
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


module fifo_test;
    parameter FIFO_WIDTH    = 16;
    parameter FIFO_DEPTH    = 8;
    parameter BIT_WIDTH     = 4; 
    reg clk;
    reg rst_n;
    reg [FIFO_WIDTH-1:0] in_fifo;
    reg i_push;
    reg i_pop;
    reg i_flush;
    wire [FIFO_WIDTH-1:0] out_fifo;
    wire is_fifo_empty;
    wire is_fifo_full;
    
    fifo uut(
            .clk (clk),
            .rst_n (rst_n),
            .in_fifo (in_fifo),
            .i_push (i_push),
            .i_pop (i_pop),
            .i_flush (i_flush),
            .out_fifo (out_fifo),
            .is_fifo_empty (is_fifo_empty),
            .is_fifo_full (is_fifo_full)
            );
            
     initial begin
     clk = 1'b0;
     in_fifo = 32'h0;
     i_push = 1'b0;
     i_pop = 1'b0;
     rst_n = 1'b0;
     i_flush = 1'b0;
     
     #100 
     rst_n = 1'b0;
     
     #20 
     rst_n = 1'b1;
     i_push = 1'b1;
     i_pop = 1'b1;
     
     
     in_fifo = 32'h0;
     
     #20 
     i_pop = 1'b1;
     in_fifo = 32'h1;
     
     #20
     i_pop = 1'b0; 
     in_fifo = 32'h2;
     
     #20 
     in_fifo = 32'h3;
     
     #20
     in_fifo = 32'h4;
     //i_flush = 1'b1;
     
     #20
     in_fifo = 32'h5;
     i_flush = 1'b0;
     
     #20
     in_fifo = 32'h6;
     
     #20
     in_fifo = 32'h7;
     
     #20
     in_fifo = 32'h8;
     #20
     in_fifo = 32'h9;
     #29
     i_pop = 1'b1;
     
     
     
     end
    always #10 clk = ~clk;
endmodule
