`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 09:01:59 PM
// Design Name: 
// Module Name: tb_data_memory
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


module tb_dmem #(parameter width = 8, parameter depth = 32);
logic clk;
logic [31:0] data2, dataW, dataR;
logic MemRead, MemWrite;
logic [2:0] funct3;

Data_Memory #(.depth(depth), .width(width)) uut( 
.clk(clk),
.data2(data2),
.dataW(dataW),
.MemRead(MemRead),
.dataR(dataR),
.MemWrite(MemWrite),
.funct3(funct3)
);

always #10 clk=~clk;
initial begin
    clk=0; 
    data2=0;
    dataW=0;
    MemRead=0;
    MemWrite=0;
    funct3 = 3'b000;
    
    #10
    data2=4;
    dataW=3;
    MemRead=1;
    MemWrite=0;
    funct3 = 3'b010;
    
    #10
    data2=56;
    dataW=2;
    MemRead=0;
    MemWrite=1;
    funct3 = 3'b100;
    
    #10
    data2=932;
    dataW=10;
    MemRead=1;
    MemWrite=0;
    funct3 = 3'b001;
    
    #10
    data2=458;
    dataW=5;
    MemRead=1;
    MemWrite=0;
    funct3 = 3'b10;
    
    #10 $finish;
end
endmodule
