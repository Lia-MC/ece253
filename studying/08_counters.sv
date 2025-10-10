// counter: requires a TQ FF -> take output of Q, XOR it with input T and feed that into D of a normal FF
// T FF -> toggle FF

module upcount(input logic[3:0] R, input logic resetn, clk, en, l, output logic[3:0] q); // assume asynchronous reset
    // R is some value chosen by the user to "reset/default set" to, and it doesn't have to necessarily be 0
    // en is enable -> when enabled, upcount counts up
    // l (aka L) is the signal that makes q get the value of R -> when L is high, the value of R is loaded into q

    always_ff@(posedgeclk, negedge resetn) // asynchronous negedge reset, reset is in the sensitivity list
    begin
        if (~resetn) // resetn takes priority, if reset is called then set to 0
            q <= 4'b0;
        else if (l) // if l (L) is high then q takes on some specific value R
            q <= R;
        else if (E)
            q <= q + 1; // when the counter is enabled it counts, when disable it holds the value
    end
endmodule