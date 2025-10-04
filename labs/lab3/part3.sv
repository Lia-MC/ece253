module d_ff (
    input logic clk, reset_b, d, 
    output logic q
);

    always_ff @(posedge clk)
    begin
        if 
            (reset_b) q <= 1'b0;
        else 
            q <= d;
    end

endmodule

module part3(input logic clk, reset_b, input logic[3:0] data, input logic[2:0] Function, output logic[7:0] ALU_reg_out);
    logic [3:0] A, B;
    logic [7:0] alu_result;

    assign A = data;
    assign B = ALU_reg_out[3:0]; // feedback from register
    
    always_comb
    begin
        case (Function)
            3'b000: alu_result = data + B; // A + B the ‘ + ’ operator 
            3'b001: alu_result = data * B; // A * B using the ‘ * ’ operator 
            3'b010: alu_result = B << A; // Left shift B by A bits using the shift operator <<.
            3'b011: alu_result = ALU_reg_out; // Hold current value in the Register , i . e . , the register value does not change 
            default: alu_result = 8'b00000000 // stores value in register or set all to 0
    end

    // erm this feels unnecessary but idk how else to use the flippy floppers
    d_ff ff0 (.clk(clk), .reset_b(reset_b), .d(alu_result[0]), .q(ALU_reg_out[0]));
    d_ff ff1 (.clk(clk), .reset_b(reset_b), .d(alu_result[1]), .q(ALU_reg_out[1]));
    d_ff ff2 (.clk(clk), .reset_b(reset_b), .d(alu_result[2]), .q(ALU_reg_out[2]));
    d_ff ff3 (.clk(clk), .reset_b(reset_b), .d(alu_result[3]), .q(ALU_reg_out[3]));
    d_ff ff4 (.clk(clk), .reset_b(reset_b), .d(alu_result[4]), .q(ALU_reg_out[4]));
    d_ff ff5 (.clk(clk), .reset_b(reset_b), .d(alu_result[5]), .q(ALU_reg_out[5]));
    d_ff ff6 (.clk(clk), .reset_b(reset_b), .d(alu_result[6]), .q(ALU_reg_out[6]));
    d_ff ff7 (.clk(clk), .reset_b(reset_b), .d(alu_result[7]), .q(ALU_reg_out[7]));

endmodule