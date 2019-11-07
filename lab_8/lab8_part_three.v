module lab8_part_three (q,a,b,c,x,y,z,clk,rst);

	input wire x,y,z,clk,rst;
	output wire [1:0]q;
	output wire a,b,c;
	
	reg [1:0]qReg;
	reg [2:0]outReg;
	
	assign q=qReg;
	assign a=outReg[2];
	assign b=outReg[1];
	assign c=outReg[0];
	
	always @ (posedge clk or negedge rst)
		if(~rst)begin
			qReg = 0;
			outReg = 2;
			end
		else if (qReg == 0 && (x || y))begin
			qReg = 3;
			outReg = 1;
			end
		else if (qReg == 0 && z)begin
			qReg = 1;
			outReg = 4;
			end
		else if (qReg == 1 && (x || z))begin
			qReg = 3;
			outReg = 1;
			end
		else if (qReg == 1 && y)begin
			qReg = 2;
			outReg = 4;
			end
		else if (qReg == 2 && z)begin
			qReg = 3;
			outReg = 1;
			end
		else if (qReg == 3 && y)begin
			qReg = 2;
			outReg = 4;
			end
		else if (qReg == 3 && x)begin
			qReg = 3;
			outReg = 1;
			end
	
endmodule
