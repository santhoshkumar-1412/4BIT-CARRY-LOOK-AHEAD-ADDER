`timescale 1ns/1ps
module cla_tb;
reg [3:0] a,b;
reg c0;
wire [3:0] S;
wire Cout;
cla dut (.S(S),.Cout(Cout),.a(a),.b(b),.c0(c0));
initial
begin
    a=4'd8; b=4'd4; c0=0;
    #10;
    a=4'd5; b=4'd3; c0=1;
    #10;
    a=4'd3; b=4'd5; c0=0;
    #10;
    a=4'd15; b=4'd1; c0=0;
    #10;
    a=4'd15; b=4'd15; c0=1;
    #10;
    a=4'd0; b=4'd0; c0=0;
    #10;
    a=4'd9; b=4'd7; c0=1;
    #10;
    $finish;
end
initial
begin
    $monitor("Time=%0t | A=%d | B=%d | Cin=%b | Sum=%d | Cout=%b",$time,a,b,c0,S,Cout);
end
initial
begin
    $dumpfile("cla.vcd");
    $dumpvars(0,cla_tb);
end
endmodule
