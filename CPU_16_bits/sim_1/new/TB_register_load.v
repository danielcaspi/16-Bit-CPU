`timescale 1ns / 1ps

module TB_register_load( );


reg          clk;     
reg          load;     
reg  [15:0]  data_in; 
wire [15:0]  data_out;  




register_with_load register_test (                            
                                    .clk(clk),           
                                    .load(load),         
                                    .data_in(data_in),
                                    .data_out(data_out)
                                  ); 
                                  
initial
    begin
        clk <= 0;
        forever #5
        clk <= !clk;
     end

initial
    begin
        load <= 0;
        data_in <= 0;
        
        #20 data_in <= 16'hffff;
        #20 load <= 1;
        #20 data_in <= 16'h0101;
        #10 load <=0;
        #20 data_in = 16'h1234;
    end                              
                                  
                                                        
endmodule
