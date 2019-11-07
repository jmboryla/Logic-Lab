module d_latch_top_level (SW,LEDR);	//Hardware level for d latch

	input wire [1:0]SW;	//input switches 1-0
	output wire [3:0]LEDR;	//output red LEDs 3-0
	
	d_latch inst0 (SW[0],SW[1],LEDR[2],LEDR[3]);	//instantiates d latch module
	
	assign LEDR[1:0]=SW[1:0];	//assigns remaining switches to red LEDs
	
endmodule	//end of module
