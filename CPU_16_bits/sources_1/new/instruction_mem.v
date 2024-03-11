`timescale 1ns / 1ps

module instruction_mem(
                        input clk,
                        input we_im,        // =1 in , =0 out
                        input [15:0] data_im_in,
                        input [11:0] add_im,
                        output [15:0] out_im
                        );
reg [15:0] out_im_reg;                       
reg [15:0] mem  [15 :0 ];

always@(posedge clk)
    if (we_im)                      
        mem[add_im] <= data_im_in;
    
    else if(!we_im)
        out_im_reg <= mem[add_im];
                        
                        
  assign out_im = out_im_reg;
                        
endmodule
