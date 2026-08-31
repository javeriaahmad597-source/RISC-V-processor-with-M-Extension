`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 10:45:45 PM
// Design Name: 
// Module Name: tb_alu_control
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


module tb_alu_control();
logic [1:0] ALUop;
logic [31:0] instruction;
logic [3:0] alu_control;

ALU_Control_Unit uut (
.ALUop(ALUop),
.instruction(instruction), 
.alu_control(alu_control)
);

initial begin
    instruction = 32'h00000000; ALUop = 2'b00;
    #10 instruction = 32'h007302B3; ALUop = 2'b00;
    #10 instruction = 32'h407302B3; ALUop = 2'b01;
    #10 instruction = 32'h007332B3; ALUop = 2'b01;
    #10 instruction = 32'h007362B3; ALUop = 2'b00;
    #10 instruction = 32'h00A35293; ALUop = 2'b11;
    #10 instruction = 32'h00A36293; ALUop = 2'b10;
    #10 instruction = 32'h00000000; ALUop = 2'b10;
    #10 instruction = 32'h00B32223; ALUop = 2'b00;
    #10 $finish;

   #20 $finish;
end
endmodule