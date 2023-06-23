`timescale 1ns/10ps
module extend_TB();

	reg [15:0] in;
	wire [31:0] out;

	extend DUT(
		.in(in), 
		.out(out)
	);

	initial 
	begin
		in = 16'b0000;
		#10 in = 16'b1000011100110111;
		#10 in = 16'b0011;
		#10 in = 16'b0111;
		#10 in = 16'b1100;
		#10 $stop;
	end

endmodule 