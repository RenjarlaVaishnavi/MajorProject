`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:43:08 03/16/2013 
// Design Name: 
// Module Name:    topmodel 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module topmodel1(clk,tm,,rst,sa1,sa0,hold,in,out,pass,fail,done);
input clk,hold,tm,rst,sa1,sa0;
input  [3:0] in;
output  pass,fail;
output reg out,done;
wire [3:0] y1;
reg [3:0]z1;
wire x1,x2;
reg f1,p1;
reg rst1,m,cin;
reg e1;
reg en;
wire c1,c2;
lfsr1 u1 (y1, e1, rst, clk);
clb u2 (z1,clk, cin,m,en,rst1, x1, c1);
induced u3 (sa1,sa0,clk,en,rst1,cin,m,z1, x2,c2);

 always@(posedge clk)
if(tm)
begin
e1 <= 1'b1;
z1 <= y1;
end
else
begin
e1 <= 1'b1;
z1 <= in ;
end
always@(posedge clk)
if(e1 & tm)
 begin
  f1 <= x1 ^ x2;
  p1 <= ~(x1^x2);
end
else
begin
f1 <= 1'b0;
p1 <= 1'b0;
end
always@(posedge clk)
if(hold)
begin
en <= 1'b1;
rst1 <= 1'b0;
m <= 1'b0;
cin <= 1'b0;
end
else
begin
en <= 1'b1;
rst1 <= 1'b0;
m <= 1'b1;
cin <= 1'b0;
end
always@(posedge clk)
if(p1)
begin
done <= 1'b1;
end
else
begin
done <= 1'b0;
end
/*always@(posedge clk)
if(tm & hold & (sa0 == 1'b0) & (sa1 == 1'b0))
begin
e1 <= 1'b1;
z1 <= in ;
end*/
always@(posedge clk)
if(x2)
begin
out <= 1'b1;
end
else
begin
out <= 1'b0;
end
assign pass = p1;
assign fail = f1;
 //assign out = x2;
endmodule

module test_topmodel1;

reg clk,hold,tm,rst,sa1,sa0;
reg [3:0]in;
wire  pass,fail,done;
wire out;

topmodel1 u1 (clk,tm,,rst,sa1,sa0,hold,in,out,pass,fail,done);

initial
begin
clk=1'b0;
forever #1 clk=~clk;
end

initial
begin
rst=1'b0;
#5 rst=1'b1;
end

initial
begin
tm = 1'b1;
 in = 4'b0010;
 
 hold = 1'b1;
 sa1 = 1'b1;
 sa0 = 1'b0;
 #10 in = 4'b0011;
 #10 in = 4'b0100;
 #10 in = 4'b0101;
 #10 in = 4'b0110;
 #10 in = 4'b0111;
 #10 in = 4'b1000;
 #10 in = 4'b1001;
 #10 in = 4'b1010;
 #10 in = 4'b1011;
 #10 in = 4'b1100;
 #10 in = 4'b1101;
 #10 in = 4'b1110;
 #10 in = 4'b1111;
 #10 in = 4'b0000;
 

end

endmodule


