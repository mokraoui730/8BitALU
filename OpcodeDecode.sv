// 8BitALU
module OpcodeDecode(
  input logic [2:0] opcode, 
  input logic enable_n, // active low (enabled when switch is 0)
  input logic reset_n, // active low (resets when button is pressed when == 1)
  output logic sel_and,   // ---------------------------------------------------- //
  output logic sel_or,    // ---------------------------------------------------- //
  output logic sel_xor,   // ---------------- one gets selected ----------------- //
  output logic sel_apass, // --------------- (selected becomes 1) --------------- //
  output logic sel_bpass,  // ----------------- (the rest are 0) ----------------- //
  output logic sel_add,   // ---------------------------------------------------- //
  output logic sel_sub    // ---------------------------------------------------- //
);
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
        3'b000: sel_and = 1'b1;
        3'b001: sel_or = 1'b1;
        3'b010: sel_xor = 1'b1;
        3'b011: sel_apass = 1'b1;
        3'b100: sel_bpass = 1'b1;
        3'b101: sel_add = 1'b1;
        3'b110: sel_sub = 1'b1;
      endcase
    end
  end
endmodule
