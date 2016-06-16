`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:58:58 05/17/2016 
// Design Name: 
// Module Name:    PCSrc_Mulselect 
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
module PCSrcD_Mulselect(
   input [1:0]PCSrcD,
   input [6:0]PC_plus1F,
	input [6:0]PC_BranchD,
	input [6:0]ins_extend,
	input [6:0]JR,
	output [6:0]PC
    );

assign PC = (PCSrcD==2'd0)?PC_plus1F:(PCSrcD==2'd1)?PC_BranchD:(PCSrcD==2'd2)?JR:ins_extend;
endmodule
