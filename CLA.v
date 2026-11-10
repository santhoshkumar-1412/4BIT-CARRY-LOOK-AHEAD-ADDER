`timescale 1ns/1ps
module cla(S,Cout,a,b,c0);
output [3:0]S;
output Cout;
input [3:0]a,b;
input c0;
wire c1,c2,c3,c4;
wire [0:3]p,g;
assign  g[0]=a[0]&b[0],
	g[1]=a[1]&b[1],
	g[2]=a[2]&b[2],
	g[3]=a[3]&b[3];
assign  p[0]=a[0]^b[0],
	p[1]=a[1]^b[1],
	p[2]=a[2]^b[2],
	p[3]=a[3]^b[3];
assign c1=(g[0]|(p[0]&c0));
assign c2=(g[1]|(p[1]&g[0])|(p[1]&p[0]&c0));
assign c3=(g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&c0));
assign c4=(g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&c0));
assign  S[0]=p[0]^c0,
	S[1]=p[1]^c1,
	S[2]=p[2]^c2,
	S[3]=p[3]^c3;
assign Cout=c4;
endmodule
