module mux_2_to_1(input logic select, a, b, output logic res);
    // my attempt:
    // if (select) assign res = a;
    // else assign res = b;

    // correct way:
    assign res = (~s & a) | (s & y);
    // if s is high, then if y is high res is high
    // if s is high, then if y is low res is low
    // if s is low, then ~s is high, so if a is high then res is high
    // if s is low, then ~s is high, so if a is low then res is low
endmodule

// mux_4_to_1 would select 1 of the 4 inputs

// multibit signals (buses: bundle of signals)
module mux_2_to_1_BUT_2_bit_input(input logic[1:0] a, b, logic s, output logic[1:0] res);
    // my attempt
    // assign res = (~s & a) | (s & b);

    // correct way:
    assign res[1] = (~s & a[1]) | (s & b[1]);
    assign res[0] = (~s & a[0]) | (s & b[0]);
endmodule