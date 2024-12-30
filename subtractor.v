module subtractor (input clk,input a,input b, output reg [9:0] out);
  always @(posedge clk) 
    begin 
      out <= (a>b) ? a -b : b-a;
    end
endmodule
