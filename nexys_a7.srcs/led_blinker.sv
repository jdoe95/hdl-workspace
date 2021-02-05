module led_blinker #(
	parameter integer unsigned COUNTER_WIDTH = 8
)
(
	input logic clock,
	input logic reset,
	output logic led_out,
	input logic [COUNTER_WIDTH-1:0] period
);
	logic [COUNTER_WIDTH-1:0] counter;

	always_ff @(posedge clock) begin
		priority if (reset) begin
			counter <= 'b0;
			led_out <= 1'b0;
		end else begin
			counter <= counter + 1'b1;
			if (counter == period) begin
				counter <= 'b0;
				led_out <= ~led_out;
			end
		end
	end
endmodule
