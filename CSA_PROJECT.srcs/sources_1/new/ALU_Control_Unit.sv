`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 10:43:23 PM
// Design Name: 
// Module Name: ALU_control
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


module ALU_Control_Unit(
    input  logic [1:0] ALUop,     
    input  logic [31:0] instruction,
    output logic [3:0] alu_control 
);
    
    logic [2:0] funct3;
    logic [6:0] funct7;
    
    assign funct3 = instruction[14:12];
    assign funct7 = instruction[31:25];  
    
    always_comb begin
        // R TYPE
        if (ALUop == 2'b10) begin  
            case({funct7, funct3})
                10'b0000000000: alu_control = 4'b0010; // ADD
                10'b0100000000: alu_control = 4'b0110; // SUB
                10'b0000000111: alu_control = 4'b0000; // AND
                10'b0000000110: alu_control = 4'b0001; // OR
                10'b0000000100: alu_control = 4'b0011; // XOR
                10'b0000000001: alu_control = 4'b0100; // SLL
                10'b0000000101: alu_control = 4'b0101; // SRL
                10'b0100000101: alu_control = 4'b0111; // SRA
                10'b0000000010: alu_control = 4'b1000; // SLT
                default: alu_control = 4'b1111; // Invalid
            endcase
        end
        
        // I TYPE , LOADS, STORES
        else if (ALUop == 2'b11) begin  
            case(funct3)
                3'b000: alu_control = 4'b0010; // ADDI, LW, SW
                3'b111: alu_control = 4'b0000; // ANDI
                3'b110: alu_control = 4'b0001; // ORI
                3'b100: alu_control = 4'b0011; // XORI
                3'b010: alu_control = 4'b1000; // SLTI
                default: alu_control = 4'b1111; // Invalid
            endcase
        end
        
        // B TYPE
        else if(ALUop == 2'b01) begin
            case(funct3)
                3'b000: alu_control = 4'b1100; // BEQ
                3'b001: alu_control = 4'b1101; // BNE  
                3'b100: alu_control = 4'b1110; // BLTU (unsigned)
                3'b101: alu_control = 4'b1111; // BGEU (unsigned)
                3'b110: alu_control = 4'b1001; // BLT (signed)
                3'b111: alu_control = 4'b1010; // BGE (signed)
                default: alu_control = 4'b1111; // Invalid
            endcase
        end
        
        else begin
            alu_control = 4'b1111; 
        end
    end
endmodule