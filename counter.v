module counter (
    input [7:0] Data,    // 8-bit data input for load operation
    input enable,         // Enable signal (count or hold)
    input load,           // Load signal (load Data into counter)
    input clk,            // Clock signal
    input reset,          // Asynchronous reset
    output reg [7:0] Q    // 8-bit output counter value
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset the counter to 0 when reset is high
            Q <= 8'b00000000;
        end else if (load) begin
            // Load new value into counter when load is high
            Q <= Data;
        end else if (enable) begin
            // Increment the counter when enable is high
            Q <= Q + 1;
        end
    end

endmodule
