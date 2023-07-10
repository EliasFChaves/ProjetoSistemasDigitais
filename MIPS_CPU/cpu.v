/* 
      MIPS_CPU - ELTD05/ELTD15

		Grupo 4:
			Elias Figueiredo Chaves - 2021004408
			Luiz Guilherme de Godoy Gerulaitis - 2020011186
			Othon Augusto Lucena - 2020003021
			
		a) Qual a latência do sistema?
			Resposta: 
			A latência é de 5 pulsos de clock, devido ao pipeline ser de 5 estágios.
			
		b) Qual o throughput do sistema?
			Resposta: 
			Quando há a ocupação total do pipeline, o throughput é de 1 instrução por ciclo de clock.
			
		c) Qual a máxima frequência operacional entregue pelo Time Quest Timing Analizer para o multiplicador e para o sistema? (Indique a FPGA utilizada)
			Resposta: 
			FPGA utilizada foi: Cyclone IV GX: EP4CGX150DF31I7AD
			A frequência máxima operacional do Multiplicador foi de 248.32 MHz
			A frequência máxima operacional do Sistema foi 107.79 MHz
			Timing Analyzer: Slow 1200mV 100C Model
			
			
		d) Qual a máxima frequência de operação do sistema? (Indique a FPGA utilizada)
			Resposta: 
			FPGA utilizada foi: Cyclone IV GX: EP4CGX150DF31I7AD.
			Para o Multiplicador, a frequência de operação foi de 248.32 MHz.
			Para o Sistema, a frequência de operação foi de 7.3035 MHz.
			A frequência do sistema assume esse valor, pois como o multiplicadorleva 34 pulsos de clock de para realizar a sua operação, 
			a frequência do sistema deve ser divida por 34.
			
		e) Com a arquitetura implementada, a expressão (A*B) – (C+D) é executada corretamente (se executada em sequência ininterrupta)? Por quê? 
			O que pode ser feito para que a expressão seja calculada corretamente?
			Resposta: 
			Devido à ocorrência de "pipeline hazard", em que o resultado de uma instrução ainda não está disponível no registrador de 
			destino e a instrução seguinte tenta acessá-lo, é necessário adotar medidas para resolver esse problema. Uma solução viável
			seria a inserção de três ciclos de espera (bolhas) na pipeline após as instruções de load.
			
		f) Analisando a sua implementação de dois domínios de clock diferentes, haverá problemas com metaestabilidade? Por que?
			Resposta: 
			Não, pois o clock do sistema é um múltiplo inteiro do clock do multiplicador e a PLL (Phase-Locked Loop) mantém a fase sincronizada.
		
		g) A aplicação de um multiplicador do tipo utilizado, no sistema MIPS sugerido, é eficiente em termos de velocidade? Por que?
			Resposta: 
			Não, porque a implementação do multiplicador utilizada possui uma estrutura de pipeline enrolada, o que significa que não há paralelismo 
			e leva vários ciclos para concluir a sua execução, nesse caso leva 34 ciclos.
		
		h) Cite modificações cabíveis na arquitetura do sistema que tornaria o sistema mais rápido (frequência deoperação maior). 
		   Para cada modificação sugerida, qual a nova latência e throughput do sistema?
			Resposta: 
			Uma alternativa viável seria substituir a implementação atual do multiplicador por uma mais adequada para o sistema MIPS em questão, 
			como o multiplicador disponível na FPGA. Essa mudança permitiria ao sistema operar em uma frequência mais alta, eliminando a necessidade de múltiplos clocks. 
			Assim, a latência e o throughput seriam mantidos, resultando em um desempenho otimizado.

*/

module cpu(
	input Clk, Reset,
	input [31:0] Data_BUS_READ,
	output [31:0] ADDR, Data_BUS_WRITE,
	output CS, WR_RD
);
	(*keep=1*)wire [31:0] addressCorrection_mem1, addressCorrection_mem2;
	(*keep=1*)wire [31:0] dataOut_Instruct_Mem;
	(*keep=1*)wire [9:0] dataOut_PC;
	(*keep=1*)wire Clk_Mult, Clk_System;
	(*keep=1*)wire [22:0] ctrl0, ctrl1, ctrl2, ctrl3;
	(*keep=1*)wire [31:0] dataOut_RegFile_1, dataOut_RegFile_2;
	(*keep=1*)wire [31:0] writeBack;	
	(*keep=1*)wire [31:0] register_A,register_B;	
	(*keep=1*)wire [31:0] dataOut_Extend;
	(*keep=1*)wire [31:0] dataOut_Imm;	
	(*keep=1*)wire [31:0] dataOut_Mux1;	
	(*keep=1*)wire [31:0] dataOut_ALU;	 
	(*keep=1*)wire [31:0] dataOut_Mult;	
	(*keep=1*)wire [31:0] dataOut_Mux2;		
 	(*keep=1*)wire [31:0] dataOut_D1;		 
	(*keep=1*)wire [31:0] dout;
	(*keep=1*)wire [31:0] dataOut_Mux3;	
	(*keep=1*)wire [31:0] dataOut_D2;
	(*keep=1*)wire dataOut_M;

	pll	PLL (
		.areset (Reset),
		.inclk0 (Clk),
		.c0 (Clk_Mult),
		.c1 (Clk_System),
	);	
	
	assign ADDR = dataOut_D1;
	assign WR_RD = ctrl2[1];
	assign addressCorrection_mem1 = dataOut_PC - 32'h0500;
	assign addressCorrection_mem2 = dataOut_D1 - 32'h0C00;
	
