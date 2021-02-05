`include "timescale.sv"
module toggler
(
	input logic clock,
	input logic reset,
	input logic clock_en,
	input logic toggle_en,
	output logic out
);
	always_ff @(posedge clock) begin
		priority if (reset)
			out <= 1'b0;
		else if (clock_en && toggle_en)
			out <= ~out;
		else begin
			// intentionally left blank
		end
	end
endmodule
