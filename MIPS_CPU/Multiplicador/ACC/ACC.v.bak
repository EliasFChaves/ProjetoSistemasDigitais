module ACC(Clk, Ad, Load, Sh, Entradas, Saidas);
	input Clk, Ad, Load, Sh;
	input [8:0]Entradas;
	output reg [8:0]Saidas;
	
	always @(posedge Clk) begin
		if(Load) begin
			Saidas[3:0] <= Entradas[3:0];
			Saidas[8:4] <= 0;
		end
		else if(Sh) Saidas[8:0] <= {1'b0, Saidas[8:1]};
		else if(Ad) Saidas[8:0] <= {Entradas[8:4], Saidas[3:0]};
	end
endmodule
	
	