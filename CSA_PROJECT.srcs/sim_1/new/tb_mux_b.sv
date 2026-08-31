`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 09:05:46 PM
// Design Name: 
// Module Name: tb_mux_1
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


module tb_mux_b ();
logic [31:0] data2, new_imm;
logic ALUSrc;
logic [31:0] source_B;

MUX_B uut(.data2(data2), .new_imm(new_imm), .source_B(source_B), .ALUSrc(ALUSrc));

initial begin
    data2 = 32'h0;
    new_imm = 32'h0;
    ALUSrc =0;
    
    #10
    data2 = 32'h0001346C;
    new_imm = 32'h0000006C;
    ALUSrc =0;
    
    #10
    data2 = 32'h0000012C;
    new_imm = 32'h00033450;
    ALUSrc =1;
    #10 $finish;
end
endmodule
