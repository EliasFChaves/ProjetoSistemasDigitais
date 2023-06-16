module Counter(Load, Clk, K);
	input Load, Clk;
	output reg K;
	
	integer i = 0;
	
	always@(posedge Clk) begin
		if(Load) begin
			i = 30;
			K=0;
		end
		
		else if(i==0) K=1;
		i = i-1;
	end
	
endmodule
