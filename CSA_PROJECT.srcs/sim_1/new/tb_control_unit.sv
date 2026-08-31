`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 10:49:45 PM
// Design Name: 
// Module Name: tb_control_unit
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


module tb_control_unit();
logic [31:0] instruction;
logic busy, start, is_mul;
logic MemRead, MemtoReg, MemWrite, RegWrite, ALUSrc, Branch;
logic [1:0] mul_type;
logic [3:0] alu_control;

Control_Unit uut(
.instruction(instruction),
.alu_control(alu_control),
.busy(busy),
.start(start),
.is_mul(is_mul),
.MemRead(MemRead),
.MemWrite(MemWrite),
.ALUSrc(ALUSrc),
.Branch(Branch),
.mul_type(mul_type),
.RegWrite(RegWrite),
.MemtoReg(MemtoReg)
);

initial begin
    instruction = 32'h00000000; busy = 1'b0;
    #10 instruction = 32'h023100B3 ; busy = 1'b1;
    #10 instruction = 32'h407302B3; busy = 1'b0;
    #10 $finish;
end

endmodule