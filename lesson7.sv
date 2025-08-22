// arrays are an aggregate type
// provides more scalable implementation

module test ();
    byte b0, b1;
    initial begin 
        b0 = 8'b0; // set to 0
        b1 = 8'b1; // set to 1
    end

    // this is the same as:
    byte b[1:0]; // square bracket here indicates array size
    // this means the size is 2
    initial begin
        b[0] = 8'b0; // square bracket here indicates index
        b[1] = 8'b1;
    end

    // which is also the same as:
    byte b[1:0];
    initial begin
        b = '{8'b1, 8'b0}; // '{} indicates an array
    end

    // which is also the same as:
    byte b[1:0];
    initial begin
        for (int i = 0; i < $size(b); i++) begin // $size(b) returns size of array b which is 2 here
            b[i] = i;
        end
    end
    // execept this snippet is scalable unlike the others

    // we can also use a foreach loop
    byte b[1:0];
    initial begin
        foreach (b[i]) begin // goes thru all elements in b one by one
            b[i] = i;
        end
    end

    // packing and unpacking arrays
    bit b0, b1, b2; // three individual bits
    bit b[2:0]; // unpacked array with size of 3
    bit[2:0] b_packed; // packed array, bits are concatenated together to form a larger size variable
    // byte cannot be backed -> only single bit vectors can be packed: bit, logic, reg, wire

    // array creation
    bit b[2:0];
    bit b_le[2:0]; // little endian style
    bit b_be[0:2]; // big endian style
    bit b_cs[3]; // simply stating the size of the array instead of a range

    initial begin
        b[1] = b_le[1]; // these are both accessing indexes, it's legal here
        b = b_le // same size array so legal
        b[2:1] = b_le[1:0] // assignment with slices of arrays are legal as long as the sizes match
        b = b_be; // legal but note that b[2] = b_be[0], b[1] = b_be[1], b[0] = b_be[2]
    end

    // multidimensional arrays
    // all of these are two bytes:
    bit b_unpacked[1:0][7:0];
    bit[7:0] b_mixed[1:0];
    bit[1:0][7:0] b_packed;

    // for 2d arrays, you need two for loops (nested) to go through entire array
    byte by[1:0][2:0];
    initial begin
        for (int i = 0; i < 2; i++) begin
            for (int j = 0; j < 3; j++) begin
                by[i][j] = 3 * i + j;
            end
        end
    end
    // this is equivalent to:
    initial begin
        foreach (by[i][j]) begin
            by[i][j] = 3 * i + j;
        end
    end
endmodule