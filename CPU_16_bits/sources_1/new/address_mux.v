`timescale 1ns / 1ps


module mux_address(             
                    input clk,
                    input [11:0] in_1,  
                    input [11:0] in_2,  
                    input sel,
                    output [11:0] mux_out
                    );
                
reg [11:0] mux_out_reg;

always@(posedge clk)
       if(!sel) 
          mux_out_reg = in_2;
       else if (sel)
          mux_out_reg <= in_1;
               

assign mux_out = mux_out_reg;               
               
               
           
               
               
endmodule