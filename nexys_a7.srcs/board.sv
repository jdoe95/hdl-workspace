/*
 * This is the top-level module that represents the connectivity of the FPGA to other devices on the
 * Nexys A7 board.
 */
module board
(
	input logic osc,         // IC9 100 MHz crystal oscillator at pin E3
	output logic [15:0] led  // on-board LEDs connected to the FPGA
);
	logic clock;     // 280 MHz master clock
	logic clock_en;  // master clock enable

	clock_provider clock_provider_inst (
		.clock_in(osc),
		.clock_out_en(clock_en),
		.clock_out(clock)
	);
	
	assign led[0] = clock_en;

endmodule
