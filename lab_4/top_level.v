module top_level(SW,LEDR);
	input wire [4:0]SW;
	output wire [1:0]LEDR;
two_to_one_mux inst0 (SW[4].Select, SW[3:2].inH,SW[1:0].inL,LEDR.m);

endmodule