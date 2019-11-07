/* module top_level
*
*  Purpose: Connects hardware to the parity generators and checkers to verify function
*
*  Input: Switches 0-9
*  Output: HEX digits 0-3, Red LED 0-9
*  Student: Jonathan Boryla
*  Date: March 12,2018
*		    
*/
module top_level (SW,LEDR,HEX0,HEX1,HEX2,HEX3); //Module name and port list

	input wire [9:0] SW;	//Lists switches 0-9 as inputs
	output wire [6:0]HEX0,HEX1,HEX2,HEX3;	//lists HEX 0-3 as outputs
	output wire [9:0]LEDR;	//lists all red LEDs as outputs
	wire EP, OP, EPC, OPC;	//Wires for intermediate results
	wire [3:0] data,EPseg,OPseg,EPCseg,OPCseg,checkSeg,paritySeg,odd,even,letter;	//busses for various uses
	assign LEDR = SW;	//assigns the red LEDs to the corresponding switches	
	
	four_bit_two_input_mux inst0({SW[3],SW[2],SW[1],SW[0]},{SW[7],SW[6],SW[5],SW[4]},SW[8],data);	//instantiaties the four_bit_two_input_mux to select the data being used, using switch 8 as select.
	seven_segment_bitwise inst1(data,HEX0); //Uses seven_segment_bitwise module to output information on the data line to HEX digit 0
	
	even_parity_generator inst2(data[3],data[2],data[1],data[0],EP);	//instantiates even_parity_generator wires output to EP
	even_parity_checker inst3(data[3],data[2],data[1],data[0],EP,EPC); //instantiates even_parity_checker wires output to EPC
	odd_parity_generator inst4(data[3],data[2],data[1],data[0],OP);	//instantiates odd_parity_generator wires output to OP
	odd_parity_checker inst6(data[3],data[2],data[1],data[0],OP,OPC);	//instantiates odd_parity_checker wires output to OPC
	
	assign {EPseg}={3'b000,EP}; //Turns EP into a 4-bit bus with 3 leading 0's 
	assign {OPseg}={3'b000,OP};	//Turns OP into a 4-bit bus with 3 leading 0's
	assign {EPCseg}={3'b000,EPC};	//Turns EPC into a 4-bit bus with 3 leading 0's
	assign {OPCseg}={3'b000,OPC};	//Turns OPC into a 4-bit bus with 3 leading 0's
	
	four_bit_two_input_mux inst5 (EPCseg,OPCseg,SW[9],checkSeg);	//uses four_bit_two_input_mux to select even or odd parity based on switch 9, and outputs to checkSeg.
	seven_segment_bitwise inst7(checkSeg,HEX2);	//outputs the parity checker value to HEX segment 2
	four_bit_two_input_mux inst8 (EPseg,OPseg,SW[9],paritySeg);	//uses four_bit_two_input_mux to select even or odd parity based on switch 9, and outputs to paritySeg.
	seven_segment_bitwise inst9(paritySeg,HEX1);	//outputs the generator value to HEX segment 1
	
	assign {odd}={4'b0000};	//Assigns "0" to 4-bit bus odd
	assign {even}={4'b1110}; //Assigns hex "E" to 4-bit bus even
	four_bit_two_input_mux inst10(even,odd,SW[9],letter);	//selects odd or even using four_bit_two_input_mux and switch 9 as select line
	seven_segment_bitwise(letter,HEX3); //outputs "O" or "E" to HEX3
	
endmodule 
