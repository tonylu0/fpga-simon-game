// D flip flop
// 
// q (output)
// d (data)
// clk (clock)
module DFlip(q, d, reset, clk);

    output  q;
    input   d, reset, clk;

    wire    clk_in, d_in;
    wire    nreset;
    
    or      (clk_in, clk, reset);
    
    not     (nreset, reset);
    and     (d_in, d, nreset);
    
    wire nands, nandr;
    wire notd, notq, notreset;
    
    not     (notd, d_in);

    nand     a1(nands, d_in, clk_in);
    nand     a2(nandr, notd, clk_in);
    nand     a3(q, nands, notq);
    nand     a4(notq, nandr, q);
    
endmodule

module DFlip8(q, d, reset, clk);

    input   [7:0] d;
    input   reset, clk;
    output  [7:0] q;
    
    DFlip d1(q[0], d[0], reset, clk);
    DFlip d2(q[1], d[1], reset, clk);
    DFlip d3(q[2], d[2], reset, clk);
    DFlip d4(q[3], d[3], reset, clk);
    DFlip d5(q[4], d[4], reset, clk);
    DFlip d6(q[5], d[5], reset, clk);
    DFlip d7(q[6], d[6], reset, clk);
    DFlip d8(q[7], d[7], reset, clk);
    
endmodule

    