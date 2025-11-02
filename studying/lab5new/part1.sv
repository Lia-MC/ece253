module part1(
    input  logic Clock,
    input  logic Reset,
    input  logic w,
    output logic z,
    output logic [3:0] CurState
);

    typedef enum logic [3:0] {A=4'd0, B=4'd1, C=4'd2, D=4'd3,
                              E=4'd4, F=4'd5, G=4'd6} statetype;
    statetype y_Q, Y_D;

    // Next-state logic
    always_comb begin
        unique case (y_Q)
            A:   Y_D = (w) ? B : A;
            B:   Y_D = (w) ? C : A;
            C:   Y_D = (w) ? D : E;         // 11→ 111 or 110
            D:   Y_D = (w) ? F : E;         // 111→1111 or 1110
            E:   Y_D = (w) ? G : A;         // 110→1101 or 1100
            F:   Y_D = (w) ? F : A;         // stay high for >4 1s
            G:   Y_D = (w) ? C : A;         // 1101 overlap
            default: Y_D = A;
        endcase
    end

    // State register
    always_ff @(posedge Clock) begin
        if (Reset) y_Q <= A;
        else       y_Q <= Y_D;
    end

    // Output: z=1 in states F or G
    assign z = (y_Q==F) || (y_Q==G);
    assign CurState = y_Q;

endmodule
