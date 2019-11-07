module div_by_5(I,O,rst,prt, QA, QB , QC, QD);	//divide by 5 clock divider module using D flip-flops

	input wire I,prt,rst;	//inputs I - input clock, prt - flip-flop preset, rst - flip-flop reset
	output wire O, QA, QB, QC, QD;	//outputs O - input clock divided by five, and QA-D - output of each flip flop
	wire QAN, QBN, QCN, QDN, and0, and1, and2, xor0;	// wires from gates to input to flip flops, and wires QAN-DN for flip flop outputs
	
	xor inst2 (xor0, QA, QB);	//xor flip-flop outputs of QA and QB
	and inst0 (and0, QAN, QCN);	//and flip-flop outputs QAN and QCN
	and inst1 (and1, xor0, QCN); //and output of first xor and QCN
	and inst3 (and2, QA, QB, QCN);	//
	d_flip_flop inst4(and0, I, rst, prt, QA, QAN); //input to flip-flop is output of and0, and I is the clock input
	d_flip_flop inst5(and1, I, rst, prt, QB, QBN);	//input to flip-flop is output of and1, and I is the clock input
	d_flip_flop inst6(and2, I, rst, prt, QC, QCN);	//input to flip-flop is output of and2, and I is the clock input
	d_flip_flop inst7(QB, ~I, rst, prt, QD, QDN);	//the input to the final flip flop is the output QB, and the clock input is inverted
	
	or inst8 (O, QD, QB);	//the output of the last flip-flop QD is ORed with QB to produce the output of the divide by 5

endmodule	// end of divide by 5 module