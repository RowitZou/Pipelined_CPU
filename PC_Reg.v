`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:04:41 05/17/2016 
// Design Name: 
// Module Name:    PC_Reg 
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
module PC_Reg(
   input clk,
	input rst_n,
	input [6:0]PCin,
	input StallF,
	output reg [6:0]PCF
    );
	 
always@(posedge clk or negedge rst_n)
begin
  if(~rst_n)
    PCF <= 7'd0;
  else
  begin
    if(~StallF)  PCF <= PCin;
  end
end

endmodule
