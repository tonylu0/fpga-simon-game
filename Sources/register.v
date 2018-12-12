
// srlatch: 1 bit sr latch 
//
// q      (output) - Current value of register
// s      (set)    - Sets value to 1
// r      (reset)  - Resets latch to 0
//
module SRlatch(q, s, r);

    parameter 
        width = 8
    
    output  [(width - 1):0] q;
    input   [(width - 1):0] s, r;

    wire    [(width - 1):0] d;
    wire    [(width - 1):0] in, nreset;

    not     n(nreset, r);
    and     a(in, s, nreset);


    nor     [(width - 1):0] up(q, r, d);
    nor     [(width - 1):0] down(d, in, q);

endmodule // SRlatch

// D flip flop
// 
// q (output)
// d (data)
// clk (clock)
module DFlip(q, d, clk);

    output  q;
    input   d, clk;

    wire nands, nandr;
    wire notd, notq;

    not     (notd, d);

    and     a1(nands, d, clk);
    and     a2(nandr, notd, clk);
    and     a3(q, nands, notq);
    and     a4(notq, nandr, q);

endmodule

    