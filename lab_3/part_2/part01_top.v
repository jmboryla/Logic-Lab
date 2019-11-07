module part01_top(input [3:0]SW, output[6:0]HEX0); //Module name and port list

sevenSegment_bitwise inst0(SW,HEX0); //instance of sevenSegment_bitwise module to connect the board to the hex ouput

endmodule	//end of module