module clock_divider(clockIn,clockOut);	//Clock divider to divide clock down to 10Hz

	input wire clockIn;	//Input clockIn - 50MHz clock from altera board
	output wire clockOut;	//ouput clockOut - 10Hz clock 
	wire MHz10,MHz1,KHz100,KHz10,KHz1,Hz100; //wires to wire divide by 10 circuits together
	
	div_by_5 inst0 (clockIn,MHz10,1'b1,1'b1);	//50MHz to 10MHz (holding preset and reset high)
	div_by_10 inst1 (MHz10,MHz1);	//10MHz to 1MHz
	div_by_10 inst2 (MHz1,KHz100);	//1MHz to 100kHz
	div_by_10 inst3 (KHz100,KHz10);	//100kHz to 10kHz
	div_by_10 inst4 (KHz10,KHz1);	//10kHz to 1kHz
	div_by_10 inst5 (KHz1,Hz100);	//1kHz to 100Hz
	div_by_10 inst6 (Hz100,clockOut);	//100Hz to 10Hz - output
	
endmodule	//end of clock divider module
