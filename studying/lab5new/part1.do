vlog part1.sv
vsim work.part1
add wave -r /*
force Clock 0 0ns, 1 5ns -repeat 10ns
force Reset 1
force w 0
run 10ns
force Reset 0
# input stream 1 1 1 1 0 1
force w 1; run 10ns
force w 1; run 10ns
force w 1; run 10ns
force w 1; run 10ns
force w 0; run 10ns
force w 1; run 10ns
run 50ns
