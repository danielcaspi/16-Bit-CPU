`timescale 1ns / 1ps


module mux(             
                input clk,
                input [31:0] in_32,  
                input [15:0] in_16,  // 12
                input sel,
                output [31:0] mux_out
               );
               
reg [31:0] mux_out_reg;

always@(posedge clk)
       if(sel) 
          mux_out_reg = {16'h00000,  in_16};
       else if (!sel)
          mux_out_reg <= in_32;
               

assign mux_out = mux_out_reg;               
               
               
           
               
               
endmodule
