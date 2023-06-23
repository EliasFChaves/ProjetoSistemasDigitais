module extend #(parameter DATA_WIDTH=32)( 
	input [15:0] in, 
	output reg [DATA_WIDTH-1:0] out
);	
	
	// Extensão de sinal
	always @(*) begin
		if (in[15]) begin
			out <= {16'hFFFF,in[15:0]};
		end
		else begin
			out <= {16'h0,in[15:0]};
   	end
	end
endmodule
