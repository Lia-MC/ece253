// while sv is a hardware language, it allows both for 
// synthesis (hardware oriented) and simulation (software oriented)

module test (); 
// module represents a block, 
// test is the name of the block, 
// bracket contains input and output

// simulation code:
initial $display("Hello World");
// initial represents where code starts to be executed, like main function in c
// $display is used to print messages

initial $display("Hello Again");
// multiple initial blocks can be used to different execution 
// every initial block runs in parallel in terms of order, no way to tell which happens first

// we generally use initial begin + end to wrap around code blocks that belong together:
initial begin 
    $display("Hello World");
end

// initial begin + end wrapping is necessary if there's multiple lines of code
initial begin 
    $display("Hello World"); // prints first
    $display("Hello Again"); // prints after first line is printed
    // however, in simulation time, they both happen at time zero...
    // we can introduce simulation time delay by introducing 
    #1ns;
    $display("Hello Againnn"); // delay allows this line to be printed a nanosec later
end
// within these blocks, every line is executed sequentially

// always blocks can also kickstart execution
always #1ns begin
    $display("Hello World");
end
// always block executes repeatedly and requires a trigger event
// here, this block will be printing the message every 1 nanosec

always @(clk) begin
    $display("Hello World");
end
// the trigger can also be a signal instead of time
// here, we have a clk signal, so its triggered every time clk toggles from 0 to 1 or 1 to 0 

// we can also limit the signal event using posedge or negedge
// posedge: positive edge, toggle from 0 to 1
// negedge: negative edge, toggle from 1 to 0
always @(posedge clk) begin // here, posedge so its triggered when clk toggled from 0 to 1
    $display("Hello World");
end
// always block may be synthesizable depending on how it's coded
// here, none of the always blocks are synthasizable because the always blocks are
// only used to print messages

endmodule