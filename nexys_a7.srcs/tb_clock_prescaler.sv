`include "timescale.sv"
module tb_clock_prescaler;
	logic clock;
	logic reset;
	logic clock_en;
	logic [3:0] clock_out_en;

	clock_prescaler #(
		.COUNTER_WIDTH(4)
	) uut (.*);

	initial begin
		clock <= 1'b0;
		reset <= 1'b0;
		clock_en <= 1'b0;
		#2 reset <= 1'b1;
		#10 reset <= 1'b0;
		#30 clock_en <= 1'b1;
		#200 clock_en <= 1'b0;
		#10 clock_en <= 1'b1;
		#30 clock_en <= 1'b0;
	end
	always #5 clock <= ~clock;
endmodule
