/*
 * ECE 204 Eight Bit ALU Final Project
 * or_op
 *
 * Author(s): Iman Mokraoui, Mylan Bui, Ava Katz
 * Description: This file performs a bitwise OR operation between two eight-bit numbers. 
 *
 */

module or_op( 
  input logic [7:0] A, 
  input logic [7:0] B,
  output logic [7:0] result 
);
  // OR operation
  assign result = A | B;
endmodule
