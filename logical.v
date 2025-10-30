module logical (input [3:0]opcode , input clk,input [7:0]a,input [7:0]b, output reg [7:0] out);
  
  
  always @(posedge clk)
    begin
      
      case (opcode)
        4'b0101: out <= a|b;
        4'b0110: out <= a&b;
        4'b0111: out <= ~(a);
        4'b1000: out <= a^b;
        4'b1001: out <= ~(a^b); // nxor
        4'b1010: out <= ~(a&b); // nand
        4'b1011: out <= ~(a|b); // nor
        4'b1100:out <= a << 1; // shift left 
        4'b1101:out <= $signed(a) >>> 1; //shift right
        4'b1110: out <= a+1 ;// increment
        default : out<= 8'b0;
      endcase
    end
endmodule
