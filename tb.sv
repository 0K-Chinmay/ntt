`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2024 21:40:50
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();
logic [7:0]c[7:0];
logic ro,clk,WI,ntt;
main u1(.ReadOut(ro),.clk(clk),.WriteIn(WI),.Ntt(ntt),.c(c));
initial begin 
  WI=0;ntt=0;ro=0;
  clk=0;  #10;
  clk=1;  #10;
  WI=1;#10
  ntt=1;#10
  ro=1;#10
  $stop;
end
endmodule
