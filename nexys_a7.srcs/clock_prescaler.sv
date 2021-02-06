`include "timescale.sv"
/*
 * Prescale a clock enable by powers of 2.
 * The output clock enable lasts for 1 clock cycle.
 *     clock_out_en[0] = clock_en
 *     clock_out_en[1] = clock_en/2
 *     clock_out_en[2] = clock_en/4
 *     ... and so on
 */
module clock_prescaler #(
	parameter integer unsigned COUNTER_WIDTH = 8
)
(
	input logic clock,      // input clock
	input logic reset,      // synchronous reset
	input logic clock_en,   // clock enable to prescale
	// prescaled clock enable
	output logic [COUNTER_WIDTH-1:0] clock_out_en
);
	/*
	 * The period of a higher bit of the free-running counter is twice the lower bit. The bits of
	 * the counter is XOR masked with the output of the last clock cycle so that the output enable
	 * signal only lasts 1 clock cycle.
	 */
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
