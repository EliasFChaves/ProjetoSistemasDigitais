module Multiplicador(Clk, St, Done, Idle, Multiplicando, Multiplicador, Produto, Reset);
	input Clk, St, Reset;
	input [15:0]Multiplicando, Multiplicador;
	output Idle, Done;
	output [31:0]Produto;
	
	wire [32:0] w_produto;
	assign Produto = w_produto[31:0];
	
	wire[16:0] w_soma;
	
	wire w_load;
	wire w_sh;
	wire w_ad;
	
	wire w_k;
	
	ACC acc (.Load(w_load), .Sh(w_sh), .Ad(w_ad), .Clk(Clk), .Entradas({w_soma, Multiplicador}), .Saidas(w_produto));
	
	Adder adder (.Soma(w_soma), .OperandoA(Multiplicando), .OperandoB(w_produto[31:16]));
	
	CONTROL control (.Reset(Reset), .Clk(Clk), .K(w_k), .Load(w_load), .Sh(w_sh), .Ad(w_ad), .St(St), .M(w_produto[0]), .Idle(Idle), .Done(Done));
	
	Counter counter(.Load(w_load), .Clk(Clk), .K(w_k));
	
endmodule
