`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:57:28 05/17/2016 
// Design Name: 
// Module Name:    ForwardAD_Mulselect 
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
module ForwardAD_Mulselect(
    input [1:0]ForwardAD,
	 input [31:0]ALUOutM,
	 input [31:0]RD1,
	 input [31:0]ResultW,
	 output [31:0]r1_out
    );
	 
 assign r1_out = (ForwardAD==2'd0)?RD1:(ForwardAD==2'd1)?ALUOutM:ResultW;


endmodule
