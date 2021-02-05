`include "timescale.sv"
module tb_clock_provider;
	logic clock_in;
	logic clock_out0;
	logic clock_out1;
	logic clock_ready;

	initial clock_in <= 1'b0;
	always #10 clock_in <= ~clock_in;

	clock_provider clock_provider_inst (.*);
endmodule
