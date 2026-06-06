module Parser (
    input  logic [7:0] result,
    output logic [3:0]   ones,
    output logic [3:0]   tens,
    output logic [3:0] hundreds
);

    assign ones =  result % 10;
    assign tens = (result / 10) % 10;
    assign hundreds = result / 100; 

endmodule
