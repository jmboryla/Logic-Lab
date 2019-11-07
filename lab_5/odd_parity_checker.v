/* module odd_parity_checker
*
*  Purpose: Checks inputs for odd parity value, and outputs 0 when matching
*
*  Input: A,B,C,D
*  Output: OPC
*  Student: Jonathan Boryla
*  Date: March 12,2018
*		    
*/
module odd_parity_checker (A,B,C,D,OP,COP); //Module and port list

	input wire A,B,C,D,OP;	//Inputs
	output wire COP;			//Outputs

	assign COP = ~(A^B^C^D^OP);	//Assigns the XNOR of A,B,C,D,OP to COP. COP will be 0 when parity is odd.

endmodule
