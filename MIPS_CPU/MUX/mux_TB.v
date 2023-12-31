`timescale 1ns/100ps
module mux_TB();
	
	reg [31:0] data1, data2;
	reg sel;
	wire [31:0] out;
	
	mux DUT (
		.sel(sel),
		.data1(data1),
		.data2(data2),
		.out(out)
	);
	
	initial 
	begin
		data1 = 32'hFFFF0000;
		data2 = 32'h0000FFFF;
		sel = 0;
		#20;sel = 1;
		#20 $stop;
	end
endmodule
