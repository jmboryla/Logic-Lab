module two_bit_comp(A,B,GT,LT,EQ);

input wire [1:0] A,B;
output wire GT,LT,EQ;

wire A0_GT_B0, A1_GT_B1, A1_EQ_B1, A0_EQ_B0;

a_greater_than_b inst0 (A[0],B[0],A0_GT_B0);
a_greater_than_b inst1 (A[1],B[1],A1_GT_B1);

assign A1_EQ_B1 = A[1] ~^ B[1];
assign A0_EQ_B0 = A[0] ~^ B[0];

assign GT = A0_GT_B0 | (A1_EQ_B1 & A1_GT_B1);
assign EQ = A1_EQ_B1 & A0_EQ_B0;
assign LT = (~EQ) & (~GT);

endmodule 