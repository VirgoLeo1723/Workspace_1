onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc "  -L xbip_utils_v3_0_10 -L c_reg_fd_v12_0_6 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_6 -L xbip_dsp48_addsub_v3_0_6 -L xbip_addsub_v3_0_6 -L c_addsub_v12_0_14 -L xbip_dsp48_acc_v3_0_6 -L xbip_accum_v3_0_6 -L c_accum_v12_0_14 -L xil_defaultlib -L secureip -lib xil_defaultlib xil_defaultlib.c_accum_0

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {c_accum_0.udo}

run 1000ns

quit -force
