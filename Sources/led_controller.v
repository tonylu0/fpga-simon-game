module led_controller(input [7:0] in, output [7:0] led);

    assign led[7:0] = in[7:0];

endmodule // led_controller