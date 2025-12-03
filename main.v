module main(ini, adicionar, S0, S1, Tampar);

	wire [7:0]P, Z;
	input ini, adicionar, Tampar;
	output [7:0] S0, S1;
	
	wire [7:0] Qbuff;
	wire [3:0]BCD0, BCD1;
	wire [6:0]Q;
	
	wire PLoad, save, CLK;
	
	ContadorDeCargaParalela( Z[6:0], Q, ~PLoad, Tampar);
	
	Reg8bits(Qbuff, ~CLK, Q, );
	
	and(Tem5, ~Qbuff[6], ~Qbuff[5],  ~Qbuff[4],  ~Qbuff[3], Qbuff[2], ~Qbuff[1], Qbuff[0], CLK); 
	
	or(save, Tem5, adicionar);
	
	or(CLK, adicionar, Tampar);
	
	or(PLoad, ini, save);
	
	mux1_8bits(P, 8'b00001111, ini, Z);

	BinaryToBCD(Q, BCD0, BCD1);
	
	Somador8bits(P, , Qbuff, 8'b00001111, );
	
	decodificador7seg(BCD0, S0);

	decodificador7seg(BCD1, S1);
	
endmodule