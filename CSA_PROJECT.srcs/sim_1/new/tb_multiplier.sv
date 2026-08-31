`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2025 09:43:48 AM
// Design Name: 
// Module Name: tb_multiplier
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


module tb_multiplier();
logic clk;
logic rst; 
logic [31:0] data1, data2; 
logic start, is_mul;
logic [1:0] mul_type;
logic [31:0] prod;
logic done, busy;
logic [5:0] counter;
    
Multiplier_co_processor uut(
    .clk(clk),
    .rst(rst),
    .data1(data1),
    .data2(data2),
    .start(start),
    .is_mul(is_mul),
    .mul_type(mul_type),
    .prod(prod),
    .done(done),
    .busy(busy),
    .counter(counter)
);
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1;
        data1 = 32'b0;
        data2 = 32'b0;
        start = 1'b0;
        is_mul = 1'b0;
        mul_type = 2'b00;
        
        #20 rst = 0;
        #10;
        
//        // Test 1: MUL -   4 × 4 = 16
//        data1 = 32'd4;
//        data2 = 32'd4;
//        start = 1'b1;
//        is_mul = 1'b1;
//        mul_type = 2'b00;
//        #10 start = 0;
//        wait(done==1);
//        #10;
//        rst = 1;
//        #20 rst = 0;
//        #10;
        
//        // Test 2: MUL -   4 × -4 = -16
//        data1 = 32'd4;
//        data2 = 32'hFFFFFFFC; // -4
//        start = 1'b1;
//        is_mul = 1'b1;
//        mul_type = 2'b10;
//        #10 start = 0;
//        wait(done==1);
//        #10;
//        rst = 1;
//        #20 rst = 0;
//        #10;
        
//        // Test 3: MUL -   -4 × 4 = -16
//        data1 = 32'hFFFFFFFC; // -4
//        data2 = 32'd4;
//        start = 1'b1;
//        is_mul = 1'b1;
//        mul_type = 2'b11;
//        #10 start = 0;
//        wait(done==1);
//        rst = 1;
//        #20 rst = 0;
//        #10;
        
        // Test 4: MUL -   -4 × -4 = 16  
        data1 = 32'hFFFFFFFC; // -4
        data2 = 32'hFFFFFFFC; // -4
        start = 1'b1;
        is_mul = 1'b1;
        mul_type = 2'b01;
        #10 start = 0;
        wait(done==1);
        rst = 1;
        #20 rst = 0;
        #10;
        #10 $finish;
    end
endmodule