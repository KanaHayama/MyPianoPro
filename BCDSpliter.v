module BCDSpliter(I, O1, O0);
	input [6:0] I;
	output [3:0] O1, O0;
	DIV (.denom(4'd10), .numer(I), .quotient(O1), .remain(O0));
endmodule
