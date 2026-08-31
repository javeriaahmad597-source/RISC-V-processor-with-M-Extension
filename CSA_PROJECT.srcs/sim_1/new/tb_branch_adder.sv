`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 09:24:46 PM
// Design Name: 
// Module Name: tb_mux_2
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


module tb_branch_adder ();
logic [31:0] addr, new_imm;
logic [31:0] BTA;

Branch_adder uut(.addr(addr), .new_imm(new_imm), .BTA(BTA));

initial begin
    addr=0;
    new_imm = 32'h0; 
    
    #10
    addr=4;    
    new_imm = 32'h03456fe1; 
    
    #10
    addr=20;
    new_imm = 32'h03456fe1;
    
    #10
    addr=22;
    new_imm = 32'h03456fe1;
    
    #10
    addr=25;
    new_imm = 32'h03456fe1;
    
    #10
    addr=28;    
    new_imm = 32'h03456fe1;
    
    #10 $finish;
end
endmodule