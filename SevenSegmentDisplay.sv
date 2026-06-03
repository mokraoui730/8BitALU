module ALUDisplay(
    input  logic        clk,
    input  logic        reset_n,
    output logic [6:0]  Seg0,    // seconds ones  (rightmost)
    output logic [6:0]  Seg1,    // seconds tens
    output logic [6:0]  Seg2,    // minutes ones
    output logic [6:0]  Seg3,    // minutes tens
    output logic [6:0]  Seg4,    // hours ones
    output logic [6:0]  Seg5     // hours tens    (leftmost)
);

    logic [25:0] tickCount;
    logic [5:0]  seconds, minutes;
    logic [6:0]  hours;

    Clock #(.TICKS_PER_SEC(50_000_000)) myClock (
        .clk         (clk),
        .reset_n     (reset_n),
        .tickCount   (tickCount),
        .secondsCount(seconds),
        .minutesCount(minutes),
        .hoursCount  (hours)
    );

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
    SevenSegmentDecode seg3dec (.digit(min_tens),  .segments(Seg3));
    SevenSegmentDecode seg4dec (.digit(hour_ones), .segments(Seg4));
    SevenSegmentDecode seg5dec (.digit(hour_tens), .segments(Seg5));

endmodule
