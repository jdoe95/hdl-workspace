/*
 * Test bench file for Matrix Display Scanner
 */
module tb_matrix_disp_scanner;
	logic clock;
	logic reset;
	logic clock_en;
	logic [1:0] inten_in;
	logic [7:0] line_data_in [0:7];
	logic [7:0] line_data_out;
	logic [0:7] line_select_out;

	matrix_disp_scanner #(
		.SEL_COUNTER_WIDTH(3),
		.DATA_WIDTH(8),
		.INTEN_COUNTER_WIDTH(2),
		.SEL_ACT_LEVEL(1'b0),
		.SEL_INACT_LEVEL(1'b1),
		.SEL_RESET_LEVEL(1'b1),
		.DATA_RESET_LEVEL(1'b1)
	) uut (.*);

	initial begin
		clock <= 1'b0;
		reset <= 1'b0;
		clock_en <= 1'b0;
		inten_in <= 'b0;
		line_data_in <= {8'h11, 8'h22, 8'h33, 8'h44, 8'h55, 8'h66, 8'h77, 8'h88};
		#40 clock_en <= 1'b1;
		#2 reset <= 1'b1;
		#10 reset <= 1'b0;
		#420 inten_in <= 'd2;
		#420 inten_in <= 'd3;
	end

	always #5 clock <= ~clock;
endmodule
