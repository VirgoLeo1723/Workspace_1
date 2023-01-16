`timescale 1ns / 1ps

module testbench;
    parameter FIFO_WIDTH = 16;
    parameter N_LABEL = 4;
    parameter BITS = 2;
    reg clk;
    reg i_is_clf;
    reg i_is_accum_fin;
    reg [BITS-1:0] label_select;
    wire [N_LABEL*FIFO_WIDTH-1:0] o_clf_accum_reg;
    wire [N_LABEL-1:0] o_clf_accum_reg_vld;
    wire [FIFO_WIDTH-1:0] o_rgs_accum_reg;
    wire o_rgs_accum_reg_vld;

    accumulator_gen DUT (
        .clk(clk),
        .i_is_clf(i_is_clf),
        .i_is_accum_fin(i_is_accum_fin),
        .label_select(label_select),
        .o_clf_accum_reg(o_clf_accum_reg),
        .o_clf_accum_reg_vld(o_clf_accum_reg_vld),
        .o_rgs_accum_reg(o_rgs_accum_reg),
        .o_rgs_accum_reg_vld(o_rgs_accum_reg_vld)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        i_is_clf = 1;
        i_is_accum_fin = 0;
        label_select = 0;
        
        // #200     i_is_accum_fin = 1;
        // #20      i_is_accum_fin = 0; label_select = 2;
        // #200     i_is_accum_fin = 1;
        // #20      i_is_accum_fin = 0; label_select = 1;
        // #200     i_is_accum_fin = 1;
        // #20      i_is_accum_fin = 0; label_select = 3;
        // #200     i_is_accum_fin = 1;
        // #20      i_is_accum_fin = 0;
        #40      i_is_clf = 0;       label_select = 0;
        #200     i_is_accum_fin = 1;
        #20      i_is_accum_fin = 0; label_select = 3;
        #200     i_is_accum_fin = 1;
        #20      i_is_accum_fin = 0;
        #40 $finish;
    end
endmodule
