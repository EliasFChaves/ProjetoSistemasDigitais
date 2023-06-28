module ADDRDecoding(
	input [31:0] addr,
	output reg cs
);
	reg [31:0] superior;
	reg [31:0] inferior;
	
	//Memoria interna C00h a FFFh
	always @ (*)
	begin
		superior = 32'hFFF;
		inferior = 32'hC00;
		if(addr[31:0] >= inferior) 
		begin
			if(addr[31:0] <= superior)
			begin
				cs = 0; //Interna
			end
			else cs = 1; //Externa
		end
		else cs = 1;	
	end 
	
endmodule 