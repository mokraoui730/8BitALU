/*
 * ECE 204 Eight Bit ALU Final Project
 * and_op
 *
 * Author(s): Iman Mokraoui, Mylan Bui, Ava Katz
 * Description: This file performs a bitwise AND operation between two eight-bit numbers. 
 *
 */

module and_op( 
  input logic [7:0] A, 
  input logic [7:0] B,
  output logic [7:0] result
);
	
// AND function //
	assign result = A & B;
endmodule
