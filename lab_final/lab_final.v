module lab_final(A,B,C,D,E,rst,out);

	input wire A,B,C,D,E,rst;
	output wire [3:0] out;
	
	
	reg [3:0] regout;
	reg [3:0] data;
	reg [2:0] state=0;
	
	assign out = regout;
	
	always @	*
		if (~rst)begin
			state=0;
			regout=4'hC;
		end
		else if (state == 0 && rst)begin
			regout=4'hB;
			state=1;
		end
		else if (state == 1 && A)begin
			regout=4'hA;
			state=2;
		end
		else if ((state == 2 || state==3) && B)begin
			state = 3;
				if (~C && ~D) begin
					data = 4'h2;
				end
				else if (C && ~D)begin
					data = 4'h3;
				end
				else if (~C && D)begin
					data = 4'h4;
				end
				else if (C && D)begin
					data = 4'h5;
				end
				regout=data;
		end
		else if (state == 3 && ~B && E)begin
			state = 4;
			if (data == 2 || data == 4) begin
			regout=4'hE;
			end
			else if (data == 3 || data == 5)begin
			regout=4'h0;
			end
		end
		else if (state == 4 && ~A)begin
			state = 5;
			regout = 4'hF;
		end
	endmodule
		