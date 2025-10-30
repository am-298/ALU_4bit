module ripple_adder(input [7:0]a, input [7:0]b, 
output reg [8:0] out);

wire [7:0] c;
wire [7:0] s;
 fulladder fd1(a[0],b[0],1'b0,c[0],s[0]);
 fulladder fd2(a[1],b[1],c[0],c[1],s[1]);
 fulladder fd3(a[2],b[2],c[1],c[2],s[2]);
 fulladder fd4(a[3],b[3],c[2],c[3],s[3]);
 fulladder fd5(a[4],b[4],c[3],c[4],s[4]);
 fulladder fd6(a[5],b[5],c[4],c[5],s[5]);
 fulladder fd7(a[6],b[6],c[5],c[6],s[6]);
 fulladder fd8(a[7],b[7],c[6],c[7],s[7]);

 assign out = {c[7],s};

endmodule 

