`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 11:14:24 PM
// Design Name: 
// Module Name: MUX_1b
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


module MUX_A(
input logic [31:0] prod,
input logic [31:0] dataW,
input logic done,
output logic [31:0] CALC
    );

always_comb
begin
    if(done == 1'b1)
        CALC = prod;
    else
        CALC = dataW;
end    
endmodule
