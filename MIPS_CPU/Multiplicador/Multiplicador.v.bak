module Multiplicador(Clk, St, Done, Idle, Multiplicando, Multiplicador, Produto, reset);
	input Clk, St, reset;
	input [3:0]Multiplicando, Multiplicador;
	output Idle, Done;
	output [7:0]Produto;
	
	wire [8:0] w_produto;
	assign Produto = w_produto[7:0];
	
	wire[4:0] w_soma;
	
	wire w_load;
	wire w_sh;
	wire w_ad;
	
	wire w_k;
	
	ACC acc (.Load(w_load), .Sh(w_sh), .Ad(w_ad), .Clk(Clk), .Entradas({w_soma, Multiplicador}), .Saidas(w_produto));
	
	Adder adder (.Soma(w_soma), .OperandoA(Multiplicando), .OperandoB(w_produto[7:4]));
	
	CONTROL control (.reset(reset), .Clk(Clk), .K(w_k), .Load(w_load), .Sh(w_sh), .Ad(w_ad), .St(St), .M(w_produto[0]), .Idle(Idle), .Done(Done));
	
	Counter counter(.Load(w_load), .Clk(Clk), .K(w_k));
	
endmodule
