`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 10:53:39 PM
// Design Name: 
// Module Name: MUX_3
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


module PC_MUX #(parameter width=32)(
input clk,
input logic [width-1:0] BTA, addr,
input logic Branch, zero_flag, busy, computing,
output logic [width-1:0] pc
);
always_ff @(posedge clk)
begin
    if(Branch==1 && zero_flag==1)begin
        pc <= BTA;
    end
    else if(busy == 1'b1 || computing == 1'b1) begin
        pc <= addr;
    end
    else begin
        pc <= addr + 4;
    end
end
endmodule
