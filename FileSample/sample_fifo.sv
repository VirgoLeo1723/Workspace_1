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
    ,input [FIFO_WIDTH-1:0]           i_rear
    ,output reg                       o_is_full

    ,input                            i_pop
    ,output [FIFO_WIDTH-1:0]          o_front
    ,output reg                       o_vld 
    ,output reg                       o_empty
);

    logic[FIFO_WIDTH-1:0] wptr, rptr;
    logic[FIFO_WIDTH-1:0] mark_ptr;
    logic[FIFO_WIDTH-1:0] pointer_result;
    logic we, re;
    
    assign pointer_result = wptr - rptr;
    assign re = (~o_empty) & i_pop;
    assign we = (~o_is_full)&i_push;
    
    blk_mem_gen_0 b(
        .clka(clk),
        .clkb(clk),
        .addra(wptr),
        .addrb(rptr),
        .dina(i_rear),
        .doutb(o_front),
        .wea(we)
    );
    
    always @(*)
    begin
        o_is_full = pointer_result == FIFO_DEPTH;
        o_empty = pointer_result == 0;
    end

    // MARK
    always_ff @(posedge clk) begin
        if(!rst_n)
            mark_ptr <= 0;
        else if (i_mark_read_rst)
            mark_ptr <= rptr;
        else
            mark_ptr <= mark_ptr;
    end
    
    // READ

    always_ff @(posedge clk) begin
        if(!rst_n || i_flush)
            rptr <= 0;
        else if (i_read_rst)
            rptr <= mark_ptr;
        else if (re)
            rptr <= rptr + 1;
        else
            rptr <= rptr;
    end
    
    // WRITE
    always_ff @(posedge clk) begin
        if(!rst_n || i_flush)
            wptr <= 0;
        else if (we)
            wptr <= wptr + 1;
        else
            wptr <= wptr;
    end
endmodule
