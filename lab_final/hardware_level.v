module hardware_level(SW,LEDR,HEX0);

	input wire [5:0]SW;
	output wire [6:0]HEX0;
	output wire [5:0]LEDR;
	
	wire [3:0] segment;
	
	assign LEDR=SW;
	
	lab_final inst0(SW[1],SW[2],SW[3],SW[4],SW[5],SW[0],segment);
	
	seven_segment inst1(segment,HEX0);
	
endmodule
