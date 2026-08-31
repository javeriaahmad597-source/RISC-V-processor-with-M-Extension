`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 02:31:01 PM
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter width=32)(
    input [3:0] alu_control,     
    input logic [width-1:0] data1, source_B, 
    output logic [width-1:0] dataW, 
    output logic zero_flag
);
logic flag;
always_comb begin
    // Default values
    dataW = 32'b0;
    zero_flag = 1'b0;
    
    case (alu_control)
        4'b0010: dataW = data1 + source_B;                    // ADD, ADDI, LW, SW
        4'b0110: dataW = data1 - source_B;                    // SUB
        4'b0000: dataW = data1 & source_B;                    // AND, ANDI
        4'b0001: dataW = data1 | source_B;                    // OR, ORI
        4'b0011: dataW = data1 ^ source_B;                    // XOR, XORI
        4'b0100: dataW = data1 << source_B[4:0];              // SLL
        4'b0101: dataW = data1 >> source_B[4:0];              // SRL
        4'b0111: dataW = $signed(data1) >>> source_B[4:0];    // SRA
        4'b1000: dataW = ($signed(data1) < $signed(source_B)) ? 32'b1 : 32'b0; // SLT, SLTI
        // BRANCH OPERATIONS
        4'b1100: begin                        // BEQ
                 dataW = (data1 == source_B) ? 32'b1 : 32'b0;
                 zero_flag = (dataW == 0);
                 end
        4'b1101: begin                        // BNE
                 dataW = (data1 != source_B) ? 32'b1 : 32'b0;
                 zero_flag = (dataW == 0);
                 end
        4'b1110: begin                        // BLTU (unsigned <)
                 dataW = (data1 < source_B) ? 32'b1 : 32'b0;
                 zero_flag = (dataW == 0);
                 end
        4'b1111: begin                        // BGEU (unsigned >=)
                 dataW = (data1 >= source_B) ? 32'b1 : 32'b0;
                 zero_flag = (dataW == 0);
                 end
        4'b1001: begin                        // BLT (signed <)
                 dataW = ($signed(data1) < $signed(source_B)) ? 32'b1 : 32'b0;
                 zero_flag = (dataW == 0);
                 end
        4'b1010: begin                        // BGE (signed >=)
                 dataW = ($signed(data1) >= $signed(source_B)) ? 32'b1 : 32'b0;
                 zero_flag = (dataW == 0);
                 end
       
    endcase         

end
endmodule