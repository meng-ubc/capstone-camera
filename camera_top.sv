module camera_top(	input CLOCK_50,
					output logic [7:0] VGA_R, VGA_G, VGA_B,
					output logic VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N);
	
	logic clk, clk_25;
	assign clk = CLOCK_50;

	clock_divider cd1(	.in_clk	(clk),
						.reset	(0),
						.outclk	(clk_25));
	
	logic [9:0] temp1, temp2;
	logic [7:0] c1, c2, c3;
	logic t1, t2, t3;
	Graphics_Controller gc ( 1,1,8'b0,8'b0,8'b0,10'b0,10'b0, t1,t2,t3,c1,c2,c3,temp1,temp2);
	
endmodule