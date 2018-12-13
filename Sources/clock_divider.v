`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2018 03:19:56 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    output clk_out,
    input clk_in
    );
    
    reg     [31:0] counter = 1;
    reg     temp_clk = 0;
    always @ (posedge(clk_in))
    begin
        if (counter == 2000000)
        begin
            counter <= 1;
            temp_clk <= ~temp_clk;
        end
        else 
            counter <= counter + 1;
    end
    assign clk_out = temp_clk;

endmodule
