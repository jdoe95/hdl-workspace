`include "timescale.sv"
module clock_divider_simple #(
	parameter integer unsigned COUNTER_WIDTH = 8
)
(
	input logic clock,
	input logic reset,
	input logic clock_en,
	output logic [COUNTER_WIDTH-1:0] clock_out_en
);
	logic [COUNTER_WIDTH-1:0] counter = 'b0;
	logic [COUNTER_WIDTH-1:0] xor_mask = 'b0;

	always_ff @(posedge clock) begin
		priority if (reset) begin
			counter <= 'b0;
			xor_mask <= 'b0;
			clock_out_en <= 'b0;
		end else if (clock_en) begin
			counter <= counter + 1'b1;
			clock_out_en <= counter ^ xor_mask;
			xor_mask <= counter;
		end else begin
			// intentionally left blank
		end
	end
endmodule
