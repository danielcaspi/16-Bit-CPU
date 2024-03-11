`timescale 1ns / 1ps


module tb_control( );

reg clk;                  
reg en;                   
reg [3:0] opcode_in;     
wire [2:0] opcode_out;    
wire loadA;               
wire loadB;               
wire loadC;               
wire loadIR;              
wire loadPC;              
wire incPC;               
wire mode;
wire we_DM;               
wire selA;                
wire selB;


cpu_controller controller_test(
                                    .clk(clk),                  
                                    .en(en),                   
                                    .opcode_in(opcode_in),
                                    .opcode_out(opcode_out),         
                                    .loadA(loadA),               
                                    .loadB(loadB),               
                                    .loadC(loadC),               
                                    .loadIR(loadIR),              
                                    .loadPC(loadPC),              
                                    .incPC(incPC),               
                                    .mode(mode), 
                                    .we_DM(we_DM),               
                                    .selA(selA),                
                                    .selB(selB)   
                                    );              
initial
begin
    clk = 0;
    forever #5
    clk = !clk;
end

initial
begin
    en = 0;
    opcode_in = 0000;
    #10
    en = 1;
    opcode_in = 1001;
    #30
    
    opcode_in = 1010;
end



endmodule
