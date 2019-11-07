module d_latch (E,D,Q,QNOT);	//D latch module	
	
	input wire E,D;	//Inputs enable, and data
	output wire Q,QNOT;	//outputs Q and QNOT	
	reg out;	//reg to use in alway block
	
	always @ (E or D or Q) //always with E,D, and Q in sensitivity list
	  if (E)begin	//if statement depending on state of E
	  out= D;	//out is D when enabled
	  end //ends if statement	
	  else begin //else statement
	  out = Q;	//out is Q previous if not enabled
	  end	//end else statement
	  
	  assign Q= out;	//assign out to Q
	  assign QNOT= ~Q;	//assign ~Q to QNOT
	  
endmodule	//end of module

	