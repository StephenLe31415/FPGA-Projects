`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Huy Le
// 
// Create Date: 01/17/2025 05:31:26 PM
// Design Name: Input Select Module
// Module Name: input_select
// Project Name: ECE3829 - Lab 1 - Combinational Circuit
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


module input_select(
    input [1:0] mode_sel,       // Bits to select the mode (0 to 3)
    input [13:0] slider,        // Input to display on the 7-segment displays
    output [3:0] A, B, C, D     // 4-bit output to display on the 7-segment displays
    );
    
    reg [7:0] disCD;    // Concatenated array of C and D
    reg [3:0] disA, disB, disC, disD;   // Buffer
    wire [3:0] hexA, hexB, hexC, hexD; // Connecting (Mod. bin2hex) with (Mod. input_select)
    reg op_flag = 1'b0; // Set flag if sum/prod is needed
    
    // NOTE: all registers will be set for all cases in order to avoid latches and unwated behaviors.
    // Mux to decide what to display for display A, B, C, and D.
    always @ (*) begin
        case(mode_sel)
            2'b00 : begin   // WPI ID
                disA = 4'h6; 
                disB = 4'h4; 
                disC = 4'h9; 
                disD = 4'h6;
                disCD = 8'h0;
                op_flag = 1'b0;   // Reset all to 0
            end 
            2'b01 : begin   // Binary to Hex Conversion
                disA = {2'h0, slider[13:12]};
                disB = slider[11:8];
                disC = slider[7:4];
                disD = slider[3:0];
                disCD = 8'h0;
                op_flag = 1'b0;
            end
            2'b10: begin    // Times 2 with Shift Left Operator
                disA = {2'b00, slider[13:12]};   
                disB = slider[11:8];
                disCD = slider[13:8] << 1;
                disC = 4'h0;    // Getting rid of latches
                disD = 4'h0;    // Getting rid of latches
                op_flag = 1'b1; // Set op. flag for PRODUCT
            end
            2'b11: begin    // Sum
                disA = slider[7:4]; // In hex
                disB = slider[3:0]; // In hex
                disC = 4'h0;    // Getting rid of latches
                disD = 4'h0;    // Getting rid of  latches
                disCD = slider[7:4] + slider[3:0];
                op_flag = 1'b1; // Set op. flag for SUM
            end
            default : begin
                disA = 4'h0;
                disB = 4'h0;
                disC = 4'h0;
                disD = 4'h0;
                disCD = 8'h0;
                op_flag = 1'b0; // Reset all flags
            end
        endcase
    end
    
    // Output assignment
    assign A = disA;
    assign B = disB;
    assign C = (op_flag)? disCD[7:4] : disC;
    assign D = (op_flag)? disCD[3:0] : disD;

endmodule
