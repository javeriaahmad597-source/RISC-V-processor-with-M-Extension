`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 09:10:33 PM
// Design Name: 
// Module Name: Top_Module
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


module Top_Module #(parameter WIDTH = 32 )(
input logic clk,
input logic rst,
output logic done,
output logic [5:0] counter,
output logic [WIDTH-1:0] addr, instruction, out_MUX2, source_B, prod, CALC,
output logic [WIDTH-1:0]  dataW, dataR, data1, data2, new_imm, BTA,
output logic [WIDTH-1:0]pc,
output logic [2:0] funct3,
output logic [1:0] mul_type,
output logic MemtoReg, RegWrite, MemWrite, MemRead, is_mul,
output logic ALUSrc, Branch, zero_flag, busy, start,
output logic [3:0] alu_control
);

// internal logic
logic computing;
logic [63:0] product_reg;


// alu
ALU #(.width(WIDTH)) alu(
.data1(data1),
.source_B(source_B),
.dataW(dataW),
.zero_flag(zero_flag),
.alu_control(alu_control)
);

// register file
Register_File #(.width(WIDTH)) reg_file(
.clk(clk),
.RegWrite(RegWrite),
.MemtoReg(MemtoReg),
.instruction(instruction),
.out_MUX2(out_MUX2),
.data1(data1),
.data2(data2)
);

// program counter
Program_Counter #(.width(WIDTH)) p_c(
.clk(clk),
.rst(rst),
.done(done),
.Branch(Branch),
.zero_flag(zero_flag),
.BTA(BTA),
.is_mul(is_mul),
.addr(addr),
.pc(pc)
);

// instruction memory
Instruction_Memory #(.width(WIDTH)) imem(
.addr(addr),
.funct3(funct3),
.instruction(instruction)
);

// data memory
Data_Memory dmem(
.clk(clk),
.data2(data2),
.funct3(funct3),
.dataR(dataR),
.dataW(dataW),
.MemRead(MemRead),
.MemWrite(MemWrite)
);

// immediate generator
Immediate_Gen #(.width(WIDTH)) imm_gen(
.instruction(instruction),
.new_imm(new_imm)
);

// mux A
MUX_A  mux_a(
.prod(prod),
.dataW(dataW),
.done(done),
.CALC(CALC)
);

// mux B
MUX_B#(.width(WIDTH)) mux_b(
.data2(data2),
.new_imm(new_imm),
.ALUSrc(ALUSrc),
.source_B(source_B)
);

// result mux 
RESULT_MUX #(.width(WIDTH)) mux_result(
.CALC(CALC),
.dataR(dataR),
.MemtoReg(MemtoReg),
.out_MUX2(out_MUX2)
);

// branch adder
Branch_adder  add_b(
.addr(addr),
.new_imm(new_imm),
.BTA(BTA)
);

// control unit
Control_Unit c_unit(
.instruction(instruction),
.MemRead(MemRead),
.MemtoReg(MemtoReg),
.MemWrite(MemWrite),
.RegWrite(RegWrite),
.ALUSrc(ALUSrc),
.start(start),
.is_mul(is_mul),
.busy(busy),
.mul_type(mul_type),
.Branch(Branch),
.alu_control(alu_control)
);

Multiplier_co_processor mul_cop(
.clk(clk),
.rst(rst), 
.busy(busy),
.data1(data1), 
.data2(data2), 
.start(start),
.is_mul(is_mul),
.mul_type(mul_type),
.prod(prod),
.done(done),
.counter(counter)
);

endmodule