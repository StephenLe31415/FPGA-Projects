`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Huy Le
// 
// Create Date: 12/29/2024 09:07:52 PM
// Design Name: 
// Module Name: top
// Project Name: Home Alarm System
// Target Devices: 
// Tool Versions: 

// Description: This digital design involves a mock-up alarm system where it is enable by a switch on the Basys 4.
// If the system is enabled, it will count the number sensors triggered (switches 0-3) and display it on the right-most 7-segment display.
// If the system is enabled and no sensor is triggered, it displays A for Alarm.
// If the system is not enabled, it will display 0 for Off. 

// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input [4:0] sw,
    // sw[3-0]: doors, windows, sensors, etc.
    // sw[4]: enable
    input m,
    output alarm,
    output [3:0] an,
    output [6:0] seg
    );
    
    assign an = 4'b1110;        // turn on the right-most 7-seg display 
    
    seven_segment S1 (sw[4:0], seg, an);    // display 0 or A on the 7-seg
    home_alarm_system H1 (sw[3:0], sw[4], alarm);   // Turn on/off LED, indicates sensor detections
    
endmodule
