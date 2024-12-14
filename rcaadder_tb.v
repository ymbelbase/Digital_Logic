module tb_RCA16Bit;
    reg [15:0] A;   // Operand A
    reg [15:0] B;   // Operand B
    reg Cin;        // Carry-in
    wire [15:0] S;  // Sum output
    wire Cout;      // Carry-out

    // Instantiate the 16-bit RCA module
    RCA16Bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );
    initial begin
        // Dump waveform for GTKWave
        $dumpfile("RCA16Bit.vcd");
        $dumpvars(0, tb_RCA16Bit);
        // Test case 1: A = 16'b0000000000000001, B = 16'b0000000000000001
        A = 16'b0000000000000001;
        B = 16'b0000000000000001;
        Cin = 0;
        #10; // Wait for 10 time units
        
        // Test case 2: A = 16'b1111111111111111, B = 16'b0000000000000001
        A = 16'b1111111111111111;
        B = 16'b0000000000000001;
        Cin = 0;
        #10;
        
        // Test case 3: A = 16'b1010101010101010, B = 16'b0101010101010101
        A = 16'b1010101010101010;
        B = 16'b0101010101010101;
        Cin = 1;
        #10;

        $finish;
    end
endmodule
