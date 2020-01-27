module FreqChange #( parameter UPPER = 5 
	) (
	clk_in,
	clk_out
	);
	input clk_in;
	output clk_out;
	reg clk;
	reg [31:0] counter;
	
	always @(posedge clk_in) begin
		if (counter >= UPPER) begin
			counter <= 0;
			clk <= 1'b1;
		end
		else begin
			counter <= counter + 1;
			clk <= 1'b0;
		end;
	end
	
	assign clk_out = clk;
endmodule
