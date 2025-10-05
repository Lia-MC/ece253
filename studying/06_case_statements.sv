module casestatements_example_seg7(input logic[3:0] SW, output logic[6:0] HEX0);
    always_comb // case statements require an always block
    begin
        case (SW) // CASE REQUIRES AN ENDCASE!!!
        // CASE REQUIRES A DEFAULT CASE!!!
            0: HEX0 = 7'b1000000;
            1: HEX0 = 7'b1000001;
            2: HEX0 = 7'b1000010;
            3: HEX0 = 7'b1000011;
            4: HEX0 = 7'b1000100;
            5: HEX0 = 7'b1000101;
            6: HEX0 = 7'b1000110;
            7: HEX0 = 7'b1000111;
            8: HEX0 = 7'b1001000;
            9: HEX0 = 7'b1001001;
        default: HEX0 = 7'b1111111;
        endcase       
    end
endmodule