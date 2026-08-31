`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 11:07:45 PM
// Design Name: 
// Module Name: adder
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


module Adder(
input logic computing, busy,
input logic [5:0] counter,
input logic [31:0] addr,
output logic [31:0] PC_4
);

always_comb
begin
    if(busy==1'b1 || computing==1'b1) begin
    PC_4 = addr;
    end
    else begin
    PC_4 = addr + 4;
    end
end    
endmodule