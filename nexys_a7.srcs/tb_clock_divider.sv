`include "timescale.sv"
module tb_clock_divider;
	logic clock;
	logic reset;
	logic clock_in_en;
	logic [3:0] period;
	logic clock_out_en;

	clock_divider #(
		.COUNTER_WIDTH(4)
	) uut (.*);

	initial begin
		clock <= 1'b0;
		reset <= 1'b0;
		clock_in_en <= 1'b0;
		period <= 4'd0;
		#2 reset <= 1'b1;
		#10 reset <= 1'b0;
		#20 clock_in_en <= 1'b1;
		#50 period <= 4'd1;
		#100 period <= 4'd15;
	end

	always #5 clock <= ~clock;

endmodule
