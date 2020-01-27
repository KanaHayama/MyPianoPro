module ToneGenerator #(
			parameter DELAY = 735000,/*//12000000*/ /*//每128分之一音符所占时钟周期数，该值应大于2*/ 
			parameter ADDR_MAX = 610//ROM地址上限
		) (
			clk,
			rst,
			addr,
			note,
			tone_original,
			tone
		);
	input clk;
	input rst;
	output reg [9:0] addr;
	input [6:0] note;//时长:该音符所占128分之一音符时值的倍数
	input [6:0] tone_original;//音调
	output [6:0] tone;
	
	reg addr_add;
	reg [31:0] count;//该音符已播放时钟周期数 
			
	always @(posedge clk or posedge rst) begin
		if (rst)begin
			count <= 32'b0;
			addr_add <= 1'b0;
		end
		else
			if (count >= (({1'b0,note} + 1) * DELAY - 1)) begin
				count <= 32'b0;
				addr_add <= 1'b1;
			end
			else begin
				count <= count + 32'b1;
				addr_add <= 1'b0;
			end
	end
	
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			addr <= 8'b0;
		end
		else	
			if (addr_add == 1'b1) begin
				if (addr >= ADDR_MAX) begin
					addr <= 8'b0;
				end
				else
					addr <= addr + 8'b1;
			end
	end
	
	assign tone = !rst? tone_original: 7'b0;

endmodule
