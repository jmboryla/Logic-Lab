module decimal_counter(A,overflow,clk,rst,prt,up,stop);	//module decimal counter, counts 0-9 then back to 0 with overflow occurring when the counter loops

	input wire clk, rst, prt,up,stop;	//inputs clk - input clock for the counter, rst - resets counter to 0, prt - presets counter to 9, up - determines if the counter is counting up or down, stop - determine if counter is running
	output wire overflow;	//output overflow - tells when counter has rolled over
	output wire [3:0]A;		//4-bit output A - outputs binary representation of number being counted
	
	reg overflow_reg;	//registers to use in alway block
	reg [3:0]A_reg;
	
	assign overflow = overflow_reg;	//assigning value from always block registers to outputs
	assign A = A_reg;
	
	always @ (posedge clk or negedge rst or negedge prt) //always block sensitive to positive edge of clock, and negative edge of preset and reset
	
			if (~rst)begin	//if reset is pressed
				overflow_reg <= 1'b0;	//overflow is low
				A_reg <= 4'd0;	//A_reg is reset to 0
				end	//end reset condition
				
			else if (~prt)begin	//if preset is pressed
				overflow_reg <=1'b0;	//overflow is low
				A_reg <= 4'd9;	//A_reg is set to 9
				end	//end of preset condition
				
			else if (A_reg < 4'd9 && up && ~stop)begin	//if A_reg is less than 9, counter is counting up, and not stopped
				overflow_reg <= 1'b0;	//overflow is low
				A_reg <= A_reg + 1'b1;	//A_reg is incremented by 1
				end	//end of else if condition
				
			else if (A_reg > 4'd0 && ~up && ~stop)begin	//if A_reg is greater than 0, counter is counting down, and not stopped
				overflow_reg <= 1'b0;	//overflow is low
				A_reg <= A_reg - 1'b1;	//A_reg is decremented by 1
				end	//end of else if condition
				
			else if (A_reg == 4'd9 && up && ~stop)begin	//if A_reg equals 9, counter is counting up, and not stopped	
				overflow_reg <= 1'b1;	//overflow is triggered
				A_reg <= 4'd0;	//A_reg is reset to 0
				end //end of else if condition
				
			else if (A_reg == 4'd0 && ~up && ~stop)begin	//if A_reg equals 0, counter is counting down, and not stopped
				overflow_reg <= 1'b1;	//overflow is triggered
				A_reg <= 4'd9;	//A_reg is reset to 9
				end	//end of else if condition
				
	endmodule	//end of decimal counter module