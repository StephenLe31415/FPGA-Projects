`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2025 11:44:07 AM
// Design Name: 
// Module Name: led_counter
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


module led_counter(
    input clk,
    input reset_n,
    output reg [15:0] led_out
    );
    
    // Parameter statement
    localparam C_MAX_COUNT = 10_000_000 - 1;
    
    // wire and reg declaration
    wire update_en;             // When HIGH, allows LED to value to update
    reg [23:0] count_value;     // Holds current count values
    
    // Enable LED values to update
    assign update_en = (count_value == C_MAX_COUNT);
    
    // Counter with a 1Hz count cycle
    // Operation explained: at every posedge clock, the count values increment by 1
    // After 10,000,000 ticks, the counter reset.
    // Since the Frequency of the CLK is 10MHz --> reset every 1 second --> Counter has rate of 1 Hz (increment once/second) 
    always @ (posedge clk) begin
        if (reset_n == 1'b0) count_value <= 24'd0;                      // Reset counter
        else if (count_value == C_MAX_COUNT) count_value <= 24'd0;      // Reset counter after 10,000,000 posedge detected
        else count_value <= count_value + 24'd1;                        // Update (increment) counter for every posedge
    end
    
    // LED output  logic, roate LED value each time.
    always @ (posedge clk) begin
        if (reset_n == 1'b0) led_out[15:0] <= 16'd1;
        else if (update_en == 1'b1) led_out[15:0] <= {led_out[14:0], led_out[15]};
        else led_out[15:0] <= led_out[15:0];
    end
    
    
endmodule
