module tb_register;
    reg [7:0] D;         // 8-bit data input
    reg reset;           // Asynchronous reset
    reg enable;          // Enable signal
    reg clk;             // Clock signal
    wire [7:0] Q;        // 8-bit output of the register

    // Instantiate the 8-bit register
    reg8bit_register uut (
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
        $dumpfile("register_wave.vcd");
        $dumpvars(0, tb_register);

        // Test case 1: Assert reset
        reset = 1;   // Assert reset
        #10;          // Wait for 10 time units
        reset = 0;    // Deassert reset
        #10;

        // Test case 2: Enable and load data (0xAA)
        enable = 1;
        D = 8'b10101010;  // Load 0xAA
        #10;              // Wait for a clock edge
        enable = 0;       // Disable enable
        #10;

        // Test case 3: Change data to 0xCC while enable is high
        enable = 1;
        D = 8'b11001100;  // Load 0xCC
        #10;              // Wait for a clock edge

        // Test case 4: Ensure no change with enable low
        enable = 0;
        D = 8'b11110000;  // Attempt to load data 0xF0, but enable is off
        #10;

        // Finish the simulation
        $finish;
    end
endmodule