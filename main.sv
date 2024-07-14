`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2024 21:35:52
// Design Name: 
// Module Name: main
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


module main(
input logic ReadOut,
input logic clk,
input logic WriteIn,
input logic Ntt,
input logic [7:0]a[7:0],
output logic [7:0]c[7:0]
    );
    logic[7:0] Twf [7:0][7:0];
   
    logic [7:0]c1[7:0];
    
twd k1(.Twf(Twf));
inp y1(.clk(clk),.WriteIn(WriteIn),.Ntt(Ntt),.in(a));
mem u3(.WtrL(WriteIn),.ReadL(ReadOut),.a(a),.Twf(Twf),.c(c1),.out(c),.ntt(Ntt));
ntt u1(.a(a),.Twf(Twf),.out(c1),.ntt(Ntt));

endmodule
