`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2025 02:17:44 PM
// Design Name: 
// Module Name: tb_mul_register
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


module tb_mul_register();
logic [5:0] counter;
logic [31:0] data2;
logic [63:0] product_reg, data;

mul_register uut(.counter_out(counter), .data2(data2), .data(data), .product_reg(product_reg));

initial begin
    counter = 0; data2 = 4; product_reg = 1;
    #10 counter = 0; data2 = 4; product_reg = 1;
    #10 counter = 1; data2 = 4; product_reg = 2;
    #10 counter = 2; data2 = 4; product_reg = 3;
    #10 $finish;
end

endmodule