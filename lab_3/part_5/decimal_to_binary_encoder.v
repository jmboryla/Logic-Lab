module decimal_to_binary_encoder(D,B); //module and ports

	input wire [9:0]D;	//input wire is a 10 bit bus D
	output wire [3:0]B; // output is a 4 bit bus B
	
	assign B[0]=D[1]|D[3]|D[5]|D[7]|D[9];	//Assigns all 1's of D to B0 pattern repeats for remaining outputs
	assign B[1]=D[2]|D[3]|D[6]|D[7];	
	assign B[2]=D[4]|D[5]|D[6]|D[7];
	assign B[3]=D[8]|D[9];
	
endmodule	//end of module
