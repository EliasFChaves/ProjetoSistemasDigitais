module instructionmemory
#(	parameter data_WIDTH = 32,	parameter ADDR_WIDTH = 10 )
(
	input [ADDR_WIDTH-1:0] address,
	input clk,
	output reg [data_WIDTH-1:0] dataOut
);

reg [data_WIDTH-1:0] memoria [0:(1<<ADDR_WIDTH)-1];
integer i;
//registrador r23 para offset de memória

initial begin
	for (i=0;i<1024;i=i+1)
		memoria[i] <= 0;
	memoria[0] <= 32'b000101_10111_00000_0000_1100_0000_0000;//load A
	memoria[1] <= 32'b000101_10111_00001_0000_1100_0000_0001;//load B
	memoria[2] <= 32'b000101_10111_00010_0000_1100_0000_0010;//load C
	memoria[3] <= 32'b000101_10111_00011_0000_1100_0000_0011;//load D
	
	memoria[4] <= 32'b000100_00000_00001_00100_01010_110010;//A*B
	memoria[5] <= 32'b000100_00010_00011_00101_01010_100000;//C+D
	
	memoria[6] <= 32'b000100_00100_00101_00110_01010_100010;//A*B - (C+D)
	
	memoria[7] <= 32'b000110_10111_00110_0000_1111_1111_1111;//store na memória
	
	//Código com bolha:
	memoria[8] <= 32'b000101_10111_00000_0000_1100_0000_0000;//load A
	memoria[9] <= 32'b000101_10111_00001_0000_1100_0000_0001;//load B
	memoria[10] <= 32'b000101_10111_00010_0000_1100_0000_0010;//load C
	memoria[11] <= 32'b000101_10111_00011_0000_1100_0000_0011;//load D
	
	//três bolhas
	memoria[12] <= 32'b000101_10111_11000_0000_1100_0000_0100;//Bubble lw 24,0C04(23) 
	memoria[13] <= 32'b000101_10111_11000_0000_1100_0000_0100;//Bubble lw 24,0C04(23) 
	memoria[14] <= 32'b000101_10111_11000_0000_1100_0000_0100;//Bubble lw 24,0C04(23)
	
	memoria[15] <= 32'b000100_00000_00001_00100_01010_110010;//A*B
	
	//três bolhas
	memoria[16] <= 32'b000101_10111_11000_0000_1100_0000_0100;//Bubble lw 24,0C04(23) 
	memoria[17] <= 32'b000101_10111_11000_0000_1100_0000_0100;//Bubble lw 24,0C04(23) 
	memoria[18] <= 32'b000101_10111_11000_0000_1100_0000_0100;//Bubble lw 24,0C04(23)
	
	memoria[19] <= 32'b000100_00010_00011_00101_01010_100000;//C+D
	
	//três bolhas
	memoria[20] <= 32'b000101_10111_11000_0000_1100_0000_0100;//Bubble lw 24,0C04(23) 
	memoria[21] <= 32'b000101_10111_11000_0000_1100_0000_0100;//Bubble lw 24,0C04(23) 
	memoria[22] <= 32'b000101_10111_11000_0000_1100_0000_0100;//Bubble lw 24,0C04(23) 
	
	memoria[23] <= 32'b000100_00100_00101_00110_01010_100010;//A*B - (C+D)
	
	//três bolhas
	memoria[24] <= 32'b000101_10111_11000_0000_1100_0000_0100;//Bubble lw 24,0C04(23)
	memoria[25] <= 32'b000101_10111_11000_0000_1100_0000_0100;//Bubble lw 24,0C04(23) 
	memoria[26] <= 32'b000101_10111_11000_0000_1100_0000_0100;//Bubble lw 24,0C04(23) 
	
	memoria[27] <= 32'b000110_10111_00110_0000_1111_1111_1111;//store na memória
end
	always @ (posedge clk) 
	begin
		dataOut <= memoria[address];
	end

endmodule
