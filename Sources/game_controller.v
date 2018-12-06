
module palindrome_control(palindrome, done, select, load, go, a_ne_b, front_ge_back, clock, reset);
	output load, select, palindrome, done;
	input go, a_ne_b, front_ge_back;
	input clock, reset;

  wire sGarbage, sStart, sCompare, sShift, sDone, sDoneP;


  wire sGarbage_next = (sGarbage & ~go) | reset;
  wire sStart_next = ((sGarbage & go) | (sDone & go) | (sDoneP & go) | (sStart & go)) & ~reset;

  wire sCompare_next = ((sStart & ~go) | (sShift & ~front_ge_back)) & ~reset;
  wire sShift_next = (sCompare & ~a_ne_b & ~go) & ~reset;

  wire sDone_next = ((sCompare & a_ne_b) | | (sDone & ~go)) & ~reset;
  wire sDoneP_next = ((sShift & front_ge_back) | (sDoneP & ~go)) & ~reset; 

  dffe fsGarbage(sGarbage, sGarbage_next, clock, 1'b1, 1'b0);
  dffe fsStart(sStart, sStart_next, clock, 1'b1, reset);
  
  dffe fsCompare(sCompare, sCompare_next, clock, 1'b1, reset);
  dffe fsShift(sShift, sShift_next, clock, 1'b1, reset);

  dffe fsDone(sDone, sDone_next, clock, 1'b1, reset);
  dffe fsDoneP(sDoneP, sDoneP_next, clock, 1'b1, reset);
	
  assign load = ~sGarbage;
  assign select = ~go & ~reset;
  assign palindrome = (sDoneP) & ~reset;
  
  assign done = (sDone | sDoneP) & ~reset;
endmodule // palindrome_control 