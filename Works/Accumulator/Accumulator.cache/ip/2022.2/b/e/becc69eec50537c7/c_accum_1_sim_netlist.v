// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Jan 18 01:04:26 2023
// Host        : DESKTOP-BR8935G running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_accum_1_sim_netlist.v
// Design      : c_accum_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_accum_1,c_accum_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_accum_v12_0_14,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (B,
    CLK,
    BYPASS,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 bypass_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME bypass_intf, LAYERED_METADATA undef" *) input BYPASS;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [15:0]Q;

  wire [15:0]B;
  wire BYPASS;
  wire CLK;
  wire [15:0]Q;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* c_add_mode = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_width = "16" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "1" *) 
  (* c_has_c_in = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "16" *) 
  (* c_scale = "0" *) 
  (* c_verbosity = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_accum_v12_0_14 U0
       (.ADD(1'b1),
        .B(B),
        .BYPASS(BYPASS),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Hmjb8m69Ax8Qs6OUAY4PpxopwYbfwZ0yd1x92r3aYqt7Gy7mTTT7t3ovjcNCQXT3lHLP70OtcvOq
MnfiXcZdbkenteZUm1nvTJSbEO4IGYr4rgZ36Sc5ByQwkRbmPQHLIHNgDh4B3+/wwfQ/SQh/SIXO
6b+KkDi+ulxf+IZFrgY=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
O5aax3XMXMiopJNkPbqoPoieOC/Uslho3SEHxSllkRE4qQFtwws/VoDebH5tOVMM43Yf6nKFiHgu
mx9dtvi79wvJr7peifnz412GhwbUfveru60BZPpWQs43eQZVFreUzxABSUubzcIumcIg8Mx2G2DE
Wyr80roV1Gs0VMQOt563+9XhXiUkaX5KcD2eWRV0/t5Uh7hA1lTapnhMUT7smMyckuwtl0m/t3+r
QeqrVzB+9m9mEhpaT77K6RPTfok2ylTTKC+HgY01x+csbOus2oBkBe9jw/QaZrdZPSJRtQ1GcLAZ
AkJXO/Vxdx1xtpjqBsHapEDQ3dtjq7ELbEATJQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
mw5hg+VafDug/V5L3aRX2Xmc+T3czGRvp4zT6Fzs6xuBS7oTnpkNVSNF+DF6XmqV3VXKmHWCyqKr
CGH87/J0/WRAjPrMDaeJV+b23RFX34rPxNMSzQaVwLH2u5QgLQB/be2zAimh5A04sjGnuz7Qc0Cr
zvkt1kkQgZ8SIQ3jFQ4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qecUN5avLWwLtKT67tyZ94hrXP9+drbWM7XsmsPBpVJFzUPuOIiEUimjbWRbdt1unoRocLoPm2Er
y3msalvVAx/s9F+/1aMa2WzMPS1Gnxvq0ZIzEvHf/T3cwus7E5mSuwJVd9QaLK5olSggi6KU9mKx
40+RgfoQfsvbvet1kQjCziUdXrkNujwNYF9VhHAqjTVDn6kL6RCO9c8nW2bvf06XoEAP56SP4fTq
Vvw2Vnyk+E5xQKCZ/FZCKQUtcn8GZNejtILI+xi64bjGuLL31AgTQ0dW2HtWORSNvtKkQhL/RDXR
/kzqRO8dmUmJ2K5CI3ZOzHIXnsoYG4Kvd9Aphg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
x3JgLmvOLKw0NKO6lyIkA0DH/bFzSmi4pTt4JHh2M5lp49QsySelNHlOk01hRqQwgDpPLslYLTlW
vWgz7VSOZcabqvB5zWwgL+qntrwqUfIIIXO7FIPwMX5pIujBa0V5RCP/DF+l0bA24ck1UdPsAN2V
af0C37Az8IWWLc9zGzZz7lZb1rHRcRrzPl9sYa94pzF68FLEVue7ILLBw4jjcWcu6hJAjfO6oCMf
OHOUeiyXKiZ/LQDAlCDyG67r48w8U5VTlxJpask2jYNraeVpn08cVj+J1GeNx6pA2oYTYpKMbff5
mznfzhiGX0F0rqI49nk2AbEzewJGqw6eANjnrg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OIssHFepIE7+Wt8YpRUb6lbDDMa/7uzhjzZvONaUB+nNjTTXkHyEebdBXEsqG/0aHNPE3QlWQzqc
w1ivbYFpjtGgUXihMeMkCFZXwEFha3EELWkxR9zY1MQ4Xashbz8+dn/zK4GCpZzA6xvttunR2qqL
gPluZuWh4jX/7uUnm8+o+rNpfjro8t6uJs9EvxwaWG4cvXEuxfCi6+lNkX03CYpGIhUL3WvVS6ic
y9MsQBT6BcVnT75mXYYCf3XrwCFidlKS8oUJa9uhmSnyQAkGfHamxsnAZz0xb1zBvs0TS7jE62o/
dgM9mempnnnGe1FUnaJu47aKAa72rz2NDopqhQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Sj9VfX7IAWcOGfP9wNK4CR9MNUz++EyB+ESovz2tVzKULqf/in3bzhUGqLpR88GAjxKUvp6IShy9
nwmM+Zfs+2PrHZOgk26Yx3rwgp56iQFj+xqqzwu2yS3uDGgBJVKqnASdvn77ZupVgdM7cH8EMdkH
xUe+eu2DmkLR89GmBNYL/MMnQZgV4GToD7+ylk7efnmO7oCIquD7tyqEjxaUNe2khHEgxjUWSf0C
DK0y19RQLPM92vg5olz4Am2VNTwE9OOvB0edRbDCj0lpfZbmqowiEjVPI/TbXrMIfaTMgngBmXTP
nH5sIZGrHIwXP0WvCfF5e/imb8KuElaruZZt6w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
QBcNZzJeeRFI+7ZLaCUcheecOD2TAIOCqCMTwCeXJiXBBZGAyD8je8CTC7YZMVJTw8AglbtPlCqw
MIp0MwhdySlWoVio6g79ZyCYTRsWKxNms6i8cqEkQSfVwZBZMYErCTqNhYecCLWaNnCOD8COJgU7
OLXW0G5t6KowjreVTc4TTII3+p22z6Mq27Cfzqirbym7wHLq/4IduVCXBnIR5yrv5DjIuTL/+Pu2
hWwSCI4Cbudg3k3H05MIkNiKntkKmS5rt6RbsUFJ0JCKHkQEp1KHIpYIod8YlcxLdk3Z3MQQy9TU
a6JooKF+Ph5TEqeiAFAnYqUsBso+zIguX02yqQxqj0ux76SJm+SrjG3iayC3ErrZB5Fi+tudi5jr
l4P/VV5i9WwxaAJCDTCnFYv6FjyHqzQfDWdzNnDoqeYopp+EOR0E2azp48QWYFZxJ+IIDBdv5StD
NySQU1cFRfAOOHqW800PYdZhgmyetY4NedrZ54VDC1Uzlh8YZcym9qbY

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FeodHoED2QtRqgU94gf5+FxKagLGJC0xpa3onHrGuJuYOB77blIsJKh6peDQ0CSrfgUnkDZOIOjC
ixqTzxrvZ+SwDJ7KkBtcqW0MX3su9MklnLILaGhYAX423e2uMOXcsxAIbmSrEoTUCFQx394tEaYv
1CE8v0HL1iI+mY9HnOGCyH/Q4mu/vKmW/7i3ups9j4wiz3HxXUEY9RDkFqyVK0BDDMIMwhJqs9zD
oQ0XfizvhHADp3LCbpsxkUPPPqaBNJ2VkOlhS/+7kY3mymqYukUOvQPjzZNMZBWjTBp079z6eZvG
Jfc5UiyoSMNdbFxiec2xoU4LORodHc3rcq7wZg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DFAiO9w8wDd5yttOiRg0nC2l/kp/3cYhQckPClJPpCXmanKDsj20p7Ny2doVY1JHQC8+F4bWomJl
tQTkVlSD+lNdKcE/v2V3KKlNX17EWdv6s8q/GR09ZwIq0uW5BMAdjF1h3eIvwSYVdC4a7m8Td8Wu
XiW+7td6WUemjX60VfxiaDQ1hTLKTrUnmAKzn3QE+aDeupHO46p+6SzC7+t1KAmKHI0zrlM368hl
rxHLGmIGk7oWEGuhc5ip0aJGoBJNROpdeJ0TxLp9xi9AaCGfdPyzqFUUwUmLRMkQ+xLhxTlkoIUd
avIQDojCdnK9a3VGPO/0OicPQ0/voTMw+iJ6pg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
6OJdRQZv1+vybEj2Oq6LxKqEFo+TttfRu1ENOufWHKLT6dhqAXaArRt5Dml0ZtkXid5PlkmP7y4R
dzGmzk66l1xAiBzyxt9opbNKO9E+6qG/9o1mjgCX0ikMZF11ArMmTFtZ//0slI7ZL1gzwJHMGh2r
1TPrjI7HNUnSz03wmGDE/MdLNuM0BcvCJIUJ22jCt2nMe+aWMryCJ1+qWc515UMWegztupQ0AlKc
dWzRZcZW9nZoyQt2faEaO24EP50c3AQ5xQ77f004W/92QTmc+GSI4X9rgfZ3mfapYCD+WwIHvdyx
d19CI5o7wAFbOxfD0x53HRhxlm+FnTd4evSxSA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17392)
`pragma protect data_block
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
yOUiAebeLw==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
