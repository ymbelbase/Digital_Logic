module MUX8to1_4bit (
    input [3:0] D0, D1, D2, D3, D4, D5, D6, D7,  // 8 data inputs
    input [2:0] S,                            // 3-bit select input
    output reg [3:0] Y                        // 4-bit output
);
    always @(*) begin
        case(S)
            3'b000: Y = D0;
            3'b001: Y = D1;
            3'b010: Y = D2;
            3'b011: Y = D3;
            3'b100: Y = D4;
            3'b101: Y = D5;
            3'b110: Y = D6;
            3'b111: Y = D7;
            default: Y = 4'b0000;
        endcase
    end
endmodule
