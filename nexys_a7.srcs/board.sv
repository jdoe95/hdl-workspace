/*
 * This is the top-level module that represents the connectivity of the FPGA to other devices on the
 * Nexys A7 board.
 */
module board
(
	input logic osc,         // IC9 100 MHz crystal oscillator at pin E3
	output logic [15:0] led  // on-board LEDs connected to the FPGA
);
	logic master_clock;     // 200 MHz master clock
	logic clock_en;         // global clock enable
	logic master_reset;     // master reset signal
	logic slow_clock;       // 20 MHz slow clock

	clock_provider clock_provider_inst
	(
		.clock_in(osc),
		.clock_ready(clock_en),
		.clock_out0(master_clock),
		.clock_out1(slow_clock)
	);

endmodule
