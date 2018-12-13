
module top_module(
    output  [10:0] led,
    input   btnC, btnD, btnU, btnR,
    input   [7:0] swt,
    input   clk
);

wire  [7:0] random_output;
wire  clock_in;
wire  clock, reset, enter_move;
wire  divided_clock;
wire  start_game, load;

assign start_game = btnC;
assign reset = btnD;
assign enter_move = btnU;
assign load = btnR;

clk_wiz wiz(clock_in, 1'b0, , clk);

clock_divider divide(divided_clock, clock_in);

wire  [24:0] counter;

always_counter count(counter, clock_in);

wire reset_out, led_out;

FSM state(led_out, reset_out, random_output, swt, load, start_game, enter_move, reset, divided_clock);

DFlip8 flip (random_output, counter[7:0], (reset_out | reset), load);

assign led[7:0] = random_output | swt;

assign led[10:8] = led_out;

endmodule