module registerfile (
	input Clk, Reset, we,
	input [4:0] rs, rt, rd,
	input [31:0] inBack,
	output [31:0] outa, outb	
);	
	integer j;
	reg [31:0] register [31:0];
	
	assign outa = register[rs];
	assign outb = register[rt];
	
	always @ (posedge Clk, posedge Reset) begin 
		
		if (Reset)
			for(j = 0; j <= 31; j = j+1) 
				register[j] <= 32'h0;
				
		else if (we)
				register[rd] <= inBack;
	end 
	


endmodule
