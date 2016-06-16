`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:20:15 05/18/2016 
// Design Name: 
// Module Name:    ForwardAE_Mulselect 
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
module ForwardAE_Mulselect(
   input [31:0]RD1_out,
	input [31:0]ALUOutM,
	input [31:0]ResultW,
   input [1:0]ForwardAE,
	output [31:0]SrcAE
);

  assign SrcAE = (ForwardAE==2'd0)?RD1_out:(ForwardAE==2'd1)?ResultW:ALUOutM;
endmodule
