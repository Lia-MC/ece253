// After drawing your schematic, write code that corresponds to your schematic and a .do
// file that test your design. Your System Verilog code should use the same names for the
// wires and instances as shown in your schematic. Your .do file should have at least one
// test case. Complete Steps 1 and 2 as part of your pre-lab preparation.

module FA (input logic a, b, cin, output logic s, cout);
    assign s = a^b^cin;
    assign cout = (a&b)|(cin&a)|(cin&b);
endmodule

module adder4 (input logic[3:0] A, B, input logic cin, output logic[3:0] s, output logic cout);
    logic c1, c2, c3;
    FA u0(A[0], B[0], cin, s[0], c1);
    FA u0(A[1], B[1], c1, s[1], c2);
    FA u0(A[2], B[2], c2, s[2], c3);
    FA u0(A[3], B[3], c3, s[3], cout);
endmodule

module or8 (input logic[3:0] A, B, output logic ALUout);
    ALUout = |{A,B}; // A | B;
endmodule

module and8 (input logic[3:0] A, B, output logic ALUout);
    ALUout = &{A,B}; // A & B;
endmodule

module concat (input logic[3:0] A, B, output logic ALUout);
    ALUout = {A, B};
endmodule

module ALU (input logic[1:0] Function, input logic[3:0] A, B, output logic[7:0] ALUout);
    always_comb
        begin
            case (Function)
                2'b00: adder4 u0(A, B, 0, ALUout);
                2'b01: or8 u1(A, B, ALUout);
                2'b10: and8 u2(A, B, ALUout);
                2'b11: concat u3(A, B, ALUout);
                default: ALUout <= 8b00000000;
        end
endmodule