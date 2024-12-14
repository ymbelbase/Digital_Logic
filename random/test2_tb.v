module tb_mux_8_1();
    reg [7:0] i;       // 8 inputs
    reg [2:0] s;       // 3 select lines
    wire o;            // Output

    mux_8_1 uut(o, i, s); // Instantiate the 8-to-1 multiplexer

    initial begin
        $dumpfile("dump.vcd");   // Specify the VCD output file name
        $dumpvars(0, tb_mux_8_1); // Dump all variables in the testbench
        
        i = 8'b10101010;         // Example input vector
        for (s = 0; s < 8; s = s + 1) begin
            #10;               
            $display("s = %b, o = %b", s, o); // Display the selected output
        end
        $finish;                 // End the simulation
    end
endmodule

