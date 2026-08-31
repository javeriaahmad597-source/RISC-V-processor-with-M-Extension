`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 09:01:15 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory #(
    parameter width = 8, 
    parameter depth = 32
)(
input logic clk,
input logic [31:0] dataW, data2,
input logic [2:0] funct3,
input logic MemRead, MemWrite,
output logic [31:0] dataR
);

logic [width-1:0] datamem [0:depth-1];
logic [7:0] temp1; 
logic [15:0] temp2;
logic [31:0] temp3;

initial begin
    $readmemb("Data_mem.mem", datamem);
end
assign temp1 = datamem[dataW + 1];
assign temp2 = {datamem[dataW + 2], datamem[dataW + 1]};
assign temp3 = {datamem[dataW + 3], datamem[dataW + 2], datamem[dataW + 1], datamem[dataW]};

always_comb 
begin
    if(MemRead==1)begin 
    case(funct3)
        3'b000: dataR <= {{24{temp1[7]}}, temp1};   // lb
        3'b001: dataR <= {{16{temp2[15]}}, temp2};  // lh
        3'b010: dataR <= temp3;                     // lw
        3'b100: dataR <= {{24{1'b0}}, temp1};       // lbu
        3'b101: dataR <= {{16{1'b0}}, temp2};       // lhu
        default dataR <= 32'b0;
    endcase
    end
    
    else begin
    dataR <= 32'b0;
    end
end

always_ff @(posedge clk) 
begin
    if (MemWrite==1) begin
    case(funct3)
        3'b000: datamem[dataW] <= data2[7:0];   //sb
        
        3'b001:                             //sh
        begin 
        datamem[dataW] = data2[7:0];
        datamem[dataW + 1] <= data2[15:8]; 
        end
        
        3'b010:                             //sw
        begin 
        datamem[dataW] <= data2[7:0];
        datamem[dataW + 1] <= data2[15:8];
        datamem[dataW + 2] <= data2[23:16];
        datamem[dataW + 3] <= data2[31:24];
        end
    endcase
    end
end
endmodule