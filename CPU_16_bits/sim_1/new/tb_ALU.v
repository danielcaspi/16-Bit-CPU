`timescale 1ns / 1ps


module tb_ALU();

 reg [15:0] a;                                                  
 reg [15:0] b;                                                  
 reg [3:0] opcode; // opcode[3] = 0 -> arith_unit , opcode[3] = 
 wire [31:0] out_alu;                                           
 wire z_a_flag,z_b_flag,a_bigger_flag,b_bigger_flag,eq_flag ;    



 ALU ALU_test(                                                                                         
            .a(a),                                                                         
            .b(b),                                                                         
            .opcode(opcode),    
            .out_alu(out_alu),                                                                  
            .z_a_flag(z_a_flag),
            .z_b_flag(z_b_flag),
            .a_bigger_flag(a_bigger_flag),
            .b_bigger_flag(b_bigger_flag),
            .eq_flag(eq_flag)                            
            ); 
            
initial
begin
    a = 16'h0004;
    b = 16'h0001;
                                                                                                      
end                                                                                                    

integer i;
initial
begin
opcode <= 4'bz000;
#20

for ( i = 0; i < 4'hf; i= i+1)
    begin
    
        opcode <= i;
        #5;
    end
    
end





endmodule
