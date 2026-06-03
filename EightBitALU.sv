module EightBitALU(
	input [7:0] A,  // 8 bit input A
	input [7:0] B,  //8 bit input B
	input [2:0] opcode, 
	output [7:0] result, 
	output overflow_flag, 
	output zero_flag
);


Addition_Subtraction ADD(
	.A(A),
	.B(B),
	/// check if need flag to disinct
	.result(result),
	.zero_flag(zero_flag)

);




typedef enum logic [2:0] {
        IDLE, AND, OR, XOR, APASS, BPASS, ADD, SUB
    } state_t;
state_t state, next_state;

always_ff @(posedge reset) begin
	if (reset)
		state <= IDLE;
	else 
		state <= next_state;
	end
	
always_comb begin
	// flags always set to zero before operation
	overflow_flag = 1'b0;
	zero_flag = 1'b0;
	
	// default state - idle or listening
	next_state = IDLE; 
	case (state)
		IDLE: begin // check wether need idle state since it doesn't have flag
			if(opcode == 3'b000) 
				next_state = AND; 
			if (opcode == 3'b001)
				next_state = OR;
			if(opcode == 3'b010) 
					next_state = XOR;
			if(opcode == 3'b011) 
					next_state = APASS;
			if(opcode == 3'b100) 
					next_state = BPASS;
			if(opcode == 3'b101) 
					next_state = ADD;
			if(opcode == 3'b110) 
					next_state = SUB;
		end  
		AND : next_state = IDLE; 
		OR: next_state = IDLE; 
		XOR: next_state = IDLE; 
		APASS: next_state = IDLE; 
		BPASS: next_state = IDLE; 
		ADD: next_state = IDLE;
		SUB: next_state = IDLE;
		default: next_state = IDLE; 
		
	endcase
end




always_comb begin 
	
	case(state)
	AND:
	OR:
	XOR:
	APASS: result = A;
	BPASS: result = B; 
	ADD:
	SUB:
	endcase

end
	
endmodule

// if we don't need to do a fsm design 
always_comb begin
	// flags always set to zero before operation
	overflow_flag = 1'b0;
	zero_flag = 1'b0;
	
	if (enable_n = 0) begin
		case (opcode)
			3'b000:
			3'b001: 
			3'b010: 
			3'b011: result = A; 
			3'b100: result = B; 
			3'b101:
			3'b110: 
			default: 
		endcase	
	end

end
