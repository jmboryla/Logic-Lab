module gated_sr_top_level (SW,LEDR);	//hardware level for gated SR latch

	input wire [2:0]SW;	//inputs switches 2-0
	output wire [4:0]LEDR;	//outputs red LEDs 4-0
	
	gated_sr_latch inst0 (SW[1],SW[0],SW[2],LEDR[3],LEDR[4]);	//instantiates gated SR latch module
	
	assign LEDR[2:0]=SW[2:0];	//assigns remaining red LEDs to corresponding switches
	
endmodule	//end of module
