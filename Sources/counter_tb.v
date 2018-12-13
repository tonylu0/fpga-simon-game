module counter_tb;
  reg       clock = 0;
  always #1 clock = !clock;

  reg reset = 0;
  wire [1:0] cnt;

  counter2 c(cnt, reset, clock);

  initial begin
  #3
  reset = 1;
  #1
  reset = 0;
  
  end
  
  initial begin 
    $display("\t\ttime \tclock \tdata \tq"); 
    $monitor("%d,\t%b, \t%b", $time, clock, cnt);
    #30
    $finish;
  end
endmodule