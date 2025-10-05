module alwaysandifstatements(input logic x1, x2, s, output logic f);
    always_comb // combinational logic //  equivalent to always @ (x1, x2, s) <- sensitivity list
    begin
        if (s==0) f = x1; // notice there are no assigns inside of always_comb
        else f = x2;
    end
endmodule
// this is a mux!!!