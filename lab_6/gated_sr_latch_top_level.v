module gated_sr_top_level (SW,LEDR);

	input wire [2:0]SW;
	output wire [4:0]LEDR;
	
	gated_sr_latch inst0 (SW[1],SW[0],SW[2],LEDR[3],LEDR[4]);
	
	assign LEDR[2:0]=SW[2:0];
	
endmodule
