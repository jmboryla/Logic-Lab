module FSM (n,i,c,e,Q, clk, rst);	//Module FSM, part two state machine
	input wire n,i,c,e;	//State machine inputs n,i,c,e
	input wire clk,rst;	//clk => clock, rst => reset
	output wire [2:0]Q;	//state machine output Q
	
	reg [2:0]state=1;	//reg for always block output, initialize to 1
	
	assign Q=state;	//assign state to Q
	
	always @ (posedge clk or negedge rst)	//always block sensitive to clock and reset
		if (~rst)begin //if reset
			state = 1; end	//state is 1
		else if (state == 1 && n)begin	//if state is 1 and input is n
			state = 2; end	//state is 2
		else if (state == 1 && ~n)begin 	//if state is 1 and input is ~n
			state = 6; end	//Error state
		else if (state == 2 && i)begin	//if state is 2 and input is i
			state = 3; end	//state is 3
		else if (state == 2 && ~i)begin	//if state is 2 and input is ~i
			state = 6; end	//Error state
		else if (state == 3 && c)begin	//if state is 3 and input is c
			state = 4; end	//state is 4
		else if (state == 3 && ~c)begin	//if state is 3 and input is ~c
			state = 6; end	//Error state
		else if (state == 4 && e)begin	//if state is 4 and input is e
			state = 7; end //Success State
		else if (state == 4 && ~e)begin	//if state is 4 and input is ~e
			state = 6; end	//Error state
endmodule //end of module