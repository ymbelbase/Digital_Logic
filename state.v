module sequence_detector (
    input clk,          // Clock signal
    input reset,        // Asynchronous reset signal
    input in,           // Serial input bit stream
    output reg detected // Output signal, high when "101101" is detected
);

    // Define states using parameters
    parameter S0 = 3'b000, // Initial state
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100,
              S5 = 3'b101,
              S6 = 3'b110; // Sequence detected state

    reg [2:0] state, next_state; // State registers

    // State transition logic
    always @ (posedge clk or posedge reset) begin
        if (reset)
            state <= S0; // Reset to initial state
        else
            state <= next_state; // Transition to next state
    end

    // Next state logic
    always @ (state or in) begin
        case (state)
            S0: next_state = (in) ? S1 : S0; // If in = 1, move to S1, else stay in S0
            S1: next_state = (in) ? S1 : S2; // If in = 0, move to S2
            S2: next_state = (in) ? S3 : S0; // If in = 1, move to S3, else reset to S0
            S3: next_state = (in) ? S3 : S4; // If in = 0, move to S4
            S4: next_state = (in) ? S5 : S0; // If in = 1, move to S5, else reset to S0
            S5: next_state = (in) ? S1 : S6; // If in = 0, move to S6 (sequence complete)
            S6: next_state = S6; // Once in S6, stay in S6 (sequence detected)
            default: next_state = S0; // Default to S0 on invalid state
        endcase
    end

    // Output logic
    always @ (state) begin
        if (state == S6)
            detected = 1; // Set detected signal high when the sequence is detected
        else
            detected = 0;
    end

endmodule
