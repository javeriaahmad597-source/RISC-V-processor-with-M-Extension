`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 10:48:16 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
input logic [31:0] instruction,
input logic busy,
output logic MemRead, MemtoReg, MemWrite, ALUSrc, 
output logic RegWrite, Branch, start, is_mul,
output logic [1:0] mul_type,
output logic [3:0] alu_control
);
logic [1:0] ALUop;
logic [2:0] funct3;
logic [6:0] funct7, opcode;
assign funct3 = instruction[14:12];
assign funct7 = instruction[31:25];
assign opcode = instruction[6:0];

ALU_Control_Unit alu_cont(
.instruction(instruction),
.ALUop(ALUop),
.alu_control(alu_control)
);

Control_logic cont(
.instruction(instruction),
.MemRead(MemRead),
.MemWrite(MemWrite),
.ALUSrc(ALUSrc),
.RegWrite(RegWrite),
.MemtoReg(MemtoReg),
.ALUop(ALUop),
.Branch(Branch)
);

always_comb begin
    start = 1'b1;
    is_mul = 1'b0;
    mul_type = 2'b00;        
    
    if (opcode == 7'b0110011 && funct7 == 7'b0000001) begin  
        is_mul = 1'b1;  
        case(funct3) 
            3'b000: mul_type = 2'b00;    // MUL
            3'b001: mul_type = 2'b01;    // MULH
            3'b010: mul_type = 2'b10;    // MULHSU
            3'b011: mul_type = 2'b11;    // MULHU 
        endcase
        if (busy == 1'b1) begin
            start = 1'b0;  
        end
    end 
end
endmodule