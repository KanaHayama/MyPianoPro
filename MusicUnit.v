module MusicUnit #(parameter TONEFN, NOTEFN)(CLK, RST, EN, PLAYING, TONE, WAVE, BCD1, BCD0);
	input CLK, RST, EN;
	output reg PLAYING;
	output [6:0] TONE;
	output WAVE;
	output [3:0] BCD1, BCD0;
	
	wire [9:0] ADDRWIRE;
	wire [6:0] NOTEWIRE;
	wire [6:0] TONEWIRE;
	
	MusicPlayer (.CLK(CLK), .RST(RST), .EN(EN), .RomAddr(ADDRWIRE), .RomTone(TONEWIRE), .RomNote(NOTEWIRE), .Tone(TONE), .Wave(WAVE));
	ROM #(.FILENAME(TONEFN))(.address(ADDRWIRE), .clock(CLK), .q(TONEWIRE));
	ROM #(.FILENAME(NOTEFN))(.address(ADDRWIRE), .clock(CLK), .q(NOTEWIRE));
	BCDSpliter (.I(TONE), .O1(BCD1), .O0(BCD0));
	always@(TONE) begin
		PLAYING = TONE != 7'd0;
	end
endmodule
