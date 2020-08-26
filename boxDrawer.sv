module boxDrawer(clk,reset,H_cont,V_cont,iRed,iGreen,iBlue,oVGA_R,oVGA_G,oVGA_B);
	input logic clk,reset;
	input reg signed [12:0] H_cont, V_cont;
	input logic [7:0] iBlue,iGreen,iRed;
	
	output logic [7:0] oVGA_R,oVGA_G,oVGA_B;
	
	logic signed [12:0] upBound [0:15];
	logic signed [12:0] lowBound [0:15];
	logic signed [12:0] leftBound [0:3];
	logic signed [12:0] rightBound [0:3];
	
	parameter rate = 16;

	logic [31:0] divClk;
	
	clock_divider cdiv (.clock(clk), .divided_clocks(divClk));
	
	
	coordinate c (.clk(divClk[rate]), .*);
	
	assign row1 = (H_cont > leftBound[0] && H_cont < rightBound[0])
	&& ((V_cont > upBound[0] && V_cont < lowBound[0]) | 
			(V_cont > upBound[1] && V_cont < lowBound[1]) |
			(V_cont > upBound[2] && V_cont < lowBound[2]) |
			(V_cont > upBound[3] && V_cont < lowBound[3]));
			
	
	assign row2 = (H_cont > leftBound[1] && H_cont < rightBound[1])
	&& ((V_cont > upBound[4] && V_cont < lowBound[4]) | 
			(V_cont > upBound[5] && V_cont < lowBound[5]) |
			(V_cont > upBound[6] && V_cont < lowBound[6]) |
			(V_cont > upBound[7] && V_cont < lowBound[7]));
	
	assign row3 = (H_cont > leftBound[2] && H_cont < rightBound[2])
	&& ((V_cont > upBound[8] && V_cont < lowBound[8]) | 
			(V_cont > upBound[9] && V_cont < lowBound[9]) |
			(V_cont > upBound[10] && V_cont < lowBound[10]) |
			(V_cont > upBound[11] && V_cont < lowBound[11]));
	
	assign row4 = (H_cont > leftBound[3] && H_cont < rightBound[3])
	&& ((V_cont > upBound[12] && V_cont < lowBound[12]) | 
			(V_cont > upBound[13] && V_cont < lowBound[13]) |
			(V_cont > upBound[14] && V_cont < lowBound[14]) |
			(V_cont > upBound[15] && V_cont < lowBound[15]));
	
	always_ff @(posedge clk) begin
		if (row1 | row2 | row3 | row4 |  V_cont == 450)	 begin
			oVGA_R <= 255;
			oVGA_G <= 255;
			oVGA_B <= 255;		
		end else begin
			oVGA_R <= iRed;
			oVGA_G <= iGreen;
			oVGA_B <= iBlue;                        
		end
	end
endmodule

module coordinate_testbench();
	logic clk,reset;
	logic signed [12:0] upBound [0:15];
	logic signed [12:0] lowBound [0:15];
	logic signed [12:0] leftBound [0:3];
	logic signed [12:0] rightBound [0:3];
	
	parameter CLOCK_PERIOD = 100;
	
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	coordinate dut (.*);
	
	initial begin
		reset <= 1; @(posedge clk);
		reset <= 0; @(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
						@(posedge clk);
		$stop;
	end
endmodule

module clock_divider (clock, divided_clocks);
 input logic clock;
 output logic [31:0] divided_clocks = 0;

 always_ff @(posedge clock) begin
 divided_clocks <= divided_clocks + 1;
 end

endmodule