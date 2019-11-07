module four_bit_comp(A,B,GT,LT,EQ);

input wire [3:0]A,B;
output wire GT,LT,EQ;

wire Al_GT_Bl, Ah_GT_Bh, Al_EQ_Bl, Ah_EQ_Bh,Al_LT_Bl,Ah_LT_Bh;

two_bit_comp inst0(A[1:0],B[1:0],Al_GT_Bl,Al_LT_Bl,Al_EQ_Bl);
two_bit_comp inst1(A[3:2],B[3:2],Ah_GT_Bh,Ah_LT_Bh,Ah_EQ_Bh);

assign GT = Ah_GT_Bh|Ah_EQ_Bh&Al_GT_Bl;
assign EQ = Al_EQ_Bl&Ah_EQ_Bh;
assign LT = (~GT) & (~EQ);

endmodule