module lab8_part_two (n,I,c,e,Q, clk, rst);
	input wire n,I,c,e;
	input wire clk,rst;
	output wire [2:0]Q;
	wire Q2N,Q1N,Q0N;
	wire and0,and1,and2,and3,or0,or1,or2,or3,or4;
	
	or inst3 (or0, Q[2],Q[1],Q0N,~n);
	or inst4 (or1, Q[2],Q1N,Q[0],~I);
	and inst5 (and0, or0, or1);
	
	or inst6 (or3, Q[2],Q1N,Q0N,~c);
	
	and inst7 (and1, Q2N, Q[1],Q0N,I);
	and inst8 (and2, Q[2],Q1N,Q0N,e);
	and inst9 (and3, Q[2],Q[1],Q[0]);
	or inst10 (or4, and1,and2,and3);
	
	d_flip_flop_preset inst0(or4,clk,1'b1,rst,Q[0],Q0N);
	d_flip_flop_preset inst1(or3,clk,rst,1'b1,Q[1],Q1N);
	d_flip_flop_preset inst2(and0,clk,rst,1'b1,Q[2],Q2N);

endmodule	