//Instruction Fetch - 1º Estágio

	pc PC(
		.Reset(Reset),
		.Clk(Clk_System),
		.address(dataOut_PC)
	);
	
	instructionmemory Intruction_Memory(
		.clk(Clk_System),
		.address(addressCorrection_mem1[9:0]),
		.dataOut(dataOut_Instruct_Mem)
	);
	
	
//Instruction Decode - 2º Estágio
	
	control Control(
		.in(dataOut_Instruct_Mem),
		.out(ctrl0)
	);
	 
	registerfile Register_File(
		.Clk(Clk_System),
		.Reset(Reset),
		.we(ctrl3[7]),
		.inBack(writeBack),
		.rs(ctrl0[22:18]),
		.rd(ctrl3[12:8]),
		.rt(ctrl0[17:13]),
		.outa(dataOut_RegFile_1),
		.outb(dataOut_RegFile_2)
	);
	
	extend Extend(
		.in(dataOut_Instruct_Mem),
		.out(dataOut_Extend)
	);

	Register A(
		.Reset(Reset),
		.Clk(Clk_System),
		.in(dataOut_RegFile_1),
		.out(register_A)
	);
	 
	Register B(
		.Reset(Reset),
		.Clk(Clk_System),
		.in(dataOut_RegFile_2),
		.out(register_B)
   );

	Register #(23) CTRL1 (
		.Reset(Reset),
		.Clk(Clk_System),
		.in(ctrl0[22:0]),
		.out(ctrl1[22:0])
	);

	Register IMM(
		.Reset(Reset),
		.Clk(Clk_System),
		.in(dataOut_Extend),
		.out(dataOut_Imm)
	);
	 
	 
	 
//Execute - 3º Estágio
	
	mux MUX1(
		.data1(register_B),
		.data2(dataOut_Imm),
		.sel(ctrl1[6]),
		.out(dataOut_Mux1)
	);
	  
	alu ALU(
		.a(register_A),
		.b(dataOut_Mux1),
		.sel(ctrl1[5:4]),
		.out(dataOut_ALU)
	);
	  
	Multiplicador MULTIPLICADOR(
		.Clk(Clk_Mult),
		.Multiplicador(register_A[15:0]),
		.Multiplicando(register_B[15:0]),
		.St(ctrl1[3]),
		.Produto(dataOut_Mult)
	);

	mux MUX2(
		.data1(dataOut_Mult),
		.data2(dataOut_ALU),
		.sel(ctrl1[2]),
		.out(dataOut_Mux2)
	);
	
	Register D1(
		.Reset(Reset),
		.Clk(Clk_System),
		.in(dataOut_Mux2),
		.out(dataOut_D1)
	);
 
	Register B2(
		.Reset(Reset),
		.Clk(Clk_System),
		.in(register_B),
		.out(Data_BUS_WRITE)
	);
	
	Register #(23) CTRL2(
		.Reset(Reset),
		.Clk(Clk_System),
		.in(ctrl1[22:0]),
		.out(ctrl2[22:0])
	);	 

	
//Memory - 4º Estágio
	 
	ADDRDecoding ADDR_Decoding (
		.addr(dataOut_D1),
		.cs(CS)
	);

	datamemory Data_Memory (
		.Clk(Clk_System),
		.WR_RD(ctrl2[1]),
		.ADDR(addressCorrection_mem2[9:0]),
		.din(Data_BUS_WRITE),
		.dout(dout)
	);
	
	Register #(1) M (
		.Reset(Reset),
		.Clk(Clk_System),
		.in(CS),
		.out(dataOut_M)
	);
	
	mux MUX3(
		.data1(dout),
		.data2(Data_BUS_READ),
		.sel(dataOut_M),
		.out(dataOut_Mux3)
	);
	
	Register D2(
		.Reset(Reset),
		.Clk(Clk_System),
		.in(dataOut_D1),
		.out(dataOut_D2)
	);

	Register #(23) CTRL3(
		.Reset(Reset),
		.Clk(Clk_System),
		.in(ctrl2[22:0]),
		.out(ctrl3[22:0])
	);

//Write Back - 5º estágio 
	mux MUX4(
		.data1(dataOut_D2),
		.data2(dataOut_Mux3),
		.sel(ctrl3[0]),
		.out(writeBack)
	);
	
	
 endmodule 