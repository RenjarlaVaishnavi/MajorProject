`timescale 1ns/1ns
module lfsr1(out, enable, rst, clk);
//input [3:0]in;
input clk,rst,enable;
output [3:0]out;
reg [3:0] temp;
wire w1;
assign w1 = temp[1] ^ temp[0];
always @(posedge clk or negedge rst)
begin

if(!rst)
temp <= 4'b0010;

else if(enable)
begin
temp <= {w1, temp[3], temp[2], temp[1]};
end

end
assign out = temp;
endmodule

module test_lfsr;

reg clk,rst,enable1;
reg [3:0]in1;
wire [3:0]t;

lfsr l1(.clk(clk), .rst(rst), .enable(enable1), .in(in1), .out(t));

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
enable1 = 1'b1;
 in1 = 4'b0010;
// $display("output=%b",t);
//#60 $finish;


end

//initial
//begin
//$recordfile ("lfsr.trn");
//$recordvars ("depth = 0");
//end
endmodule

