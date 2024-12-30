`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Huy Le
// 
// Create Date: 12/29/2024 08:42:02 PM
// Design Name: 
// Module Name: home_alarm_system
// Project Name: Home Alarm System 
// Target Devices: Basys 3 Artix-7 Board
// Tool Versions: 
// Description: A simple home alarm system with enable signal logic.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module home_alarm_system(
    input [3:0] sw,
    input m,
    output a
    );
    // Turn on the First LED if one of the switch is turned on
    // AKA a sensor detects something.
    assign a = m & (sw[0] | sw[1] | sw[2] | sw[3]);
endmodule
