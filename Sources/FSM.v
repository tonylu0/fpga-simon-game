
module FSM(led_out, random_num, swt, enter_move, reset, clock);

    output  [7:0] led_out;
    input   [7:0] random_num, swt;
    input   enter_move, reset, clock;

    wire    s0, s1, s2, s3, s4, s5;

    wire    s0_next, s1_next, s2_next, s4_next, s5_next;


    // Reset when next one is on
    SRlatch fs0(s0, s0_next, s1);
    SRlatch fs1(s1, s1_next, s2);
    SRlatch fs2(s2, s2_next, s3);
    SRlatch fs3(s3, s3_next, s4);
    SRlatch fs4(s4, s4_next, s5);
    SRlatch fs5(s5, s5_next, reset);

endmodule // Game_FSM