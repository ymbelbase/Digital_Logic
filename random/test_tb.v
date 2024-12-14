module testbench;
    reg [2:0] A;  // 3-bit input
    wire [7:0] Y; // 8-bit output

    // Instantiate the 3-to-8 decoder
    Decoder3to8 uut (
        .A(A),
        .Y(Y)
    );

    initial begin
        // Monitor changes
        $monitor("Time = %0t, A = %b, Y = %b", $time, A, Y);

        // Test all input combinations
        A = 3'b000; #10;
        A = 3'b001; #10;
        A = 3'b010; #10;
        A = 3'b011; #10;
        A = 3'b100; #10;
        A = 3'b101; #10;
        A = 3'b110; #10;
        A = 3'b111; #10;

        // End the simulation
        $finish;
    end
endmodule

