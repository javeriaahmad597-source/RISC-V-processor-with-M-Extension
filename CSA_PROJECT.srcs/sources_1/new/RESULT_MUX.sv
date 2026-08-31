`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 09:19:02 PM
// Design Name: 
// Module Name: MUX_2
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

module RESULT_MUX #(parameter width=32)(
input logic [width-1:0] CALC, dataR,
input logic MemtoReg,
output logic [width-1:0] out_MUX2
);
always_comb
begin
    if(MemtoReg==1'b1)
    out_MUX2 = dataR;
    else
    out_MUX2 = CALC;
end
endmodule
