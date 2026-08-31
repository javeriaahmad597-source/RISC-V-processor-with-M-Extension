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


module tb_mux_result ();
logic [31:0] CALC, dataR;
logic MemtoReg;
logic [31:0] out_MUX2;

RESULT_MUX uut(.CALC(CALC), .dataR(dataR), .out_MUX2(out_MUX2), .MemtoReg(MemtoReg));

initial begin
    CALC = 32'h00000000;
    dataR = 32'h00000000;
    MemtoReg = 0;
    
    #10 CALC = 32'hDEADBEEF; dataR = 32'hCAFEBABE; MemtoReg = 1;
    #10 CALC = 32'h00000000; dataR = 32'hFFFFFFFF; MemtoReg = 0;
    #10 CALC = 32'h7FFFFFFF; dataR = 32'h80000000; MemtoReg = 1;
    #10 CALC = 32'hAAAAAAAA; dataR = 32'h55555555; MemtoReg = 0;
    #10 CALC = 32'h11111111; dataR = 32'h22222222; MemtoReg = 1;
    #10 CALC = 32'hFFFF0000; dataR = 32'h0000FFFF; MemtoReg = 0;
    #10 CALC = 32'hF0F0F0F0; dataR = 32'h0F0F0F0F; MemtoReg = 1;
    #10 CALC = 32'h01234567; dataR = 32'h89ABCDEF; MemtoReg = 0;
    
    #10 $finish;
end
endmodule

