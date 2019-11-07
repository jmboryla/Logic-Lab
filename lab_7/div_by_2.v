module div_by_2(I,O,rst,prt);	//Divide by two circuit

	input wire I,rst,prt;	//inputs are I-input clock,rst-reset for flip-flop, and prt-preset for flip-flop
	output wire O;	//output O - input clock signal divided by 2
	wire rewire;	//wire to wire QNOT output of flip-flop back to D input
	
d_flip_flop inst0(rewire, I, rst, prt, O, rewire);	//instance of d flip-flop wired to divide clock input by two

endmodule	//end of clock divider module
