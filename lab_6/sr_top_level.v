module sr_top_level (SW,LEDR);	//Top level module for SR latch

	input wire [1:0] SW;	//input Switches 1,0
	output wire [3:0]LEDR;	//outputs red LEDS 3-0
	
	sr_latch inst0 (SW[1],SW[0],LEDR[2],LEDR[3]); //instantiates sr latch SW[1].S, SW[0].R, LEDR[2].Q, and LEDR[3].QNOT
	
	assign LEDR[0]=SW[0];	//Switch 0 to red LED 0
	assign LEDR[1]=SW[1];	//Switch 1 to red LED 1
	
endmodule	//end of module 
