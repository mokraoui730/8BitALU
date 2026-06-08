/*
 * Eight Bit ALU Final Project
 * Seven Segment Decoder
 *
 * Author(s): Iman Mokraoui, Mylan Bui, Ava Katz
 * Source: Lab 3b
 * Description: Displays a hex number on the FPGA hex display given a four bit binary number.  
 */

module SevenSegmentDecode(
    input logic [3:0] digit,
    output logic [6:0] segments
	 
);

always_comb begin
    case (digit)
        //                   gfe_dcba
		  4'h0: segments = 7'b100_0000;
		  4'h1: segments = 7'b111_1001;
		  4'h2: segments = 7'b010_0100;
		  4'h3: segments = 7'b011_0000;
	     4'h4: segments = 7'b001_1001;
  		  4'h5: segments = 7'b001_0010;
		  4'h6: segments = 7'b000_0010;
		  4'h7: segments = 7'b111_1000;
		  4'h8: segments = 7'b000_0000;
		  4'h9: segments = 7'b001_1000;
		  4'ha: segments = 7'b000_1000;
		  4'hb: segments = 7'b000_0011;
		  4'hc: segments = 7'b100_0110; 
		  4'hd: segments = 7'b010_0001;
		  4'he: segments = 7'b000_0110;
		  4'hf: segments = 7'b000_1110;

	 
    endcase
end

endmodule

