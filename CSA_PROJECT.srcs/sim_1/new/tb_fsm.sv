`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2025 04:31:48 PM
// Design Name: 
// Module Name: tb_fsm
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


module tb_fsm();
logic clk;
logic rst;
logic start, is_mul;
logic computing;
logic done; 
logic busy;
logic [1:0] current_state;
logic [5:0] counter_out;

FSM uut(
.clk(clk),
.rst(rst),
.start(start),
.is_mul(is_mul),
.computing(computing),
.done(done),
.busy(busy),
.current_state(current_state),
.counter_out(counter_out)
);

always #10 clk = ~clk;
initial begin
    clk = 1'b0; rst = 1'b0; start = 1'b0; is_mul = 1'b0;
    #10 rst = 1'b1; start = 1'b0; is_mul = 1'b0;
    #10 rst = 1'b1; start = 1'b1; is_mul = 1'b1;
    #10 rst = 1'b1; start = 1'b1; is_mul = 1'b0;
    #10 rst = 1'b1; start = 1'b0; is_mul = 1'b1;
    #10 rst = 1'b1; start = 1'b1; is_mul = 1'b1;
    #10 $finish;
end

endmodule
