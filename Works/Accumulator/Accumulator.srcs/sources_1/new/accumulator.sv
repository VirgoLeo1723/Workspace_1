`timescale 1ns / 1ps

module Accumulator #(
     parameter N_DTPS     = 4 // number of DTPs (in other word, number of input FIFO)
    ,parameter FIFO_WIDTH = 16
    ,parameter N_LABELS   = 4 // number of label for classification problem
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
    logic   [N_DTPS-1:0]            R_EN;
    logic   [N_DTPS-1:0]            IS_EMPTY;
    logic   [N_DTPS*FIFO_WIDTH-1:0] FIFO_OUT;
    logic   [N_LABELS-1:0]          ACCUM_IN;
   multi_fifo   inst0 (
                        .CLK        (clk), 
                        .RESET      (rst_n), 
                        .I_PUSH     (i_in_fifo_push), 
                        .I_REAR     (i_in_fifo_rear), 
                        .I_R_EN     (R_EN), 
                        .DATA_OUT   (FIFO_OUT), 
                        .EMPTY      (IS_EMPTY), 
                        .FULL       (o_in_fifo_is_full)
                       );
   process_data inst1 (
                        .CLK            (clk), 
                        .RESET          (rst_n), 
                        .IS_EMPTY       (IS_EMPTY), 
                        .RD_EN          (R_EN), 
                        .DATA_IN        (FIFO_OUT), 
                        .DATA_OUT       (ACCUM_IN)
                   );
    accumulator_label  inst2 (
                        .CLK            (clk), 
                        .RESET          (rst_n), 
                        .IS_CLF         (i_is_clf), 
                        .IS_ACCUM_FIN   (i_is_accum_fin), 
                        .DATA_IN        (ACCUM_IN), 
                        .DATA_OUT_CLF   (o_clf_accum_reg),
                        .DATA_OUT_RGS   (o_rgs_accum_reg),
                        .CLF_VALID      (o_clf_accum_reg_vld),
                        .RGS_VALID      (o_rgs_accum_reg_vld)
                    );


endmodule
