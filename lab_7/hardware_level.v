module hardware_level (CLOCK_50,HEX0,HEX1,HEX2,SW,KEY); //module to connect to Altera DE0 hardware

	input wire CLOCK_50;	//50MHz clock 
	input wire [1:0]SW;	//SW1 - stop, SW0 - up
	input wire [1:0]KEY;	//KEY1 - prt, KEY0 - rst
	output wire [6:0]HEX0,HEX1,HEX2;	//HEX0 - tenth, HEX1 - ones, HEX2 - tens
	wire [3:0]A,B,C;	//wires to connect counter output to seven segment module
	wire clk,ovf0,ovf1,ovf2;	//wires for clock and overflow
	
	clock_divider inst6(CLOCK_50,clk);	//clock divider is used to divide 50MHz clock from Altera board down to 10Hz
	
	decimal_counter inst0(A,ovf0,clk,KEY[0],KEY[1],SW[0],SW[1]);	//decimal counter to represent tenths of seconds
	decimal_counter inst1(B,ovf1,ovf0,KEY[0],KEY[1],SW[0]);	//decimal counter to represent seconds
	five_counter inst2(C,ovf2,ovf1,KEY[0],KEY[1],SW[0]);	//mod five counter to represent tens of seconds
	
	seven_segment inst3(A,HEX0);	//seven segment module to convert binary to seven segment digits on Altera board
	seven_segment inst4(B,HEX1);
	seven_segment inst5(C,HEX2);
	
endmodule	//end of top level module