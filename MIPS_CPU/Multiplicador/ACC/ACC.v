module ACC(Clk, Ad, Load, Sh, Entradas, Saidas);
	input Clk, Ad, Load, Sh;
	input [32:0]Entradas;
	output reg [32:0]Saidas;
	
	always @(posedge Clk) begin
		if(Load) begin
			Saidas[32:0] <= {16'b0, Entradas[15:0]}
		end
		else if(Sh) Saidas[32:0] <= {1'b0, Saidas[32:1]};
		else if(Ad) Saidas[32:16] <= Entradas[32:16];
	end
endmodule
	
	