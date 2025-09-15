// two syntax were created to model hardware in sv: wire and reg
module dut (input wire clk);
    wire w0; // create a wire named w0, used for connectivity
    reg r0; // create a reg named r0, technically stands for register but it isn't a register

    // can create multiple wires and regs:
    wire w1, w2;
    reg r1, r2;

    // can create a multiple bits version for each:
    wire[7:0] w_7_0; // create an 8 bits wire
    reg[7:0] r_7_0; // create an 8 bits reg
    // notation??????????????????????????????????????

    // not a hard rule but...
    // ...wires should be controlled through assign statements
    assign w0 = 1'b1; // connects w0 to a high supply 
    assign w1 = r0 & w0; // creates an AND gate of r0 & w0 where w1 is connected to output

    // ...regs should be set inside always or initial blocks
    // use reset!! (convention since if we don't initialize r1 we don't know its value)
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            r1 <= 0;
        end else begin
            r1 <= r0 & w0; // creates an AND gate and a register
            // AND gate between r0 and w0
            // output of the AND gate and clk serve as inputs for register
            // output of register is r1
        end
        // notice the <= is a nonblocking assignment, 
        // instead of the usual blocking assignment: =
    end
    initial r0 = 1'b1; 
    // initial is simulation code, can't be translated into logic gates/connection
    // initial can be used as test bench to drive stimulus to design


    // another syntax exists called logic, it replaces wire and reg
    // initial, always, and assign can all be used on logic
    logic lg0, lg1, lg2;
    initial lg0 = 1'b1;
    always @(posedgeclk) begin
        lg1 = lg0;
    end
    assign lg2 = lg1;

    // you can't entirely replace wires and reg with logic
    // for wire, you can have multiple drivers:
    assign w0 = w1;
    assign w1 = w2;
    // you can't have multiple drivers for logic
    assign lg0 = lg1;
    assign lg1 = lg2; // this is illegal... only wire can do this

    // more about drivers
    // this is NOT multiple drivers issue, this is a race condition
    // raise condition essentially means one of the conditions will override the other
    initial lg0;
    initial lg0 = 1'b0;
    initial lg0 = 1'b1;
    // generally no way to tell which condition will go first

    // here is another race condition, not multiple drivers issue
    always @(posedge clk) begin
        lg0 = 1'b0;
    end
    always @(posedge clk) begin
        lg0 = 1'b1;
    end

    // but this IS a multiple drivers issue
    assign lg0 = 1'b0;
    always @(posedge clk) begin
        lg0 = 1'b1;
    end

    // note: multiple drivers issue -> failed compilation

    // a "multiple drivers" issue arises when a signal or net in a 
    // digital circuit is driven by more than one source

endmodule