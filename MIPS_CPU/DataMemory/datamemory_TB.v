`timescale 10ns/10ps
module datamemory_TB();
    
    reg  Clk, WR_RD;
    reg  [31:0 ] din;
    reg  [9:0 ] ADDR;
    wire [31:0 ] dout;
    
	 wire [31:0] memory [0:1023];
    
    datamemory DUT(
        .din(din),
        .ADDR(ADDR),
        .Clk(Clk),
        .WR_RD(WR_RD),
        .dout(dout)
    );

    always 
        #2 Clk = ~Clk;

    initial 
    begin
        Clk = 0;
        WR_RD = 0;
        din = 0;
        
		  #100
        ADDR = 0;
		  #100
		  ADDR = 1;
		  #100
		  ADDR = 2;
		  #100
		  ADDR = 3;

        #100
        WR_RD = 1;
        
        #100
        ADDR = 0;
		  din = 20;
		  #100
		  ADDR = 1;
		  din = 30;
		  #100
		  ADDR = 2;
		  din = 40;
		  #100
		  ADDR = 4;
		  din = 50;
        
        #100
        WR_RD = 0;
        din = 0;
        
        #100
        ADDR = 0;
		  #100
		  ADDR = 1;
		  #100
		  ADDR = 2;
		  #100
		  ADDR = 3;
        
        #100 $stop;
    end
	 
endmodule 