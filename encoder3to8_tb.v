module tb_PriorityEncoder8to3;
    reg [7:0] I;  // 8-bit input
    wire [2:0] Y;  // 3-bit output
    wire V;  // Valid output

    // Instantiate the Priority Encoder
    PriorityEncoder8to3 uut (
        .I(I),
        .Y(Y),
        .V(V)
    );

    initial begin
        // Dump waveforms for GTKWave
        $dumpfile("priority_encoder.vcd");
        $dumpvars(0, tb_PriorityEncoder8to3);
        
        // Test all combinations of inputs
        I = 8'b00000000; #10;
        I = 8'b00000001; #10;
        I = 8'b00000010; #10;
        I = 8'b00000100; #10;
        I = 8'b00001000; #10;
        I = 8'b00010000; #10;
        I = 8'b00100000; #10;
        I = 8'b01000000; #10;
        I = 8'b10000000; #10;
        I = 8'b11111111; #10;
        
        // End simulation
        $finish;
    end
endmodule
