`include "timescale.sv"
module tb_reset_provider;
	logic clock;
	logic clock_en;
	logic reset_out;
	logic async_reset_in;

	reset_provider reset_provider_inst (.*);

	initial begin
		clock <= 1'b0;
		clock_en <= 1'b0;
		async_reset_in <= 1'b0;
		#22 clock_en <= 1'b1;
		#52 async_reset_in <= 1'b1;
		#72 async_reset_in <= 1'b0;
	end

	always #5 clock <= ~clock;

endmodule
