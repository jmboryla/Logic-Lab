module hardware_level (SW,LEDR);
input wire [3:0] SW;
output wire [6:0] LEDR;



two_bit_comp inst0 (SW[3:2],SW[1:0],LEDR[5],LEDR[4],LEDR[3]);


assign LEDR[3:0] = SW[3:0];
endmodule
