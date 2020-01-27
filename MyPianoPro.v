module MyPianoPro(CLK, BTNRST, BTNEN, WAVE, COM4, LED4, LED1);
	input CLK, BTNRST, BTNEN;
	output [4:0] WAVE;
	output reg [7:0] LED1;
	output [3:0] COM4;
	output [6:0] LED4;
	wire RST, EN, CLKCON, CLKDIS;
	wire [3:0] BCD1_0, BCD0_0, BCD0_1, BCD1_1, BCDO;
	wire [6:0] TONE0, TONE1, TONE2, TONE3, TONE4;
	
	assign RST = ! BTNRST;
	assign EN = ! BTNEN;
	/*
	assign COM4OUT[0] = !COM4[0];
	assign COM4OUT[1] = !COM4[1];
	assign COM4OUT[2] = !COM4[2];
	assign COM4OUT[3] = !COM4[3];
	assign LED4OUT[0] = !LED4[0];
	assign LED4OUT[1] = !LED4[1];
	assign LED4OUT[2] = !LED4[2];
	assign LED4OUT[3] = !LED4[3];
	assign LED4OUT[4] = !LED4[4];
	assign LED4OUT[5] = !LED4[5];
	assign LED4OUT[6] = !LED4[6];
	*/
	
	//assign CLKCON = CLK;
	FreqChange #(.UPPER(1))(.clk_in(CLK), .clk_out(CLKCON));
	
	MusicUnit #(.TONEFN("Tone0.mif"), .NOTEFN("Note0.mif"))(.CLK(CLKCON), .RST(RST), .EN(EN), .PLAYING(), .TONE(TONE0), .WAVE(WAVE[0]), .BCD1(BCD1_0), .BCD0(BCD0_0));
	MusicUnit #(.TONEFN("Tone1.mif"), .NOTEFN("Note1.mif"))(.CLK(CLKCON), .RST(RST), .EN(EN), .PLAYING(), .TONE(TONE1), .WAVE(WAVE[1]), .BCD1(BCD1_01), .BCD0(BCD0_1));
	MusicUnit #(.TONEFN("Tone2.mif"), .NOTEFN("Note1.mif"))(.CLK(CLKCON), .RST(RST), .EN(EN), .PLAYING(), .TONE(TONE2), .WAVE(WAVE[2]), .BCD1(), .BCD0());
	MusicUnit #(.TONEFN("Tone3.mif"), .NOTEFN("Note1.mif"))(.CLK(CLKCON), .RST(RST), .EN(EN), .PLAYING(), .TONE(TONE5), .WAVE(WAVE[3]), .BCD1(), .BCD0());
	MusicUnit #(.TONEFN("Tone4.mif"), .NOTEFN("Note1.mif"))(.CLK(CLKCON), .RST(RST), .EN(EN), .PLAYING(), .TONE(TONE4), .WAVE(WAVE[4]), .BCD1(), .BCD0());
	
	FreqChange #(.UPPER(100000))(.clk_in(CLKCON), .clk_out(CLKDIS));
	BCD4Sweeper (.CLK(CLKDIS), .I3(BCD1_1), .I2(BCD0_1), .I1(BCD1_0), .I0(BCD0_0), .O(BCDO), .COM(COM4));
	BCD2LED (.BCD(BCDO), .LED(LED4));

	always@(*) begin
		LED1[0] <= ('d22<=TONE0&&TONE0<='d27)||('d22<=TONE1&&TONE1<='d27)||('d22<=TONE2&&TONE2<='d27)||('d22<=TONE3&&TONE3<='d27)||('d22<=TONE4&&TONE4<='d27);
		LED1[1] <= ('d28<=TONE0&&TONE0<='d33)||('d28<=TONE1&&TONE1<='d33)||('d28<=TONE2&&TONE2<='d33)||('d28<=TONE3&&TONE3<='d33)||('d28<=TONE4&&TONE4<='d33);
		LED1[2] <= ('d34<=TONE0&&TONE0<='d39)||('d34<=TONE1&&TONE1<='d39)||('d34<=TONE2&&TONE2<='d39)||('d34<=TONE3&&TONE3<='d39)||('d34<=TONE4&&TONE4<='d39);
		LED1[3] <= ('d40<=TONE0&&TONE0<='d45)||('d40<=TONE1&&TONE1<='d45)||('d40<=TONE2&&TONE2<='d45)||('d40<=TONE3&&TONE3<='d45)||('d40<=TONE4&&TONE4<='d45);
		LED1[4] <= ('d46<=TONE0&&TONE0<='d51)||('d46<=TONE1&&TONE1<='d51)||('d46<=TONE2&&TONE2<='d51)||('d46<=TONE3&&TONE3<='d51)||('d46<=TONE4&&TONE4<='d51);
		LED1[5] <= ('d52<=TONE0&&TONE0<='d57)||('d52<=TONE1&&TONE1<='d57)||('d52<=TONE2&&TONE2<='d57)||('d52<=TONE3&&TONE3<='d57)||('d52<=TONE4&&TONE4<='d57);
		LED1[6] <= ('d58<=TONE0&&TONE0<='d63)||('d58<=TONE1&&TONE1<='d63)||('d58<=TONE2&&TONE2<='d63)||('d58<=TONE3&&TONE3<='d63)||('d58<=TONE4&&TONE4<='d63);
		LED1[7] <= ('d64<=TONE0&&TONE0<='d69)||('d64<=TONE1&&TONE1<='d69)||('d64<=TONE2&&TONE2<='d69)||('d64<=TONE3&&TONE3<='d69)||('d64<=TONE4&&TONE4<='d69);
	end
endmodule
