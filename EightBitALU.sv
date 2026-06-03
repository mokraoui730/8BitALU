module EightBitALU(
	input logic [7:0] A,  // 8 bit input A
	input logic [7:0] B,  //8 bit input B
	input logic [2:0] opcode, // 3 bit binary designating current operation
	input logic reset_n,
	input logic enable_n,
	output logic [7:0] result, // 8 bit binary number result from operation
	output logic overflow // flag signaling overflow on addition or subtraction, high when overflow occurs
);

	// stores the op decoded from opcode 
	logic sel_and;
	logic sel_or;
	logic sel_xor; 
	logic sel_apass; 
	logic sel_bpass; 
	logic sel_add; 
	logic sel_sub; 
	
	// stores results from each operation
	logic arith_res;
	logic and_res;
	logic or_res;
	logic xor_res;

// sets op var to 1 if chosen by the opcode 	
OpcodeDecode decode (
	.opcode(opcode),
	.enable_n(enable_n),
	.sel_and(sel_and),
	.sel_or(sel_or),
	.sel_xor(sel_xor),
	.sel_apass(sel_apass),
	.sel_bpass(sel_bpass),
	.sel_add(sel_add),
	.sel_sub(sel_sub)
);
	
// adds A and B if op is sel_and, else subtracts
arithmetic arith_op(
	.A(A),
	.B(B),
	.sel_and(sel_add),
	.result(arith_res),
	.overflow(zero_flag)
);

// bitwise AND operation of A and B
AND and_op(
	.A(A),
	.B(B),
	.result(and_res)
);

// bitwise OR operation of A and B
OR or_op(
	.A(A),
	.B(B),
	.result(or_res)
);


// bitwise XOR operation of A and B
XOR xor_op(
	.A(A),
	.B(B),
	.result(xor_res)
);

// resets result and flag to zero asynchronously when reset is pressed 
always_ff @(posedge reset_n) begin
	if (!reset_n) begin
		result <= 8'b0; 
		overflow <= 1'b0; 
	end
end


// produces the result of a operation specified by the opcode  
always_comb begin
	// flags always set to zero before operation
	// only set to high with addition or subtraction ops
	overflow = 1'b0; 
	result = 8'b0; 
	// only perform ops when enabled 
	if (enable_n) begin
		if (sel_and) 
			result = and_res; 
		else if (sel_or) 
			result = or_res; 
		else if(sel_xor) 
			result = xor_res;
		else if(sel_apass) 
			result = A; 
		else if (sel_bpass) 
			result = B; 
		else if(sel_add) 
			result = arith_res;  
		else if(sel_sub) 
			result = arith_res;
		else
			result = 8'b0;
	end

end

endmodule
