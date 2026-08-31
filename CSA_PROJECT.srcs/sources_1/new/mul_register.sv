`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2025 02:01:11 PM
// Design Name: 
// Module Name: mul_register
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


module mul_register(
    input logic [5:0] counter_out,
    input logic [31:0] data2,
    input logic [63:0] product_reg,
    output logic [63:0] data
);

always_comb begin
    if(counter_out == 6'b0) 
        data = {{32'b0}, (data2)};
    else 
        data = product_reg;
end
endmodule
