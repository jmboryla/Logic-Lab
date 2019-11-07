module lab8_part_one(W,Z,clk,rst,Q3,Q2,Q1,Q0);

	input wire W, clk,rst;
	output wire Z;
	
	output Q3,Q2,Q1,Q0;
	wire Q3N, Q2N, Q1N, Q0N;
	wire and0, and1, and2, and3, and4, and5, and6;
	wire or0, or1, or2, or3, or4, or5, or6;
	wire xor0, xor1;
	
	and inst0 (and0,Q3N,Q2,Q1,Q0N,W);
	and inst1 (and1,Q3,Q2N,Q1N,Q0N,W);
	or inst2 (or0, and0, and1);
	xor inst7 (xor0, Q0, W);
	xor inst8 (xor1, Q2, Q1);
	and inst9 (and2, Q3N, xor0, xor1);
	and inst10 (and3, Q3N, Q2, Q0, ~W);
	or inst11 (or1, and2, and3);
	or inst12 (or3, Q1N, Q0);
	or inst13 (or4, Q0, W);
	or inst14 (or5, Q2, Q1N, W);
	and inst15 (and4, or3, or4, or5, Q3N);
	and inst16 (and5, Q3N, Q2, Q1, Q0);
	and inst17 (and6, Q3, Q2N, Q1N, Q0N);
	or inst18 (or6, and5, and6);
	
	d_flip_flop inst3 (or0, clk, rst, Q3, Q3N);
	d_flip_flop inst4 (or1, clk, rst, Q2, Q2N);
	d_flip_flop inst5 (and4, clk, rst, Q1, Q1N);
	d_flip_flop inst6 (~W, clk, rst, Q0, Q0N);
	
	assign Z= or6;

endmodule
