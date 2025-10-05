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

module ripple_carry_adder(input logic[3:0] a, b, cin, output logic[4:0] s, output logic cout);
    always_comb
    begin
        logic c1, c2, c3;
        full_adder u0(a[0], b[0], cin, s[0], c1);
        full_adder u1(a[1], b[1], c1, s[1], c2);
        full_adder u2(a[2], b[2], c2, s[2], c3);
        full_adder u3(a[3], b[3], c3, s[3], cout);
    end
endmodule