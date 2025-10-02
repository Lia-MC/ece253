module basic_logic(input logic a, b, output logic w, x, y, z);
    assign w = a & b; // bitwise and
    assign x = a | b; // bitwise or
    assign y = a ^ b; // bitwise xor
    assign z = ~a; // bitwise not
endmodule