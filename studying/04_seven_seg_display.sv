module seg7(input logic[3:0]x, output logic[6:0] H); 
// why isnt input 3:0 cuz dont we need 4 bits to represent up till the number 9
// input logic[1:0]x was for the example which only displayed up til the number 3

    // light is on when switch is set to 0
    logic x1, x2, x3, x4;
    assign x1 = x[3];
    assign x2 = x[2];
    assign x3 = x[1];
    assign x4 = x[0];

    assign H[0] = (~x1)&(x2)&(~x3)&(~x4) + (~x1)&(~x2)&(~x3)&(x4);
    assign H[1] = (~x1)&(x2)&(~x3)&(x4) + (~x1)&(x2)&(x3)&(~x4);
    assign H[2] = (~x1)&(~x2)&(x3)&(~x4);
    assign H[3] = (~x1)&(~x2)&(~x3)&(x4) + (~x1)&(x2)&(~x3)&(~x4) + (~x1)&(x2)&(x3)&(x4);
    assign H[4] = (~x1)&(x4) + (~x1)&(x2)&(~x3) + (~x2)&(~x3)&(x4);
    assign H[5] = (~x1)&(~x2)&(x3) + (~x1)&(~x2)&(x4);
    assign H[6] = (~x1)&(~x2)&(~x3) + (~x1)&(x2)&(x3)&(x4);
endmodule