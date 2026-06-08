/*
 * ECE 204 Eight Bit ALU Final Project
 * Arithmetic
 *
 * Author(s): Iman Mokraoui, Mylan Bui, Ava Katz
 * Description: Arithmetic contais the addition and subtraction functions. Takes in 3-bit sel_add opcode, if the opcode is not sel_add then 
 *computes subtraction instead. The two 8-bit inputs used to perform arithmetic function are A and B.
 *The output is 9 bits wide, the 9th bit represents overflow and the first 8 bits are results. 
 *
 */
module arithmetic( 
  input logic [7:0] A, 
  input logic [7:0] B,
  input logic sel_add, 
  output logic overflow, 
  output logic [7:0] result
);

  
//Arithmetic operation for addition and subtraction
  always_comb begin 
    if (sel_add) begin 
      //Addition: A + B 
      {overflow, result} = A + B; // Overflow = [8] , Result = [7:0]
    end else begin
      //Subtraction: A - B 
      {overflow, result} = A - B; // Overflow = [8] , Result = [7:0]
  end 
end
  
endmodule
      
