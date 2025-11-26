module main(ini, S0, S1, Qbuff, Q, CLK);

	wire [7:0]P, Z;
	input ini, CLK;
	output [7:0] S0, S1, Qbuff;
	output Q;
	
	wire [3:0]BCD0, BCD1;
	wire [6:0]Q;
	
	wire PLoad, save;
	
	ContadorDeCargaParalela( Z[6:0], Q, ~PLoad, CLK);
	
	Reg8bits(Qbuff, CLK, P, save);
	
	and(save, ~Qbuff[6], ~Qbuff[5],  Qbuff[4],  ~Qbuff[3], Qbuff[2], ~Qbuff[1], ~Qbuff[0], ~ini); 
	
	or(PLoad, ini, save);
	
	mux1_8bits(Qbuff, 8'b00001111, ini, Z);

	BinaryToBCD(Q, BCD0, BCD1);
	
	Somador8bits(P, , Q, 8'b00001110, );
	
	decodificador7seg(BCD0, S0);

	decodificador7seg(BCD1, S1);
	
endmodule