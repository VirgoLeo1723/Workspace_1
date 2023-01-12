`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2023 09:16:28 PM
// Design Name: 
// Module Name: accumulator_label
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


module accumulator_label (CLK, RESET, IS_CLF, IS_ACCUM_FIN, DATA_IN, DATA_OUT_CLF, DATA_OUT_RGS, CLF_VALID, RGS_VALID);
    parameter   NO_LABEL = 4;
    parameter   WIDTH    = 16;
    parameter   BITS     = 2;
    
    input                               CLK, RESET, IS_CLF, IS_ACCUM_FIN;
    input       [NO_LABEL-1:0]          DATA_IN;
    output  reg [NO_LABEL*WIDTH-1:0]    DATA_OUT_CLF;
    output  reg [WIDTH-1:0]             DATA_OUT_RGS;
    output  reg                         RGS_VALID;
    output  reg [NO_LABEL-1:0]          CLF_VALID;
    
    logic       [NO_LABEL*WIDTH-1:0]    TEMP_RESULT_CLF;      
    logic       [WIDTH-1:0]             TEMP_RESULT_RGS;  
    logic       [BITS-1:0]              DATA_IN_RGS;
    
    
    //ACCUMULATOR for classification
    genvar index;
    generate
        for (index=0; index <NO_LABEL; index=index+1) begin: ACCUMULATOR
        c_accum_0 INST0 (
                          .B    (DATA_IN[index]),        // input wire [0 : 0] B
                          .CLK  (CLK),    // input wire CLK
                          .SCLR (SCLR),  // input wire SCLR
                          .Q    (TEMP_RESULT_CLF[index*WIDTH+:WIDTH])        // output wire [15 : 0] Q
                        ); 
        end
    endgenerate
    
    //ACCUMULATOR for regression
    integer pos;
    always_ff @(DATA_IN) begin
        for (pos=0; pos<=NO_LABEL; pos = pos + 1)begin
            if (DATA_IN[pos] == 1'b1)
                DATA_IN_RGS <= (BITS'(pos));
        end
    end
    
    c_accum_0 INST1 (
                      .B    (DATA_IN_RGS),        // input wire [0 : 0] B
                      .CLK  (CLK),    // input wire CLK
                      .SCLR (SCLR),  // input wire SCLR
                      .Q    (TEMP_RESULT_RGS)        // output wire [15 : 0] Q
                    );
     defparam   INST1.C_B_WIDTH = 2;
    
    // RESULT 
    always_ff @(posedge CLK) begin
        if (IS_ACCUM_FIN) begin
            if (IS_CLF) begin
                DATA_OUT_CLF    <= (NO_LABEL*WIDTH'(TEMP_RESULT_CLF));
                CLF_VALID       <= (NO_LABEL'(1));
            end
            else begin
                DATA_OUT_RGS    <= (WIDTH'(TEMP_RESULT_RGS));
                RGS_VALID       <= 1;         
            end
        end
        else begin    
                CLF_VALID       <= 0;
                RGS_VALID       <= 0;
        end 
    end

endmodule
