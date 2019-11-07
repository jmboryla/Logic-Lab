module part_two_top_level (SW,LEDR,KEY,HEX0);	//module to connect FSM to hardware

	input wire [4:0]SW;	//input switches 4-0
	input wire [1:0]KEY;	//input keys 1-0
	output wire [6:0]HEX0;	//output HEX0
	output wire [4:0]LEDR;	//output red LEDS 4-0
	wire [2:0]Q;	//Wire for output of FSM to connect to seven segment module
	
	assign LEDR=SW;	//assign LEDs to switches
	
	FSM inst0(SW[3],SW[2],SW[1],SW[0],Q,KEY[0],SW[4]);	//instance of FSM using switches and keys as inputs
	
	seven_segment inst1 ({1'b0,Q},HEX0);	//Seven segment module instance to for output of FSM
	
	
endmodule	//end of module
