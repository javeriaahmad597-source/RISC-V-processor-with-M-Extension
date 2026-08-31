`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 02:41:55 PM
// Design Name: 
// Module Name: tb_alu
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


module tb_alu#(parameter width = 32)();
logic [31:0] source_A, source_B; 
logic [31:0] dataW;
logic move;
logic [1:0] alu_control;

ALU #(.width(width))uut( 
.source_A(source_A), 
.source_B(source_B), 
.dataW(dataW),
.alu_control(alu_control),
.move(move)
);
initial
begin
   alu_control = 4'b0010;
   source_A = 32'h00000123;
   source_B = 32'h0000AD34;
   
   #10
   alu_control = 4'b0100;
   source_A = 32'h00010110;
   source_B = 32'h0000CB12;
   
   #10
   alu_control = 4'b0000;
   source_A = 32'h0000e057;
   source_B = 32'h00000111;
   
   #10
   alu_control = 4'b1000;
   source_A = 32'h00003354;
   source_B = 32'h00000000;
   
   #10
   alu_control = 4'b0111;
   source_A = 32'h00001000;
   source_B = 32'h00000001;
   
   #10                      
   alu_control = 4'b1001;   
   source_A = 32'h00001000;    
   source_B = 32'h00000001;
   
   #10 $finish;
end
endmodule
