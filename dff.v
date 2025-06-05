`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:14 03/16/2013 
// Design Name: 
// Module Name:    dff 
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
module dff(clk,rst,en,din, do);
    input clk,rst,en,din;
    output reg do;
	 always@(posedge clk)
	 if(rst)
	 do <= 1'b0;
	 else if(en)
	 do <= din;
	
endmodule
