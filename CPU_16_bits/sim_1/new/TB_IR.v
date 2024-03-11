`timescale 1ns / 1ps


module TB_IR();

reg clk;              
reg loadIR;           
reg [15:0] in_from_IM;
wire [11:0] address;  
wire [3:0] opcode;

 instruction_register IR_test(                                  
                                    .clk(clk),               
                                    .loadIR(loadIR),          
                                    .in_from_IM(in_from_IM),       
                                    .address(address),    
                                    .opcode(opcode) 
                              );                               
                
initial
    begin
        clk <= 0;
        forever #5
        clk <=!clk;
    end
    
initial
    begin
        loadIR <= 0;
        in_from_IM <= 0;
        
        #20 in_from_IM <= 16'hffff;
        #30 loadIR <= 1;
        #50 in_from_IM <= 16'h0001;
        #60 loadIR <=0;
        #70 in_from_IM <= 16'h7777;
     end
  
    
    
    
                                                                    


endmodule
