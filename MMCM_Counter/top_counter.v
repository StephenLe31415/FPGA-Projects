`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2025 10:45:40 AM
// Design Name: 
// Module Name: top_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: The design uses LED 0 through 15 on the Basys3 board, the LED outputs light sequen?ally on at a
// time from right to left at a 1 Hz update rate.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_counter(
    input clk,
    input btnC,
    output [15:0] led
    );
    
    // Signal Declaration
    wire clk_10MHz;
    wire reset_n; 
    
    // Clock module converting 100MHz to 10MHz CLK signal
    clk_wiz_0 clk_mmcm_wiz_DUT(
    // Clock out ports
    .clk_10MHz(clk_10MHz),      // output clk_10MHz
    // Status and control signals
    .reset(btnC), // input reset
    .locked(reset_n),          // output locked
   // Clock in ports
    .clk_in1(clk)               // input clk_in1
);

    // Module to update LED value at 1Hz interval, rotates LED to lèft
    led_counter led_counter_DUT(
        .clk(clk_10MHz),        // 10MHz clock input
        .reset_n(reset_n),      // Active low reset
        .led_out(led[15:0])     //Output LED
    );

endmodule
