// SEQUENTIAL CIRCUITS!!!
// outputs are determined by PRESENT and PREVIOUS inputs in some window of time

// 1. LATCH: cross coupled NOR gates
//    output continuously stores & maintains previous output until it is explicitly reset
//    if R = S, weird things can happen
//    inputs: R, S
//    outputs: Q, ~Q

// 2. GATED RS LATCH: add a clk to latch
//    clk allows enable/disable of the latch, clk is ANDed with each input R and S before they enter latch
//    inputs: R, S, clk
//    outputs: Q, ~Q

// 3. GATED D LATCH: 
//    initial value of Q is crisscrossmode undertermined!!!
//    level sensitive -> Q tracks D as long as clk is high
//    at clk = 0, Q is in storage mode -> opaque mode
//    at clk = 1, Q tracks D where D = 0 (aka ~D) is reset and D = 1 (aka D) is set -> transparent mode
//    prevents the situ where S = R where things in the latch got weird
//    inputs: D, clk
//    outputs: Q, ~Q

module D_latch(input logic d, clk, output logic q);
    always_latch 
    begin
        if (clk == 1)
            q = d;        
    end
endmodule

// 4. D FLIP FLOP (POSITIVE EDGE TRIGGERED): 
//    gated d latch except Q tracks D only AT the POSITIVE EDGE of the clk
//    inputs: D, clk
//    outputs: Q, ~Q

module d_ff_pos(input logic d, clk, output logic q);
    always_ff @ (posedgeclk)
        q <= d; // storage at an instant of time
endmodule

// 5. D FLIP FLOP (NEGATIVE EDGE TRIGGERED): 
//    gated d latch except Q tracks D only AT the NEGATIVE EDGE of the clk
//    inputs: D, clk
//    outputs: Q, ~Q

// 6. REGISTER (FLIP FLOPS == REGISTERS)
module register_8bits(input logic[7:0] d, input logic clk, output logic[7:0] q);
    always_ff @ (posedgeclk)
        q <= d;
        // could also specify q[0] = d[0]; for each element to choose specific elements instead of the whole dataset
endmodule

// 7. ACTIVE HIGH SYNCHRONOUS RESETS
module d_ff_synch(input logic d, clk, resetn, output logic q);
    always_ff @ (posedgeclk) // reset isn't in sensitivity list, it's synchronous
        if (resetn == 1) q <= 1'b0; // if active edge of reset is high, reset => active high reset
        else q <= d;
endmodule

// 8. ACTIVE LOW SYNCHRONOUS RESETS
//    synchronous with clk edge
module d_ff_synch(input logic d, clk, resetn, output logic q);
    always_ff @ (posedgeclk) // reset isn't in sensitivity list, it's synchronous
        if (resetn == 0) q <= 1'b0; // if active edge of reset is low, reset => active low reset
        else q <= d;
endmodule

// 9. ACTIVE HIGH ASYNCHRONOUS RESETS
//    independent of clk edge
module d_ff_asynch(input logic d, clk, resetn, output logic q);
    always_ff @ (posedgeclk, posedge resetn) // reset appears in sensitivity list, it affects q independent of clk edge
    begin
        if (resetn == 1) q <= 1'b0; // active high reset
        else q <= d;
    end
endmodule

// 10. ACTIVE LOW ASYNCHRONOUS RESETS
//    independent of clk edge
module d_ff_asynch(input logic d, clk, resetn, output logic q);
    always_ff @ (posedgeclk, negedge resetn) // reset appears in sensitivity list, it affects q independent of clk edge
    begin
        if (resetn == 0) q <= 1'b0; // active low reset
        else q <= d;
    end
endmodule

// 11. MULTIBIT (8 BIT) REGISTER (FF) WITH RESET
module register_8bits(input logic[7:0] d, input logic clk, resetn, output logic[7:0] q);
    always_ff @ (posedgeclk)
    begin
        if (resetn == 0) q <= 8'b0; // this is basically the only thing in need of change
        else q <= d;
    end
endmodule

// 12. ENABLE 
//     chooses whether data is loaded in or not at clk edge
//     pass new value of d to ff if EN is high, otherwise recycles old state
//     prevent losing data by disabling and recycling the old value