// 8BitALU
module OpcodeDecode(
  input logic [2:0] opcode, 
  input logic enable_n, // active low (enabled when switch is 0)
  input logic reset_n, // active low (resets when button is pressed when == 1)
  input logic [2:0] current_state, // State FSM is curretnly in (Sn)
  output logic [2:0] next_state, // State FSM where to go on next clock edge (Sx)
  output logic sel_and,   // ---------------------------------------------------- //
  output logic sel_or,    // ---------------------------------------------------- //
  output logic sel_xor,   // ---------------- one gets selected ----------------- //
  output logic sel_apass, // --------------- (selected becomes 1) --------------- //
  output logic sel_bpass  // ----------------- (the rest are 0) ----------------- //
  output logic sel_add,   // ---------------------------------------------------- //
  output logic sel_sub    // ---------------------------------------------------- //
);

  // State encoding - matches opcode
  localparam S_IDLE = 3'b000;
  localparam S_AND = 3'b001;
  localparam S_OR = 3'b010;
  localparam S_XOR = 3'b011;
  localparam S_APASS = 3'b100;
  localparam S_BASS = 3'b101;
  localparam S_ADD = 3'b110;
  localparam S_SUB = 3'b111;
  
  // Next State Logic //
  // S0 + enable_n = 0 + opcode -> transition to opcode state
  // S0 + enable_n = 1 -> stay IDLE (S0)
  // S1 - S7 + any -> return to IDLE (S0)
  alway_comb begin
    if (!reset)          // when reset button is pressed
      next_state = S_IDLE; // go back to S0
    else begin
      case(current_state) // look at current state
        //State 0: IDLE//
        S_IDLE: begin 
          if (!enable_n) // when enable_n is low (enabled) 
            next_state = opcode // set next state to the opcode
          else // if enable_n is high (not enabled) 
            next_state = S_IDLE; // stays in IDLE (S0)
        end
        default: next_state = S_IDLE; // (S1-S7) cases go back to IDLE (S0)
      endcase
    end
  end
  
  // Select Operation to Compute //
  // Raises one sel to high (1) for ALU to compute; rest are 0
  // All 0s when disable or in reset
  always_comb begin // initialize every select line to 0 
    sel_and = 1'b0; 
    sel_or = 1'b0;
    sel_xor = 1'b0;
    sel_apass = 1'b0;
    sel_bpass = 1'b0;
    sel_add = 1'b0;
    sel_sub = 1'b0;
  
    if (!enable_n && reset_n) begin // if ALU is enabled (== 0) and reset is not being pressed (== 1)
      case(opcode) // looks at opcode and switches selected opcode to high (1)
        S_AND: sel_and = 1'b1;
        S_OR: sel_or = 1'b1;
        S_XOR: sel_xor = 1'b1;
        S_APASS: sel_apass = 1'b1;
        S_BPASS: sel_bpass = 1'b1;
        S_ADD: sel_add = 1'b1;
        S_SUB: sel_sub = 1'b1;
      endcase
    end
  end
endmodule
