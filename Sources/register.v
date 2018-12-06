
// srlatch: 1 bit sr latch 
//
// q      (output) - Current value of register
// d      (output) - Opposite value of register
// s      (set)    - Sets value to 1
//
module srlatch(q, s);

    parameter 
        width = 8,
        reset_value = 0;
    
    output  [(width - 1):0] q;
    input   [(width - 1):0] s;

    wire    [(width - 1):0] r;
    wire    [(width - 1):0] d;

    assign  r = !s;

    nor     [(width - 1):0] up(q, r, d);
    nor     [(width - 1):0] down(d, s, q);

endmodule // srlatch