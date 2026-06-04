module or_op( 
  input logic [7:0] A, 
  input logic [7:0] B,
  output logic [7:0] result 
);
  // OR module
  // A | B
  assign result = A | B;
endmodule
