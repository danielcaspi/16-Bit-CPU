`timescale 1ns / 1ps


module register_with_load(
                            input         clk,
                            input         load,
                            input [15:0]  data_in,
                            output [15:0] data_out
                        );
                        
reg [15:0] data_out_reg;
                     
always@(posedge clk)
    if(load)
        data_out_reg <= data_in;                        
                        
assign data_out = data_out_reg;                        
                        
endmodule
