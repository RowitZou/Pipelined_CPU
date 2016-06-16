`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:58 05/18/2016 
// Design Name: 
// Module Name:    M_RegFile 
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
module M_RegFile(
   input clk,
	input RegWriteE,
	input MemtoRegE,
   input MemWriteE,
   input [31:0]alu_out,
   input [31:0]WriteDataE,
   input [4:0]WriteRegE,
   output reg RegWriteM,
	output reg MemtoRegM,
   output reg MemWriteM,
   output reg [31:0]ALUOutM,
   output reg [31:0]WriteDataM,
   output reg [4:0]WriteRegM
    );

always@(posedge clk)
begin
          RegWriteM <= RegWriteE;
			 MemtoRegM <= MemtoRegE;
		    MemWriteM <= MemWriteE;
			 ALUOutM   <= alu_out;
			 WriteDataM<= WriteDataE;
			 WriteRegM <= WriteRegE;
end

endmodule
