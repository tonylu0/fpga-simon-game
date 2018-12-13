module random_num_gen(
  input  clk,
  input  rst_n,
  output reg [1:0] data
);

wire feedback = data[1] ^ data[0] ;

always @(posedge clk or negedge rst_n)

if (~rst_n) 
  data <= 2'b11;
else
  data <= {data[0],feedback} ;
  
endmodule