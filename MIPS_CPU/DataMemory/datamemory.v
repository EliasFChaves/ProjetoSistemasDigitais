module datamemory #(parameter ADDR_WIDTH = 10, parameter DATA_WIDTH = 32)
(
    input Clk,
    input WR_RD, //Read em 0, Write em 1
    input [ADDR_WIDTH-1:0] ADDR,
    input [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout
);

    reg [DATA_WIDTH-1:0] memory [0:(1<<ADDR_WIDTH)-1];
    
    always @(posedge Clk) begin
        if (WR_RD)
            memory[ADDR] <= din;
        
        dout <= memory[ADDR];
    end
    
    initial begin
        memory[0]=32'd2001; // A
        memory[1]=32'd4001; // B
        memory[2]=32'd5001; // C
        memory[3]=32'd3001; // D
    end

endmodule 