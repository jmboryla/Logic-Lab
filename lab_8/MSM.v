module MSM(q,segOut,x,y,z,clk,rst);	//Module MSM, for part three

	input wire x,y,z,clk,rst;	//inputs x,y,z => state machine inputs, clk => clock, rst => reset
	output wire [1:0]q;	//current state output
	output wire [3:0]segOut;	//state output
	reg [1:0]qReg;	//current state reg
	reg [3:0]outReg;	//reg for state output 
	
	assign q=qReg;	//assigns qreg to q
	assign segOut=outReg; //outputs a,b,c

	always @ (posedge clk or negedge rst)	//always block sensitive to clock and reset
		if(~rst)begin	//if reset
			qReg = 0;	//state is 0
			outReg = 11;	//output is b
			end	//end if
		else if (qReg == 0 && (x || y))begin	//if state is 0 and x or y
			qReg = 3;	//state is 3
			outReg = 12;	//output is c
			end	//end else if
		else if (qReg == 0 && z)begin		//if state is 0 and z
			qReg = 1;	//state is 1
			outReg = 10;	//output is a
			end
		else if (qReg == 1 && (x || z))begin	//if state is 1 and x or z
			qReg = 3;	//state is 3
			outReg = 12;	//output is c
			end	//end else if
		else if (qReg == 1 && y)begin	//if state is 1 and y
			qReg = 2;	//state is 2
			outReg = 10;	//output is a
			end	//end else if
		else if (qReg == 2 && z)begin	//if state is 2 and z
			qReg = 3;	//state is 3
			outReg = 12;	//output is c
			end	//end else if
		else if (qReg == 3 && y)begin	//if state is 3 and y
			qReg = 2;	//state is 2
			outReg = 10;	//output is a
			end	//end else if 
		else if (qReg == 3 && x)begin	//if state is 3 and x
			qReg = 3;	//state is 3
			outReg = 12;	//output is c
			end	//end else if
		
endmodule	//end of module