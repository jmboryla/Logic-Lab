module d_flip_flop (D, clk, rst, Q, QNOT);	//D flip-flop module

	input wire D, clk, rst;	//inputs clock, data, and reset
	output wire Q,QNOT;	//outputs Q and QNOT
	reg out;	//reg out for always block
	
	always @ (posedge clk or negedge rst)	//always block depends on positive edge of the clock, negative edge of reset
		if (~rst)begin	//if reset is low
			out <= 1'b0;	//out is a 0
		end	//ends if
		else begin	//begin else
		out <= D;	//out is D
		end	//end else
		
	assign Q=out;	//assings out to Q
	assign QNOT=~Q;	//assigns ~Q to QNOT
	
endmodule	//end of module
