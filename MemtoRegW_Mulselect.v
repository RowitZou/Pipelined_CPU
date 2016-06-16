`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:17:14 05/18/2016 
// Design Name: 
// Module Name:    MemtoRegW_Mulselect 
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
module MemtoRegW_Mulselect(
   input MemtoRegW,
	input [31:0]ReadDataW,
	input [31:0]ALUOutW,
	output [31:0]ResultW
    );
 assign ResultW = (~MemtoRegW)?ALUOutW:ReadDataW;

endmodule
