`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2023 05:31:51 PM
// Design Name: 
// Module Name: accumulator_tb
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


module accmulator_tb #(
     parameter N_DTPS     = 4 // number of DTPs (in other word, number of input FIFO)
    ,parameter FIFO_WIDTH = 16
    ,parameter N_LABELS   = 4 // number of label for classification problem
    ,parameter BITS       = 2
) ();
     reg                            clk;
     reg                            rst_n;
  
     reg                            i_is_clf; // is classification ?
     reg                            i_is_accum_fin; // this signal is a pulse. When active, accumulation results will be pushed into clf or rgs FIFOs
     reg                            i_flush; // flush all FIFOs

    // input FIFOs
     reg  [N_DTPS-1:0]              i_in_fifo_push; // each bit corresponding to an input FIFO
     reg  [N_DTPS*FIFO_WIDTH-1:0]   i_in_fifo_rear; // each FIFO_WIDTH bits corresponding to an input FIFO
     wire  [N_DTPS-1:0]              o_in_fifo_is_full; // each bit indicates if coressponding input FIFO is full


    // output classification registers
     wire [N_LABELS*FIFO_WIDTH-1:0] o_clf_accum_reg; // each FIFO_WIDTH bits corresponding to a classification register
     wire [N_LABELS-1:0]            o_clf_accum_reg_vld; // each bit corresponding to a classification register, active as a pulse when these registers are updated
    
    // output regression register
     wire [FIFO_WIDTH-1:0]          o_rgs_accum_reg;
     wire                           o_rgs_accum_reg_vld; // corresponding to a regression register, active as a pulse when this register is updated

    Accumulator INST0   (   clk, 
                            rst_n, 
                            i_is_clf, 
                            i_is_accum_fin, 
                            i_flush, 
                            i_in_fifo_push, 
                            i_in_fifo_rear,
                            o_in_fifo_is_full,
                            o_clf_accum_reg,
                            o_clf_accum_reg_vld,
                            o_rgs_accum_reg,
                            o_rgs_accum_reg_vld
                         );
    initial begin
        clk             = 0;
        rst_n           = 0;
        i_flush         = 0;
        i_is_clf        = 0;
        i_is_accum_fin  = 0;
        i_in_fifo_push  = 4'b1111;
        #4 i_in_fifo_push = 4'b0000;
        i_in_fifo_rear  = 0;
    end
    always begin
        #1; 
        clk              <= ~clk;
        i_is_clf         <= 1;
        i_in_fifo_rear   <= 64'h0000000300030002;
    end
    always begin
        #2;
        rst_n           <= 1;
    end
    always begin
        #11;
        i_is_accum_fin  <= ~i_is_accum_fin;
    end
    
//    reg [BITS:0]index;
    
//    always @(posedge clk) begin
//        #8;
//        for (index=0; index<N_DTPS; index=index+1) begin
//            i_in_fifo_push  <= (1<<index);
//            #2;
//        end
//    end
        

    
endmodule
