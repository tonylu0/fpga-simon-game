module main_test();

    reg     clock;
    
    initial begin
    clock = 0;
    end
    
    always #1 clock = !clock;

    reg reset = 1;
    reg[4:0] base, ending;

    wire in, out;

    initial begin
        $dumpfile("main_test.vcd");
        $dumpvars(0, main_test);
        #1      reset = 0;

        #10 $finish;
    end
endmodule // main