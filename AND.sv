module AND_op( 
  input logic [7:0] A, 
  input logic [7:0] B,
  input logic opcode, 
  output result
)
// AND function //
  always_comb begin
    if (opcode)
      result = A & B;
    else
      result = 8'b0;
  end
endmodule
