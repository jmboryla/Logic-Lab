/*********************************************
*Module Name:hardware_four_to_one_mux			*
*Created By:Jonathan Boryla						*
*Purpose: Verilog module for a four input		*
*one output multiplexer circuit being			* 
*implemented to hardware.							*
*********************************************/
module hardware_four_input_mux(SW,HEX0,LEDR);	//module name and port list

input wire [5:0] SW;	//lists SW[6:0] as inputs
output wire [6:0]HEX0;//HEX0 the first hex digit is an output
output wire [5:0]LEDR;//LEDs to show switch states

wire m;	//wire m for output of four_to_one_mux
wire [3:0]B;	//wire B[3:0] for input to the seven segment module


four_to_one_mux inst0 (SW[3],SW[2],SW[1],SW[0],SW[5],SW[4],m);	//instance of the four to one mux with the switches 0-3 as inputs, and 4-5 as select lines

assign {B}= {3'b000,m};	//assigns 000m to the signal going into wire B

sevenSegment_bitwise inst1(B,HEX0);	//instance of the seven segment module with B as the input and HEX0 as the output

assign LEDR = SW; // assigning the LEDs to the switches

endmodule
