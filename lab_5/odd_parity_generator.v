/* module odd_parity_generator
*
*  Purpose: Generates an ODD parity bit to output
*
*  Input: Four inputs A,B,C,D
*  Output: Odd parity bit output OP
*  Student: Jonathan Boryla
*  Date: March 12,2018
*		    
*/
module odd_parity_generator (A,B,C,D,OP); //module name and port list

	input wire A,B,C,D;	//inputs
	output wire OP;		//outputs

	assign OP = ~(A^B^C^D);	//XNOR A,B,C,D to produce an odd parity bit OP

endmodule
