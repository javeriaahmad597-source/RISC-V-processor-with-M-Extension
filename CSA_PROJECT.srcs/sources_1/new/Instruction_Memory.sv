`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 02:43:42 PM
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_Memory #(
    parameter width = 32, 
    parameter depth = 37
)(
input logic [31:0] addr,
output logic [2:0] funct3,
output logic [31:0] instruction
);

logic [6:0] opcode;
logic [4:0] rd, rs1, rs2;
logic [6:0] funct7;
logic [11:0] imm;

logic [width-1:0] mem[0:depth-1];
initial begin
    $readmemh("Instr_mem.mem", mem);
end
always_comb begin
     instruction = mem[addr >> 2];
     opcode = instruction[6:0];
     rd = instruction[11:7];
     funct3 = instruction[14:12];
     rs1 = instruction[19:15];
     rs2 = instruction[24:20];
     funct7 = instruction[31:25];
     imm = instruction[31:20];
end
endmodule