module Parser #(parameter N = 6)(
    input  logic [N-1:0] digit,
    output logic [3:0]   ones,
    output logic [3:0]   tens
);

    assign ones = digit % 10;
    assign tens = digit / 10;

endmodule
