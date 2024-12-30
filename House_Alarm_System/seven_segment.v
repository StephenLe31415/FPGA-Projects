`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Huy Le
// 
// Create Date: 12/29/2024 08:47:27 PM
// Design Name: 
// Module Name: seven_segment
// Project Name: Home Alarm System
// Target Devices: 
// Tool Versions: 
// Description: this modules contains the design and logic for hte 7-segment display.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seven_segment(
    input [4:0] in,     //inputs
    output reg [6:0] seg,    // 7 segments
    output [3:0] an     // enable signals for the 4 led 7-segment
    );
    
    wire integer count;
    assign count = in[0] + in[1] + in[2] + in[3];
    
    always @ (count)
    begin
    if (in[4]) begin
        case(count)
            1 : seg = 7'b1111001;          // 1
            2 : seg = 7'b0100100;          // 2
            3 : seg = 7'b0110000;          // 3
            4 : seg = 7'b0011001;          // 4
            default: seg = 7'b0001000;     // A  
         endcase
    end
    else begin
        seg = 7'b1000000;       // 0;
    end
    end
endmodule

//7-segment display stuff:
//        4'b0000 : seg = 7'b1000000;     // 0
//        4'b0001 : seg = 7'b1111001;     // 1
//        4'b001z : seg = 7'b0100100;     // 2
//        4'b0011 : seg = 7'b0110000;     // 3
//        4'b0100 : seg = 7'b0011001;     // 4
//        4'b0101 : seg = 7'b0010010;     // 5
//        4'b0110 : seg = 7'b0000010;     // 6
//        4'b0111 : seg = 7'b1111000;     // 7
//        4'b1000 : seg = 7'b0000000;     // 8
//        4'b1001 : seg = 7'b0010000;     // 9
//        4'b1010 : seg = 7'b0001000;     // A
//        4'b1011 : seg = 7'b0000011;     // b
//        4'b1100 : seg = 7'b1000110;     // C
//        4'b1101 : seg = 7'b0100001;     // D
//        4'b1110 : seg = 7'b0000110;     // E
//        4'b1111 : seg = 7'b0001110;     // F
