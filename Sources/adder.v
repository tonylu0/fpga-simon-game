
// Half adder
// s  (sum)
// c  (carry)
// a  (input)
// b  (input)
module ha(
  output  s, c,
  input   a, b
);

xor x1(s, a, b);
and a1(c, a, b);

endmodule