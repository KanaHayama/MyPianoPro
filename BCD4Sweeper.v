module BCD4Sweeper(CLK, I3, I2, I1, I0, O, COM);
	input CLK;
	input [3:0] I3, I2, I1, I0;
	output reg [3:0] O, COM;
	always@(posedge CLK) begin
		COM = COM << 1;
		if (COM == 4'b0000) COM = 4'b0001;
		case (COM)
			4'b0001: O = I0;
			4'b0010: O = I1;
			4'b0100: O = I2;
			4'b1000: O = I3;
		endcase
	end
endmodule
