`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 10:46:33 PM
// Design Name: 
// Module Name: Control
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


module Control_logic(
    input logic [31:0] instruction,
    output logic MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Branch, 
    output logic [1:0] ALUop
);
    logic [6:0] instr = instruction[6:0];
    logic [6:0] funct7 = instruction[31:25];
    
    
    always_comb begin
        // Default values
        MemRead = 1'b0;
        MemWrite = 1'b0;
        MemtoReg = 1'b0;
        ALUSrc = 1'b0;
        RegWrite = 1'b0;
        Branch = 1'b0;
        ALUop = 2'b00;
        
        case(instr)
            // R TYPE
            7'b0110011:begin 
                RegWrite = 1'b1;
                ALUop = 2'b10;
            end
            
            // I TYPE (ALU immediate)
            7'b0010011: begin
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUop = 2'b11;
            end
            
            // LOADS
            7'b0000011: begin
                MemRead = 1'b1;
                MemtoReg = 1'b1;
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUop = 2'b11;
            end
            
            // STORES (S-type)
            7'b0100011: begin
                MemWrite = 1'b1;
                ALUSrc = 1'b1;
                ALUop = 2'b11;
            end
            
            // Branch
            7'b1100011: begin
                Branch = 1'b1;
                MemtoReg = 1'bX;
                ALUop = 2'b01; 
            end
        endcase
    end
endmodule