`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:28:30 05/18/2016 
// Design Name: 
// Module Name:    ForwardBE_Mulselect 
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
module ForwardBE_Mulselect(
   input [31:0]RD2_out,
	input [31:0]ALUOutM,
	input [31:0]ResultW,
   input [1:0]ForwardBE,
	output [31:0]RD2_outE
);

  assign RD2_outE = (ForwardBE==2'd0)?RD2_out:(ForwardBE==2'd1)?ResultW:ALUOutM;
endmodule
