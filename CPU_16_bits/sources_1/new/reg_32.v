`timescale 1ns / 1ps


module reg_32           (
                            input         clk,
                            input         load,
                            input [31:0]  data_in,
                            output [31:0] data_out
                        );
                        
reg [31:0] data_out_reg;
                     
always@(posedge clk)
    if(load)
        data_out_reg <= data_in;                        
                        
assign data_out = data_out_reg;                        
                        
endmodule
