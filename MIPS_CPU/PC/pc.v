module pc(
	input Clk, Reset, 
	output [31:0] address
);
	reg [31:0]regpc = 32'h0500;
	always@(posedge Clk or posedge Reset) begin 
		if(Reset)
			regpc <= 32'h0500;
		else
			regpc <= regpc + 32'h0001;
	end

	assign address = regpc;
endmodule 