module EightBitALU(
input [7:0] A,  // 8 bit input A
input [7:0] B,  //8 bit input B
input [2:0] opcode, 
input	enable_n, 
input reset_n,
output [7:0] result, 
output overflow_flag, 
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
	
always @(op) begin
	// flags always set to zero before operation
	overflow_flag = 1'b0;
	
	// default state - idle or listening
	next_state = IDLE; 
	case (op)
	
		IDLE: begin
			if(opcode == 1)
				next_state = AND; 
			if (opcode == 2)
				next_state = OR
			if(opcode == 3) 
					next_state = XOR;
			if(opcode == 4) 
					next_state = APASS;
			if(opcode == 5) 
					next_state = BPASS;
			if(opcode == 6) 
					next_state = ADD;
			if(opcode == 6) 
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
// Just A //

// Just B //

// Addition //

//Subtraction//

// AND //

// OR //

// XOR //
