`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 09:05:02 PM
// Design Name: 
// Module Name: MUX_1
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


module MUX_B #(parameter width=32)(
input logic [width-1:0] data2, new_imm,
input logic ALUSrc,
output logic [width-1:0] source_B
);
always_comb
begin
    if(ALUSrc == 1)
    source_B = new_imm;
    else
    source_B = data2;
end
endmodule