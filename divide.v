
module divide (input clk,input a,input b, output reg [9:0] out);
  always @(posedge clk)
    begin
      out <= (b!=0) a/b : 10'b0; //check for the cond - b=0
    end
endmodule
