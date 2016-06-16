`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:12:59 05/17/2016 
// Design Name: 
// Module Name:    PC_Plus_Module 
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
module PC_Plus_Module(
   input signed [6:0]PC_Plus1D,
	input signed [6:0]ins_extend,
	output [6:0]PCBranchD
    );
 assign PCBranchD = PC_Plus1D + ins_extend;

endmodule
