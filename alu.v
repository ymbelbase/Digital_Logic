module ALU (
    input [7:0] A, B,   // 8-bit inputs
    input [2:0] sel,    // Select signal for operation
    input clk, reset,   // Clock and reset signals
    output reg [7:0] Result // 8-bit result
);
    wire [7:0] sum, and_out, or_out, xor_out, left_shift, right_shift;
    reg [7:0] counter;

    // Submodules
    assign sum = A + B;               // Addition
    assign and_out = A & B;           // Bitwise AND
    assign or_out = A | B;            // Bitwise OR
    assign xor_out = A ^ B;           // Bitwise XOR
    assign left_shift = A << 1;       // Left Shift
    assign right_shift = A >> 1;      // Right Shift

    // Counter Logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            counter <= 8'b0;
        else
            counter <= counter + 1;   // Increment Counter
    end

    // MUX8to1 to select the operation
    always @(*) begin
        case (sel)
            3'b000: Result = sum;          // Addition
            3'b001: Result = left_shift;   // Left Shift
            3'b010: Result = right_shift;  // Right Shift
            3'b011: Result = counter;      // Counter
            3'b100: Result = and_out;      // Bitwise AND
            3'b101: Result = or_out;       // Bitwise OR
            3'b110: Result = xor_out;      // Bitwise XOR
            default: Result = 8'b0;        // No Operation
        endcase
    end
endmodule
