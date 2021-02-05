`include "timescale.sv"
module reset_provider
(
	input logic clock,
	input logic clock_en,
	input logic async_reset_in,
	output logic reset_out
);

	// FDPE Single data rate DFF with async reset and posedge clock enable
	FDPE #(
		.INIT(1'b1)
	) fdpe_inst
	(
		.Q(reset_out),
		.C(clock),
		.CE(clock_en),
		.PRE(async_reset_in),
		.D(1'b0)
	);

endmodule
