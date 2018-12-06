module RNG_register(random_num, RNG_in, start_game, reset);

    output  [7:0] random_num;
    input   [31:0] RNG_in;
    input   start_game, reset;

    wire    r = reset | start_game;
    wire    [7:0] in;

    always @posedge(start_game)
        r <= 1;
    always @negedge(start_game)
        r <= 0;
        in <= RNG_in;

    SRlatch storeRandom(in, RNG_in[7:0], r);


endmodule // RNG_register