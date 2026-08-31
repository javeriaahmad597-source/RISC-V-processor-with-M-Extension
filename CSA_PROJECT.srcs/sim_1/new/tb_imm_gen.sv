`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 09:08:18 PM
// Design Name: 
// Module Name: tb_immediate_gen
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


module tb_imm_gen ();
logic [31:0] instruction;
logic [31:0] new_imm;

Immediate_Gen uut(
.instruction(instruction),
.new_imm(new_imm)
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
    #10 instruction = 32'h00004463;
    #10 $finish;
end
endmodule