// Top-level wrapper connecting 8Bit ALU to the FPGA. Using a 3 phase input schedule so the user can input opcode, A and B using the switches. 
// Phase 0: Opcode
// Phase 1: A input
// Phase 2: B input 
// Phase 3: Output result 

module connector (
	input logic clk, //clock 
	input logic [1:0] KEY, //buttons for KEY[0]: reset_n and KEY[1]: enable_n
	input logic [9:0] SW, //SW[7:0]: A and B, SW[2:0]:Opcode
	output logic [6:0] SegOnes, 
	output logic [6:0] SegTens, 
	output logic [6:0] SegHundreds, 
	output logic [6:0] PhaseLabel
);

// Phase definitions
typedef enum logic [1:0] { 
	PH_OPCODE = 2'b00, 
	PH_A = 2'b01,
	PH_B = 2'b10, 
	PH_DONE = 2'b11
} phase_t; 

phase_t phase; 

// Latched input registers
logic [2:0] opcode_reg;
logic [7:0] A_reg;
logic [7:0] B_reg;

//Button Edge Detection (KEY[1] = latch button, active low)
//btn_pulse: exactly one clock cycle on the falling edge. 
logic btn_prev; 
wire btn_pulse; 

assign btn_pulse = btn_prev & ~KEY[1];

// Phase + Input Latch 
 always_ff @(posedge clk or negedge KEY[0]) begin
        if (!KEY[0]) begin
            phase      <= PH_OPCODE;
            opcode_reg <= 3'b000;
            A_reg      <= 8'b0;
            B_reg      <= 8'b0;
            btn_prev   <= 1'b1;
        end else begin
            btn_prev <= KEY[1];

            if (btn_pulse) begin
                case (phase)
                    PH_OPCODE: begin
                        opcode_reg <= SW[2:0];
                        phase      <= PH_A;
                    end
                    PH_A: begin
                        A_reg <= SW[7:0];
                        phase <= PH_B;
                    end
                    PH_B: begin
                        B_reg <= SW[7:0];
                        phase <= PH_DONE;
                    end
                    PH_DONE: begin
                        phase <= PH_OPCODE;
                    end
                endcase
            end
        end
    end
	 
//Enable_n is active low, ALU runs in PH_DONE
    logic alu_enable_n;
    assign alu_enable_n = (phase == PH_DONE) ? 1'b0 : 1'b1;
	 
//ALU result and overflow wires 
    logic [7:0] alu_result;
    logic       alu_overflow;
// Initiating Eight_bit_ALU 
    Eight_bit_ALU alu (
        .A        (A_reg),
        .B        (B_reg),
        .opcode   (opcode_reg),
        .reset_n  (KEY[0]),
        .enable_n (alu_enable_n),
        .result   (alu_result),
        .overflow (alu_overflow)
    );
// SevenSegmentDisplay for Result
    SevenSegmentDisplay seg_display (
        .reset_n (KEY[0]),
        .result  (alu_result),
        .Seg0    (SegOnes),
        .Seg1    (SegTens),
        .Seg2    (SegHundreds)
    );
	 
// Phase Labels 
// Active-low 7-segment encoding. 
//  For opcode "O"  -> 7'b100_0000   (segments a,b,c,d,e,f on; g off)
//  For input A, "A"  -> 7'b000_1000   (segments a,b,c,e,f,g on)
//  For input B "b"  -> 7'b000_0011   (segments c,d,e,f,g on)
//  Output result"-"  -> 7'b011_1111   (segment g only)
    always_comb begin
        case (phase)
            PH_OPCODE: PhaseLabel = 7'b100_0000;
            PH_A:      PhaseLabel = 7'b000_1000;
            PH_B:      PhaseLabel = 7'b000_0011;
            PH_DONE:   PhaseLabel = 7'b011_1111;
            default:   PhaseLabel = 7'b111_1111;
        endcase
    end

endmodule
