
module FSM(led_out, reset_out, random_num, swt, load, start_game, enter_move, reset, clock);

    output  [2:0] led_out;
    output  reset_out;
    input   [7:0] random_num, swt, load;
    input   start_game, enter_move, reset, clock;

    wire    [7:0] store_num;
    DFlip8 store(store_num, random_num, reset, load);
    
    wire garbage;
    wire life3, life3Pull, life3CheckSuccess, life3CheckFail;
    wire life2, life2Pull, life2CheckSuccess, life2CheckFail;
    wire life1, life1Pull, life1CheckSuccess, life1CheckFail;
    
    wire garbage_next = reset | life1CheckFail | (garbage & ~start_game);
    DFlip lifeGarbage(garbage, garbage_next, reset, clock);
    
    wire life3_next = ((garbage & start_game) | life3CheckSuccess) & ~reset;
    DFlip lifeThree(life3, life3_next, reset, clock);
    
    wire life3Pull_next = ((life3) | (life3Pull & ~enter_move)) & ~reset;
    DFlip lifeThreePull(life3Pull, life3Pull_next, reset, clock);
    
    wire life3CheckSuccess_next = ((swt == store_num) & enter_move & life3Pull) & ~reset;
    DFlip lifeThreeCheckSuccess(life3CheckSuccess, life3CheckSuccess_next, reset, clock);
    
    wire life3CheckFail_next = (((swt != store_num) & enter_move & life3Pull) | (life3CheckFail & ~start_game))& ~reset;
    DFlip lifeThreeCheckFail(life3CheckFail, life3CheckFail_next, reset, clock);
    
    wire life2_next = (life3CheckFail & start_game) & ~reset;
    DFlip lifeTwo(life2, life2_next, reset, clock);
    
    wire life2Pull_next = ((life2) | (life2Pull & ~enter_move)) & ~reset;
    DFlip lifeTwoPull(life2Pull, life2Pull_next, reset, clock);
    
    wire life2CheckSuccess_next = ((swt == store_num) & enter_move & life2Pull) & ~reset;
    DFlip lifeTwoCheckSuccess(life2CheckSuccess, life2CheckSuccess_next, reset, clock);
    
    wire life2CheckFail_next = (((swt != store_num) & enter_move & life2Pull) | (life2CheckFail & ~start_game))& ~reset;
    DFlip lifeTwoCheckFail(life2CheckFail, life2CheckFail_next, reset, clock);
    
    wire life1_next = (life2CheckFail & start_game) & ~reset;
    DFlip lifeOne(life1, life1_next, reset, clock);
    
    wire life1Pull_next = ((life1) | (life1Pull & ~enter_move)) & ~reset;
    DFlip lifeOnePull(life1Pull, life1Pull_next, reset, clock);
    
    wire life1CheckSuccess_next = ((swt == store_num) & enter_move & life1Pull) & ~reset;
    DFlip lifeOneCheckSuccess(life1CheckSuccess, life1CheckSuccess_next, reset, clock);
    
    wire life1CheckFail_next = ((swt != store_num) & enter_move & life1Pull) & ~reset;
    DFlip lifeOneCheckFail(life1CheckFail, life1CheckFail_next, reset, clock);
    
    assign reset_out = (life3Pull | life2Pull | life1Pull);
    
    
    assign led_out[2] = clock & (life3Pull);
    assign led_out[1] = clock & (life2Pull | life3CheckFail | led_out[2]);
    assign led_out[0] = clock & (life1Pull | life2CheckFail | led_out[1]);
    

endmodule // Game_FSM