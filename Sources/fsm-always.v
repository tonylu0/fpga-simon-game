
module fsm-always(
  
)
reg lives = 3;
always @ (posedge clock) begin
  if (swt == store_num)
    reg <= 1;
  else if (lives == 0) 
    
end