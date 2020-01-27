onerror {quit -f}
vlib work
vlog -work work MyPiano.vo
vlog -work work MyPiano.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.FreqChange_vlg_vec_tst
vcd file -direction MyPiano.msim.vcd
vcd add -internal FreqChange_vlg_vec_tst/*
vcd add -internal FreqChange_vlg_vec_tst/i1/*
add wave /*
run -all
