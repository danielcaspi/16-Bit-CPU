`timescale 1ns / 1ps


module logic_unit(
                    input [15 : 0] in_a,
                    input [15 : 0] in_b,
                    input [2 : 0] opcode,
                    output [31 : 0] out_logic
                    );
reg [31:0] out_logic_reg;
always@(in_a,in_b,opcode) 
    begin
    	case(opcode)
    	3'b000: out_logic_reg = {16'h0000, (in_a & in_b)}; 
    	3'b001: out_logic_reg = {16'h0000, (in_a | in_b)};
    	3'b010: out_logic_reg = {16'h0000, (~(in_a | in_b))};
    	3'b100: out_logic_reg = {16'h0000, (~ in_a)};
    	3'b101: out_logic_reg = {16'h0000, (~ in_b)};
    	3'b110: out_logic_reg = {16'h0000, (in_a ^ in_b)};
    	3'b111: out_logic_reg = {16'h0000, (~(in_a ^ in_b))};
    	default out_logic_reg = 32'h00000000;
    	endcase
    end
                    
assign out_logic = out_logic_reg;                    
                     

    
endmodule
