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


module tb_adder ();
logic [31:0] addr;
logic [31:0] PC_4;

Adder uut(.addr(addr), .PC_4(PC_4));

initial begin
    addr=0;
    #10 addr=4;    
    #10 addr=8;
    #10 addr=20;
    #10 addr=22;
    #10 addr=25;
    #10 addr=28;
    #10 $finish;
end
endmodule