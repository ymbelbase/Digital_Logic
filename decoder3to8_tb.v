module tb_Decoder3to8;
    reg [2:0] A;  // 3-bit input
    wire [7:0] Y;  // 8-bit output
    
    // Instantiate the Decoder3to8
    Decoder3to8 uut (
        .A(A),
        .Y(Y)
    );
    
    initial begin
        // Test all combinations of A
        A = 3'b000; #10;
        A = 3'b001; #10;
        A = 3'b010; #10;
        A = 3'b011; #10;
        A = 3'b100; #10;
        A = 3'b101; #10;
        A = 3'b110; #10;
        A = 3'b111; #10;
        
        // End simulation
        $finish;
    end
    
    initial begin
        // Dump waveforms for GTKWave
        $dumpfile("decoder3to8.vcd");
        $dumpvars(0, tb_Decoder3to8);
    end
endmodule
