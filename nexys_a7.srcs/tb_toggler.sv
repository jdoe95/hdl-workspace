`include "timescale.sv"
module tb_toggler;
	logic clock;
	logic reset;
	logic clock_en;
	logic toggle_en;
	logic out;

	initial begin
		clock <= 1'b0;
		reset <= 1'b0;
		clock_en <= 1'b0;
		toggle_en <= 1'b0;

		#2 reset <= 1'b1;
		#10 reset <= 1'b0;
		#30 toggle_en <= 1'b1;
		#30 clock_en <= 1'b1;
		#100 clock_en <= 1'b0;
		#30 toggle_en <= 1'b0;
		#30 clock_en <= 1'b1;
		#100 clock_en <= 1'b0;
	end

	always #5 clock <= ~clock;

	toggler toggler_inst (.*);

endmodule
