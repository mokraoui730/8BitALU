module arithmetic( 
  input logic [7:0] A, 
  input logic [7:0] B,
  input logic sel_add, 
  input logic sel_sub, 
  output logic overflow, 
  output logic [7:0] result
);

  logic [8:0] full_result; 

  always_comb begin 
    if (sel_add) begin 
      //Addition: A + B 
      assign full_result = A + B;
      result = full_result[7:0];
      overflow = full_result[8];
    end else if (sel_sub) begin
      //Subtraction: A - B 
      assign full_result = A - B;
      result = full_result[7:0]; 
      overflow = full_result[8]; 
    end else begin 
      result = 8'b0;  //clear
      overflow = 1'b0; 
    end 
  end 
  
endmodule
      

