module WaveGenerator  #(
			parameter FREQ = 24000000
		) (clk,
			rst,
			en,
			tone,
			wave
		);
	input clk;
	input rst;
	input en;
	input	[6:0] tone;
	output wave;
	reg level;
	reg [31:0] count;
	reg [31:0] delay;
	wire wave;
	
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			count <= 32'b0;
		end
		else 
			if((count >= delay) && (!(delay == 32'b0))) begin
				count <= 32'b0;
			end
			else
				count <= count + 1;
	end
	
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			level <= 1'b0;
		end
		else	
			if ((count >= delay) && (!(delay == 32'b0))) begin
				level <= !level;
			end
	end
	
	always @(tone) begin
		case (tone)
			'd01: delay = 'd436364;
			'd02: delay = 'd411876;
			'd03: delay = 'd388752;
			'd04: delay = 'd366939;
			'd05: delay = 'd346340;
			'd06: delay = 'd326904;
			'd07: delay = 'd308555;
			'd08: delay = 'd291241;
			'd09: delay = 'd274889;
			'd10: delay = 'd259465;
			'd11: delay = 'd244903;
			'd12: delay = 'd231156;
			'd13: delay = 'd218182;
			'd14: delay = 'd205938;
			'd15: delay = 'd194379;
			'd16: delay = 'd183469;
			'd17: delay = 'd173170;
			'd18: delay = 'd163452;
			'd19: delay = 'd154277;
			'd20: delay = 'd145619;
			'd21: delay = 'd137446;
			'd22: delay = 'd129731;
			'd23: delay = 'd122450;
			'd24: delay = 'd115578;
			'd25: delay = 'd109091;
			'd26: delay = 'd102968;
			'd27: delay = 'd97189;
			'd28: delay = 'd91734;
			'd29: delay = 'd86586;
			'd30: delay = 'd81726;
			'd31: delay = 'd77139;
			'd32: delay = 'd72809;
			'd33: delay = 'd68723;
			'd34: delay = 'd64866;
			'd35: delay = 'd61225;
			'd36: delay = 'd57789;
			'd37: delay = 'd54545;
			'd38: delay = 'd51484;
			'd39: delay = 'd48594;
			'd40: delay = 'd45867;
			'd41: delay = 'd43293;
			'd42: delay = 'd40863;
			'd43: delay = 'd38569;
			'd44: delay = 'd36405;
			'd45: delay = 'd34362;
			'd46: delay = 'd32433;
			'd47: delay = 'd30613;
			'd48: delay = 'd28894;
			'd49: delay = 'd27273;
			'd50: delay = 'd25742;
			'd51: delay = 'd24297;
			'd52: delay = 'd22934;
			'd53: delay = 'd21646;
			'd54: delay = 'd20431;
			'd55: delay = 'd19285;
			'd56: delay = 'd18202;
			'd57: delay = 'd17181;
			'd58: delay = 'd16216;
			'd59: delay = 'd15306;
			'd60: delay = 'd14447;
			'd61: delay = 'd13636;
			'd62: delay = 'd12871;
			'd63: delay = 'd12149;
			'd64: delay = 'd11467;
			'd65: delay = 'd10823;
			'd66: delay = 'd10216;
			'd67: delay = 'd9641;
			'd68: delay = 'd9101;
			'd69: delay = 'd8590;
			'd70: delay = 'd8108;
			'd71: delay = 'd7653;
			'd72: delay = 'd7224;
			'd73: delay = 'd6818;
			'd74: delay = 'd6436;
			'd75: delay = 'd6074;
			'd76: delay = 'd5733;
			'd77: delay = 'd5412;
			'd78: delay = 'd5108;
			'd79: delay = 'd4821;
			'd80: delay = 'd4551;
			'd81: delay = 'd4295;
			'd82: delay = 'd4054;
			'd83: delay = 'd3827;
			'd84: delay = 'd3612;
			'd85: delay = 'd3409;
			'd86: delay = 'd3218;
			'd87: delay = 'd3037;
			'd88: delay = 'd2867;
			default: delay = 'd0;
		endcase
	end
	
	assign wave = level & en;
	
endmodule
