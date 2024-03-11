`timescale 1ns / 1ps

module TB_cpu( );

 reg        clk_i;           
 reg        we_im_i;         
 reg        EN_i;            
 reg [15:0] code_i;          
 reg [11:0] immed_address_i; 
 wire       z_a_i;           
 wire       z_b_i;           
 wire       a_bigger_i;      
 wire       b_bigger_i;      
 wire       eq_i ;            

CPU_16_bits cpu_test (
                        .clk_i(clk_i),          
                        .we_im_i(we_im_i),        
                        .EN_i(EN_i),           
                        .code_i(code_i),         
                        .immed_address_i(immed_address_i),
                        .z_a_i(z_a_i),          
                        .z_b_i(z_b_i),          
                        .a_bigger_i(a_bigger_i),     
                        .b_bigger_i(b_bigger_i),     
                        .eq_i (eq_i)
                        );           

initial
    begin
        clk_i = 0;
        forever #5 
        clk_i = !clk_i;
    end

initial
    begin
        we_im_i<= 0;        
        EN_i<= 0;           
        code_i<= 0;         
        immed_address_i<= 0;   
    end
    
initial
    begin
           we_im_i <=1;
        #5 we_im_i <=0;
        #10 EN_i <= 1;
        
        #5 we_im_i <= 1;
           code_i <= 16'h6001;
       
       #10 we_im_i <= 0;

       #20 we_im_i <= 1; // load A
           code_i <= 16'h4000; 
        
       #10 we_im_i <=0;
       
       #20 we_im_i <= 1; // load B
           code_i <= 16'h5001;  

       #10 we_im_i <=0;

       #20 we_im_i <= 1; 
           code_i <= 16'h1010;
    end
















endmodule
