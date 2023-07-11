`timescale 10ns/10ps
module instructionmemory_TB();
parameter data_WIDTH = 32;
parameter ADDR_WIDTH = 10;
//Input Ports
reg [ADDR_WIDTH-1:0] address;
reg clk;
wire [data_WIDTH-1:0] dataOut;
integer i = 0;

instructionmemory DUT(
	.address(address),  
	.clk(clk), 
	.dataOut(dataOut)
);

initial begin
	clk = 0;
	address = 10'b0000000000;	
	
	#10
	for (i=0; i < 28; i = i + 1) 
	begin
		#20 address = address + 1;
	end
	
end

always #5 clk = ~clk;

initial #1000 $stop;

endmodule
