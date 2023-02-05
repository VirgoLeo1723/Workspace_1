`timescale 1ns / 1ps

module Accumulator #(
     parameter N_DTPS     = 4 // number of DTPs (in other word, number of input FIFO)
    ,parameter FIFO_WIDTH = 16
    ,parameter N_LABELS   = 4 // number of label for classification problem
    ,parameter   BITS = 2
) (
     input                            clk
    ,input                            rst_n
  
    ,input                            i_is_clf // is classification ?
    ,input                            i_is_accum_fin // this signal is a pulse. When active, accumulation results will be pushed into clf or rgs FIFOs
    ,input                            i_flush // flush all FIFOs

    // input FIFOs
    ,input  [N_DTPS-1:0]              i_in_fifo_push // each bit corresponding to an input FIFO
    ,input  [N_DTPS*FIFO_WIDTH-1:0]   i_in_fifo_rear // each FIFO_WIDTH bits corresponding to an input FIFO
    ,output [N_DTPS-1:0]               o_in_fifo_is_full // each bit indicates if coressponding input FIFO is full


    // output classification registers
    ,output [N_LABELS*FIFO_WIDTH-1:0] o_clf_accum_reg // each FIFO_WIDTH bits corresponding to a classification register
    ,output [N_LABELS-1:0]            o_clf_accum_reg_vld // each bit corresponding to a classification register, active as a pulse when these registers are updated
    
    // output regression register
    ,output [FIFO_WIDTH-1:0]          o_rgs_accum_reg
    ,output                           o_rgs_accum_reg_vld // corresponding to a regression register, active as a pulse when this register is updated
);
    logic   [N_DTPS-1:0]            i_fifo_rd_en;
    logic   [N_DTPS-1:0]            o_in_fifo_is_empty /*keep synthesis*/;
    logic   [N_DTPS*FIFO_WIDTH-1:0] o_fifo_out;
    logic   [N_LABELS-1:0]          i_accum_in;
    
    
    
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
    // Distribute Label
    reg			[BITS-1:0]		      index_of_fifo;
	reg		    [BITS-1:0]		      select;
	wire        [BITS-1:0]            label_out;
	reg         [N_DTPS-1:0]          is_select_empty; 
    always_ff @(posedge clk) begin
        if (!rst_n || index_of_fifo == N_DTPS) index_of_fifo <= 0;
        else index_of_fifo  <= index_of_fifo + 1;
        select              <= index_of_fifo;
        is_select_empty     <= o_in_fifo_is_empty;
    end
    always_comb begin
        if (!rst_n) i_fifo_rd_en = 0;
        else begin
            if (o_in_fifo_is_empty[index_of_fifo]==1'b0) 
                i_fifo_rd_en = (N_DTPS'(1<<index_of_fifo));
            else
                i_fifo_rd_en = (N_DTPS'(0<<index_of_fifo));
        end
    end
    assign label_out    = (BITS'(o_fifo_out[select*FIFO_WIDTH+:FIFO_WIDTH])) & {BITS{~is_select_empty[select]}};
    assign i_accum_in   = (N_LABELS'((1 & ~is_select_empty[select]) << label_out));
    
    // Accumulate Label
    accumulator_gen multi_accum (
                            .clk                (clk),
                            .i_is_clf           (i_is_clf),
                            .i_is_accum_fin     (i_is_accum_fin),
                            .label              (i_accum_in),
                            .o_clf_accum_reg    (o_clf_accum_reg),             
                            .o_clf_accum_reg_vld(o_clf_accum_reg_vld),
                            .o_rgs_accum_reg    (o_rgs_accum_reg),
                            .o_rgs_accum_reg_vld(o_rgs_accum_reg_vld)
                         );
endmodule
