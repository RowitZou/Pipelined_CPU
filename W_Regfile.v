`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:09:48 05/18/2016 
// Design Name: 
// Module Name:    W_RegFile 
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
module W_RegFile(
   input clk,
	input RegWriteM,
	input MemtoRegM,
	input [31:0]RD,
	input [31:0]ALUOutM,
	input [4:0]WriteRegM,
	output reg RegWriteW,
	output reg MemtoRegW,
	output reg [31:0]ReadDataW,
	output reg [31:0]ALUOutW,
	output reg [4:0]WriteRegW
    );
always@(posedge clk)
begin
   RegWriteW <= RegWriteM;
	MemtoRegW <= MemtoRegM;
   ReadDataW <= RD;
	ALUOutW   <= ALUOutM;
	WriteRegW <= WriteRegM;
end

endmodule
