`timescale 1ns / 1ps

module accumulator #(
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
    ,output [N_DTP-1:0]               o_in_fifo_is_full // each bit indicates if coressponding input FIFO is full


    // output classification registers
    ,output [N_LABELS*FIFO_WIDTH-1:0] o_clf_accum_reg // each FIFO_WIDTH bits corresponding to a classification register
    ,output [N_LABELS-1:0]            o_clf_accum_reg_vld // each bit corresponding to a classification register, active as a pulse when these registers are updated
    
    // output regression register
    ,output [FIFO_WIDTH-1:0]          o_rgs_accum_reg
    ,output                           o_rgs_accum_reg_vld // corresponding to a regression register, active as a pulse when this register is updated
);

reg [N_LABELS*FIFO_WIDTH-1:0] reg_clf;
reg	[FIFO_WIDTH-1:0] reg_rgs;
assign o_clf_accum_reg = reg_clf;
assign o_rgs_accum_reg = reg_rgs;




reg [N_LABELS-1:0] reg_clf_vld;
reg reg_rgs_vld;
assign o_clf_accum_reg_vld = reg_clf_vld;
assign o_rgs_accum_reg_vld = reg_rgs_vld;


wire [N_LABELS*FIFO_WIDTH-1:0] accum_clf_to_reg_clf;
wire [FIFO_WIDTH-1:0] accum_rgs_to_reg_rgs;




wire [N_LABELS-1:0] label;
demultiplexer demux (
	 .SELECT ()
	,.DATA_OUT (label)
);


wire BYPASS_clf;
wire BYPASS_rgs;
assign BYPASS_clf = 0;
assign BYPASS_rgs = 0;

reg [N_LABELS*FIFO_WIDTH-1:0] B_reg_clf;
reg [FIFO_WIDTH-1:0] B_reg_rgs;
wire [N_LABELS*FIFO_WIDTH-1:0] B_clf;
wire [FIFO_WIDTH-1:0] B_rgs;
reg [FIFO_WIDTH-1:0] i_is_clf_temp;
reg [FIFO_WIDTH-1:0] label_temp;
always_comb @(i_is_clf, label) begin
	i_is_clf_temp = {FIFO_WIDTH{i_is_clf}};
	for (int i = 0; i < N_LABELS; i = i + 1) begin
		label_temp = {FIFO_WIDTH{label[i]}};
		B_reg_clf[FIFO_WIDTH*(i+1):FIFO_WIDTH*i] = FIFO_WIDTH'(i+1) & i_is_clf_temp & label_temp;
	end
	B_reg_rgs = /*Something*/0 & (~i_is_clf_temp);
end
assign B_clf = B_reg_clf;
assign B_rgs = B_reg_rgs;




genvar index;
generate
	for (index = 0; index < N_LABELS; index = index + 1) begin
		c_accum_0 accum_inst_clf (
			.B(B_clf[FIFO_WIDTH*(index+1):FIFO_WIDTH*index]),				// input wire [FIFO_WIDTH*(index+1):FIFO_WIDTH*index] B
			.CLK(clk),														// input wire CLK
			.BYPASS(BYPASS_clf),											// input wire BYPASS
			.Q(accum_clf_to_reg_clf[FIFO_WIDTH*(index+1):FIFO_WIDTH*index])	// output wire [FIFO_WIDTH*(index+1):FIFO_WIDTH*index] Q
		);
	end
endgenerate
c_accum_0 accum_inst_rgs (
	.B(B_rgs[FIFO_WIDTH*(index+1):FIFO_WIDTH*index]),				// input wire [FIFO_WIDTH*(index+1):FIFO_WIDTH*index] B
	.CLK(clk),														// input wire CLK
	.BYPASS(BYPASS_clf),											// input wire BYPASS
	.Q(accum_rgs_to_reg_rgs[FIFO_WIDTH*(index+1):FIFO_WIDTH*index])	// output wire [FIFO_WIDTH*(index+1):FIFO_WIDTH*index] Q
);



always_ff @(posedge clk) begin
	if (i_is_accum_fin) begin
		reg_clf <= accum_clf_to_reg_clf;
		reg_rgs <= accum_rgs_to_reg_rgs;

		for (int i = 0; i < N_LABELS; i = i + 1) begin
			if (reg_clf_vld[i] == 1) reg_clf_vld[i] <= 0;
			else reg_clf_vld[i] <= label[i] & i_is_clf;
		end

		if (reg_rgs_vld == 1) reg_rgs_vld <= 0;
		else reg_rgs_vld <= ~i_is_clf;
	end
end




endmodule




module demultiplexer(SELECT, DATA_OUT);
	parameter	NO_OUTPUT	= 4;
	parameter	BITS		= 2;
	
	input		[BITS-1:0]			SELECT;
	output	    [NO_OUTPUT-1:0]	    DATA_OUT;
	assign	    DATA_OUT = (NO_OUTPUT'(1<<SELECT));
endmodule