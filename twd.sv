`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2024 20:10:15
// Design Name: 
// Module Name: twd
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


module twd(
output logic[7:0] Twf [7:0][7:0]
);

logic [7:0]mod=17;
logic [7:0] root=9;
logic [31:0]power;
initial begin
   for (int i=0;i<8;i++) begin 
       for (int j=0;j<8;j++) begin
                power = 1;
                for (int k = 0; k < i * j; k++) begin
                    power = (power * root)%mod;
                end
          Twf[i][j] = power%mod;
       end
    end
    end
    

endmodule