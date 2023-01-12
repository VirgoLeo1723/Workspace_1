`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 01:42:11 PM
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


module fifo_tb();

    reg                            clk;
    reg                            rst_n;
    reg                            i_flush; // empty the FIFO
    reg                            i_read_rst; // reset read pointer
    reg                            i_mark_read_rst; // mark the reset point of read pointer
    
    reg                            i_push;
    reg  [15:0]                    i_rear;
    wire                           o_is_full;
    
    reg                            i_pop;
    wire  [15:0]                   o_front;
    wire                           o_vld ;
    wire                           o_empty;

sample_fifo fifo_test(
    .clk(clk),
    .rst_n(rst_n),
    .i_flush(i_flush),
    .i_read_rst(i_read_rst),
    .i_mark_read_rst(i_mark_read_rst),
    .i_push(i_push),
    .i_rear(i_rear),
    .o_is_full(o_is_full),
    .i_pop(i_pop),
    .o_front(o_front),
    .o_vld(o_vld),
    .o_empty(o_empty)
);

initial begin
    clk = 0;
    rst_n = 0;
    i_pop = 0;
    i_push = 0;
    i_rear = 0;
    i_flush = 0;
    i_mark_read_rst = 0;
    i_read_rst = 0;
end

always begin
    #4 clk <= ~clk;
end

initial begin
    #50;
    #1 rst_n = 1; i_push = 1;
    
    for (i_rear = 0; i_rear < 32; i_rear = i_rear + 1) begin
            @(negedge clk)#2;
    end
    #3 i_push = 0;
    #10 i_pop = 1;
    #5 i_push = 1;
        for (i_rear = 0; i_rear < 32; i_rear = i_rear + 1) begin
            @(negedge clk)#2;
            i_mark_read_rst = (i_rear == 5) ? 1 : 0; // ?ánh d?u v? trí reset con tr? ??c là 5
            i_read_rst = (i_rear == 10) ? 1 : 0; // Con tr? ??c quay l?i v? trí s? 5
    end
end

endmodule
