`timescale 1ns / 1ps


module CPU_16_bits(
                    input        clk_i,
                    input        we_im_i,
                    input        EN_i,
                    input [15:0] code_i,             
                    input [11:0] immed_address_i,
                    output       z_a_i,
                    output       z_b_i,
                    output       a_bigger_i,
                    output       b_bigger_i,
                    output       eq_i
                    
    );

wire [3:0]  opcode_to_control,opcode_to_alu;    
wire [31:0] alu_out;
wire [15:0] data_out_reg_a,data_out_reg_b,data_out_reg_c,data_in_reg_c;
wire [31:0] out_mem_to_a_b;
wire sel_A,sel_B;
wire [11:0] mux_im_out;
wire load_A,load_B,load_C,load_IR,load_PC,inc_PC;
wire [11:0] address_line;
wire we_DM_cpu;
wire [15:0] IM_out;
wire [11:0] pc_out_wire;

 ALU alu_unit(                                                                                         
                                    .a(data_out_reg_a),                                                                         
                                    .b(data_out_reg_b),                                                                         
                                    .opcode(opcode_to_alu),    
                                    .out_alu(alu_out),                                                                  
                                    .z_a_flag(z_a_i),
                                    .z_b_flag(z_b_i),
                                    .a_bigger_flag(a_bigger_i),
                                    .b_bigger_flag(b_bigger_i),
                                    .eq_flag(eq_i)                            
            );

register_with_load register_a (
                                    .clk(clk_i),    
                                    .load(load_A),   
                                    .data_in(out_mem_to_a_b[15:0]),
                                    .data_out(data_out_reg_a)
                                  );

register_with_load register_b (
                                    .clk(clk_i),    
                                    .load(load_B),   
                                    .data_in(out_mem_to_a_b[31:16]),
                                    .data_out(data_out_reg_b)
                                  );

reg_32 register_c (
                                    .clk(clk_i),    
                                    .load(load_C),   
                                    .data_in(data_in_reg_c),
                                    .data_out(data_out_reg_c)
                                  );

mux alu_mux (                                              
                                    .clk(clk_i),            
                                    .in_32(alu_out),   
                                    .in_16({1'h0,address_line}),   
                                    .sel(sel_B),            
                                    .mux_out(data_in_reg_c)
              ); 
              
mux_address IM_mux (                                    
                                    .clk(clk_i),            
                                    .in_1(immed_address_i),   
                                    .in_2(pc_out_wire),   
                                    .sel(sel_A),            
                                    .mux_out(mux_im_out)
                         ); 

cpu_controller controller_(                     
                                    .clk(clk_i),      
                                    .en(EN_i),        
                                    .opcode_in(opcode_to_control),
                                    .opcode_out(opcode_to_alu[2:0]),
                                    .loadA(load_A),  
                                    .loadB(load_B),  
                                    .loadC(load_C),  
                                    .loadIR(load_IR),
                                    .loadPC(load_PC),
                                    .incPC(inc_PC),  
                                    .mode(opcode_to_alu[3]),    
                                    .we_DM(we_DM_cpu),  
                                    .selA(sel_A),    
                                    .selB(sel_B)     
                                    );              

 mem #(32, 12) mem_cpu (                        
                                    .clk(clk_i),            
                                    .data_in(data_out_reg_c),    
                                    .data_out(out_mem_to_a_b),  
                                    .we_DM(we_DM_cpu),        
                                    .addres_dm(address_line) 
                         );                      

 instruction_register IR_reg(                         
                                    .clk(clk_i),              
                                    .loadIR(load_IR),           
                                    .in_from_IM(IM_out),
                                    .address(address_line),  
                                    .opcode(opcode_to_control)    
                              );                     

 instruction_mem IM_mem(                                       
                                    .clk(clk_i),                            
                                    .we_im(we_im_i),        
                                    .data_im_in(code_i),              
                                    .add_im(mux_im_out),                  
                                    .out_im(IM_out)                  
                       );                                   
program_counter PC (                .clk(clk_i),              
                                    .pc_load(load_PC),      
                                    .pc_inc(inc_PC),        
                                    .pc_address(address_line),
                                    .pc_out (pc_out_wire)        
                         );                      

    
    
    
endmodule
