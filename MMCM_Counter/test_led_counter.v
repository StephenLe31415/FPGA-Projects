`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2025 03:08:29 PM
// Design Name: 
// Module Name: test_led_counter
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


module test_led_counter(
    );
    
    // Input declarations
    reg btnC;       // Button to reset logic
    reg clk_100m;   // 100MHz input CLK signal
    
    wire [15:0] led;    // Output wire
    
    // Create a CLK signal
    // 100MHz CLK signal -> 10 ns period ->> 5 ns HIGH and 5 ns LOW
    localparam C_CLK_HALF_PERIOD = 5;
    
    // Toggle state after 5ns
    always begin
        # C_CLK_HALF_PERIOD clk_100m <= ~clk_100m;
    end
    
    // Create reset signal
    initial begin
        clk_100m = 0;           // Init. to 0
        btnC = 1'b1;            // Init. to 1
        #2000 btnC = 1'b0;      // Wait 2000ns and clear reset signal
        #200000;                // Run for 200 us then stop the simulation
        $stop;
    end
    
    // Instantiate top_counter as DUT
    top_counter DUT (
        .clk(clk_100m),
        .btnC(btnC),
        .led(led)
        );
    
    // Override parameter to speed up simulation
    defparam DUT.led_counter_DUT.C_MAX_COUNT = 100;
    
endmodule
