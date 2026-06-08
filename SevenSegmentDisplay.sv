/*
 * ECE 204 Eight Bit ALU Final Project
 * SevenSegmentDisplay
 *
 * Author(s): Iman Mokraoui, Mylan Bui, Ava Katz
 * Description: Displays the result of each operation on the FPGA hex display. 
 * The ones digit is the rightmost display, and preceded by the tens and hundreds digit. 
 *
 */

module SevenSegmentDisplay(
    input logic [7:0] result,
    output logic [6:0]  Seg0,    //  ones  (rightmost)
    output logic [6:0]  Seg1,    //  tens
    output logic [6:0]  Seg2    //  hundreds
);
   
    // Parsed digits
    logic [3:0] ones_parsed;
    logic [3:0] tens_parsed;
    logic [3:0] hundreds_parsed;

    // wired to parser to seperate result into digits for diplay
    Parser resultParser(
        .result(result), 
        .ones(ones_parsed), 
        .tens(tens_parsed),
        .hundreds(hundreds_parsed)
    );

    // displays each digit on the fpga 
    SevenSegmentDecode seg0dec (.digit(ones_parsed),  .segments(Seg0));
    SevenSegmentDecode seg1dec (.digit(tens_parsed),  .segments(Seg1));
    SevenSegmentDecode seg2dec (.digit(hundreds_parsed),  .segments(Seg2));
    

endmodule
