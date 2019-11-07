/*********************************************
*Module Name:four_to_one_mux						*
*Created By:Jonathan Boryla						*
*Purpose: Verilog module for a four input		*
*one output multiplexer circuit.					*
*********************************************/
module four_to_one_mux (i3,i2,i1,i0,s1,s0,m);	//module and port list

input wire i3,i2,i1,i0,s1,s0;	//lists i3-0, and s1-s0 as input wires

output wire m;	//lists m as an output wire

assign m = i3&s1&s0|i2&s1&~s0|i1&~s1&s0|i0&~s1&~s0;	//assigns the minterm combination of s1s0 input of deired input i3-0 eg. s1s0'(10) is i2

endmodule  	