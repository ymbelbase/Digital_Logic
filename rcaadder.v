module RCA16Bit (
    input [15:0] A,       // 16-bit input A
    input [15:0] B,       // 16-bit input B
    input Cin,            // Carry-in (Cin)
    output [15:0] S,      // 16-bit sum
    output Cout           // Carry-out
);
    wire [15:0] carry;   // Carry for each bit
    // Full Adder Logic for each bit
    assign S[0] = A[0] ^ B[0] ^ Cin;
    assign carry[0] = (A[0] & B[0]) | (Cin & (A[0] ^ B[0]));
    
    assign S[1] = A[1] ^ B[1] ^ carry[0];
    assign carry[1] = (A[1] & B[1]) | (carry[0] & (A[1] ^ B[1]));
    
    assign S[2] = A[2] ^ B[2] ^ carry[1];
    assign carry[2] = (A[2] & B[2]) | (carry[1] & (A[2] ^ B[2]));
    
    assign S[3] = A[3] ^ B[3] ^ carry[2];
    assign carry[3] = (A[3] & B[3]) | (carry[2] & (A[3] ^ B[3]));
    
    assign S[4] = A[4] ^ B[4] ^ carry[3];
    assign carry[4] = (A[4] & B[4]) | (carry[3] & (A[4] ^ B[4]));
    
    assign S[5] = A[5] ^ B[5] ^ carry[4];
    assign carry[5] = (A[5] & B[5]) | (carry[4] & (A[5] ^ B[5]));
    
    assign S[6] = A[6] ^ B[6] ^ carry[5];
    assign carry[6] = (A[6] & B[6]) | (carry[5] & (A[6] ^ B[6]));
    
    assign S[7] = A[7] ^ B[7] ^ carry[6];
    assign carry[7] = (A[7] & B[7]) | (carry[6] & (A[7] ^ B[7]));
    
    assign S[8] = A[8] ^ B[8] ^ carry[7];
    assign carry[8] = (A[8] & B[8]) | (carry[7] & (A[8] ^ B[8]));
    
    assign S[9] = A[9] ^ B[9] ^ carry[8];
    assign carry[9] = (A[9] & B[9]) | (carry[8] & (A[9] ^ B[9]));
    
    assign S[10] = A[10] ^ B[10] ^ carry[9];
    assign carry[10] = (A[10] & B[10]) | (carry[9] & (A[10] ^ B[10]));
    
    assign S[11] = A[11] ^ B[11] ^ carry[10];
    assign carry[11] = (A[11] & B[11]) | (carry[10] & (A[11] ^ B[11]));
    
    assign S[12] = A[12] ^ B[12] ^ carry[11];
    assign carry[12] = (A[12] & B[12]) | (carry[11] & (A[12] ^ B[12]));
    
    assign S[13] = A[13] ^ B[13] ^ carry[12];
    assign carry[13] = (A[13] & B[13]) | (carry[12] & (A[13] ^ B[13]));
    
    assign S[14] = A[14] ^ B[14] ^ carry[13];
    assign carry[14] = (A[14] & B[14]) | (carry[13] & (A[14] ^ B[14]));
    
    assign S[15] = A[15] ^ B[15] ^ carry[14];
    assign Cout = (A[15] & B[15]) | (carry[14] & (A[15] ^ B[15]));
    
endmodule
