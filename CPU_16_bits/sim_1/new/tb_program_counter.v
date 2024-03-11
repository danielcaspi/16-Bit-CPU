`timescale 1ns / 1ps

module tb_program_counter( );


reg clk ;             
reg pc_load ;         
reg pc_inc ;          
reg [11:0] pc_address;
wire [11:0] pc_out ;   

program_counter PC_test ( .clk(clk),              
                          .pc_load(pc_load),          
                          .pc_inc(pc_inc),           
                          .pc_address(pc_address),
                          .pc_out (pc_out)
                          );   

initial 
    begin
        clk = 0;
        forever #5
        clk = !clk;
    end
    




initial
begin
        pc_load <= 1'b0;
    	pc_inc <= 1'b0;
    	pc_address <= 12'h00f;
    
    #30 pc_load = 1'b1;
    	pc_inc = 1'b0;
    	pc_address <= 12'h001;

    
    #30 pc_load = 1'b0;
    	pc_inc = 1'b1;
    	
    #30 pc_load = 1'b1;
    	pc_inc = 1'b1;	
    	
end




endmodule
