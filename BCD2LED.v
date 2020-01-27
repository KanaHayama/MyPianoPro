module BCD2LED(BCD, LED);
	input [3:0] BCD;
	output reg [6:0] LED;
	/*
	always@(*) begin
		case (BCD)
			'd0: LED <= 'b0111111;
			'd1: LED <= 'b0001100;
			'd2: LED <= 'b1110110;
			'd3: LED <= 'b1011110;
			'd4: LED <= 'b1001101;
			'd5: LED <= 'b1011011;
			'd6: LED <= 'b1111011;
			'd7: LED <= 'b0001110;
			'd8: LED <= 'b1111111;
			'd9: LED <= 'b1011111;
			default: LED <= 'b0010010;
		endcase
	end
	*/
	always@(*) begin
		case (BCD)
			0: LED <= 7'b0111111; // 0
			1: LED <= 7'b0000110; // 1
			2: LED <= 7'b1011011; // 2
			3: LED <= 7'b1001111; // 3
			4: LED <= 7'b1100110; // 4
			5: LED <= 7'b1101101; // 5
			6: LED <= 7'b1111101; // 6
			7: LED <= 7'b0100111; // 7
			8: LED <= 7'b1111111; // 8
			9: LED <= 7'b1100111; // 9
			10: LED <= 7'b1110111; // A
			11: LED <= 7'b1111100; // b
			12: LED <= 7'b0111001; // c
			13: LED <= 7'b1011110; // d
			14: LED <= 7'b1111001; // E
			15: LED <= 7'b1110001; // F
			default: LED <= 7'b0000000;
		endcase
	end
endmodule
