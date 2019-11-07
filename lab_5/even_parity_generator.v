/* module even_parity_generator
*
*  Purpose: Generates an EVEN parity bit to output
*
*  Input: Four inputs A,B,C,D
*  Output: Even parity bit output EP
*  Student: Jonathan Boryla
*  Date: March 12,2018
*		    
*/
module even_parity_generator (A,B,C,D,EP); //module name and ports

	input wire A,B,C,D; //Inputs 
	output wire EP;	//Outputs

	assign EP = A^B^C^D; //XOR A,B,C,D and assign to EP to produce an even parity bit

endmodule
