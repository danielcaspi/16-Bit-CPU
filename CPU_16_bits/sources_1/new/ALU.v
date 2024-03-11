`timescale 1ns / 1ps

module ALU( 
            input [15:0] a,
            input [15:0] b,
            input [3:0] opcode, // opcode[3] = 0 -> arith_unit , opcode[3] = 1 -> logic_unit
            output [31:0] out_alu,
            output z_a_flag,z_b_flag,a_bigger_flag,b_bigger_flag,eq_flag
              );
              
reg z_a,z_b,a_bigger,b_bigger,eq;
reg [31:0] logic_out_reg,arith_out_reg;
wire [31:0] logic_out_wire,arith_out_wire;
reg [31:0] out_alu_reg;

 logic_unit LU (                              
                   . in_a(a),        
                   . in_b(b),        
                   .opcode(opcode[2:0]),       
                   .out_logic(logic_out_wire)   
                    );                           
  arith_unit AU(
                    . in_a(a),
                    . in_b(b),
                    .opcode(opcode[2:0]),
                    .out_arith(arith_out_wire)
                    );
                    
                    
 always@(*)
 begin
     logic_out_reg<= logic_out_wire; 
     arith_out_reg<=arith_out_wire;
 end
             
always@(*)
begin
    if(opcode[3] == 1)
       out_alu_reg <= logic_out_reg;
    else if (opcode[3] == 0)
        out_alu_reg <= arith_out_reg;
    else
        out_alu_reg <= 0;
end
     
assign out_alu = out_alu_reg;
                     
always@(a,b)   
    begin 
        if( a == b)  // eq
           	   eq = 1;
        else 
           	   eq = 0;
           	           
        if( a == 16'h0000)  // za
        	z_a = 1;
    	else 
        	z_a = 0;
    	
    	if (b == 16'h0000) // zb
    	   z_b = 1;
    	else 
    	   z_b = 0;
    	
    	if (a > b)
    	   a_bigger = 1;
        else
           a_bigger = 0;
    	
    	if (b > a )
    	   b_bigger = 1;
        else
           b_bigger = 0;
    		              
    end

    
 assign  z_a_flag      = z_a;
 assign  z_b_flag      = z_b;
 assign  a_bigger_flag = a_bigger;
 assign  b_bigger_flag = b_bigger;            
 assign  eq_flag       = eq;            
              
endmodule
