`timescale 1ns / 1ps


module arith_unit(
                    input [15:0] in_a,
                    input [15:0] in_b,
                    input [2:0] opcode,
                    output [31:0] out_arith);
reg [31:0] out_arith_reg;                    
                    
  always@(in_a,in_b,opcode)
begin
	case(opcode)
	3'b000: out_arith_reg = {16'h0000, in_a+in_b};
	3'b001: out_arith_reg = in_a * in_b;
	3'b010: if (in_a > in_b) begin
		out_arith_reg = in_a - in_b;
		end
		else begin
		out_arith_reg = in_b - in_a;
		end
	3'b011: if (in_a > in_b) begin
		out_arith_reg = in_a / in_b;
		end
		else begin
		out_arith_reg = in_b /in_a;
		end
	default out_arith_reg = 32'h00000000;
	endcase
end
assign out_arith = out_arith_reg;

endmodule                  
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    

