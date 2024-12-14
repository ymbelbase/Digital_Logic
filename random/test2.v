module mux_8_1(o, i, s);
    output o;             // Output of the 8-to-1 multiplexer
    input [7:0] i;        // 8 input lines
    input [2:0] s;        // 3 select lines

    wire [3:0] k1;        // Intermediate wires for level 1
    wire [1:0] k2;        // Intermediate wires for level 2

    // first level
    mux_case mux1(k1[0], i[1:0], s[0]);
    mux_case mux2(k1[1], i[3:2], s[0]);
    mux_case mux3(k1[2], i[5:4], s[0]);
    mux_case mux4(k1[3], i[7:6], s[0]);

    // second level
    mux_case mux5(k2[0], k1[1:0], s[1]);
    mux_case mux6(k2[1], k1[3:2], s[1]);

    // third level
    mux_case mux7(o, k2[1:0], s[2]);
endmodule

// Definition of 2-to-1 multiplexer module
module mux_case(out, in, s);
    output reg out;       // Single output
    input [1:0] in;      // 2 inputs
    input s;             // Select line

    always @(*) begin
        case (s)
            1'b0: out = in[0];
            1'b1: out = in[1];
            default: out = 1'bx; // Safety fallback
        endcase
    end
endmodule
