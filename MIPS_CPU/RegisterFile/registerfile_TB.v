`timescale 1ns/10ps
module registerfile_TB ();
 
   reg Clk, Reset, we;
	reg [4:0] rs, rt, rd;
	reg [31:0] inBack;
	wire [31:0] outa, outb;
	
	wire [31:0] register [31:0];
	
	registerfile DUT(
		.Clk(Clk),
		.Reset(Reset),
		.we(we),
		.inBack(inBack),
		.rs(rs),
		.rt(rt),
		.rd(rd),
		.outa(outa),
		.outb(outb)
	);
	
	always #10 Clk = ~Clk;
	
	initial begin
		Clk = 0;
		Reset = 1;
		we = 0;
		inBack = 0;
		rs = 0;
		rt = 0;
		rd = 0;
		
		#15 Reset = 0;
		
		inBack = 32'h5F;
		rd = 5'h5;
		we = 1;
		#30 we = 0;
		
		#30 inBack = 32'h28D;
		rd = 5'h3;
		we = 1;
		#30 we = 0;
		
		#30 inBack = 32'h06530025;
		rd = 5'h11;
		we = 1;
		#30 we = 0;
		
		#30 inBack = 32'hFFFFFFFF;
		rd = 5'h1F;
		we = 1;
		#30 we = 0;
		
		#60 rs = 5'h5;
		rt = 5'h3;
		#60;
		rs = 5'h11;
		rt = 5'h1F;
		#60 $stop;
		
	end
	
	initial $init_signal_spy("/registerfile_TB/DUT/register", "register", 1);
	
	
endmodule
