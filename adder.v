module adder (input clk, input a, input b, output reg [9:0] out);
  always @(posedge clk)
    begin 
      out <= a+b;
    end
endmodule 

