`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2023 12:35:58 AM
// Design Name: 
// Module Name: accumulator_gen
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


`timescale 1ns / 1ps

module accumulator_gen #(
    parameter                           FIFO_WIDTH  = 16,
    parameter                           N_LABEL     = 4, 
	parameter                           BITS        = 2
) (
    input                               clk,
    input                               rst_n,
    input                               i_is_clf,
    input                               i_is_accum_fin,

    input   [N_LABEL-1:0]                  label,

    output  [N_LABEL*FIFO_WIDTH-1:0]    o_clf_accum_reg,
    output  [N_LABEL-1:0]               o_clf_accum_reg_vld,

    output  [FIFO_WIDTH-1:0]            o_rgs_accum_reg,
    output                              o_rgs_accum_reg_vld
);
    
    // CLASSIFICATION
    wire                        BYPASS_in;
    wire    [FIFO_WIDTH-1:0]    B_gen_to_en_clf;
    wire    [FIFO_WIDTH-1:0]    B_en_to_accum_clf     [0:N_LABEL-1];
    wire    [FIFO_WIDTH-1:0]    Q_accum_to_reg_clf    [0:N_LABEL-1];
    assign BYPASS_in        = 0 || ~rst_n;
    assign B_gen_to_en_clf  = 1 ||  rst_n;
    
    genvar index;
    generate
        for (index = 0; index < N_LABEL; index = index + 1) begin
            enable_clf INST1 (
                .i_is_clf       (i_is_clf),
                .i_is_accum_fin (i_is_accum_fin),
                .label          (label[index]),
                .B_in           (B_gen_to_en_clf),
                .B_out          (B_en_to_accum_clf[index])
            );

            c_accum_1 INST2 (
                .B      (B_en_to_accum_clf[index]),
                .CLK    (clk),
                .BYPASS (BYPASS_in), 
                .Q      (Q_accum_to_reg_clf[index])
            );

            reg_gen_clf INST3 (
                .clk            (clk),
                .rst_n          (rst_n),
                .i_is_accum_fin (i_is_accum_fin),
                .label          (label[index]),
                .i_is_clf       (i_is_clf),
                .Q_in           (Q_accum_to_reg_clf[index]),
                .clf_vld        (o_clf_accum_reg_vld[N_LABEL-1-index]),
                .clf_out        (o_clf_accum_reg[FIFO_WIDTH*(N_LABEL-index)-1:FIFO_WIDTH*(N_LABEL-1-index)])
            );
        end
    endgenerate

    // REGRESSION
    reg     [FIFO_WIDTH-1:0]    B_gen_to_en_rgs;
    wire    [FIFO_WIDTH-1:0]    B_en_to_accum_rgs;
    wire    [FIFO_WIDTH-1:0]    Q_accum_to_reg_rgs;
    integer pos;
    always @(*) begin
        if (!rst_n)
            B_gen_to_en_rgs = 0;
        else begin
            if (label==0) B_gen_to_en_rgs = 0;
            else begin
                for (pos=0; pos<N_LABEL; pos=pos+1) begin
                    if (label[pos]==1'b1) B_gen_to_en_rgs = pos + 1;        
                end
            end
        end
    end
    
    enable_rgs INST4 (
        .i_is_clf(i_is_clf),
        .i_is_accum_fin(i_is_accum_fin),
        .B_in(B_gen_to_en_rgs),
        .B_out(B_en_to_accum_rgs)
    );
    c_accum_1 INST5 (
        .B      (B_en_to_accum_rgs),
        .CLK    (clk),
        .BYPASS (BYPASS_in), 
        .Q      (Q_accum_to_reg_rgs)
    );
    reg_gen_rgs INST6 (
        .clk            (clk),
        .rst_n          (rst_n),
        .i_is_accum_fin (i_is_accum_fin),
        .i_is_clf       (i_is_clf),
        .Q_in           (Q_accum_to_reg_rgs),
        .rgs_vld        (o_rgs_accum_reg_vld),
        .rgs_out        (o_rgs_accum_reg)
    );
    

endmodule


module enable_clf #(
	parameter						FIFO_WIDTH	= 16
)	(
	input							i_is_clf,
    input                           i_is_accum_fin,
	input							label,
	input		[FIFO_WIDTH-1:0]	B_in,


	output reg	[FIFO_WIDTH-1:0]	B_out
);
	always @(*) begin 
		if (i_is_clf == 1'b1 && label == 1'b1 && i_is_accum_fin == 0) begin
			B_out = B_in;
		end else begin
			B_out = 0;
		end
	end
endmodule

module enable_rgs #(
	parameter						FIFO_WIDTH	= 16
)	(
	input							i_is_clf,
    input                           i_is_accum_fin,
	input		[FIFO_WIDTH-1:0]	B_in,


	output reg	[FIFO_WIDTH-1:0]	B_out
);
	always @(*) begin 
		if (i_is_clf == 0 && i_is_accum_fin == 0) begin
			B_out = B_in;
		end else begin
			B_out = 0;
		end
	end
endmodule


module reg_gen_clf #(
	parameter						FIFO_WIDTH	= 16
) (
    input                           rst_n,
	input							clk,
	input							i_is_accum_fin,
	input							label,
	input							i_is_clf,
	input	[FIFO_WIDTH-1:0]		Q_in,


	output	reg						clf_vld,
	output	reg	[FIFO_WIDTH-1:0]	clf_out
);
	always @(posedge clk) begin
        if (rst_n == 0) begin
            clf_out <= 0;
			clf_vld <= 0;
        end else begin
            if (clf_vld == 1) clf_vld <= 0;
            if (i_is_accum_fin) begin
                clf_out <= Q_in;
                clf_vld <= label & i_is_clf;
            end
        end
	end
endmodule




module reg_gen_rgs #(
	parameter						FIFO_WIDTH	= 16
) (
    input                           rst_n,
	input							clk,
	input							i_is_accum_fin,
	input							i_is_clf,
	input	[FIFO_WIDTH-1:0]		Q_in,


	output	reg						rgs_vld,
	output	reg	[FIFO_WIDTH-1:0]	rgs_out
);
	always @(posedge clk) begin 
        if (rst_n == 0) begin
            rgs_out <= 0;
            rgs_vld <= 0;
        end else begin
            if (rgs_vld == 1) rgs_vld <= 0;
            if (i_is_accum_fin) begin
                rgs_out <= Q_in;
                rgs_vld <= ~i_is_clf;
            end
        end
	end
endmodule