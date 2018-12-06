
// srlatch: 1 bit sr latch 
//
// q      (output) - Current value of register
// s      (set)    - Sets value to 1
// r      (reset)  - Resets latch to 0
//
module srlatch(q, s, r);

    parameter 
        width = 8,
        reset_value = 0;
    
    output  [(width - 1):0] q;
    input   [(width - 1):0] s, r;

    wire    [(width - 1):0] d;
    wire    [(width - 1):0] in, nreset;

    not     n(nreset, r);
    and     a(in, s, nreset);


    nor     [(width - 1):0] up(q, r, d);
    nor     [(width - 1):0] down(d, in, q);

endmodule // srlatch