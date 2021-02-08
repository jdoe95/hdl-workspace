/*
 * Matrix Display Scanner With Global Intensity
 * The module outputs line select and line data. Line select controls which line in the display is
 * active and line data controls the dots to be activated for the line. The number of lines can only
 * be a multiple of 2.
 */
`include "timescale.sv"

module matrix_disp_scanner #(
	/*
	 * Width of the counter identifying display lines.
	 * The number of lines in the display is 2 to the power of LINE_COUNTER_WIDTH
	 *   i.e. LINE_COUNTER_WIDTH of 3 drives 8 lines (0-7)
	 */
	parameter integer unsigned SEL_COUNTER_WIDTH = 3,

	/*
	 * Number of dots in each line.
	 */
	parameter integer unsigned DATA_WIDTH = 8,

	/*
	 * Width of the counter for controlling global intensity.
	 */
	parameter integer unsigned INTEN_COUNTER_WIDTH = 8,

	/*
	 * Output drive signals for the matrix display line select and line data.
	 */
	parameter logic SEL_ACT_LEVEL = 1'b0,
	parameter logic SEL_INACT_LEVEL = 1'bz,
	parameter logic SEL_RESET_LEVEL = 1'bz,
	parameter logic DATA_RESET_LEVEL = 1'bz
)
(
	input clock,

	/*
	 * Synchronous reset
	 * When in reset, the scanning is stopped and all outputs are held at their inactive state. The
	 * line counter is reset to line 0. This can be used to hold the module in an off state.
	 * The module restarts scanning on the first rising edge after reset is released.
	 */
	input reset,

	/*
	 * Synchronous clock enable
	 * The scan is paused when this signal is inactive. This can be used to control the scanning
	 * frequency.
	 */
	input clock_en,

	/*
	 * Line data for lines (0-7)
	 * The data is sampled on the clock rising edge when clock enable is active.
	 */
	input [DATA_WIDTH-1:0] line_data_in [0:2**SEL_COUNTER_WIDTH-1],

	/*
	 * Global intensity
	 * The intensity value is sampled on the clock rising edge clock enable is active.
	 */
	input [INTEN_COUNTER_WIDTH-1:0] inten_in,

	/*
	 * Line select and line data outputs (connected to the display).
	 */
	output logic [DATA_WIDTH-1:0] line_data_out,
	output logic [0:2**SEL_COUNTER_WIDTH-1] line_select_out
);
	logic [SEL_COUNTER_WIDTH-1:0] sel_counter;
	logic [INTEN_COUNTER_WIDTH-1:0] inten_counter;

	always_ff @(posedge clock) begin
		priority if (reset) begin
			line_data_out <= {DATA_WIDTH{DATA_RESET_LEVEL}};
			line_select_out <= {(2**SEL_COUNTER_WIDTH){SEL_RESET_LEVEL}};
			sel_counter <= '1;
			inten_counter <= '1;

		end else if (clock_en) begin
			inten_counter <= inten_counter + 1'b1;

			priority if (inten_counter == '1) begin
				sel_counter <= sel_counter + 1'b1;
				line_data_out <= line_data_in[sel_counter + 1'b1];
				line_select_out <= {2**SEL_COUNTER_WIDTH{SEL_INACT_LEVEL}};
				line_select_out[sel_counter + 1'b1] <= SEL_ACT_LEVEL;

			end else if (inten_counter == inten_in)
				line_select_out <= {2**SEL_COUNTER_WIDTH{SEL_INACT_LEVEL}};

			else begin
				// intentionally left blank
			end
		end else begin
			// intentinoally left blank
		end
	end
endmodule
