`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Huy Le
// 
// Create Date: 01/18/2025 10:01:45 AM
// Design Name: Seven Segment Display Module
// Module Name: seven_seg
// Project Name: ECE3829 - Lab 1- Combination Circuit
// Target Devices: Artix-7 Basys 3
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


module seven_seg(
    input [3:0] A, B,C, D,  // Display input
    input [3:0] disp_sel,   // Push_button select bits
    output reg [6:0] display,       // 7-segment display bits
    output reg [3:0] anode      // 7-segment anode bits
    );

    reg [3:0] bin;  // Output from the mux to choose either A, B, C, or D.
    
    // Muxes to choose the display and the 4-bit output. (anode and bin)
    always @ (*) begin
        case(disp_sel)
            4'b1000 : begin
                anode = 4'b0111;
                bin = A;  
            end
            4'b0100 : begin
                anode = 4'b1011;
                bin = B;
            end
            4'b0010 : begin
                anode = 4'b1101;
                bin = C;
            end
            4'b0001 : begin
                anode = 4'b1110;
                bin = D;
            end
            default : begin
                anode = 4'b1111;
                bin = 4'h0;
            end
        endcase
    end
    
    // Bin to BCD conversion (bascially Bin to Hex)
    always @ (bin) begin 
        case(bin)
            4'b0000 : display = 7'b1000000;     // 0
            4'b0001 : display = 7'b1111001;     // 1
            4'b0010 : display = 7'b0100100;     // 2
            4'b0011 : display = 7'b0110000;     // 3
            4'b0100 : display = 7'b0011001;     // 4
            4'b0101 : display = 7'b0010010;     // 5
            4'b0110 : display = 7'b0000010;     // 6
            4'b0111 : display = 7'b1111000;     // 7
            4'b1000 : display = 7'b0000000;     // 8
            4'b1001 : display = 7'b0010000;     // 9
            4'b1010 : display = 7'b0001000;     // A
            4'b1011 : display = 7'b0000011;     // b
            4'b1100 : display = 7'b1000110;     // C
            4'b1101 : display = 7'b0100001;     // D
            4'b1110 : display = 7'b0000110;     // E
            4'b1111 : display = 7'b0001110;     // F
            default : display = 7'b1000000; // Default to "0"
         endcase
     end
    
endmodule
