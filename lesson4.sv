// enumeration

module test ();
    parameter RED=0, GREEN=1;
    parameter DAY=0, NIGHT=1;

    int colour;
    int mode;
    initial begin
        colour = 32'd0;
        colour = RED;
        $display("colour = %0d", colour); 
        // mild proble, colour = DAY; could replace this (it shouldn't but it's possible)
        // to resolve this, we can use enum

        mode = 32'd0;
        mode = DAY;
        $display("mode = %0d", mode);
    end

    // enum begins here:
    // type                   // variable
    enum int {RED=0, GREEN=1} colour;
    enum int {DAY=0, NIGHT=1} mode;
    initial begin
        colour = RED;
        $display("colour = %0d", colour); 
        mode = DAY;
        $display("mode = %0d", mode);
    end

    // the following are equivalent
    enum {R, G, B} colour; // int colour
    enum int {R=0, G=1, B=2} colour;
    // by default, enum is int, first var is 0, second is 1, third is 2

    // we can change up enum a lil by:
    enum bit[1:0] {R, G, B} colour;

    // overwriting:
    enum {R=1, G, B} colour; // R=1,G=2,B=3
    enum {R, G=2, B} colour; // R=0,G=2,B=3 // ugly tho, i don't recommend

    // we CAN'T assign enum variables like this:
    enum {RED, GREEN} colour0;
    enum {RED, GREEN} colour1;

    // we CAN and SHOULD assign enum variables like this:
    typedef enum {RED, GREEN} eColour;
    eColour colour0;
    eColour colour1;
    eColour colour2;

    // we CAN'T do this:
    colour0 = 0; // even if RED = 0 and RED is defined

    // but we CAN do this:
    colour1 = RED;

    // and we ALSO CAN do this:
    $cast(colour2, 0); // cast executes assignment as long as underlying types are compliant
    // cast would fail if we assign it to 2, since RED=0 and GREEN=1, neither is 2

    enum {RED, GREEN} colour;
    enum {DAY, NIGHT} mode;
    initial begin
        colour = RED; // legal
        colour = DAY; // illegal even if both red and day are 0

        colour = RED;
        colour = colour.first(); // get the first value: RED
        // the above is the same as setting colour to RED
        colour = colour.next(); // colour was RED so next value is GREEN
        colour = colour.next(); // colour was GREEN so next value is RED
        colour = colour.last(); // colour will be set to GREEN
        $display("colour=%0d,%0s", colour, colour.name()); 
        // colour.name() gives you the name of the value
        // here, colour.name() would give you GREEN
        // this line will print colour=1,GREEN
    end
endmodule