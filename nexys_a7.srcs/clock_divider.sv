`include "timescale.sv"
/*
 * Clock Divider
 * Divides clock by (period + 1) cycles.
 */
module clock_divider #(
	parameter integer unsigned COUNTER_WIDTH = 8
)
(
	input logic clock,
	input logic reset,
	input logic clock_in_en,
	input logic [COUNTER_WIDTH-1:0] period,
	output logic clock_out_en
);
	logic [COUNTER_WIDTH-1:0] counter;

	always_ff @(posedge clock) begin
		if (reset) begin
			counter <= 'b0;
			clock_out_en <= 1'b0;
		end else if (clock_in_en) begin
			counter <= counter + 1'b1;
			clock_out_en <= 1'b0;
			if (counter == period) begin
				counter <= 'b0;
				clock_out_en <= 1'b1;
			end
		end else begin
			// intentionally left blank
		end
	end
endmodule
