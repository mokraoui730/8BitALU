module EightBitALU(
	input logic [7:0] A,  // 8 bit input A
	input logic [7:0] B,  //8 bit input B
	input logic [2:0] opcode, 
	output logic [7:0] result, 
	output logic overflow
);

	logic sel_and;
	logic sel_or;
	logic sel_xor; 
	logic sel_apass; 
	logic sel_bpass; 
	logic sel_add; 
	logic sel_sub; 
	
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
	
Addition_Subtraction ADD(
	.A(A),
	.B(B),
	// check if need flag to disinct
	.result(result),
	.zero_flag(zero_flag)

);

AND_op and(
	.A(A),
	.B(B),
	.result(result)
);

OR_op or(
	.A(A),
	.B(B),
	.result(result)
);

XOR_op or(
	.A(A),
	.B(B),
	.result(result)
);

// if we don't need to do a fsm design 
always_comb begin
	// flags always set to zero before operation
	overflow_flag = 1'b0;
	zero_flag = 1'b0;
	
	if (enable_n) begin
		if (sel_and) begin 
			
		end else
		if (sel_or) begin
			
		end else if(sel_xor) begin
		
		end else if(sel_apass) result = A; 
		
		else if (sel_bpass) result = B; 
		
		else if(sel_add) begin 
		
		end else if(sel_sub) begin
			
		end else begin
			result = 8'b0;
	end

end

endmodule
