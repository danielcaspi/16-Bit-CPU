`timescale 1ns / 1ps


module instruction_register(
                             input clk,                 // 16bit
                             input loadIR,
                             input [15:0] in_from_IM,
                             output [11:0] address,
                             output [3:0] opcode                       
                              );
                              
reg [11:0] address_reg;
reg [3:0] opcode_reg;                       
    
always@(posedge clk )                          
    if(loadIR)
    begin
        address_reg <= in_from_IM[11:0];
        opcode_reg  <= in_from_IM[15:12];                        
    end                          
                              
 assign address = address_reg;
 assign opcode = opcode_reg;                            
                             
                             
                             
                             
                             
                             
endmodule
