// WHAT'S THE DIFFERENCE?

// generally, both have similar flow
// upon reset, it's off, and if it's not in reset, 
// then state alternates between on and off at every clk

// snippet 1:
module dut (input wire clk, reset);
    enum {OFF, ON} state;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state = OFF;
        end else begin
            state = (state==ON) ? OFF : ON;
        end
    end
endmodule


// snippet 2:
module dut (input wire clk, reset);
    string state;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state = "OFF";
        end else begin 
            state = (state == "ON") ? "OFF" : "ON";
        end
    end
endmodule

// my thoughts
// snippet 1 uses enum while snippet 2 uses string
// since snippet 2 uses string, i think there's something that
// acts weirdly compaired to snippet 1 in the line about
// alternating between the states
// specifically the statement state == "ON" or the bracket that
// indicates the priorities in calculations could be peculiar...?
// not sure what the question mark syntax means

// answer
// enum is not synthesizable, string is not
// strings can be used in simulation
// i think it means, snippet 1 will run, but snippet 2 just
// doesn't make sense because you can't use strings in 
// "actual" aka non-simulation code