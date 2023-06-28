`timescale 1ns/10ps

module Multiplicador_TB(); 
	wire [31:0] produto;
	wire idle, done;
	reg st,reset,clk;
	reg [15:0] multiplicando,multiplicador;
	
	reg [16:0] w_soma;
	reg w_load, w_sh, w_ad, w_k;
	
	Multiplicador DUT(
		.Produto(produto),
		.Idle(idle),
		.Done(done),
		.St(st),
		.Clk(clk),
		.Multiplicando(multiplicando),
		.Multiplicador(multiplicador),
		.Reset(reset)
	);
	
	//iniciando entradas
	initial begin
		reset = 0;
		st = 1;
		clk = 0;
		#5		
		reset = 1;
		#15
		reset = 0;
	end
	
	integer i;
	reg fail = 0;
	initial begin
		multiplicando = 0;
		multiplicador = 0;
		#680
			
		multiplicando = 65535;		
		for(i = 0; i < 65536;i = i+3) begin
			multiplicador = i;
			#680 
			if(done) begin
				if(produto != i*multiplicando)begin
					$display("Erro:%dx%d = %d",i,1,produto);
					fail = 1;
				end
				//else $display("%dx%d = %d",i,j,produto);
			end
		end
		if(fail) $display("Falhou o multiplicador");
		else		$display("Deu bom, soh sucesso");
		#20 $stop;		
	end
	
	always begin
		#10 clk = ~clk;
	end
	
	initial $init_signal_spy("/Multiplicador_TB/DUT/w_soma", "w_soma", 1);
	 initial $init_signal_spy("/Multiplicador_TB/DUT/w_load", "w_load", 1);
	 initial $init_signal_spy("/Multiplicador_TB/DUT/w_sh", "w_sh", 1);
	 initial $init_signal_spy("/Multiplicador_TB/DUT/w_ad", "w_ad", 1);
	 initial $init_signal_spy("/Multiplicador_TB/DUT/w_k", "w_k", 1);

endmodule
