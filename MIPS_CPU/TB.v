`timescale 1ns/10ps
module TB();
	
	reg Clk, Reset;
	reg [31:0] Data_BUS_READ;
	wire [31:0] ADDR, Data_BUS_WRITE;
	wire CS, WR_RD;
	
	reg Clk_System, Clk_Mult;
	reg [31:0] writeBack;	
	
	cpu DUT (.Clk(Clk), .Reset(Reset), .Data_BUS_READ(Data_BUS_READ), .ADDR(ADDR), .Data_BUS_WRITE(Data_BUS_WRITE),.CS(CS), .WR_RD(WR_RD));

	initial begin
		$init_signal_spy("DUT/Clk_System","Clk_System",1);
		$init_signal_spy("DUT/Clk_Mult","Clk_Mult",1);
		$init_signal_spy("DUT/writeBack","writeBack",1);
		
		Clk = 0;
		Reset = 0;
		Data_BUS_READ = 32'h0;
		
		#100 Reset = 1;
		#200 Reset = 0;

		#3500 $stop;
	end
	
	always #2.0135 Clk = ~Clk;	
endmodule 