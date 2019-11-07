module part_one(z,w,clk,rst);	//Module part_one, state machine to determine sequence of "0000" or "1111"
	input wire w,clk,rst;	//w => sequence input, clk => clock, rst => reset 
	output wire z;	//z => state machine output
	
	reg zReg = 0;	//reg for always block	
	reg [3:0]state=0;	//reg to hold current state, initialize to 0
	
	assign z = zReg;	//assign reg to z
	
	always @ (posedge clk or negedge rst)	//always block sensitive to clock and reset
		if (~rst)begin	//resets when low
			state = 0;	//reset to state 0
			zReg = 0;	//output is 0
			end	//end if
		else if (state == 0 && w)begin	//if state is 0 and input is 1
			state = 1;	//state is 1
			zReg = 0;	//output is 0
			end	//end else if
		else if (state == 0 && ~w)begin	//if state is 0 and input is 0
			state = 2;	//state is 2
			zReg = 0;	//output is 0
			end	//end else if
		else if (state == 1 && w)begin	//if state is 1 and input is 1
			state = 3;	//state is 3
			zReg = 0;	//output is 0
			end	//end else if
		else if (state == 1 && ~w)begin	//if state is 1 and input is 0
			state = 2;	//state is 2
			zReg = 0;	//output is 0
			end	//end else if
		else if (state == 2 && w)begin	//if state is 2 and input is 1
			state = 1;	//state is 1
			zReg = 0;	//output is 0
			end	//end else if
		else if (state == 2 && ~w)begin	//if state is 2 and input is 0
			state = 4;	//state is 4
			zReg = 0;	//output is 0
			end	//end else if
		else if (state == 3 && w)begin	//if state is 3 and input is 1
			state = 5;	//state is 5
			zReg = 0;	//output is 0
			end	//end else if
		else if (state == 3 && ~w)begin 	//if state is 3 and input is 0
			state = 2;	//state is 2
			zReg = 0;	//output is 0
			end	//end else if 
		else if (state == 4 && w)begin	//if state is 4 and input is 1
			state = 1;	//state is 1
			zReg = 0;	//output is 0
			end	//end else if	
		else if (state == 4 && ~w)begin	//if state is 4 and input is 0
			state = 6;	//state is 6
			zReg = 0;	//output is 0
			end	//end else if
		else if (state == 5 && w)begin	//if state is 5 and input is 1
			state = 7;	//state is 7
			zReg = 1;	//output is 1
			end	//end else if
		else if (state == 5 && ~w)begin	//if state is 5 and input is 0
			state = 2;	//state is 2
			zReg = 0;	//output is 0
			end	//end else if
		else if (state == 6 && w)begin	//if state is 6 and input is 1
			state = 1;	//state is 1
			zReg = 0;	//output is 0	
			end	//end else if
		else if (state == 6 && ~w)begin	//if state is 6 and input is 0
			state = 8;	//state is 8
			zReg = 1;	//output is 1
			end	//end else if
		else if (state == 7 && w)begin	//if state is 7 and input is 1
			state = 7;	//state is 7
			zReg = 1;	//output is 1
			end	//end else if
		else if (state == 7 && ~w)begin	//if state is 7 and input is 0
			state = 2;	//state is 2
			zReg = 0;	//output is 0
			end	//end else if
		else if (state == 8 && w)begin	//if state is 8 and input is 1
			state = 1;	//state is 1
			zReg = 0;	//output is 0
			end	//end else if
		else if (state == 8 && ~w)begin	//if state is 8 and input is 0
			state = 8;	//state is 8
			zReg = 1;	//output is 1
			end	//end else if
endmodule //end of module