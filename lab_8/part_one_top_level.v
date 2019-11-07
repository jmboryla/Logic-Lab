module part_one_top_level (SW,LEDR,KEY0);

	input wire [4:0]SW,LEDR;
	input wire KEY0;
	
	lab8_part_two inst0(SW[3],SW[2],SW[1],SW[0],KEY0,SW[4],1'b1);
	
endmodule
	