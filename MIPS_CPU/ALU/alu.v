module alu(a,b,sel,out);
	input [31:0] a;
	input [31:0] b;
	input [1:0] sel;
	output reg [31:0] out;

	always @(a, b, sel)
	begin
		case(sel)
			2'b00: out <= a + b;	//	Add
			2'b01: out <= a - b;	// Sub
			2'b10: out <= a & b;	// And
			2'b11: out <= a | b;	// Or
		endcase

	end
 
endmodule