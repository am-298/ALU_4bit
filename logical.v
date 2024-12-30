module logical (input [3:0]opcode , input clk,input a,input b, output reg [9:0] out);
  always @(posedge clk)
    begin
      case (opcode)
        4'b0101: out <= a|b;
        4'b0110: out <= a&b;
        4'b0111: out <= ~(a);
        4'b1000: out <= a^b;
        4'b1001: out <= {6'b0,~(a^b)};
        4'b1010: out <={6'b0,~(a&b)};
        4'b1011: out <={6'b0,~(a+b)};
       
     endcase
    end
endmodule
