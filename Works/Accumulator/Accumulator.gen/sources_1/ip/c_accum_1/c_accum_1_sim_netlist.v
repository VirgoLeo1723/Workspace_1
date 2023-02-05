// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Jan 31 18:41:40 2023
// Host        : DESKTOP-BR8935G running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Study/HK222/PAPER/Practice/Accumulator/Accumulator.gen/sources_1/ip/c_accum_1/c_accum_1_sim_netlist.v
// Design      : c_accum_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_accum_1,c_accum_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_accum_v12_0_14,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module c_accum_1
   (B,
    CLK,
    BYPASS,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 bypass_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME bypass_intf, LAYERED_METADATA undef" *) input BYPASS;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [15:0]Q;

  wire [15:0]B;
  wire BYPASS;
  wire CLK;
  wire [15:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
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
  c_accum_1_c_accum_v12_0_14 U0
       (.ADD(1'b1),
        .B(B),
        .BYPASS(BYPASS),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .Q(Q),
        .SCLR(SCLR),
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
HybI8Ww66k/C+Bd8xG5Ogtt27PqfiI4s6Bia0VjMtnA+ibdCdc4kaM0R83xZeJ/j32W4ONJ+ocP9
FwNrdMyFrFt7QbTFu09+43Ze1nCn0XBo7H1s+TU2SgvdS9M3Ak+asF/5ssry9kUnIdOw8t6ecncc
PfTvhfpPexoX3wIS8xZ0BK6jjrJUVwVyZZOyql8nPZiy6DLmnJPXxzeeEnAsshIjZdtHDTelLxw4
EBHmyO8Ej3Z0kvvL7X6+CUkqbmXtXnr7feRlxBvVUwOb41uKd1jI4Ek+3Z3kwsHGrPDMT4/IoF08
mVcaXY1bzA1d+xKAcNJAV5kulpS+n8fj93IIAA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QC8OFH2bu7vKcSBbC7oCoRyiOAbPG8OOsDyLy6NuqnEcah36wV96KPMDG8INvBIG50uQnVmPB553
Zo1YYyE4MX6hGiP19hr3o53sro1iDLquGdTvuoUNBEQ9E/RXbuYIDRQgbECqkZFMvl1/pP/aAfj3
nA0Lkcqyp+kB5WFm2O8fy5AxoZy8CE8KXh8TtcyKbyU91C0znCwkCcHXv3QHTsZkYxt/sgfyoZVl
pzyYvomxiLggf8CIQgwWPM141aPkzl8zNkewMfpZtdiU0TnLMjSb8j93/hrkZKVzOzWys3N+hdBa
qmIvZgeOM1ctzmqQWuDv+yCAlTsfcX4+cJ6D7w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17680)
`pragma protect data_block
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
i+xMZh1RM1MVEQ==
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
