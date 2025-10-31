module multiplier (input clk,input start,input [7:0]a,
input [7:0]b, output reg [15:0] out,
output reg busy);

 reg signed [7:0]acc; 
 reg signed [7:0] Q;
 reg Qn;
 reg [3:0] i=4'b0000;

always @(posedge clk) begin
  if (start && !busy) begin
      acc <= 8'b0;
      Q <= b;
      Qn <=1'b0;
      busy<=1'b1;
      i <=0;
   end
  
  else if (busy) begin

        case ({Q[0],Qn})
          2'b01: acc <= acc + a;
          2'b10: acc <= acc - a;
          default : acc <=acc;
        endcase

        {acc,Q,Qn} <= {acc[7],acc,Q}>>>1;
        i <= i+1;

        if (i==7) begin
          out <={acc,Q};
          busy <=1'b0;
        end

    end

  end

  
endmodule
