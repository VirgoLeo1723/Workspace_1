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
    ,output reg [FIFO_WIDTH-1:0]      rptr
    ,output reg [FIFO_WIDTH-1:0]      wptr
    ,output reg [FIFO_WIDTH-1:0]      data_in_bram
);

    //logic[15:0] wptr;
    //logic[15:0] data_in_bram;
    logic[15:0] rptr_in_accum;
    logic[15:0] wptr_in_accum;
    logic[15:0] mark_ptr;
    logic[15:0] pointer_result;
    logic[15:0] Q;
 
    logic we, re, bypass_rptr, bypass_wptr;
    
    assign pointer_result = wptr - rptr;
    assign re = (~o_empty) & i_pop;
    assign we = (~o_is_full) & i_push;
    
    blk_mem_gen_0 b(
        .clka(clk),
        .clkb(clk),
        .addra(wptr),
        .addrb(rptr),
        .dina(data_in_bram),
        .doutb(o_front),
        .wea(we)
    );
    
    c_accum_0 count_rptr (
      .B(rptr_in_accum),            // input wire [15 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass_rptr),  // input wire BYPASS
      .Q(rptr)            // output wire [15 : 0] Q
    );
    
    c_accum_0 count_wptr (
      .B(wptr_in_accum),            // input wire [15 : 0] B
      .CLK(clk),        // input wire CLK
      .BYPASS(bypass_wptr),  // input wire BYPASS
      .Q(wptr)            // output wire [15 : 0] Q
    );
    
    always @(*)
    begin
        o_is_full = pointer_result == FIFO_DEPTH;
        o_empty = pointer_result == 0;
    end
    //dual D_ff
    always @(posedge clk)
    begin
        Q <= i_rear;
        data_in_bram <= Q;
    end
    //mark
    always_ff @(posedge clk) begin
        if(!rst_n)
            mark_ptr <= 0;
        else
            if (i_mark_read_rst)
                mark_ptr <= rptr - 1;
            else
                mark_ptr <= mark_ptr;
    end
    
    // read
    always_ff @(posedge clk) begin
        if(!rst_n || i_flush)
        begin
            rptr_in_accum <= 0;
            bypass_rptr <= 1;
        end
        else
            if (i_read_rst)
            begin
                rptr_in_accum <= mark_ptr;
                bypass_rptr <= 1;
            end
            else 
                if (re)
                begin
                    rptr_in_accum <= 1;
                    bypass_rptr <= 0;
                end
                else
                begin
                    bypass_rptr <= 1;
                end
    end
    
    // WRITE
    always_ff @(posedge clk) begin
        if(!rst_n || i_flush) begin
            wptr_in_accum <= 0;
            bypass_wptr <= 1;
        end
        else 
            if (we) begin
                wptr_in_accum <= 1;
                bypass_wptr <= 0;
            end
            else begin
                wptr_in_accum <= 0;
                bypass_wptr <= 0;
            end
    end

//    always_ff @(posedge clk) begin
//        if(!rst_n || i_flush)
//            wptr <= 0;
//        else if (we)
//            wptr <= wptr + 1;
//        else
//            wptr <= wptr;
//    end
endmodule
