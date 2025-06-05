`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:26 03/16/2013 
// Design Name: 
// Module Name:    lut 
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
module lut(a,b,c, s);
    input a,b,c;
    output s;
	 wire y1,y2,y3,y4,y5,y6;
	 mux1 u1(1'b0,1'b1,c, y1);
	 mux1 u2(1'b0,1'b1,c, y2);
	 mux1 u3(1'b0,1'b1,c, y3);
	 mux1 u4(1'b0,1'b1,c, y4);
	 mux1 u5 (y1,y2,b,y5);
	 mux1 u6 (y3,y4,b,y6);
	 mux1 u7 (y5,y6,a,s);

endmodule
