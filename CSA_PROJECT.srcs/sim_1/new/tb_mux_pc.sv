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


module tb_mux_pc ();
logic [31:0] BTA, PC_4;
logic Branch, zero_flag;
logic [31:0] pc;

PC_MUX uut(.BTA(BTA), .PC_4(PC_4), .pc(pc), .Branch(Branch));

initial begin
    BTA = 32'h00000000;
    PC_4 =  32'h00000000;
    Branch = 0;
    zero_flag = 0;
    
    #10 BTA = 32'hDEADBEEF; PC_4 = 32'h00002004; Branch = 1; zero_flag = 1;
    #10 BTA = 32'h00000000; PC_4 = 32'h00003008; Branch = 0; zero_flag = 0;
    #10 BTA = 32'h7FFFFFFF; PC_4 = 32'h0000400C; Branch = 1; zero_flag = 1;
    #10 BTA = 32'hAAAAAAAA; PC_4 = 32'h00005010; Branch = 0; zero_flag = 0;
    #10 BTA = 32'h11111111; PC_4 = 32'h00006014; Branch = 1; zero_flag = 1;
    #10 BTA = 32'hFFFF0000; PC_4 = 32'h00007018; Branch = 0; zero_flag = 0;
    #10 BTA = 32'hF0F0F0F0; PC_4 = 32'h0000801C; Branch = 1; zero_flag = 1;
    #10 BTA = 32'h01234567; PC_4 = 32'h00009020; Branch = 0; zero_flag = 0;
    
    #10 $finish;
end
endmodule