module Accumulator_Gen #(
    parameter FIFO_WIDTH = 16,
    parameter N_LABELS = 4
) (
    input                            clk,
    input                            rst_n,
    input                            reset,
    input                            i_is_clf,
    input                            i_is_accum_fin,

    input  [N_LABELS-1:0]            label,

    output [FIFO_WIDTH*N_LABELS-1:0] o_clf_accum_reg,
    output                           o_clf_accum_reg_vld,

    output [FIFO_WIDTH-1:0]          o_rgs_accum_reg,
    output                           o_rgs_accum_reg_vld
);

    //------------------------------CLASSIFICATION------------------------------//

    reg  [N_LABELS-1:0]    B_clf;
    wire [FIFO_WIDTH-1:0]  B_get_to_accum_clf [0:N_LABELS-1];
    wire [FIFO_WIDTH-1:0]  Q_accum_to_reg_clf [0:N_LABELS-1];

    wire                   BYPASS;
    assign BYPASS = reset;

    reg  [FIFO_WIDTH-1:0]  clf_reg            [0:N_LABELS-1];

    generate
        for (genvar i = 0; i < N_LABELS; i = i + 1) begin
            always_comb begin : Get_B_clf
                if (!rst_n || reset) begin
                    B_clf[i] = 0;
                end else begin
                    if (i_is_clf && label[i] == 1 && !i_is_accum_fin) begin
                        B_clf[i] = 1;
                    end else begin
                        B_clf[i] = 0;
                    end
                end
            end

            assign B_get_to_accum_clf[i] = FIFO_WIDTH'(B_clf[i]);

            c_accum_0 Accum_clf (
                .B      (B_get_to_accum_clf[i]),
                .CLK    (clk),
                .BYPASS (BYPASS), 
                .Q      (Q_accum_to_reg_clf[i])
            );

            always_ff @( posedge clk ) begin : Reg_clf
                if (!rst_n || reset) begin
                    clf_reg[i] <= 0;
                end else begin
                    if (i_is_accum_fin && i_is_clf) begin
                        clf_reg[i] <= Q_accum_to_reg_clf[i];
                    end
                end
            end

            assign o_clf_accum_reg[FIFO_WIDTH*(N_LABELS-i)-1:FIFO_WIDTH*(N_LABELS-1-i)] = clf_reg[i];
        end
    endgenerate

    //--------------------------------------------------------------------------//





    //--------------------------------REGRESSION--------------------------------//

    reg  [FIFO_WIDTH-1:0] B_rgs;
    //wire [FIFO_WIDTH-1:0] B_get_to_accum_rgs;
    wire [FIFO_WIDTH-1:0] Q_accum_to_reg_rgs;

    reg  [FIFO_WIDTH-1:0] rgs_reg;

    always_comb begin : Get_B_rgs
        if (!rst_n || reset) begin
            B_rgs = 0;
        end else begin
            for (integer i = 0; i < N_LABELS; i = i + 1) begin
                if (label[i] == 1 && !i_is_clf && !i_is_accum_fin) begin
                    B_rgs = i + 1;
                end else begin
                    B_rgs = 0;
                end
            end
        end
    end

    //assign B_get_to_accum_rgs = B_rgs;

    c_accum_0 Accum_rgs (
        .B      (B_rgs),
        .CLK    (clk),
        .BYPASS (BYPASS), 
        .Q      (Q_accum_to_reg_rgs)
    );

    always_ff @( posedge clk ) begin : Reg_rgs
        if (!rst_n || reset) begin
            rgs_reg <= 0;
        end else begin
            if (i_is_accum_fin && !i_is_clf) begin
                rgs_reg <= Q_accum_to_reg_rgs;
            end
        end
    end

    assign o_rgs_accum_reg = rgs_reg;

    //--------------------------------------------------------------------------//




    //--------------------------------REGS VALID--------------------------------//

    reg flag;
    reg clf_reg_vld;
    reg rgs_reg_vld;

    always_ff @( posedge clk ) begin : Reg_vld
        if (!rst_n || reset) begin
            clf_reg_vld <= 0;
            rgs_reg_vld <= 0;
            flag <= 0;
        end else begin
            if (!i_is_accum_fin) begin
                flag <= 0;
            end
            if (flag) begin
                clf_reg_vld <= 0;
                rgs_reg_vld <= 0;
            end else if (i_is_accum_fin) begin
                clf_reg_vld <= i_is_clf;
                rgs_reg_vld <= ~i_is_clf;
                flag = 1;
            end
        end
    end

    assign o_clf_accum_reg_vld = clf_reg_vld;
    assign o_rgs_accum_reg_vld = rgs_reg_vld;

    //--------------------------------------------------------------------------//
endmodule