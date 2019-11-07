	module a_greater_than_b(input wire A,B,output wire GT);
		assign GT = A & (~B);
	endmodule