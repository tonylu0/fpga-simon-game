
module trigger3_tb();

    reg       clock = 0;
    always #1 clock = !clock;

    wire [2:0] trigger;

    trigger3 t(trigger, clock);

    initial begin 
      $display("\t\ttime,\tclock,\ttrigger"); 
      $monitor("%d,\t%b, \t%b",$time, clock, trigger);
      #30
      $finish;
    end

endmodule