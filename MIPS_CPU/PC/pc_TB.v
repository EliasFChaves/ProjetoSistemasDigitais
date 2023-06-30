`timescale 1ns/10ps
module pc_TB();

	reg Clk, Reset;
	wire [31:0] address;

	pc DUT(
		.Clk(Clk),
		.Reset(Reset),
		.address(address)
	);
	
	always #6 Clk = ~Clk;
		
	initial 
	begin
		Clk = 0;
		Reset = 1;
		#15
		Reset = 0;
		#360
		Reset = 1;
		#12 Reset = 0;
		
		#12282 $stop;
	end

endmodule 