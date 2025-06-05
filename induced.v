`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:02 03/16/2013 
// Design Name: 
// Module Name:    induced 
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
module induced(sa1,sa0,clk,en,rst,cin,m,a, s,co);
    input sa1,sa0,clk,en,rst,cin,m;
	 input [3:0]a;
    output s;
	 output co;
	 reg [3:0]z1;
	  
   always@(posedge clk)
	if(sa1)
	z1 = {a[0],1'b0,a[2],a[3]};
	else if(sa0)
	z1 = {a[0],a[1],1'b1,a[3]};
	else
	z1 = a;
	
	clb u1 (z1,clk, cin,m,en,rst, s, co);

endmodule
