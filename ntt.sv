`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2024 21:38:59
// Design Name: 
// Module Name: ntt
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


module ntt(
    input logic [7:0] a [7:0],
    input logic [7:0] Twf [7:0][7:0],
    output logic [7:0] out [7:0],
    input logic ntt_start,
    output logic ntt_done
);

    logic [7:0] temp [7:0];

    // Task for recursive NTT computation
    task automatic ntt_recursive(
        input logic [7:0] in[],
        output logic [7:0] out[],
        input int n,
        input logic [7:0] twiddle_factors[][]
    );
        if (n == 1) begin
            out[0] = in[0];
        end else begin
            logic [7:0] even [3:0];
            logic [7:0] odd [3:0];
            logic [7:0] even_out [3:0];
            logic [7:0] odd_out [3:0];

            for (int i = 0; i < n/2; i++) begin
                even[i] = in[2*i];
                odd[i] = in[2*i + 1];
            end

            ntt_recursive(even, even_out, n/2, twiddle_factors);
            ntt_recursive(odd, odd_out, n/2, twiddle_factors);

            for (int i = 0; i < n/2; i++) begin
                logic [7:0] twiddle = twiddle_factors[n][i];
                out[i] = (even_out[i] + (twiddle * odd_out[i]) % 17) % 17;
                out[i + n/2] = (even_out[i] - (twiddle * odd_out[i]) % 17 + 17) % 17;
            end
        end
    endtask

    always_ff @(posedge ntt_start) begin
        if (ntt_start) begin
            ntt_recursive(a, temp, 8, Twf);
            for (int i = 0; i < 8; i++) begin
                out[i] = temp[i];
            end
            ntt_done = 1;
        end else begin
            ntt_done = 0;
        end
    end
endmodule
