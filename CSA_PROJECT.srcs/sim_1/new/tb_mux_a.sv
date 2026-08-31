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


module tb_mux_a ();
logic [31:0] dataW, prod;
logic done;
logic [31:0] CALC;

MUX_A uut(.dataW(dataW), .prod(prod), .CALC(CALC), .done(done));

initial begin
   dataW = 32'h00000000;
    prod = 32'b0; 
    done = 0;
    
    #10 dataW = 32'hDEADBEEF; prod = 4; done = 1;
    #10 dataW = 32'h12345678; prod = 8; done = 0;
    #10 dataW = 32'hCAFEBABE; prod = 20; done = 1;
    #10 dataW = 32'hF0F0F0F0; prod = 22; done = 0;
    #10 dataW = 32'h0F0F0F0F; prod = 25; done = 1;
    #10 dataW = 32'hFFFFFFFF; prod = 28; done = 0;
    
    #10 $finish;
end
endmodule

