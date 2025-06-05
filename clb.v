`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:34 03/16/2013 
// Design Name: 
// Module Name:    clb 
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
module clb(a,clk, cin,m,en,rst, s, co);
    input [3:0] a;
    input cin,m,en,rst,clk;
    output s;
    output co;
	 wire y1,y2,y3,y4,y5,y6;
    lut u1 (a[0],a[1],a[2], y1);
	 lut u2 (a[1],a[2],a[3], y2);
	 adder u3 (y1,y2,cin,y3,co);
	 mux1 u4 (y1,y2,a[3],y4);
	 mux1 u5 (y3,y4,m,y5);
	 dff u6 (clk,rst,en,y5, y6);
	  mux1 u7 (y5,y6,m,s);
endmodule
