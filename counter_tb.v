module tb_counter;
    reg [7:0] Data;      // 8-bit data input for load operation
    reg enable;          // Enable signal
    reg load;            // Load signal
    reg clk;             // Clock signal
    reg reset;           // Reset signal
    wire [7:0] Q;        // 8-bit output of the counter

    // Instantiate the counter module
    counter uut (
        .Data(Data),
        .enable(enable),
        .load(load),
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        enable = 0;
        load = 0;
        Data = 8'b00000000;

        // Dump waveform for GTKWave
        $dumpfile("counter_wave.vcd");
        $dumpvars(0, tb_counter);

        // Test case 1: Reset the counter
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Test case 2: Load a value into the counter (0x55)
        load = 1;
        Data = 8'b01010101; // Load 0x55 into the counter
        #10;
        load = 0;
        #10;

        // Test case 3: Enable the counter to increment
        enable = 1;
        #50;  // Let the counter run for 50 time units

        // Test case 4: Disable enable and hold the value
        enable = 0;
        #10;

        // Test case 5: Load a new value into the counter (0xFF)
        load = 1;
        Data = 8'b11111111; // Load 0xFF into the counter
        #10;

        $finish;
    end
endmodule
