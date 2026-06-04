module arithmetic( 
  input logic [7:0] A, 
  input logic [7:0] B,
  input logic sel_add, 
  output logic overflow, 
  output logic [7:0] result
);

  // logic [8:0] full_result; 

  always_comb begin 
    if (sel_add) begin 
      //Addition: A + B 
      {overflow, result} = A + B;
      //result = full_result[7:0];
      //overflow = full_result[8];
    end else begin
      //Subtraction: A - B 
      {overflow, result} = A - B;
      //result = full_result[7:0]; 
      //overflow = full_result[8]; 
  end 
end
  
endmodule
      
