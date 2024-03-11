module mem_tb; // 32x16

  localparam DATA_WIDTH = 32;
  localparam ADDRESS_WIDTH = 4;

  
  reg clk;
  reg [DATA_WIDTH - 1:0] data_in;
  wire [DATA_WIDTH - 1:0] data_out;
  reg we_DM;
  reg [2**ADDRESS_WIDTH - 1:0] addres_dm;

  mem #(DATA_WIDTH, ADDRESS_WIDTH) uut (
                                          .clk(clk),
                                          .data_in(data_in),
                                          .data_out(data_out),
                                          .we_DM(we_DM),
                                          .addres_dm(addres_dm)
                                        );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    we_DM = 1;
    data_in = 4'b0010;
    addres_dm = 4'b0010; // Address 2
    #10
    we_DM = 1;
    data_in = 4'b0011;
    addres_dm = 4'b0011; // Address 3
    #10
    we_DM = 0;
    addres_dm = 4'b0010;
    #10
    addres_dm = 4'b0011; 



    
  end

endmodule
