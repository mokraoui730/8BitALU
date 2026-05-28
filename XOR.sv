// XOR function //
module XOR_op( 
  input logic [7:0] A, 
  input logic [7:0] B,
  input logic opcode, 
  output result
)
  // OR module
  // A | B
  always_comb begin
    if (opcode)
      result = A ^ B;
    else
      result = 8'b0;
  end
endmodule
