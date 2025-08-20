// VARIABLES!
// reg      | width: 1  | 4 states: 0, 1, Z, X | 1 bit
// wire     | width: 1  | 4 states: 0, 1, Z, X | 1 bit
// logic    | width: 1  | 4 states: 0, 1, Z, X | 1 bit
// bit      | width: 1  | 2 states: 0, 1       | 1 bit
// byte     | width: 8  | 2 states: 0, 1       | signed
// shortint | width: 16 | 2 states: 0, 1       | signed
// int      | width: 32 | 2 states: 0, 1       | signed
// longint  | width: 64 | 2 states: 0, 1       | signed
// integer  | width: 32 | 4 states: 0, 1, Z, X | signed

// high Z: no voltage, "no value"
// unknown X: eg. 0.7V, may be 0 or 1

// in general, 4 states are used to represent hardware signals, 
// and 2 states are used to represent numbers

// although currently all of the first four types have width = 1, 
// all of those can be extended into multiple bits (eg. logic[3:0], bit[7:0])

// all multiple bits (aka width of more than 1) are signed
// signed: most significant bit is treated as a sign where 0 is positive, 1 is negative
// eg. 0000 0001 => +1, 1000 0001 => -127

module test ();
    byte byt; // 2 states // byte default is 0
    logic[7:0] lg8; // 4 states // logic default is unknown aka X
    initial begin
        byt = lg8; // byte can't store unknown X or high Z value, so this is not recommended
        // if lg8 stores unknown X or high Z value, it just gets converted to 0 in byt

        // we can use double & triple equals to compare the two values
        if (byt == lg8) $display("byt == lg8"); // compares only 2 states 
        // here, unknown because ?????????????????????????????
        if (byt === lg8) $display("byt === lg8"); // can compare 4 states 
        // here, negative because the two values are different
        if ($isunknown(lg8)) $display("lg8 is unknown"); // if lg8 is X then this is true
        lg8 = 8'b00000000;
        if ($isunknown(lg8)) $display("lg8 is unknown"); // since lg8 is zero, this is false
    end

    logic [7:0] lg8;
    byte byt; // signed
    initial begin 
        lg8 = 255;
        byt = -1;
        if (lg8 == byt) $display("same")
        // true because the comparison is performed on a bit basis
        $display("byt = %0d, %0d", byt, byt); // would print 11111111
        $display("lg8 = %0d, %0d", lg8, lg8); // would print 11111111
        
        // counter:
        for (byt = 0; byt < 200; byt++) begin 
        // byt is a byte type which is signed so it can't count up to 200
        // byt can only count -128 to 127 so this wouldn't work
        // counter would reach 127, then loop back to 0 and keep counting
        // infinite loop since always smaller than 200

        // we could set 
        byte unsigned byt2;
        // if we loop over byt2, it will reach 200 since 200 is within 256 

            $display("byt = %0d", byt);
        end
        $display("Count finished");
    end

    byte unsigned ubyt0;
    byte unsigned ubyt1;

    // this is the same as:

    typedef byte unsigned ubyte;
    ubyte ubyt2;
    ubyte ubyt3;

endmodule