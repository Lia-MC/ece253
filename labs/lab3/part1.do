# Write the code that corresponds to your schematic and a .do file that test your design.
# First, write a module for the full adder sub-circuit and then write the part1 module that
# will instantiate four instances of your full adder module. Your code should use the same
# names for the wires and instances as shown in your schematic. Second, write a .do file for
# your module with at least one test case. Complete Steps 1 and 2 as part of your pre-lab
# preparation.


# set the working dir, where all compiled verilog goes
vlib work

# compile all system verilog modules in mux.sv to working dir
# could also have multiple verilog files
vlog part1.sv

#load simulation using mux as the top level simulation module
vsim adder4

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# test case 1
#set input values using the force command, signal names need to be in {} brackets
force {A} {0, 0, 0, 0}
force {B} {0, 0, 0, 0}
force {cin} 0b0
#run simulation for a few ns
run 10ns

# test case 2
#set input values using the force command, signal names need to be in {} brackets
force {A} {0, 0, 0, 0}
force {B} {0, 0, 0, 0}
force {cin} 0b0
#run simulation for a few ns
run 10ns

# test case 3
#set input values using the force command, signal names need to be in {} brackets
force {A} {0, 0, 0, 0}
force {B} {0, 0, 0, 1}
force {cin} 0b0
#run simulation for a few ns
run 10ns

# test case 4
#set input values using the force command, signal names need to be in {} brackets
force {A} {0, 0, 0, 1}
force {B} {0, 0, 0, 0}
force {cin} 0b0
#run simulation for a few ns
run 10ns

# test case 5
#set input values using the force command, signal names need to be in {} brackets
force {A} {0, 0, 0, 0}
force {B} {0, 0, 0, 1}
force {cin} 0b1
#run simulation for a few ns
run 10ns

# test case 6
#set input values using the force command, signal names need to be in {} brackets
force {A} {0, 0, 0, 1}
force {B} {0, 0, 0, 0}
force {cin} 0b1
#run simulation for a few ns
run 10ns

# test case 7
#set input values using the force command, signal names need to be in {} brackets
force {A} {0, 0, 0, 1}
force {B} {0, 0, 0, 1}
force {cin} 0b1
#run simulation for a few ns
run 10ns

# test case 8
#set input values using the force command, signal names need to be in {} brackets
force {A} {1, 1, 1, 1}
force {B} {1, 1, 1, 1}
force {cin} 0b0
#run simulation for a few ns
run 10ns

# test case 9
#set input values using the force command, signal names need to be in {} brackets
force {A} {1, 1, 1, 1}
force {B} {1, 1, 1, 1}
force {cin} 0b1
#run simulation for a few ns
run 10ns

# test case 10
#set input values using the force command, signal names need to be in {} brackets
force {A} {0, 1, 1, 1}
force {B} {1, 1, 1, 1}
force {cin} 0b1
#run simulation for a few ns
run 10ns

# test case 11
#set input values using the force command, signal names need to be in {} brackets
force {A} {0, 1, 1, 1}
force {B} {0, 0, 1, 1}
force {cin} 0b1
#run simulation for a few ns
run 10ns