// XOR function //
module XOR( 
  input logic [7:0] A, 
  input logic [7:0] B,
  output result
);
  // OR module
  // A | B

  assign result = A ^ B;
  
endmodule
