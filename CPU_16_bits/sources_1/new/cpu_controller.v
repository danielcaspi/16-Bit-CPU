`timescale 1ns / 1ps


module cpu_controller(
                        input clk,
                        input en,
                        input [3:0] opcode_in,
                        input [2:0] opcode_out,
                        output loadA,
                        output loadB,
                        output loadC,
                        output loadIR,
                        output loadPC,
                        output incPC,
                        output mode, // opcode [3]
                        output we_DM,
                        output selA,
                        output selB
                        );
                       
reg loadA_reg;                       
reg loadB_reg;                       
reg loadC_reg;                        
reg loadIR_reg;                        
reg loadPC_reg;                        
reg incPC_reg;                        
reg mode_reg;                         
reg we_DM_reg;                        
reg selA_reg;                         
reg selB_reg;                          
  
reg [1:0] state,next_state;
parameter rst = 2'b00, load = 2'b01, execute = 2'b10;  
 
always@(posedge clk)
    if(!en)
        state <= rst;
    else if (en)
        state <= next_state;
  
always@(*)
    if (!en)
    begin
        loadA_reg <= 0; 
        loadB_reg <= 0;
        loadC_reg <= 0; 
        loadIR_reg <= 0;
        loadPC_reg <= 0;
        incPC_reg <= 0; 
        mode_reg <= 0;  
        we_DM_reg <= 1'bz; 
        selA_reg <= 0;  
        selB_reg <= 0;  
        next_state <= rst;
     end
     
     else
     begin
        case(state)
            rst: 
            begin
                 loadA_reg <= 0;       
                 loadB_reg <= 0;   
                 loadC_reg <= 0;   
                 loadIR_reg <= 0;  
                 loadPC_reg <= 0;  
                 incPC_reg <= 0;   
                 mode_reg <= 1'bz;    
                 we_DM_reg <= 0;
                 selA_reg <= 0;    
                 selB_reg <= 0;   
                 next_state = load; 
            end
            
            load: //In the load state, we initialise the Instruction register with the address and OPCODE to make sure the design is ready for execution.
            begin
                  loadA_reg <= 0;     
                  loadB_reg <= 0;   
                  loadC_reg <= 0;   
                  loadIR_reg <= 1;  
                  loadPC_reg <= 1;  
                  incPC_reg <= 0;   
                  mode_reg <= 1'bz;    
                  we_DM_reg <= 0;
                  selA_reg <= 0;    
                  selB_reg <= 0;  
                  next_state = execute;  
             end
             
             execute: 
             begin
                case(opcode_in)
                        4'b0000,4'b0001,4'b0010,4'b0011 :  // arith
                          begin
                                loadA_reg <= 0;   
                                loadB_reg <= 0;   
                                loadC_reg <= 0;   
                                loadIR_reg <= 0;  
                                loadPC_reg <= 0;  
                                incPC_reg <= 1;   
                                mode_reg <= 0; 
                                we_DM_reg <= 0;   
                                selA_reg <= 0;    
                                selB_reg <= 0;    
                          end
                          
                         4'b1000, 4'b1001, 4'b1010, 4'b1011, 4'b1100, 4'b1101, 4'b1110, 4'b1111: // logic
                         begin
                                loadA_reg <= 0;   
                                loadB_reg <= 0;   
                                loadC_reg <= 0;   
                                loadIR_reg <= 0;  
                                loadPC_reg <= 0;  
                                incPC_reg <= 1;   
                                mode_reg <= 1; 
                                we_DM_reg <= 0;   
                                selA_reg <= 0;    
                                selB_reg <= 0;   
                           end
                           
                           4'b0100: // load a
                           begin
                                loadA_reg <= 1;   
                                loadB_reg <= 0;   
                                loadC_reg <= 0;   
                                loadIR_reg <= 0;  
                                loadPC_reg <= 0;  
                                incPC_reg <= 1;   
                                mode_reg <= 0; 
                                we_DM_reg <= 1;   
                                selA_reg <= 0;    
                                selB_reg <= 0;    
                            end
                            
                            4'b0101: // load b    
                            begin                 
                                 loadA_reg <= 0;  
                                 loadB_reg <= 1;  
                                 loadC_reg <= 0;  
                                 loadIR_reg <= 0; 
                                 loadPC_reg <= 0; 
                                 incPC_reg <= 1;  
                                 mode_reg <= 0;
                                 we_DM_reg <= 1;  
                                 selA_reg <= 0;   
                                 selB_reg <= 0;   
                             end  
                             
                             4'b0111: // load c    
                              begin                 
                                   loadA_reg <= 0;  
                                   loadB_reg <= 0;  
                                   loadC_reg <= 1;  
                                   loadIR_reg <= 0; 
                                   loadPC_reg <= 0; 
                                   incPC_reg <= 1;  
                                   mode_reg <= 0;
                                   we_DM_reg <= 1;  
                                   selA_reg <= 0;   
                                   selB_reg <= 0;   
                               end                  
                             
                               4'b0111: //jmp address
                               begin                 
                                    loadA_reg <= 0;  
                                    loadB_reg <= 0;  
                                    loadC_reg <= 0;  
                                    loadIR_reg <= 0; 
                                    loadPC_reg <= 1; 
                                    incPC_reg <= 1;  
                                    mode_reg <= 0;
                                    we_DM_reg <= 0;  
                                    selA_reg <= 1;   
                                    selB_reg <= 1;   
                                end                  
                         endcase
                         next_state <= load;    
                      end
                      
                      default : 
                         begin
                                  loadA_reg <= 0;       
                                  loadB_reg <= 0;   
                                  loadC_reg <= 0;   
                                  loadIR_reg <= 1;  
                                  loadPC_reg <= 0;  
                                  incPC_reg <= 0;   
                                  mode_reg <= 1'bz;    
                                  we_DM_reg <= 0;
                                  selA_reg <= 0;    
                                  selB_reg <= 0;   
                                  next_state = rst;   
                         end
                endcase
        end
        
assign  loadA = loadA_reg;                       
assign  loadB = loadB_reg;                       
assign  loadC = loadC_reg;                        
assign  loadIR = loadIR_reg;                        
assign  loadPC = loadPC_reg;                        
assign  incPC = incPC_reg;                        
assign  mode = mode_reg;                         
assign  we_DM = we_DM_reg;                        
assign  selA = selA_reg;                         
assign  selB = selB_reg;   
assign  opcode_out = opcode_in[2:0];                           
                         
                                             
                        
                        
endmodule
