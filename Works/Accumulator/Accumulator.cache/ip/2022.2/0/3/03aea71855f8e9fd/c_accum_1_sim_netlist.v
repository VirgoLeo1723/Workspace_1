// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Jan 31 18:41:38 2023
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_accum_v12_0_14 U0
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
aXxxy3lFQHrhte4M/KJU+/Rd1nFJcrc52sFlruk/LMg9roGO7dUKXxNzCPm9SqXrHTp2ku+le6N7
diY1/gCKCAvfF1EHaoAjwRQhJiL/h/R9c1yTy2kyPnBtV1vDtO7wms00h62097H9a2Nx2/WWz2Mp
fLQlrg2SeXtTQpH+h5WcvbbK1Aj0ttSjxwdEVBnesDYmvxDSlB6IRVi8g9WQPuYy+qZ2C6WYJ17J
LxbbFzheQpIamo43jC/VC7ATfviW3mIJcOIKIEG3V2bWIYNbYpm8aX+Nup33TCzHkYBGBYBLneYl
1qJ2bo9B0t93DePU5NtQ5bQ3Hl2Q95V7YiCKEQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LsZsX+Rxl8ldQ8LgjA3QBmI6nqhkou3pKoNs8I0O0ErpNzaQvk6etxIMiGvxpBbXXtes6iZUrIo3
GDJJgPYo/D9bzE6f3gXuxsd4mpIaH+lt5oUw4cMFeIXec2gdUIdxZMQ3oGPOCemF+UKzZci3MBOH
rmN70yJF3bsQ59qhlAfxIQJgiwL/qw+HlJarnCp3UPam08pAB9N7rNoBF3vPbddswogbOLe56W1H
17rOy2S7ur9hlkYFFMRsDdHowULAl1hSjNIzqH0s2Nc4mbit+yXQpSiO+7hCZ8VaImYZqibwEGJ3
tMS0JwgY9hvxNReIEz/bb5oj1cKhGnO01IpOXA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17760)
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
