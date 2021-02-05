`include "timescale.sv"
module clock_provider
(
	input logic clock_in,
	output logic clock_out0,
	output logic clock_out1,
	output logic clock_ready
);
	logic feedback;

	/* Refer to UG472 */
	PLLE2_BASE #(
		.BANDWIDTH("OPTIMIZED"),
		.STARTUP_WAIT("TRUE"),

		// input clock
		.CLKIN1_PERIOD(10.0),    // input clock 100 MHz
		.REF_JITTER1(0.1),       // typical jitter 100 ps (part DSC1033CC1-100.0000T)

		// affecting all output clocks
		.DIVCLK_DIVIDE(1),    // master division 1~56
		.CLKFBOUT_MULT(16),   // master multiplication 2~64
		.CLKFBOUT_PHASE(0.0), // master phase shift -360.000~360.000

		// output clock 0
		.CLKOUT0_DIVIDE(8),       // 1~128 200 MHz
		.CLKOUT0_PHASE(0.0),      // -360.000~360.000
		.CLKOUT0_DUTY_CYCLE(0.5), // 0.001~0.999

		// output clock 1
		.CLKOUT1_DIVIDE(80),      // 20 MHz
		.CLKOUT1_PHASE(0.0),
		.CLKOUT1_DUTY_CYCLE(0.5)
	) pll_inst
	(
		.CLKFBOUT(feedback),
		.CLKFBIN(feedback),

		// control
		.LOCKED(clock_ready),
		.PWRDWN(1'b0),
		.RST(1'b0),

		// input clock
		.CLKIN1(clock_in),

		// output clocks
		.CLKOUT0(clock_out0),
		.CLKOUT1(clock_out1),
		.CLKOUT2(),
		.CLKOUT3(),
		.CLKOUT4(),
		.CLKOUT5()
	);

endmodule
