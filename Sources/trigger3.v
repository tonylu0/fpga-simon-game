
module trigger3(
  output  [2:0] trigger,
  input   clk
);

wire  [1:0] count1, count2, count3;

DFlip delay1(d1, 1'b1, clk);
DFlip delay2(d2, d1, clk);

counter2 c1(count1, clk);
counter2 c2(count2, d1);
counter2 c3(count3, d2);

assign  trigger[0] = count1[1];
assign  trigger[1] = count2[1];
assign  trigger[2] = count3[1];

endmodule