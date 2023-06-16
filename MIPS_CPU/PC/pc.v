module pc(
	input Reset, clk,
	output reg [9:0] count
);
	always @ (posedge clk, posedge Reset) 
	begin									
			if (Reset) 
			begin
					count = 10'b0;
			end 
			else 
			begin
					count = count + 10'b1;
			end
	end
endmodule