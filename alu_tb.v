module tb_ALU;
    reg [7:0] A, B;         // Inputs
    reg [2:0] sel;          // Select signal
    reg clk, reset;         // Clock and reset
    wire [7:0] Result;      // Output

    // Instantiate the ALU
    ALU uut (
        .A(A),
        .B(B),
        .sel(sel),
        .clk(clk),
        .reset(reset),
        .Result(Result)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial begin
        // Dump waveform for GTKWave
        $dumpfile("alu_wave.vcd");
        $dumpvars(0, tb_ALU);

        // Initialize inputs
        clk = 0; reset = 1;
        A = 8'h0; B = 8'h0; sel = 3'b000;
        #10 reset = 0;

        // Test Addition
        A = 8'h05; B = 8'h03; sel = 3'b000; #10;

        // Test Left Shift
        sel = 3'b001; #10;

        // Test Right Shift
        sel = 3'b010; #10;

        // Test Counter
        sel = 3'b011; #50;

        // Test Bitwise AND
        sel = 3'b100; #10;

        // Test Bitwise OR
        sel = 3'b101; #10;

        // Test Bitwise XOR
        sel = 3'b110; #10;

        // End Simulation
        $finish;
    end
endmodule
