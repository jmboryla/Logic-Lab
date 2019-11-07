/* module even_parity_checker
*
*  Purpose: Checks inputs for even parity value, and outputs 0 when matching
*
*  Input: A,B,C,D
*  Output: EPC
*  Student: Jonathan Boryla
*  Date: March 12,2018
*		    
*/
module even_parity_checker (A,B,C,D,EP,CEP); //module and port list

	input wire A,B,C,D,EP;	//Inputs
	output wire CEP;			//Outputs

	assign CEP = A^B^C^D^EP;	//XOR A,B,C,D,EP and assigns to CEP. CEP will be 0 for correct even parity.

endmodule
