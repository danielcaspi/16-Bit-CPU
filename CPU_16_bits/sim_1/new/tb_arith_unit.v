`timescale 1ns / 1ps

module tb_arith_unit(
    );
    
                                
reg [15:0] in_a;        
reg [15:0] in_b;        
reg [2:0] opcode;       
wire [31:0] out_arith;     
    
    
    
    arith_unit AU(                                
                  . in_a(in_a),                  
                  . in_b(in_b),                  
                  .opcode(opcode),       
                  .out_arith(out_arith)  
                  );                          
                                                  
initial
begin
    in_a = 16'h0004;
    in_b = 16'h0007;
                                                                                                     
end                                                                                                    

integer i;
initial
begin
for ( i = 0; i < 3'hf; i= i+1)
    begin
        opcode <= i;
    #5;
    end
end  

endmodule
