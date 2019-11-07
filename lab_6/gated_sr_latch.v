module gated_sr_latch (S,R,E,Q,QNOT); //Gated SR Latch with Q and Q' output and S,R, and E inputs.

	input wire S,R,E;	//Inputs to the latch set, reset, and enable
	output wire Q,QNOT;	//outputs 
	reg [1:0]out;	//reg out to use in always block
	
	always @ *
		case ({E,S,R})	//Case statement based on enable, set, and reset
			3'b000:out={Q,QNOT};	//Not enabled. Hold state
			3'b001:out={Q,QNOT};	//Not enabled. Hold state
			3'b010:out={Q,QNOT};	//Not enabled. Hold state
			3'b011:out={Q,QNOT};	//Not enabled. Hold state
			3'b100:out={Q,QNOT};	//Enabled. Hold State
			3'b101:out=2'b01;	//Enabled. Reset State
			3'b110:out=2'b10;	//Enabled. Set state
			3'b111:out=2'b00;	//Enabled. Invalid State
		endcase	//end of case statement
		
	assign Q=out[1];	//assigns bit 1 of out to Q
	assign QNOT=out[0];	//assigns bit 0 of out to QNOT
		
endmodule	//End of module
