`timescale 1ns / 1ps

module test_tb;

    // Declare inputs as reg and outputs as wire
    reg a_i;
    reg b_i;
    wire c_o;

    // Instantiate the module under test
    hello uut (
        .a_i(a_i),
        .b_i(b_i),
        .c_o(c_o)
    );

    // Test stimulus
    initial begin
        // Initialize inputs
        a_i = 0;
        b_i = 0;

        // Display header
        $display("Time\t a_i\t b_i\t c_o");
        $monitor("%0dns\t %b\t %b\t %b", $time, a_i, b_i, c_o);

        // Apply test cases
        #10 a_i = 1; b_i = 0;  // Test case 1
        #10 a_i = 0; b_i = 1;  // Test case 2
        #10 a_i = 1; b_i = 1;  // Test case 3
        #10 a_i = 0; b_i = 0;  // Test case 4

        // Finish simulation
        #10 $finish;
    end



initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, test_tb);
end

endmodule
