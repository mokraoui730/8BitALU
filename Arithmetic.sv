module arithmetic( 
  input logic [7:0] A, 
  input logic [7:0] B,
  input logic opcode, 
  output logic overflow, 
  output logic [7:0] result
);

  logic [8:0] full_result; 

  always_comb begin 
    if (sel_add) begin 
      //Addition: A + B 
      full_result = (1'b0, A) + (1'b0, B);
      result = full_result[7:0]; 
      overflow = full_result[8]; 
    end else if (sel_sub) begin
      //Subtraction: A - B 
      full result = (1'b0, A) - (1'b0, B);
      result = full_result[7:0]; 
      overflow = full_result[8]; 
    end else begin 
      result = 8b'0;  //clear
      overflow = 1'b0; 
    end 
  end 
endmodule
      

