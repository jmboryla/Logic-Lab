/*********************************************
*Module Name:four_bit_four_to_one_mux			*
*Created By:Jonathan Boryla						*
*Purpose: Verilog module for a 4-bit four		* 
*input one output multiplexer circuit.			*
*********************************************/
module four_bit_four_to_one_mux (in3,in2,in1,in0,s1,s0,m);//module name and port list

	input wire [3:0] in3,in2,in1,in0;	//lists in3-0 as 4-bit wide inputs
	input wire s1,s0;	//s1, and s0 will be the select lines

	output wire [3:0]m;	//m is the 4-bit output bus
	
	assign m[3]= in3[3]&s1&s0|in2[3]&s1&~s0|in1[3]&~s1&s0|in0[3]&~s1&~s0;	//uses select lines to select bit[3] of m 
	assign m[2]= in3[2]&s1&s0|in2[2]&s1&~s0|in1[2]&~s1&s0|in0[2]&~s1&~s0;	//selects correct input for bit[2] of output m, using minterm relationship
	assign m[1]= in3[1]&s1&s0|in2[1]&s1&~s0|in1[1]&~s1&s0|in0[1]&~s1&~s0;	//selects correct input for bit[1] of output m
	assign m[0]= in3[0]&s1&s0|in2[0]&s1&~s0|in1[0]&~s1&s0|in0[0]&~s1&~s0;	//selects correct input for bit[0] of output m
endmodule  	