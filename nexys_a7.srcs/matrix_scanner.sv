/*
 * Matrix Scanner with Programmable Global Intensity
 * This can be used to drive an LED matrix or segment display.
 */
`include "timescale.sv"

module matrix_scanner #(
	parameter integer unsigned DIG_COUNTER_WIDTH = 3,
	parameter integer unsigned INTEN_COUNTER_WIDTH = 4,
	parameter integer unsigned SEG_WIDTH = 8
)
(
	input clock,
	input reset,
	input clock_en,
	input [INTEN_COUNTER_WIDTH-1:0] inten,
	input [SEG_WIDTH-1:0] seg [0:2**DIG_COUNTER_WIDTH-1],
	output logic [2**DIG_COUNTER_WIDTH-1:0] dig_out,
	output logic [SEG_WIDTH-1:0] seg_out
);
	logic [INTEN_COUNTER_WIDTH-1:0] inten_counter;
	logic [DIG_COUNTER_WIDTH-1:0] dig_counter;
	logic [INTEN_COUNTER_WIDTH-1:0] inten_d;

	always_ff @(posedge clock) begin
		priority if (reset) begin
			dig_counter <= '0;
			inten_counter <= '0;
			dig_out <= '0;
			seg_out <= '0;
			inten_d <= '0;

		end else if (clock_en) begin
			inten_counter <= inten_counter + 1'b1;
			dig_out <= '1;
			dig_out[dig_counter] <= (inten_counter <= inten_d)? 1'b0 : 1'b1;
			seg_out <= seg[dig_counter];
			if (inten_counter == '1) begin
				dig_counter <= dig_counter + 1'b1;
				inten_d <= inten;
			end
		end else begin
			// intentionally left blank
		end
	end
endmodule
