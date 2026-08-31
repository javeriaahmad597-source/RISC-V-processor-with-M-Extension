`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 08:50:39 PM
// Design Name: 
// Module Name: tb_instr_mem
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


module tb_imem #(parameter width = 32, parameter depth = 37);
logic [31:0] addr;
logic [2:0] funct3;
logic [31:0] instruction;

Instruction_Memory #(.depth(depth), .width(width)) uut( 
.addr(addr), 
.funct3(funct3),
.instruction(instruction)
);

initial begin
    addr=0;
    #10 addr=4;    
    #10 addr=8;
    #10 addr=20;
    #10 addr=22;
    #10 addr=25;
    #10 addr=28;
    #10 $finish;
end
endmodule