`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 08:56:51 PM
// Design Name: 
// Module Name: Register_File
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


module Register_File #(parameter width=32)(
input logic clk, RegWrite, MemtoReg,
input logic [width-1:0] out_MUX2, instruction,
output logic [width-1:0] data1, data2
);
logic [4:0] rs1, rs2, rd;
logic [31:0] register [0:31];
logic [6:0] opcode; 

assign rs1 = instruction[19:15];
assign rs2 = instruction[24:20];
assign rd = instruction[11:7];
assign opcode = instruction[6:0] ;

initial begin
    for(int i=0; i<32; ++i) begin
            register[i] ='0;
    end
    $readmemb("Reg_mem.mem", register);
end

always_comb begin
    data1 = (rs1 == 5'b0) ? 32'b0 : register[rs1];
    data2 = (rs2 == 5'b0) ? 32'b0 : register[rs2];
end

always_ff @(posedge clk) 
begin
    if ((RegWrite || MemtoReg) && (rd != 0)) begin 
        register[rd] <= out_MUX2;
    end 
end
endmodule