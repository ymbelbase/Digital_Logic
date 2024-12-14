module shift_register (
    input [7:0] D,        // 8-bit data input
    input reset,          // Asynchronous reset
    input enable,         // Enable signal
    input clk,            // Clock signal
    output reg [7:0] Q    // 8-bit output (final stage)
);

    // Create a 5-stage shift register
    reg [7:0] stage_1, stage_2, stage_3, stage_4, stage_5;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset all stages when reset is high
            stage_1 <= 8'b00000000;
            stage_2 <= 8'b00000000;
            stage_3 <= 8'b00000000;
            stage_4 <= 8'b00000000;
            stage_5 <= 8'b00000000;
        end else if (enable) begin
            // Shift data through the stages when enable is high
            stage_1 <= D;
            stage_2 <= stage_1;
            stage_3 <= stage_2;
            stage_4 <= stage_3;
            stage_5 <= stage_4;
        end
    end

    // Output the value of the last stage
    always @(stage_5) begin
        Q <= stage_5;
    end
    
endmodule
