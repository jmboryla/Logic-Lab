module four_bit_two_input_mux (A,B,S,m);

	input wire [4:0] A, B;
	input wire S;
	output wire [4:0]m;
	reg [3:0]out;
	always @ (S)
		case (S)
		0: out= A;
		1: out= B;
		endcase
		assign m=out;
		
endmodule
