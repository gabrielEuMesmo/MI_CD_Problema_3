module contadorDuzia(Ck, S);

	input Ck;
	output S;
	
	wire [3:0]Q;
	wire clear, FF, FF1;
	
	JK_FlipFlop_Preset_Clear(1'b1, 1'b1, Ck, 1'b1,clear, Q[0], );
	
	JK_FlipFlop_Preset_Clear(Q[0], Q[0], Ck, 1'b1,clear, Q[1], );
	
	JK_FlipFlop_Preset_Clear(FF, FF, Ck, 1'b1,clear, Q[2], );
	
	JK_FlipFlop_Preset_Clear(FF1, FF1, Ck, 1'b1,clear, Q[3], );
	
	and(FF, Q[0], Q[1]);
	and(FF1, FF, Q[2]);
	
	and(S, Q[3], Q[2]);
	
	not(clear, S);
endmodule