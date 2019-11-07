/* module sevenSegment_bitwise
*
*  Purpose: Set the segments of a seven segment display
*
*  Student: Jonathan Boryla
*  Date: October 19,2017
*		    
*/
module sevenSegment_bitwise( B, segment);

	input wire [3:0]B;
	output wire [6:0]segment;
	
	assign segment[0] = ~B[3]&~B[2]&~B[1]&B[0] | ~B[3]&B[2]&~B[1]&~B[0] | B[3]&B[2]&~B[1]&B[0] | B[3]&~B[2]&B[1]&B[0];
		
	assign segment[1]=B[3]&B[2]&B[1]|B[3]&B[2]&~B[0]|B[2]&B[1]&~B[0]|~B[3]&B[2]&~B[1]&B[0];

	assign segment[2]=B[3]&B[2]&B[1]|B[3]&B[2]&~B[0]|~B[3]&~B[2]&B[1]&~B[0];
	
	assign segment[3]=(B[2]~^B[1])&B[0]|~B[3]&B[2]&~B[1]&~B[0]|B[3]&~B[2]&B[1]&~B[0];
	
	assign segment[4]=~B[3]&B[0]|~B[3]&B[2]&~B[1]|~B[2]&~B[1]&B[0];
	
	assign segment[5]=~B[3]&~B[2]&B[1]|~B[3]&~B[2]&B[0]|~B[3]&B[1]&B[0]|B[3]&B[2]&~B[1]&B[0];
	
	assign segment[6]=~B[3]&~B[2]&~B[1]|~B[3]&B[2]&B[1]&B[0]|B[3]&B[2]&~B[1]&~B[0];






endmodule 