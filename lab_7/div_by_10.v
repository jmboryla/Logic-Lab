module div_by_10 (I,O);	//divide by 10 circuit module

	input wire I;	//input I 
	output wire O;	//output O - frequency will be divided by 10
	wire div2;	//wire to wire the divide by 2 to the divide by 10
	
	div_by_2 inst0 (I,div2,1'b1,1'b1);	//divide by 2 instance (reset and preset held high)
	div_by_5 inst1 (div2,O,1'b1,1'b1);	//divide by 5 instance using output of divide by 2 as input
		
endmodule	//end of divide by 10 module
