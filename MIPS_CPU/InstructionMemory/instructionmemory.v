module instructionmemory
#(	parameter data_WIDTH = 32,	parameter ADDR_WIDTH = 10 )
(
	input [ADDR_WIDTH-1:0] address,
	input clk,
	output reg [data_WIDTH-1:0] dataOut
);

reg [data_WIDTH-1:0] memoria [0:(1<<ADDR_WIDTH)-1];

initial begin
	memoria[40] <= 32'b000101_00000_00001_0001_0010_0000_0000;//load A
	memoria[41] <= 32'b000101_00000_00010_0001_0010_0000_0001;//load B
	memoria[42] <= 32'b000101_00000_00011_0001_0010_0000_0010;//load C
	memoria[43] <= 32'b000101_00000_00100_0001_0010_0000_0011;//load D
	
	memoria[44] <= 32'b000100_00001_00010_00101_01010_110010;//A*B
	memoria[45] <= 32'b000100_00011_00100_00110_01010_100000;//C+D
	
	memoria[46] <= 32'b000100_00101_00110_00111_01010_100010;//A*B - (C+D)
	
	memoria[47] <= 32'b000110_00000_00111_0001_0010_0000_0100;//store na memória
	
end

endmodule
