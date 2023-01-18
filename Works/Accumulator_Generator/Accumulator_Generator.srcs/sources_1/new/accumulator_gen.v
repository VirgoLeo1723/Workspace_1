`timescale 1ns / 1ps

module accumulator_gen #(
    parameter                           FIFO_WIDTH  = 16,
    parameter                           N_LABEL     = 4, 
	parameter                           BITS        = 2
) (
    input                               clk,
    input                               i_is_clf,
    input                               i_is_accum_fin,

    input   [BITS-1:0]                  label_select,

    output  [N_LABEL*FIFO_WIDTH-1:0]    o_clf_accum_reg,
    output  [N_LABEL-1:0]               o_clf_accum_reg_vld,

    output  [FIFO_WIDTH-1:0]            o_rgs_accum_reg,
    output                              o_rgs_accum_reg_vld
);
    

    wire [N_LABEL-1:0] label;
    demultiplexer INST0 (
        .SELECT(label_select),
        .DATA_OUT(label)
    );





    wire                        BYPASS_in;
    wire    [FIFO_WIDTH-1:0]    B_gen_to_en_clf;
    wire    [FIFO_WIDTH-1:0]    B_en_to_accum_clf     [0:N_LABEL-1];
    wire    [FIFO_WIDTH-1:0]    Q_accum_to_reg_clf    [0:N_LABEL-1];
    assign BYPASS_in = 0;
    assign B_gen_to_en_clf = 1;
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

            c_accum_0 INST2 (
                .B      (B_en_to_accum_clf[index]),
                .CLK    (clk),
                .BYPASS (BYPASS_in), 
                .Q      (Q_accum_to_reg_clf[index])
            );

            reg_gen_clf INST3 (
                .clk            (clk),
                .i_is_accum_fin (i_is_accum_fin),
                .label          (label[index]),
                .i_is_clf       (i_is_clf),
                .Q_in           (Q_accum_to_reg_clf[index]),
                .clf_vld        (o_clf_accum_reg_vld[N_LABEL-1-index]),
                .clf_out        (o_clf_accum_reg[FIFO_WIDTH*(N_LABEL-index)-1:FIFO_WIDTH*(N_LABEL-1-index)])
            );
        end
    endgenerate





    wire    [FIFO_WIDTH-1:0]    B_gen_to_en_rgs;
    wire    [FIFO_WIDTH-1:0]    B_en_to_accum_rgs;
    wire    [FIFO_WIDTH-1:0]    Q_accum_to_reg_rgs;
    assign B_gen_to_en_rgs = label_select + 1;
    enable_rgs INST4 (
        .i_is_clf(i_is_clf),
        .i_is_accum_fin(i_is_accum_fin),
        .B_in(B_gen_to_en_rgs),
        .B_out(B_en_to_accum_rgs)
    );
    c_accum_0 INST5 (
        .B      (B_en_to_accum_rgs),
        .CLK    (clk),
        .BYPASS (BYPASS_in), 
        .Q      (Q_accum_to_reg_rgs)
    );
    reg_gen_rgs INST6 (
        .clk            (clk),
        .i_is_accum_fin (i_is_accum_fin),
        .i_is_clf       (i_is_clf),
        .Q_in           (Q_accum_to_reg_rgs),
        .rgs_vld        (o_rgs_accum_reg_vld),
        .rgs_out        (o_rgs_accum_reg)
    );
    

endmodule


module demultiplexer #(
	parameter	NO_OUTPUT	= 4,
	parameter	BITS		= 2
)	(SELECT, DATA_OUT);
	input		[BITS-1:0]			SELECT;
	output	    [NO_OUTPUT-1:0]	    DATA_OUT;
	assign	    DATA_OUT = 1 << SELECT;
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
	input							clk,
	input							i_is_accum_fin,
	input							label,
	input							i_is_clf,
	input	[FIFO_WIDTH-1:0]		Q_in,


	output	reg						clf_vld,
	output	reg	[FIFO_WIDTH-1:0]	clf_out
);
	always @(posedge clk) begin 
        if (clf_vld == 1) clf_vld <= 0;
		if (i_is_accum_fin) begin
			clf_out <= Q_in;
			clf_vld <= label & i_is_clf;
		end
	end
endmodule




module reg_gen_rgs #(
	parameter						FIFO_WIDTH	= 16
) (
	input							clk,
	input							i_is_accum_fin,
	input							i_is_clf,
	input	[FIFO_WIDTH-1:0]		Q_in,


	output	reg						rgs_vld,
	output	reg	[FIFO_WIDTH-1:0]	rgs_out
);
	always @(posedge clk) begin 
        if (rgs_vld == 1) rgs_vld <= 0;
		if (i_is_accum_fin) begin
			rgs_out <= Q_in;
			rgs_vld <= ~i_is_clf;
		end
	end
endmodule