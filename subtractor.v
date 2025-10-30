module subtractor (
  input wire [7:0] a,
  input wire [7:0] b,
  output reg [7:0] diff,
  output reg bout
);

reg [7:0] b_c; // complement
reg [7:0] G; 
reg [7:0] P;
reg [8:0] c;


integer i;

always @(*) begin
    b_c = ~b; 
    c[0] = 1'b1 ; 
  for (i=0; i<8; i=i+1) begin
    G[i] = a[i] & b_c[i];
    P[i] = a[i]^ b_c[i];
    c[i+1]=G[i] | (P[i]&c[i]);
end
end

assign diff = P ^ c[7:0];
assign bout = ~c[8];
 
endmodule
