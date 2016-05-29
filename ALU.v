`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:31 03/22/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
  input  [31:0]alu_a,
  input  [31:0]alu_b,
  input        [4:0]alu_op,
  output   reg [31:0]alu_out
    );
 
 parameter A_NOP=5'h00;
 parameter A_ADD=5'h01;
 parameter A_SUB=5'h02;
 parameter A_AND=5'h03;
 parameter A_OR =5'h04;
 parameter A_XOR=5'h05;
 parameter A_NOR=5'h06;
 parameter A_ADDU=5'h07;
 parameter A_SUBU=5'h08;
 parameter A_LL  =5'h09;
 parameter A_RR  =5'h0A;
 parameter A_RRU =5'h0B;
 parameter A_SMALL=5'h0C;
 parameter A_SMALLU=5'h0D;
 parameter A_LUI  =5'h0E;
 
 wire signed [31:0]alu_A_signed;
 wire signed [31:0]alu_B_signed;
 
 assign alu_A_signed = alu_a;
 assign alu_B_signed = alu_b;
 
 always @(*)
 begin
 case(alu_op)
	A_ADD:  alu_out=alu_A_signed+alu_B_signed;
	A_SUB:  alu_out=alu_A_signed-alu_B_signed;
	A_AND:  alu_out=alu_a&alu_b;
	A_OR:   alu_out=alu_a|alu_b;
	A_XOR:  alu_out=alu_a^alu_b;
	A_NOR:  alu_out=~(alu_a|alu_b);
	A_ADDU: alu_out=alu_a+alu_b;
	A_SUBU: alu_out=alu_a-alu_b;
	A_LL:   alu_out=alu_b<<alu_a;
	A_RR:   alu_out=alu_b>>>alu_a;
	A_RRU:  alu_out=alu_b>>alu_a;
	A_SMALL:alu_out=(alu_A_signed<alu_B_signed)?32'd1:32'd0;
	A_SMALLU:  alu_out=(alu_a<alu_b)?32'd1:32'd0;
	A_LUI:  alu_out=alu_b<<16;
	default: alu_out=32'b0;
 endcase
 end
endmodule
