module tb_MUX8to1_4bit;
    reg [3:0] D0, D1, D2, D3, D4, D5, D6, D7;  // Data inputs
    reg [2:0] S;                                 // Select input
    wire [3:0] Y;                                // Output
    
    // Instantiate the MUX8to1_4bit
    MUX8to1_4bit uut (
        .D0(D0), .D1(D1), .D2(D2), .D3(D3), .D4(D4), .D5(D5), .D6(D6), .D7(D7),
        .S(S), .Y(Y)
    );
    
    initial begin
    $dumpfile("mux8to1_4bit.vcd");
    $dumpvars(0, tb_MUX8to1_4bit);
end

    initial begin
        // Initialize Inputs
        D0 = 4'b0001; D1 = 4'b0010; D2 = 4'b0011; D3 = 4'b0100;
        D4 = 4'b0101; D5 = 4'b0110; D6 = 4'b0111; D7 = 4'b1000;
        
        // Test all select combinations
        for (S = 0; S < 8; S = S + 1) begin
            #10;
            $display("S = %b, Y = %b", S, Y);
        end
    end
endmodule