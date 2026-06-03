module SevenSegmentDisplay(
    input  logic        reset_n,
    output logic [6:0]  Seg0,    //  ones  (rightmost)
    output logic [6:0]  Seg1,    //  tens
    output logic [6:0]  Seg2,    //  hundreds
);

    logic [7:0]  ones, tens, hundreds;
   
    // Parsed digits
    logic [3:0] ones_parsed;
    logic [3:0] tens_parsed;
    logic [3:0] hundreds_parsed;

    Parser #(.N(7)) onesParser (.result(ones), (.ones(ones_parsed));
    Parser #(.N(7)) tensParser  (.result(tens), (.tens(tens_parsed));
    Parser #(.N(7)) hundredsParser (.result(hundreds), .hundreds(hundreds_parsed));

    SevenSegmentDecode seg0dec (.digit(ones_parsed),  .segments(Seg0));
    SevenSegmentDecode seg1dec (.digit(tens_parsed),  .segments(Seg1));
    SevenSegmentDecode seg2dec (.digit(hundreds_parsed),  .segments(Seg2));
    

endmodule
