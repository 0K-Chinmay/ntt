`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2024 21:47:04
// Design Name: 
// Module Name: mem
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


module mem(
input logic WtrL, 
input logic ReadL,
input logic[7:0] Twf [7:0][7:0],
input logic[7:0]c[7:0],
input logic ntt,
output logic[7:0]out[7:0],
input logic [7:0]a[7:0]);

logic[7:0]inp[7:0][7:0];
logic[7:0]ou[7:0][7:0];
logic[7:0] W [7:0][7:0];
logic[3:0]i=0;
logic[3:0]k=0;

always@(WtrL,ReadL,ntt) begin 
   if(WtrL) begin
   for(int j=0;j<8;j++)begin
     inp[i][j]<=a[j];
     end
     i<=i+1;
     W=Twf;
   end
   
   if(ntt) begin 
    for(int j=0;j<8;j++)begin
     ou[k][j]=c[j];
     end
     k=k+1;
   end
   
   if(ReadL) begin
    out=ou[k-1];
   end

end
endmodule
