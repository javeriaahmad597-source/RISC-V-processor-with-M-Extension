`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 08:54:10 PM
// Design Name: 
// Module Name: tb_pc
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


module tb_pc ();
parameter width = 32;
logic clk;        
logic rst;
logic done, is_mul;       
logic [width-1:0] BTA;
logic Branch, zero_flag;
logic [width-1:0] pc;
logic [width-1:0] addr;

Program_Counter uut( 
.clk(clk), 
.rst(rst), 
.done(done), 
.is_mul(is_mul),
.BTA(BTA),
.Branch(Branch),
.zero_flag(zero_flag),
.addr(addr), 
.pc(pc)
);

always #10 clk <= ~clk;

initial begin
    clk = 1'b0; rst = 1'b0; done = 1'b0; is_mul = 1'b0; Branch = 1'b0; zero_flag = 1'b0; BTA = 32'h0;
    #10 rst = 1'b1; done = 1'b0; is_mul = 1'b0; Branch = 1'b0; zero_flag = 1'b0; BTA = 32'h0;
    #10 rst = 1'b1; done = 1'b1; is_mul = 1'b1; Branch = 1'b0; zero_flag = 1'b0; BTA = 32'h0;
    #10 rst = 1'b1; done = 1'b1; is_mul = 1'b0; Branch = 1'b0; zero_flag = 1'b0; BTA = 32'h0;
    #10 rst = 1'b1; done = 1'b0; is_mul = 1'b1; Branch = 1'b0; zero_flag = 1'b0; BTA = 32'h0;
    #10 rst = 1'b1; done = 1'b1; is_mul = 1'b1; Branch = 1'b1; zero_flag = 1'b1; BTA = 32'h1000;
    #10 $finish;
end
endmodule