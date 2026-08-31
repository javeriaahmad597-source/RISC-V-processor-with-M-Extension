`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2025 11:32:35 AM
// Design Name: 
// Module Name: FSM
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


module FSM(
    input logic clk,
    input logic rst,
    input logic start, is_mul,
    output logic computing,
    output logic done, 
    output logic busy,
    output logic [1:0] current_state,
    output logic [5:0] counter_out
);

// State parameters
parameter IDLE = 2'b00;
parameter COMPUTE = 2'b01;
parameter COMPLETE = 2'b10;
parameter NEXT = 2'b11;

logic [1:0] state, next_state;
logic [5:0] count;
logic internal_busy, internal_done;  

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= IDLE;
        internal_busy <= 1'b0;
        internal_done <= 1'b0;
        count <= 6'b0;
    end
    else begin
        state <= next_state;
        
        if (state == COMPUTE || state == COMPLETE) begin
            count <= count + 1;
        end else begin
            count <= 6'b0;
        end
        
        case(next_state)
            IDLE: begin
                if(start && is_mul)
                internal_busy <= 1'b1;
            end
            COMPUTE:  internal_busy <= 1'b1;
            COMPLETE: internal_busy <= 1'b1;  
            NEXT: internal_busy <= 1'b0;
        endcase
    end
end

// Next state logic
always_comb begin
    next_state = state;
    
    case(state)
        IDLE: begin
            if (start && is_mul) begin
                next_state = COMPUTE;
            end
        end
        
        COMPUTE: begin
            if (count == 6'd31) begin 
                next_state = COMPLETE;
            end
        end
        
        COMPLETE: begin
                internal_done = 1'b1;
                next_state = NEXT;
        end
        
        NEXT: begin
                internal_done = 1'b0;
                next_state = IDLE;
        end
   
        default: begin
            next_state = IDLE;
        end
    endcase
end

assign computing = (state == COMPUTE);
assign done = internal_done;
assign busy = internal_busy;  
assign current_state = state;
assign counter_out = count;

endmodule