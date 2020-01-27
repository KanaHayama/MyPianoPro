module MusicPlayer(CLK, RST, EN, RomAddr, RomTone, RomNote, Tone, Wave);
	input CLK;
	input RST;
	input EN;
	output [9:0] RomAddr;
	input [6:0] RomTone;
	input [6:0] RomNote;
	output [6:0] Tone;
	output Wave;
	
	ToneGenerator tg(
		.clk(CLK),
		.rst(RST),
		.addr(RomAddr),
		.note(RomNote),
		.tone_original(RomTone),
		.tone(Tone)
	);
	
	WaveGenerator wg(
		.clk(CLK),
		.rst(RST),
		.en(EN),
		.tone(Tone),
		.wave(Wave)
	);

endmodule
