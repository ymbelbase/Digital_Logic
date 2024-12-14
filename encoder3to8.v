module PriorityEncoder8to3 (
    input [7:0] I,  // 8 input lines
    output reg [2:0] Y,  // 3-bit output encoding the highest active input
    output reg V  // Valid output signal
);

    always @(*) begin
        case (1'b1)
            I[7]: begin Y = 3'b111; V = 1; end
            I[6]: begin Y = 3'b110; V = 1; end
            I[5]: begin Y = 3'b101; V = 1; end
            I[4]: begin Y = 3'b100; V = 1; end
            I[3]: begin Y = 3'b011; V = 1; end
            I[2]: begin Y = 3'b010; V = 1; end
            I[1]: begin Y = 3'b001; V = 1; end
            I[0]: begin Y = 3'b000; V = 1; end
            default: begin Y = 3'b000; V = 0; end
        endcase
    end

endmodule
