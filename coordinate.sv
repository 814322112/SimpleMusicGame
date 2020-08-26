module coordinate(clk,reset,upBound,lowBound,leftBound,rightBound);
	input logic clk,reset;
	output logic signed [12:0] upBound [0:15];
	output logic signed [12:0] lowBound [0:15];
	output logic signed [12:0] leftBound [0:3];
	output logic signed [12:0] rightBound [0:3];
	
	logic signed [6:0] i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16;
	
	logic signed [12:0] mem1 [0:9];
	logic signed [12:0] mem2 [0:9];
	logic signed [12:0] mem3 [0:9];
	logic signed [12:0] mem4 [0:9];
	logic signed [12:0] mem5 [0:9];
	logic signed [12:0] mem6 [0:9];
	logic signed [12:0] mem7 [0:9];
	logic signed [12:0] mem8 [0:9];
	logic signed [12:0] mem9 [0:9];
	logic signed [12:0] mem10 [0:9];
	logic signed [12:0] mem11 [0:9];
	logic signed [12:0] mem12 [0:9];
	logic signed [12:0] mem13 [0:9];
	logic signed [12:0] mem14 [0:9];
	logic signed [12:0] mem15 [0:9];
	logic signed [12:0] mem16 [0:9];
	
	parameter height = 30;
	parameter width = 100;
	
	genvar j,k;
	generate
		for (j = 0; j < 16; j++) begin: a
			assign lowBound[j] = upBound[j] + height;
			
		end
		for (k = 0; k < 4; k++) begin: b
			assign rightBound[k] = leftBound[k] + width;
		end
	endgenerate
	
	
	initial begin //filling the ROMs with data read from txt files.
	 $readmemb ("beats.txt", mem1);
	 $readmemb ("beats2.txt", mem2);
	 $readmemb ("beats3.txt", mem3);
	 $readmemb ("beats4.txt", mem4);
	 $readmemb ("beats5.txt", mem5);
	 $readmemb ("beats6.txt", mem6);
	 $readmemb ("beats7.txt", mem7);
	 $readmemb ("beats8.txt", mem8);
	 $readmemb ("beats9.txt", mem9);
	 $readmemb ("beats10.txt", mem10);
	 $readmemb ("beats11.txt", mem11);
	 $readmemb ("beats12.txt", mem12);
	 $readmemb ("beats13.txt", mem13);
	 $readmemb ("beats14.txt", mem14);
	 $readmemb ("beats15.txt", mem15);
	 $readmemb ("beats16.txt", mem16);
	 end
	
	//assign position for the four columns of objects
	assign leftBound[0] = 200;
	assign leftBound[1] = 330;
	assign leftBound[2] = 460;
	assign leftBound[3] = 590;
	
	always_ff @(posedge clk) begin
		if(reset) begin
			//reset the counters
			{i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16} <= 0;
			//initial positions
			upBound[0] <= -40;
			upBound[1] <= -80;
			upBound[2] <= -240;
			upBound[3] <= -340;
			upBound[4] <= -10;
			upBound[5] <= -70;
			upBound[6] <= -270;
			upBound[7] <= -450;
			upBound[8] <= -20;
			upBound[9] <= -80;
			upBound[10] <= -350;
			upBound[11] <= -400;
			upBound[12] <= -40;
			upBound[13] <= -70;
			upBound[14] <= -130;
			upBound[15] <= -200;
		end 
		else begin 
			//*********First Column*********
			if (upBound[0] > -1000 & lowBound[0] < 470)
				upBound[0] <= upBound[0] + 1;
			else if (lowBound[0] == 470) begin
				if (i1 < 10) begin
					i1 <= i1+1;
					upBound[0] <= -1*mem1[i1-1];
				end
				else 
					upBound[0] <= -1000;
			end
			
			if (upBound[1] > -1000 & lowBound[1] < 470)
				upBound[1] <= upBound[1] + 1;
			else if (lowBound[1] == 470) begin
				if (i2 < 10) begin
					i2 <= i2+1;
					upBound[1] <= -1*mem2[i2-1];
				end
				else 
					upBound[1] <= -1000;
			end
			
			if (upBound[2] > -1000 & lowBound[2] < 470)
				upBound[2] <= upBound[2] + 1;
			else if (lowBound[2] == 470) begin
				if (i3 < 10) begin
					i3 <= i3+1;
					upBound[2] <= -1*mem3[i3-1];
				end
				else 
					upBound[2] <= -1000;
			end
			
			if (upBound[3] > -1000 & lowBound[3] < 470)
				upBound[3] <= upBound[3] + 1;
			else if (lowBound[3] == 470) begin
			if (i4 < 10) begin
				i4 <= i4+1;
				upBound[3] <= -1*mem4[i4-1];
			end
			else 
				upBound[3] <= -1000;
			end
			
			//*********Second Column*********
			if (upBound[4] > -1000 & lowBound[4] < 470)
				upBound[4] <= upBound[4] + 1;
			else if (lowBound[4] == 470) begin
				if (i5 < 10) begin
					i5 <= i5+1;
					upBound[4] <= -1*mem5[i5-1];
				end
				else 
					upBound[4] <= -1000;
			end
			
			if (upBound[5] > -1000 & lowBound[5] < 470)
				upBound[5] <= upBound[5] + 1;
			else if (lowBound[5] == 470) begin
				if (i6 < 10) begin
					i6 <= i6+1;
					upBound[5] <= -1*mem6[i6-1];
				end
				else 
					upBound[5] <= -1000;
			end
			
			if (upBound[6] > -1000 & lowBound[6] < 470)
				upBound[6] <= upBound[6] + 1;
			else if (lowBound[6] == 470) begin
				if (i7 < 10) begin
					i7 <= i7+1;
					upBound[6] <= -1*mem7[i7-1];
				end
				else 
					upBound[6] <= -1000;
			end
			
			if (upBound[7] > -1000 & lowBound[7] < 470)
				upBound[7] <= upBound[7] + 1;
			else if (lowBound[7] == 470) begin
			if (i8 < 10) begin
				i8 <= i8+1;
				upBound[7] <= -1*mem8[i8-1];
			end
			else 
				upBound[7] <= -1000;
			end
			
			//*********Third Column*********
			if (upBound[8] > -1000 & lowBound[8] < 470)
				upBound[8] <= upBound[8] + 1;
			else if (lowBound[8] == 470) begin
				if (i9 < 10) begin
					i9 <= i9+1;
					upBound[8] <= -1*mem9[i9-1];
				end
				else 
					upBound[8] <= -1000;
			end
			
			if (upBound[9] > -1000 & lowBound[9] < 470)
				upBound[9] <= upBound[9] + 1;
			else if (lowBound[9] == 470) begin
				if (i10 < 10) begin
					i10 <= i10+1;
					upBound[9] <= -1*mem10[i10-1];
				end
				else 
					upBound[9] <= -1000;
			end
			
			if (upBound[10] > -1000 & lowBound[10] < 470)
				upBound[10] <= upBound[10] + 1;
			else if (lowBound[10] == 470) begin
				if (i11 < 10) begin
					i11 <= i11+1;
					upBound[10] <= -1*mem11[i11-1];
				end
				else 
					upBound[10] <= -1000;
			end
			
			if (upBound[11] > -1000 & lowBound[11] < 470)
				upBound[11] <= upBound[11] + 1;
			else if (lowBound[11] == 470) begin
			if (i12 < 10) begin
				i12 <= i12+1;
				upBound[11] <= -1*mem12[i12-1];
			end
			else 
				upBound[11] <= -1000;
			end
			
			//*********Fourth Column*********
			if (upBound[12] > -1000 & lowBound[12] < 470)
				upBound[12] <= upBound[12] + 1;
			else if (lowBound[12] == 470) begin
				if (i13 < 10) begin
					i13 <= i13+1;
					upBound[12] <= -1*mem13[i13-1];
				end
				else 
					upBound[12] <= -1000;
			end
			
			if (upBound[13] > -1000 & lowBound[13] < 470)
				upBound[13] <= upBound[13] + 1;
			else if (lowBound[13] == 470) begin
				if (i14 < 10) begin
					i14 <= i14+1;
					upBound[13] <= -1*mem14[i14-1];
				end
				else 
					upBound[13] <= -1000;
			end
			
			if (upBound[14] > -1000 & lowBound[14] < 470)
				upBound[14] <= upBound[14] + 1;
			else if (lowBound[14] == 470) begin
				if (i15 < 10) begin
					i15 <= i15+1;
					upBound[14] <= -1*mem15[i15-1];
				end
				else 
					upBound[14] <= -1000;
			end
			
			if (upBound[15] > -1000 & lowBound[15] < 470)
				upBound[15] <= upBound[15] + 1;
			else if (lowBound[15] == 470) begin
			if (i16 < 10) begin
				i16 <= i16+1;
				upBound[15] <= -1*mem16[i16-1];
			end
			else 
				upBound[15] <= -1000;
			end
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