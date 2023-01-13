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

	wire [FIFO_WIDTH-1:0] Accum_to_Reg_ [N_LABELS-1:0];
	wire [FIFO_WIDTH-1:0] Accum_to_Reg_rgs;

	reg [FIFO_WIDTH-1:0] Register_ [N_LABELS-1:0];
	reg [FIFO_WIDTH-1:0] Register_rgs;
	
	reg o_clf_accum_reg_vld_REG [N_LABELS-1:0];
	reg o_rgs_accum_reg_vld_REG;
	
	wire [FIFO_WIDTH:0] i_accum_inst_0_B [N_LABELS-1:0];
	wire i_accum_inst_0_BYPASS [N_LABELS-1:0];
	
	wire [FIFO_WIDTH-1:0] fifo_DATA_OUT;
	//assign fifo_DATA_OUT = <>;
	
	
	genvar index;
	
	
	
	
	
	
	for (index = 0; index < N_LABELS; index = index + 1) begin:
		assign i_accum_inst_0_B[i] = FIFO_WIDTH'b(index+1);
		assign i_accum_inst_0_BYPASS[i] = 1'b0;
	end
	
	for (index = 0; index < N_LABELS; index = index + 1) begin:	
		ACCUMULATOR c_accum_0 accum_inst_clf (
			.B(i_accum_inst_0_B[i]),            // input wire [15 : 0] B
			.CLK(fifo_DATA_OUT[i]*i_is_clf),    // input wire CLK
			.BYPASS(i_accum_inst_0_BYPASS[i]),  // input wire BYPASS
			.Q(Accum_to_Reg_[i])                // output wire [15 : 0] Q
		);
	end
	
	c_accum_0 accum_inst_rgs (
		.B(/*something in here*/),            // input wire [15 : 0] B
		.CLK(~i_is_clf),   					// input wire CLK
		.BYPASS(i_accum_inst_0_BYPASS[i]),  // input wire BYPASS
		.Q(Accum_to_Reg_rgs)                // output wire [15 : 0] Q
	);
	
	
	
	
	
	
	always_ff @(posedge clk) begin:
		if (i_is_accum_fin) begin
			for (index = 0; index < N_LABEL; index = index + 1) begin:
				Register_[i] <= Accum_to_Reg_[i];
			end
			
			Register_rgs <= Accum_to_Reg_rgs;
		end
	end
	
	
	
	
	
	
	
	
	for (index = 0; index < N_LABELS; index = index + 1) begin:	
		assign o_clf_accum_reg[(i+1)*FIFO_WIDTH-1:FIFO_WIDTH*i] = Register_[i];
	end
	
	assign o_rgs_accum_reg = Register_rgs;
	
	
	
	
	
	
	always_ff @(posedge clk) begin:
		for (index = 0; index < N_LABELS; index = index + 1) begin:	
			if (o_clf_accum_reg_vld_REG[i] == 1'b1) o_clf_accum_reg_vld_REG[i] <= 1'b0;
			else begin
				o_clf_accum_reg_vld_REG[i] <= 1'b(fifo_DATA_OUT[i]*i_is_clf);
			end
		end
		
		o_rgs_accum_reg_vld_REG <= ~i_is_clf;
	end




	for (index = 0; index < N_LABELS; index = index + 1) begin:	
		assign o_clf_accum_reg_vld[i] = o_clf_accum_reg_vld_REG;
	end
	
	assign o_rgs_accum_reg_vld = o_rgs_accum_reg_vld_REG;




endmodule
