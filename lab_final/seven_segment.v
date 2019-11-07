/* module sevenSegment_bitwise
*
*  Purpose: Set the segments of a seven segment display
*
*  Input: Four bit binary representation of the hexadecimal digits 0 - F
*  Output: Seven bit pattern that is a symbolic representation of input
*
*  Examples: Input    Hex       Output   
*            0000      0		1000000    turn on all segments except 6
*            0001      1		1111001    turn on segments 1, 2
*            1010      A        0001000    turn on all segments, except 3
*            1111      F        0001110    turn on 6, 5, 4, 0
*
*  Written for an active low display. 0's turn on segments.
* 
*  Student: Jonathan Boryla
*  Date: October 19,2017
*		    
*/
module seven_segment(B, segment);

	input wire [3:0]B; 
	output wire [6:0]segment;
	
	
	// S0 = B[3]'B[2]'B[1]'B[0] + B[3]'B[2]B[1]'B[0]' + B[3]B[2]B[1]'B[0] + B[3]B[2]'B[1]B[0]
	// S0 = Sum(1, 4, 11, 13)
	assign segment[0] = ~B[3]&~B[2]&~B[1]&B[0] | ~B[3]&B[2]&~B[1]&~B[0] | B[3]&B[2]&~B[1]&B[0] | B[3]&~B[2]&B[1]&B[0];
	
	assign segment[1]=~B[3]&B[2]&~B[1]&B[0]| B[3]&B[2]&~B[0]| B[3]&B[1]&B[0] | B[2]&B[1]&~B[0];

	assign segment[2]=B[3]&B[2]&B[1]|B[3]&B[2]&~B[0]|~B[3]&~B[2]&B[1]&~B[0];
	
	assign segment[3]=(B[2]~^B[1])&B[0]|~B[3]&B[2]&~B[1]&~B[0]|B[3]&~B[2]&B[1]&~B[0];
	
	assign segment[4]=~B[3]&B[0]|~B[3]&B[2]&~B[1]|~B[2]&~B[1]&B[0];
	
	assign segment[5]=~B[3]&~B[2]&B[1]|~B[3]&~B[2]&B[0]|~B[3]&B[1]&B[0]|B[3]&B[2]&~B[1]&B[0];
	
	assign segment[6]=~B[3]&~B[2]&~B[1]|~B[3]&B[2]&B[1]&B[0]|B[3]&B[2]&~B[1]&~B[0];


endmodule 