module tb_sequence_detector;

    reg clk;
    reg reset;
    reg in;
    wire detected;

    // Instantiate the sequence detector module
    sequence_detector uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .detected(detected)
    );

    // Generate clock signal
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        in = 0;

        // Apply reset
        #10 reset = 0;

        // Apply the sequence "101101"
        #10 in = 1; // S0 -> S1
        #10 in = 0; // S1 -> S2
        #10 in = 1; // S2 -> S3
        #10 in = 1; // S3 -> S4
        #10 in = 0; // S4 -> S5
        #10 in = 1; // S5 -> S6 (detected = 1)

        // Test with other sequences
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1; // Should not detect

        // Finish the simulation
        #100 $finish;
    end

    // Dump the waveform for GTKWave
    initial begin
        $dumpfile("sequence_detector.vcd");
        $dumpvars(0, tb_sequence_detector);
    end

endmodule
