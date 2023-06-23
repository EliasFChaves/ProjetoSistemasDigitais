module pc(
	input Clk, Reset, 
	output [9:0] address
);
	reg [9:0]regpc = 10'b0;
	always@(posedge Clk or posedge Reset) begin 
		if(Reset)
			regpc <= 10'b0;
		else
			regpc <= regpc + 10'b1;
	end

	assign address = regpc;
endmodule 