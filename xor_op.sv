/*
 * ECE 204 Eight Bit ALU Final Project
 * xor_op
 *
 * Author(s): Iman Mokraoui, Mylan Bui, Ava Katz
 * Description: This file performs a bitwise XOR operation between two eight-bit numbers. 
 * 
 * 
 *
 */
// XOR function //
module xor_op( 
  input logic [7:0] A,
  input logic [7:0] B,
  output logic [7:0] result 
);

  assign result = A ^ B;
  
endmodule
