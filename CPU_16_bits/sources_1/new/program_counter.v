`timescale 1ns / 1ps


module program_counter(
                        input clk,   
                        input pc_load,    
                        input pc_inc,    
                        input [11:0] pc_address,    
                        output [11:0] pc_out    
                            
    );
    
reg [11:0] pc_out_reg;    
always@(posedge clk)
    if((pc_load == 0) && (pc_inc == 0))
        pc_out_reg <= 0;
    else if ((pc_load == 1) && (pc_inc == 0))
        pc_out_reg <= pc_address;
    else if ((pc_load == 0) && (pc_inc == 1))
        pc_out_reg <= pc_out_reg + 1; 
    else 
        pc_out_reg <= pc_out_reg;
    
  
assign pc_out = pc_out_reg;  
  
endmodule
