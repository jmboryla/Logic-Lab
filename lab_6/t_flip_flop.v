module t_flip_flop (T, clk, rst, prt, Q, QNOT);	//T flip-flop module
	
	input wire T,clk,prt,rst;	//inputs toggle, clock, preset, and reset
	output wire Q,QNOT;	//outputs Q and QNOT
	reg out;	//reg out for always block	
	
	always @ (posedge clk or negedge rst or negedge prt)	//always block depends of positive edge of the clock, negative edge of preset and reset
		if (~rst)begin	//if reset is low
			out <= 1'b0;	//out is a 0
		end	//end if
		else if (~prt)begin	//else if preset is low
			out <= 1'b1;	//out is a 1
		end	//end else if
		else if (T)begin	//else if toggle is a high
			out <= ~Q;	//Q is toggled
		end	//end else if
		else begin	//else toggle is low
			out <= Q;	//Q stays the same
		end
		
	assign Q=out;	//assigns out to Q
	assign QNOT=~Q;	//assigns ~Q to QNOT
	
endmodule	//end of module
