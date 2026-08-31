`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2025 09:01:09 AM
// Design Name: 
// Module Name: Multiplier_co_processor
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


module Multiplier_co_processor(
    input logic clk,
    input logic rst, 
    input logic [31:0] data1, data2, 
    input logic start, is_mul,
    input logic [1:0] mul_type,
    output logic [31:0] prod,
    output logic done, busy,
    output logic [5:0] counter
);
// FSM outputs
logic computing;          
logic fsm_done;       
logic [63:0] product_reg;
logic [1:0] current_state; 
logic [5:0] internal_counter, fsm_counter_out;
logic [63:0] data;
logic [31:0] result, multiplier;

always_comb begin
    multiplier = data1;
end

// Instantiate FSM
FSM fsm_inst(
    .clk(clk),
    .rst(rst),
    .start(start),
    .is_mul(is_mul),
    .busy(busy),
    .computing(computing),     
    .done(fsm_done),           
    .current_state(current_state),
    .counter_out(fsm_counter_out) 
);
mul_register mul_reg(
    .data(data),
    .data2(data2),
    .product_reg(product_reg),
    .counter_out(internal_counter)
);
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        product_reg <= 64'b0;
        internal_counter <= 6'b0;
    end
    else begin
        case(current_state)
            2'b00: begin // IDLE
                    if (start && is_mul) begin
                        product_reg <= data;
                        internal_counter <= 6'b0;
                    end
            end
            2'b01: begin // COMPUTE
                    if (product_reg[0] == 1'b1) begin
                        if(mul_type == 2'b00) 
                        product_reg <= {1'b0, {product_reg[63:32] + multiplier}, product_reg[31:1]}; 
                        else 
                        product_reg <= {product_reg[63], {product_reg[63:32] + multiplier}, product_reg[31:1]}; 
                    end
                    else begin
                        if(mul_type == 2'b00) 
                        product_reg <= {1'b0, product_reg[63:1]};
                        else
                        product_reg <= {product_reg[63], product_reg[63:1]};
                    end
                if (internal_counter < 6'd32) begin
                    internal_counter <= internal_counter + 1;
                end
            end
            2'b10: begin // COMPLETE
                internal_counter <= 6'b0;
            end
        endcase
    end
end
always_comb begin
    case(mul_type)
        2'b00: result = product_reg[31:0];  // MUL - lower 32 bits
        2'b01: result = product_reg[63:32];  // MUL - lower 32 bits
        2'b10: result = product_reg[63:32];  // MUL - lower 32 bits
        2'b11: result = product_reg[63:32];  // MUL - lower 32 bits
//        {2'b01, 2'b10, 2'b11}: result = product_reg[63:32]; // MULH - upper result bits
        default: result = product_reg[31:0];
    endcase
end
assign prod = result;
assign done = fsm_done;           
assign counter = internal_counter; 
endmodule