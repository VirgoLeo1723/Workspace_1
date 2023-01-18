// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Jan 18 01:04:28 2023
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
  c_accum_1_c_accum_v12_0_14 U0
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
ctKHq927sRNt0b6ya9jyZUw3+jHF4lHKNxrMZFw/gC/7kw6gUWUgGxZJP2GX7TjyT3oOeOpdap/0
t2U5tZ9jaA/2QvLCis/ZtxPDi4b6IFQtxs04nVaZ6IiHzpuqjulOyocrUvnejZ5Xet9PcFkk5350
CE9wgeNhwGj6Ft+lw1tvgblgPkyrkNOnkHxFkQ/X1bpK0npZjDfyiWjW9A15ttzUgIG17rYzmv0F
mKdIMChQauZk8ekfuLtzIjuL5qpQM3hdfi51HTAQZDcFKOd3Kb7T8uLL2ree+189rTM1zk4JAd9f
FFGqPenoZ11FF1SZx09I3MCO5oYPT4RJ+WOpOw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dKpZEWqzPW+5JUYbeuGcQ/5wxFdE7EwsULP8d60jq4t5tYUThgOj3gyq8b9lY19vQ6Y4UuyUiIsU
K/v+ZluCFeHpZNjd5HfAyP7Mt35h1cZeBLNDpnSxbViKBzQSLQdQUAS8EXm2ZGuWlGlKjBZ0FQW2
hVUiMgpLZYJAD3nc2UMmXCvEXTtbVOxJZ8Jt6XT/UBOcTO2mO5kS+l7JVRQqfKNwqTivwG07G+Vq
4GhddfM8Yt6ibQIqOX9nLdw3gr0g8O6ApgmoKdzv4PfH1XVn+VJVPdPogmNOBxLib+425Dcx7LLc
xmlprkpWkGBvlCbYcuu6Dmsk/j2j1budpokBhg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17312)
`pragma protect data_block
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
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
