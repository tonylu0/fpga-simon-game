module DFlip_tb;
  reg       clock = 0;
  always #1 clock = !clock;

  wire q;
  reg d = 0;
  reg reset = 0;
  

  DFlip a(q, d, reset, clock);

  initial begin
  reset = 1;
  #1
  reset = 0;
  d = 1;
  #3
  d = 0;
  #3
  d = 1;
  #1
  d = 0;
  
  end
  
  initial begin 
    $display("\t\ttime \tclock \tdata \tq"); 
    $monitor("%d,\t%b, \t%b, \t%b",$time, clock, d, q);
    #10
    $finish;
  end
endmodule