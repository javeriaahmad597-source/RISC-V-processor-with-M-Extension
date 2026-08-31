`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 08:53:06 PM
// Design Name: 
// Module Name: PC
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


module Program_Counter #(parameter width = 32)(
    input logic clk,        
    input logic rst,
    input logic done, is_mul,        
    input logic [width-1:0] BTA,
    input logic Branch, zero_flag,
    output logic [width-1:0] pc,
    output logic [width-1:0] addr
);
    
    logic [width-1:0] pc_reg;
    
    always_ff @(posedge clk or posedge rst) begin
        pc_reg <= 32'b0;
        if (rst) begin
            pc_reg <= 32'b0;
        end
        else if (is_mul == 1'b1 && done != 1'b1) begin
            pc_reg <= pc_reg;  
        end
        else if (Branch && zero_flag) begin
            pc_reg <= BTA;
        end
        else begin
            pc_reg <= pc_reg + 4;
        end
    end
    
    assign pc = pc_reg;
    assign addr = pc_reg;  
    
endmodule