module seven_bit_two_input_mux (A,B,S,m);

	input wire [6:0] A, B;
	input wire S;
	output wire [6:0]m;
	reg [6:0]out;
	always @*
		case (S)
		1'b0: out= A;
		1'b1: out= B;
		endcase
		assign m=out;
		
endmodule
