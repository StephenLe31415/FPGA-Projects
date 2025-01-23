`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Huy Le
// 
// Create Date: 01/18/2025 03:59:50 PM
// Design Name: ECE 3829 - Lab 1 - Combinational Circuit
// Module Name: lab1_top
// Project Name: ECE 3829 - Lab 1 - Combinational Circuit
// Target Devices: Artix-7 Basys 3
// Tool Versions: 
// Description: Top module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab1_top(
    input [15:0] sw,            // Input switches
    input [3:0] pushButton,     // Input push buttons to choose the display
    output [6:0] seg,           // 7-segment display
    output [3:0] an,            // Anode to turn on the 7-segment display
    output [15:0] led           // LEDs correspond to each switch
    );
    
    wire [3:0] A, B, C, D;  // Wire to connect 2 modules
    
    // Instantiate input select module
    input_select I1 (.mode_sel(sw[15:14]), .slider(sw[13:0]), .A(A), .B(B), .C(C), .D(D));
    
    // Instantiate seven_seg module
    seven_seg S1 (.A(A), .B(B), .C(C), .D(D), .disp_sel(pushButton), .display(seg), .anode(an));
    
    assign led = sw;    // Turn on the LED based off the switches.
    
endmodule
