module jk_flip_flop (J,K, clk, rst, prt, Q, QNOT);	//JK flip-flop module

	input wire J,K,clk,prt,rst;	//inputs J, K, clock, preset, and reset
	output wire Q,QNOT;	//outputs Q and QNOT
	reg out;	//reg out for always block
	
	always @ (posedge clk or negedge rst or negedge prt) //always block depends on positive edge of the clock, negative edge of preset and reset
		if (~rst)begin	//if reset is low
			out <= 1'b0;	// out is a 0
		end	//end if 
		else if (~prt)begin	//else if preset is a low
			out <= 1'b1; //out is a 1
		end	//end else if
		else begin	//else both preset and reset are high
			case ({J,K})	//case statement depends on J and K
				2'b00: out <= Q;	//hold state
				2'b01: out <= 1'b0;	//reset state
				2'b10: out <= 1'b1;	//set state
				2'b11: out <= ~Q;	//toggle state
			endcase //end of case statement
		end	//ends else 
		
	assign Q=out;	//assigns out to Q
	assign QNOT=~Q;	//assigns ~Q to QNOT
	
endmodule	//end of module
