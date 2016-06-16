`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:20:28 05/17/2016 
// Design Name: 
// Module Name:    E_RegFile 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module E_RegFile(
   input clk,
	input FlushE,
	input RegWriteD,
	input MemtoRegD,
	input MemWriteD,
	input [3:0]ALUControlD,
	input ALUSrcD,
	input RegDstD,
	input [31:0]RD1,
	input [31:0]RD2,
	input [4:0]RsD,
	input [4:0]RtD,
	input [4:0]RdD,
	input [15:0]extend,
	output reg RegWriteE,
	output reg MemtoRegE,
	output reg MemWriteE,
	output reg [3:0]ALUControlE,
	output reg ALUSrcE,
	output reg RegDstE,
	output reg [31:0]RD1_out,
	output reg [31:0]RD2_out,
	output reg [4:0]RsE,
	output reg [4:0]RtE,
	output reg [4:0]RdE,
	output reg [15:0]extend_out
    );
	 
	always@(posedge clk)
	begin
	   if(FlushE)
		  begin 
		    RegWriteE <= 0;
			 MemtoRegE <= 0;
		    MemWriteE <= 0;
			 ALUControlE <= 4'd0;
			 ALUSrcE   <= 0;
			 RegDstE   <= 0;
			 RD1_out   <= 32'd0;
			 RD2_out   <= 32'd0;
			 RsE       <= 5'd0;
			 RtE       <= 5'd0;
			 RdE       <= 5'd0;
			 extend_out<= 16'h0;
		  end
	  else
	     begin
		    RegWriteE <= RegWriteD;
			 MemtoRegE <= MemtoRegD;
		    MemWriteE <= MemWriteD;
			 ALUControlE <= ALUControlD;
			 ALUSrcE   <= ALUSrcD;
			 RegDstE   <= RegDstD;
			 RD1_out   <= RD1;
			 RD2_out   <= RD2;
			 RsE       <= RsD;
			 RtE       <= RtD;
			 RdE       <= RdD;
			 extend_out<= extend;
		  end
	end


endmodule
