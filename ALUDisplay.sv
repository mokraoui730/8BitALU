module ALUDisplay(
    input  logic        clk,
    input  logic        reset_n,
    output logic [6:0]  Seg0,    //  ones  (rightmost)
    output logic [6:0]  Seg1,    //  tens
    output logic [6:0]  Seg2,    //  hundreds
);

    logic [5:0]  seconds, minutes;
    logic [6:0]  hours;

   

    // Parsed digits
    logic [3:0] sec_ones,  sec_tens;
    logic [3:0] min_ones,  min_tens;
    logic [3:0] hour_ones, hour_tens;

    Parser #(.N(6)) secParser  (.digit(seconds), .ones(sec_ones),  .tens(sec_tens));
    Parser #(.N(6)) minParser  (.digit(minutes), .ones(min_ones),  .tens(min_tens));
    Parser #(.N(7)) hourParser (.digit(hours),   .ones(hour_ones), .tens(hour_tens));

    SevenSegmentDecode seg0dec (.digit(sec_ones),  .segments(Seg0));
    SevenSegmentDecode seg1dec (.digit(sec_tens),  .segments(Seg1));
    SevenSegmentDecode seg2dec (.digit(min_ones),  .segments(Seg2));
    

endmodule
