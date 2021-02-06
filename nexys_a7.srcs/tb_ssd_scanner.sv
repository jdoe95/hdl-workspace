`include "timescale.sv"
module tb_ssd_scanner;
	logic clock;
	logic reset;
	logic clock_en;
	logic [1:0] inten;
	logic [7:0] seg [0:7];
	logic [7:0] dig_out;
	logic [7:0] seg_out;

	ssd_scanner #(
		.DIG_COUNTER_WIDTH(3),
		.INTEN_COUNTER_WIDTH(2),
		.SEG_WIDTH(8)
	) uut (.*);

	initial begin
		clock <= 1'b0;
		reset <= 1'b0;
		clock_en <= 1'b0;
		inten <= 'b0;
		seg <= {8'h11, 8'h22, 8'h33, 8'h44, 8'h55, 8'h66, 8'h77, 8'h88};
		#40 clock_en <= 1'b1;
		#2 reset <= 1'b1;
		#10 reset <= 1'b0;
		#420 inten <= 'd2;
		#420 inten <= 'd3;
	end

	always #5 clock <= ~clock;
endmodule
