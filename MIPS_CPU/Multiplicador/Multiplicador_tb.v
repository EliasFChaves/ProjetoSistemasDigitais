`timescale 1ns/100ps
module Multiplicador_tb();
	reg [3:0]Multiplicando, Multiplicador;
	reg Clk, St, Reset;
	wire [7:0]Produto; 
	wire Idle, Done;
	integer j,k;
	
	Multiplicador DUT (
	.Clk(Clk), 
	.St(St), 
	.Done(Done), 
	.Idle(Idle), 
	.Multiplicando(Multiplicando), 
	.Multiplicador(Multiplicador), 
	.Produto(Produto), 
	.Reset(Reset)
	);
	
	always begin
	#5 Clk=!Clk;
	end
	initial begin
	#20 for(j = 0; j<16; j = j+1)
		 begin
		 Multiplicando=0;
			for(j = 0; j<16; j = j+1)
				#100 Multiplicando = Multiplicando+1;
			#100 Multiplicador = Multiplicador+1;
		 end
	#100
   $stop;
	end
	
	//applying initial conditions
	initial begin
		Clk=0;Reset=1;St=0;
		Multiplicando=0;Multiplicador=0;
		#10 Reset=0;
		#20 St=1;
	end
	
endmodule