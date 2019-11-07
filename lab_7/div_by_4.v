module div_by_4(I,O,rst,prt);	//divide by 4 circuit

		input wire I,rst,prt; //inputs are I-input clock,rst-reset for flip-flop, and prt-preset for flip-flop
		output wire O;	//output O - input clock signal divided by 4
		wire rewire1, rewire2, div2;	//wires to wire one divide by two circuit to the other, and to wire the QNOT output to D input
		
		d_flip_flop inst0 (rewire1, I, rst, prt, div2, rewire1);	//instance of d flip-flop to divide clock input by two and be wired to second instance
		d_flip_flop inst1 (rewire2, div2, rst, prt, O, rewire2); //first divide by two circuit is wired into a second flip-flop to make divide by 4
			
endmodule	//end of divide by 4 module
