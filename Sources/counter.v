// 2 bit counter
module counter2(
  output [1:0] count,
  input  reset, clk
);

wire sum1, sum2;
wire cout1, cout2;
wire d1out, d2out;

ha h1(sum1, cout1, 1'b1, d1out);
DFlip d1(d1out, sum1, reset, clk);

ha h2(sum2, cout2, cout1, d2out);
DFlip d2(d2out, sum2, reset, clk);

assign count[0] = d1out;
assign count[1] = d2out;

endmodule // counter2


// 20 bit counter
module counter20(
  output  [7:0] count,
  input          reset, clk
);

wire sum1, sum2, sum3, sum4, sum5, sum6, sum7, sum8;
wire cout1, cout2, cout3, cout4, cout5, cout6, cout7, cout8;
wire d1out, d2out, d3out, d4out, d5out, d6out, d7out, d8out;

ha h1(sum1, cout1, 1'b1, d1out);
DFlip d1(d1out, sum1, reset, clk);

ha h2(sum2, cout2, cout1, d2out);
DFlip d2(d2out, sum2, reset, clk);

ha h3(sum3, cout3, cout2, d3out);
DFlip d3(d3out, sum3, reset, clk);

ha h4(sum4, cout4, cout3, d4out);
DFlip d4(d4out, sum4, reset, clk);

ha h5(sum5, cout5, cout4, d5out);
DFlip d5(d5out, sum5, reset, clk);

ha h6(sum6, cout6, cout5, d6out);
DFlip d6(d6out, sum6, reset, clk);

ha h7(sum7, cout7, cout6, d7out);
DFlip d7(d7out, sum7, reset, clk);

ha h8(sum8, cout8, cout7, d8out);
DFlip d8(d8out, sum8, clk);

//ha h9(sum9, cout5, cout4, d5out);
//DFlip d9(d5out, sum5, clk);

//ha h10(sum10, cout5, cout4, d5out);
//DFlip d10(d5out, sum5, clk);

//ha h11(sum11, cout5, cout4, d5out);
//DFlip d11(d5out, sum5, clk);

//ha h12(sum12, cout5, cout4, d5out);
//DFlip d12(d5out, sum5, clk);

//ha h13(sum13, cout5, cout4, d5out);
//DFlip d13(d5out, sum5, clk);

//ha h14(sum14, cout5, cout4, d5out);
//DFlip d14(d5out, sum5, clk);

//ha h15(sum15, cout5, cout4, d5out);
//DFlip d15(d5out, sum5, clk);

//ha h16(sum16, cout5, cout4, d5out);
//DFlip d16(d5out, sum5, clk);

//ha h17(sum17, cout5, cout4, d5out);
//DFlip d17(d5out, sum5, clk);

//ha h18(sum18, cout5, cout4, d5out);
//DFlip d18(d5out, sum5, clk);

//ha h19(sum19, cout5, cout4, d5out);
//DFlip d19(d5out, sum5, clk);

//ha h20(sum20, cout5, cout4, d5out);
//DFlip d20(d5out, sum5, clk);

assign count[0] = sum1;
assign count[1] = sum2;
assign count[2] = sum3;
assign count[3] = sum4;
assign count[4] = sum5;
assign count[5] = sum6;
assign count[6] = sum7;
assign count[7] = sum8;
//assign count[8] = sum9;
//assign count[9] = sum10;
//assign count[10] = sum11;
//assign count[11] = sum12;
//assign count[12] = sum13;
//assign count[13] = sum13;
//assign count[14] = sum13;
//assign count[15] = sum13;
//assign count[16] = sum13;
//assign count[17] = sum13;
//assign count[18] = sum13;
//assign count[19] = sum13;

endmodule