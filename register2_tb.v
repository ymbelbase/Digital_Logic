module tb_shift_register;
    reg [7:0] D;          // 8-bit data input
    reg reset;            // Asynchronous reset
    reg enable;           // Enable signal
    reg clk;              // Clock signal
    wire [7:0] Q;         // 8-bit output

    // Instantiate the shift register
    shift_register uut (
        .D(D),
        .reset(reset),
        .enable(enable),
        .clk(clk),
        .Q(Q)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // Clock toggles every 5 time units
    end

    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        enable = 0;
        D = 8'b00000000;

        // Dump waveform for GTKWave
        $dumpfile("shift_register_wave.vcd");
        $dumpvars(0, tb_shift_register);

        // Test case 1: Assert reset
        reset = 1;   // Assert reset
        #10;          // Wait for 10 time units
        reset = 0;    // Deassert reset
        #10;

        // Test case 2: Enable and shift data (0xAA)
        enable = 1;
        D = 8'b10101010;  // Load 0xAA
        #10;              // Wait for a clock edge

        // Test case 3: Disable enable (no shifting)
        enable = 0;
        D = 8'b11001100;  // Attempt to load 0xCC, but enable is off
        #10;

        // Test case 4: Shift data again (0xFF)
        enable = 1;
        D = 8'b11111111;  // Load 0xFF
        #50;

        $finish;
    end
endmodule
