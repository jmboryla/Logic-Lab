module part_three_top_level (SW,KEY,LEDR,HEX0,HEX1);	//module to connect MSM to hardware

	input wire [3:0] SW;	//input switches 3-0
	input wire [1:0]KEY;	//input keys 1-0
	output wire [3:0] LEDR;	//output red LEDs 3-0
	output wire [6:0]HEX0,HEX1;	//HEX0 for state machine output, and HEX1 for current state
	wire [1:0]q;	//wire for current state
	wire [3:0]stateSegment;	//wire to connect current state wire to seven segment module
	wire [3:0]outSeg;	//wire for state machine output
	
	assign stateSegment = {2'b0,q};	//assign 2'b0 and q to stateSegment
	assign LEDR = SW;	//assign switches to LEDs
	
	MSM inst0 (q,outSeg,SW[2],SW[1],SW[0],KEY[0],SW[3]);	//instance of MSM with switches and keys as inputs
	
	seven_segment inst1(stateSegment,HEX1);	//Seven segment instance for current state (HEX1)
	seven_segment inst2(outSeg,HEX0);	//Seven segment instance for state output (HEX0)
	
endmodule	//end of module