`timescale 1ns / 1ns // `timescale time_unit/time_precision

module FA (input logic a, b, cin, output logic s, cout);
    assign s = a^b^cin;
    assign cout = (a&b)|(cin&a)|(cin&b);
endmodule

module adder4 (input logic[3:0] A, B, input logic cin, output logic[3:0] s, output logic cout);

    logic c1, c2, c3
    FA u0(A[0], B[0], cin, s[0], c1);
    FA u0(A[1], B[1], c1, s[1], c2);
    FA u0(A[2], B[2], c2, s[2], c3);
    FA u0(A[3], B[3], c3, s[3], cout);

endmodule