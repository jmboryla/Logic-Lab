module top_level (SW,LEDR);

input wire [9:0] SW;
output wire [5:3] LEDR;

four_bit_comp inst0 (SW[9:6],SW[3:0],LEDR[4],LEDR[5],LEDR[3]);

endmodule 