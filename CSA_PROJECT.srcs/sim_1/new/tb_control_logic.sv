`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 10:47:23 PM
// Design Name: 
// Module Name: tb_control
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


module tb_control_logic ();
logic [31:0] instruction;     
logic MemRead, MemtoReg, MemWrite, ALUSrc, Branch, RegWrite;          
logic [1:0] ALUop;
 
Control_logic uut(
    .instruction(instruction),
    .MemRead(MemRead),
    .ALUop(ALUop),
    .MemtoReg(MemtoReg),
    .MemWrite(MemWrite),
    .Branch(Branch),
    .RegWrite(RegWrite)
); 
initial begin
        
    instruction = 32'h00000000;
    #10 instruction = 32'h007302B3;
    #10 instruction = 32'h407302B3;
    #10 instruction = 32'h007332B3;
    #10 instruction = 32'h007362B3;
    #10 instruction = 32'h00A35293;
    #10 instruction = 32'h00A36293;
    #10 instruction = 32'h00000000;
    #10 instruction = 32'h00B32223;
    #10 $finish;
        
end 
endmodule