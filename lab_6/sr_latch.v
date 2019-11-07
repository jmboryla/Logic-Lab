module sr_latch (S,R,Q,QNOT);	//name of module: sr_latch

	input wire S,R;	//input wires S-set and R-reset
	output wire Q,QNOT;	//outputs Q and Q not
	reg [1:0]out;	//reg for always block bit[1] will be assigned to Q and bit[0] to QNOT
	
	always @*	//Alway block with no sensitivity list
		case({S,R,Q})	//Case statement based S,R,and Q
				3'b000:out=2'b01;	//Hold state
				3'b001:out=2'b10;	//Hold state
				3'b100:out=2'b10;	//Set state
				3'b101:out=2'b10;	//Set state
				3'b010:out=2'b01;	//Reset State
				3'b011:out=2'b01;	//Reset State
				default:out=2'b00;//Invalid state
			endcase	//end of case statement
		assign Q=out[1];	//Assigns reg out[1] to output Q
		assign QNOT=out[0];	//Assigns reg out[0] to output QNOT
		
endmodule	//end of module