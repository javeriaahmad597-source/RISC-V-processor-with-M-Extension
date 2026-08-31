`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 08:57:43 PM
// Design Name: 
// Module Name: tb_register_file
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


module tb_rf #(parameter width =32)();
logic [width-1:0] data1, data2, out_MUX2, dataR;
logic [31:0] instruction;
logic RegWrite, MemtoReg, clk;

Register_File #( .width(width)) uut( 
.instruction(instruction),
.data1(data1), 
.data2(data2), 
.dataR(dataR),
.out_MUX2(out_MUX2),
.RegWrite(RegWrite),
.MemtoReg(MemtoReg),
.clk(clk)
);

always #10 clk <= ~clk;
initial begin
    RegWrite = 0;
    MemtoReg = 0;
    instruction = 32'h00000000;
    clk=0;
    out_MUX2=32'h00000000;
    dataR=0;
    
    #10 
    RegWrite = 0;
    MemtoReg = 1;
    instruction = 32'h407302B3;
    out_MUX2 = 32'h01bc0011;
    dataR=999;
    
    #10
    RegWrite = 1;
    MemtoReg = 0;
    instruction = 32'h007302B3;
    out_MUX2 = 32'h0011100a;
    dataR=222;
    
    #10 
    RegWrite = 1;
    MemtoReg = 0;
    instruction = 32'h007312B3;
    out_MUX2 = 32'h00003456;
    dataR=94;
    
    #10 
    RegWrite = 0;
    MemtoReg = 1;
    instruction = 32'h007322B3;
    out_MUX2 = 32'h00000abc;
    dataR=123;
    
    #10 
    RegWrite = 0;
    MemtoReg = 0;
    instruction = 32'h007342B3;
    out_MUX2 = 32'h00000000;
    dataR=50;
    
    #10 $finish;
end 
endmodule