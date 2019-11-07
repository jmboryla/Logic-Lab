module four_bit_two_input_mux (A,B,S,m);

	input wire [3:0] A, B;
	input wire S;
	output wire [3:0]m;
	reg [3:0]out;
	always @*
		case (S)
		1'b0: out= A;
		1'b1: out= B;
		endcase
		assign m=out;
		
endmodule
