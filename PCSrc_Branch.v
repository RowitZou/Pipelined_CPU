`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:45 05/17/2016 
// Design Name: 
// Module Name:    PCSrc_Branch 
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
module PCSrc_Branch(
   input rst_n,
   input signed [31:0]r1_dout,
	input signed [31:0]r2_dout,
	input [5:0]ins,
	input [5:0]Funct,
	input [4:0]bgez,
	input StallF,
	output reg [1:0]PCSrc,
	output reg [1:0]BranchD
    );
 wire EqualD;

 assign EqualD = (r1_dout==r2_dout)?1:0;

 always@(*)
 begin
    if(~rst_n)  PCSrc = 2'd0;
	 else
	   begin
	    case(ins)
		 6'h01: begin if(StallF) PCSrc = 2'd0; else if((bgez==5'd1&&r1_dout>=32'd0)||(bgez==5'd0&&r1_dout<32'd0)) PCSrc = 2'd1; else PCSrc = 2'd0; end
		 6'h00: begin if(StallF) PCSrc = 2'd0; else if(Funct==6'h08)  PCSrc = 2'd2; else PCSrc = 2'd0; end
		 6'h04: begin if(StallF) PCSrc = 2'd0; else if(EqualD) PCSrc = 2'd1; else PCSrc = 2'd0; end
		 6'h05: begin if(StallF) PCSrc = 2'd0; else if(EqualD) PCSrc = 2'd0; else PCSrc = 2'd1; end
		 6'h06: begin if(StallF) PCSrc = 2'd0; else if(r1_dout<=32'd0) PCSrc = 2'd1; else PCSrc = 2'd0; end
	    6'h07: begin if(StallF) PCSrc = 2'd0; else if(r1_dout>32'd0) PCSrc = 2'd1; else PCSrc = 2'd0; end
		 6'h02: PCSrc = 2'd3;
		 default: PCSrc = 2'd0;
		 endcase
		end
 end
 
 always@(*)
 begin
   if(~rst_n)  BranchD = 2'd0;
	else
	 begin
    case(ins)
	 6'h01:  BranchD = 2'd1;
	 6'h04:  BranchD = 2'd1;
	 6'h05:  BranchD = 2'd1;
	 6'h06:  BranchD = 2'd1;
    6'h07:  BranchD = 2'd1;
	 6'h00: begin if(Funct==6'h08) BranchD = 2'd2; else BranchD = 2'd0; end
	 6'h02: BranchD = 2'd3;
    default: BranchD = 2'd0;
	 endcase
	 end
 end

endmodule
