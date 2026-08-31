`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 09:07:40 PM
// Design Name: 
// Module Name: Immediate_Gen
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


module Immediate_Gen #(parameter width=32)(
input logic [width-1:0]instruction,
output logic [width-1:0]new_imm
    );

logic [6:0] opcode = instruction[6:0]; 
logic [4:0] l_imm = instruction[11:7];
logic [6:0] u_imm = instruction[31:25];
logic [12:0] b_imm = {instruction[31], instruction[7], instruction[30:25], instruction[11:8]};

always_comb
begin
    if(opcode == 7'b0100011)begin  
    new_imm = {{20{instruction[31]}},u_imm, l_imm};
    end
    else if(opcode == 7'b1100011)begin
    new_imm = {{20{b_imm[12]}}, b_imm};
    end
    else begin
    new_imm = {{20{instruction[31]}}, instruction[31:20]};
    end
end
endmodule