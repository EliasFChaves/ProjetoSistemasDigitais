module Register #(parameter DATA_WIDTH=32)(
	input [DATA_WIDTH-1:0] in,
	input Clk, Reset, 
	output reg [DATA_WIDTH-1:0] out
);
	always @(posedge Clk, posedge Reset)
		if(Reset) begin
			out <= 0;
		end
		else begin
			out <= in;
		end
	
endmodule 