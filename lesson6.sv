module test ();
    // struct is an aggregate variable -> it can contain other variables of varying types
    // type                          // variables
    struct {bit b; byte byt; int i;} s0, s1;

    // we can use typedef to define structs as well
    typedef {bit b; byte byt; int i;} myStruct;
    myStruct s0, s1;
    // this is now a new variable type
    
    initial begin
        s0.b = 1'b0;
        s0.byt = 8'd7;
        s0.i = 32'habcd;
        s1 = s0; // this means, s1.b = s0,b, s1.byt = s0.byt, and s1.i = s0.i
    end

    bit[7:0] red0, red1, red2;
    bit[7:0] green0, green1, green2;
    bit[7:0] blue0, blue1, blue2;
    initial begin
        red0 = 8'h0;
        green0 = 8'h0;
        blue0 = 8'hff;
        red1 = red0; green1 = green0; blue1 = blue0;
        red2 = red0; green2 = green0; blue2 = blue0; 
    end
    
    // my attempt at this typedef 
    typedef struct {bit[7:0] red; bit[7:0] green; bit[7:0] blue;} pixel;
    pixel pixel0, pixel1, pixel2;

    // correct version
    typedef struct {bit[7:0] red, green, blue;} pixel0, pixel1, pixel2;

    // and now the assignment of pixel valuesss
    initial begin
        pixel0.red0 = 8'h0;
        pixel0.green0 = 8'h0;
        pixel0.blue0 = 8'hff;
        pixel1 = pixel0;
        pixel2 = pixel0;
    end

    // next part
    struct {bit b; int i;} s0;
    initial begin
        $display("%0b", s0.b);
        $display("%0b", s0.i);
        $display("%0p", s0);
        // p is used for aggregate variables like structs, and prints name and value within every member of the struct
        $display("%0b", s0); // illegal
    end

    // we can pack structure variables
    // packed means you can access the structure as one numerical variable
    struct packed{bit b; int i;} s0;
    initial begin
        $display("%0b", s0.b);
        $display("%0d", s0.i);
        $display("%0p", s0);
        $display("%0b", s0); // legal
    end

    struct {bit b; int i;} s0, s1;
    struct packed {bit b; int i;} sp0, sp1;
    initial begin
        s1 = s0;
        sp1 = sp0;
        s1 = sp0; // illegal
    end

    struct packed {bit[7:0] red; bit[7:0] green; bit [7:0] blue;} pixel;
    struct {string name; int age;} person;
    initial begin
        pixel.red = 8'hff;
        person.name = "Leo";
    end
    // structural variables MAY be synthesizable
    // if all its members are numerical variables, it's synthesizable
    // if it contains variables like a string, it's not synthesizable
endmodule