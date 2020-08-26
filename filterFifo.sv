module filterFifo(clk, reset, enable, in, out);
	
	parameter DATA_WIDTH = 24;
	parameter ADDR_WIDTH = 6;
	parameter DATA_DEPTH = 2**ADDR_WIDTH;
	
	input logic clk, reset, enable;
	input logic signed [DATA_WIDTH-1:0] in;
	output logic signed [DATA_WIDTH-1:0] out;
	
	logic [DATA_WIDTH-1:0] write_data, read_data;
	logic signed [DATA_WIDTH-1:0] accuIn;
	logic write_en, read_en,fifo_is_empty,fifo_is_full;
	logic [ADDR_WIDTH-1:0] words_used;
	
	
	Altera_UP_SYNC_FIFOSV #(.DATA_WIDTH(DATA_WIDTH), .DATA_DEPTH(DATA_DEPTH), .ADDR_WIDTH(ADDR_WIDTH)) 
	fifo (.write_en(enable),.*);
	
	always_comb begin
		write_data = in / DATA_DEPTH;
	   read_en = reset ? 0 : (words_used + 1 == DATA_DEPTH); //read when the fifo is full
	end
	
	always_ff @(posedge clk) begin
		if (reset) begin
			accuIn = write_data;
			out <= 0;
		end else if (read_en & enable) begin
			accuIn = write_data - read_data;
			out <= accuIn + out;
		end else if (~read_en & enable) begin
			accuIn = write_data;
			out <= accuIn;
		end
	end	
endmodule
	

`timescale 1ps/1ps
module filterFifo_testbench ();
	logic clk, reset, enable;
	logic signed [23:0] in;
	logic signed [23:0] out;
	
	filterFifo dut (.*);
	
	parameter CLOCK_PERIOD = 100;
	
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end	

	initial begin
		reset <= 1;              @(posedge clk);
										 @(posedge clk);
		reset <= 0; enable <= 1; in <= 64;@(posedge clk);
										          @(posedge clk);
										 in <= 32;@(posedge clk);
													 @(posedge clk);
													 @(posedge clk);
													 @(posedge clk);
													 @(posedge clk);
												    @(posedge clk);
													 @(posedge clk);
													 @(posedge clk);
													 @(posedge clk);
										 in<= 1024;@(posedge clk);
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


