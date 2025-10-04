module half_adder_my_version(input a, b, output sum, carry_out);
    assign sum = a ^ b;
    assign carry_out = a & b;
endmodule

module half_adder_correct_version(input logic a, b, output logic[1:0] s); // s[1] is carry out, s[0] is sum
    assign s[0] = a ^ b;
    assign s[1] = a & b;
endmodule

module full_adder(input logic a, b, carry_in, output logic[1:0] s);
    s[0] = a ^ b ^ carry_in;
    s[1] = (a & b) | (a & carry_in) | (b & carry_in);
endmodule

module ripple_carry_adder(input logic[3:0] a, b, cin, output logic[4:0] s);
    always_comb
    begin
        full_adder u0()
    end
endmodule