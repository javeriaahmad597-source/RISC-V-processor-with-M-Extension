`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2025 07:33:00 PM
// Design Name: 
// Module Name: Branch_adder
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


module Branch_adder(
input logic [31:0] addr, new_imm,
output logic [31:0] BTA
);
always_comb
begin
    BTA <= addr + (new_imm << 1);
end    
endmodule
