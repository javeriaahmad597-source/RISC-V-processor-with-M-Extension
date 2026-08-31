`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 09:16:35 PM
// Design Name: 
// Module Name: tb_top_module
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


module tb_top ();
parameter WIDTH = 32;
logic clk, rst, done;
logic [5:0] counter;
logic [WIDTH-1:0] addr, instruction, out_MUX2, source_B, BTA, prod, CALC;
logic [WIDTH-1:0]  dataW, dataR, data1, data2, new_imm; 
logic [WIDTH-1:0]pc;
logic [1:0] mul_type;
logic MemtoReg, RegWrite, MemWrite, MemRead, is_mul;
logic ALUSrc, Branch, zero_flag, busy, start; 
logic [3:0] alu_control;

Top_Module uut(
.clk(clk),
.rst(rst),
.done(done),
.addr(addr),
.counter(counter),
.prod(prod),
.CALC(CALC),
.instruction(instruction),
.dataW(dataW),
.dataR(dataR),
.data1(data1),
.data2(data2),
.new_imm(new_imm),
.out_MUX2(out_MUX2),
.source_B(source_B),
.BTA(BTA),
.pc(pc),
.mul_type(mul_type),
.MemtoReg(MemtoReg),
.RegWrite(RegWrite),
.MemWrite(MemWrite),
.MemRead(MemRead),
.ALUSrc(ALUSrc),
.Branch(Branch),
.busy(busy),
.start(start),
.is_mul(is_mul),
.zero_flag(zero_flag),
.alu_control(alu_control)
);

always #10 clk<=~clk;
initial begin
    clk = 0; rst = 0;
    #10 rst=1; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0; #10 rst=0;
    #10 rst=1;
    #10 $finish;
end

endmodule