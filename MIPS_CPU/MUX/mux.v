module mux(sel, data1, data2, out);

	input [31:0] data1; 
	input [31:0] data2;
	input sel;
	output [31:0] out;

	assign out = sel ? data2 : data1;
	
endmodule
