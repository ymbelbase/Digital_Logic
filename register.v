module reg8bit_register (
    input [7:0] D,       // 8-bit data input
    input reset,         // Asynchronous reset
    input enable,        // Enable signal
    input clk,           // Clock signal
    output reg [7:0] Q   // 8-bit register output
);

    // Asynchronous reset and synchronous data storage
    always @ (posedge clk or posedge reset) begin
        if (reset) 
            Q <= 8'b00000000;  // Reset the register to 0
        else if (enable)
            Q <= D;            // Load data if enable is high
    end

endmodule
