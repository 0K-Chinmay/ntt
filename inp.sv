`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2024 20:03:27
// Design Name: 
// Module Name: inp
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


module inp(
input logic clk,
input logic WriteIn,
input logic Ntt,
output logic [7:0]in[7:0]
);

integer fd;
assign fd = $fopen("Good.txt", "r");
always@(clk, WriteIn, Ntt)
begin
if(~$feof(fd))
begin
for(int i=0;i<8;i++) begin
   $fscanf(fd,"%d%*[^\n]",in[i]);
end
end
end
endmodule