`timescale 1ns / 1ps

module mem #(parameter data = 32,parameter addres = 12)(     
                input clk,
                input [data - 1:0] data_in,
                output [data - 1 :0] data_out,
                input we_DM,   // read/ write => 1/0
                input [2**addres -1 : 0] addres_dm // addres
    );
    
 reg [data-1:0] data_out_reg;
 reg [data-1:0] data_mem [2**addres -1 :0]  ;  
    
 always@(posedge clk)
    if(we_DM==1)
        data_mem[addres_dm] <= data_in;
    else if (we_DM==0)
        data_out_reg <= data_mem[addres_dm];    
    
assign data_out = data_out_reg;
endmodule
