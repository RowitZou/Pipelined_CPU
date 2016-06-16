`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:11 05/17/2016 
// Design Name: 
// Module Name:    ForwardBD_Mulselect 
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
module ForwardBD_Mulselect(
    input [1:0]ForwardBD,
	 input [31:0]ALUOutM,
	 input [31:0]RD2,
	 input [31:0]ResultW,
	 output [31:0]r2_out
    );
	 
 assign r2_out = (ForwardBD==2'd0)?RD2:(ForwardBD==2'd1)?ALUOutM:ResultW;


endmodule
