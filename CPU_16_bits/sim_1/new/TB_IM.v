`timescale 1ns / 1ps


module TB_IM();


reg         clk;                           
reg         we_im;        // =1 in , =0 out 
reg  [15:0] data_im_in;              
reg  [11:0] add_im;                  
wire [15:0] out_im;                  



 instruction_mem  test(                                   
                                    .clk(clk),           
                                    .we_im(we_im),       
                                    .data_im_in(data_im_in),   
                                    .add_im(add_im),   
                                    .out_im(out_im)        
                       );     
                       
initial
begin
    clk = 0;
    forever #5
    clk = !clk;
end

initial
    begin
        we_im <= 1;
        data_im_in <= 0;
        add_im <= 0;   
    #5 we_im <= 0;
    
    #10 we_im <= 1;
        add_im <= 12'h001;
        data_im_in <= 16'h02a3;    
    #30 we_im <= 0;
    
    #10 we_im <= 1;
        data_im_in <= 16'h00ff;
        add_im <= 12'h002;
    #30 we_im <= 0;
    
    end
    
                       
                       
                       
                       
                       
                       
                       
                       
                                                    
endmodule
