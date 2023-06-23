`timescale 1ns/10ps
module Register_TB();

	reg Reset, Clk;
	reg [31:0] in;
	wire [31:0] out;
	
	Register DUT(
		.Clk(Clk),
		.in(in),
		.out(out),
		.Reset(Reset)
	);
	
	always
		#5 Clk = ~Clk;
	
	initial 
	begin
		Reset = 1;
		Clk = 0;
		in = 0;
		#7 Reset = 0;
		#15 in = 32'h57fa2eb3;
		#20 in = 32'h00001110;
		#25 in = 32'hffffffff;
		#30 $stop;
	end
	
endmodule