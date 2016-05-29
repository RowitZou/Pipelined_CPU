`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:40:54 05/18/2016 
// Design Name: 
// Module Name:    Pipelined_CPU 
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
module Pipelined_CPU(
   input clk,
	input rst_n
    );
	 
  wire [1:0]PCSrcD;
  wire [6:0]PCF;
  wire [1:0]BranchD;
  wire [6:0]PCBranchD;
  wire [6:0]PCin;
  wire StallF;
  wire StallD;
  wire [31:0]ins;
  wire [31:0]insD;
  wire  [6:0]PC_plus1D;
  wire RegWriteD;
  wire MemtoRegD;
  wire MemWriteD;
  wire [3:0]ALUControlD;
  wire ALUSrcD;
  wire RegDstD;
  wire [4:0]WriteRegW;
  wire [31:0]ResultW;
  wire [31:0]RD1;
  wire [31:0]RD2;
  wire [31:0]r1_out;
  wire [31:0]r2_out;
  wire [1:0]ForwardAD;
  wire [1:0]ForwardBD;
  wire [1:0]ForwardAE;
  wire [1:0]ForwardBE;
  wire [31:0]ALUOutM;
  wire FlushE;
  wire RegWriteE;
  wire MemtoRegE;
  wire MemWriteE;
  wire [3:0]ALUControlE;
  wire ALUSrcE;
  wire RegDstE;
  wire [31:0]RD1_out;
  wire [31:0]RD2_out;
  wire [4:0]RsE;
  wire [4:0]RtE;
  wire [4:0]RdE;
  wire [15:0]extend_out;
  wire [4:0]WriteRegE;
  wire [31:0]SrcAE;
  wire [31:0]SrcBE;
  wire [31:0]RD2_outE;
  wire [31:0]alu_out;
  wire RegWriteM;
  wire MemtoRegM;
  wire MemWriteM;
  wire [31:0]WriteDataM;
  wire [4:0]WriteRegM;
  wire [31:0]RD;
  wire RegWriteW;
  wire [31:0]ReadDataW;
  wire [31:0]ALUOutW;
  wire MemtoRegW;
  wire [4:0]ALUControlE_modify;
  
  assign ALUControlE_modify[4:4] = 0;
  assign ALUControlE_modify[3:0] = ALUControlE;
  
  PCSrcD_Mulselect PCSrcD_Mulselect(.PCSrcD(PCSrcD),.PC_plus1F(PCF+7'b0000001),.PC_BranchD(PCBranchD),.ins_extend(insD[6:0]),.JR(r1_out[6:0]),.PC(PCin));
  PC_Reg PC_Reg(.clk(clk),.rst_n(rst_n),.PCin(PCin),.StallF(StallF),.PCF(PCF));
  ROM ROM(.a(PCF),.spo(ins));
  
  D_RegFile D_RegFile(.clk(clk),.ins(ins),.StallD(StallD),.PC_plus1F(PCF+7'd1),.PCSrcD(PCSrcD),.insD(insD),.PC_plus1D(PC_plus1D));
  CU CU(.Op(insD[31:26]),.rst_n(rst_n),.Funct(insD[5:0]),.RegWriteD(RegWriteD),.MemtoRegD(MemtoRegD),.MemWriteD(MemWriteD),.ALUControlD(ALUControlD),.ALUSrcD(ALUSrcD),.RegDstD(RegDstD));
  REG Reg(.clk(~clk),.rst_n(rst_n),.r1_addr(insD[25:21]),.r2_addr(insD[20:16]),.r3_addr(WriteRegW),.r3_din(ResultW),.r3_wr(RegWriteW),.r1_dout(RD1),.r2_dout(RD2));
  ForwardAD_Mulselect ForwardAD_Mulselect(.ForwardAD(ForwardAD),.ALUOutM(ALUOutM),.RD1(RD1),.ResultW(ResultW),.r1_out(r1_out));
  ForwardBD_Mulselect ForwardBD_Mulselect(.ForwardBD(ForwardBD),.ALUOutM(ALUOutM),.RD2(RD2),.ResultW(ResultW),.r2_out(r2_out));
  PCSrc_Branch PCSrc_Branch(.rst_n(rst_n),.r1_dout(r1_out),.r2_dout(r2_out),.Funct(insD[5:0]),.bgez(insD[20:16]),.StallF(StallF),.ins(insD[31:26]),.PCSrc(PCSrcD),.BranchD(BranchD));
  PC_Plus_Module PC_Plus_Module(.PC_Plus1D(PC_plus1D),.ins_extend(insD[6:0]),.PCBranchD(PCBranchD));
  
  E_RegFile E_RegFile(.clk(clk),.FlushE(FlushE),.RegWriteD(RegWriteD),.MemtoRegD(MemtoRegD),.MemWriteD(MemWriteD),.ALUControlD(ALUControlD),.ALUSrcD(ALUSrcD),.RegDstD(RegDstD),.RD1(RD1),.RD2(RD2),.RsD(insD[25:21]),.RtD(insD[20:16]),.RdD(insD[15:11]),.extend(insD[15:0]),.RegWriteE(RegWriteE),.MemtoRegE(MemtoRegE),.MemWriteE(MemWriteE),.ALUControlE(ALUControlE),.ALUSrcE(ALUSrcE),.RegDstE(RegDstE),.RD1_out(RD1_out),.RD2_out(RD2_out),.RsE(RsE),.RtE(RtE),.RdE(RdE),.extend_out(extend_out));
  RegDstE_Mulselect RegDstE_Mulselect(.RtE(RtE),.RdE(RdE),.RegDstE(RegDstE),.WriteRegE(WriteRegE));
  ForwardAE_Mulselect ForwardAE_Mulselect(.RD1_out(RD1_out),.ALUOutM(ALUOutM),.ResultW(ResultW),.ForwardAE(ForwardAE),.SrcAE(SrcAE));
  ForwardBE_Mulselect ForwardBE_Mulselect(.RD2_out(RD2_out),.ALUOutM(ALUOutM),.ResultW(ResultW),.ForwardBE(ForwardBE),.RD2_outE(RD2_outE));
  ALUSrcE_Mulselect ALUSrcE_Mulselect(.RD2_outE(RD2_outE),.extend_out(extend_out),.ALUSrcE(ALUSrcE),.SrcBE(SrcBE));
  ALU ALU(.alu_a(SrcAE),.alu_b(SrcBE),.alu_op(ALUControlE_modify),.alu_out(alu_out));
  
  M_RegFile M_RegFile(.clk(clk),.RegWriteE(RegWriteE),.MemtoRegE(MemtoRegE),.MemWriteE(MemWriteE),.alu_out(alu_out),.WriteDataE(RD2_outE),.WriteRegE(WriteRegE),.RegWriteM(RegWriteM),.MemtoRegM(MemtoRegM),.MemWriteM(MemWriteM),.ALUOutM(ALUOutM),.WriteDataM(WriteDataM),.WriteRegM(WriteRegM));
  RAM RAM(.a(ALUOutM[8:2]),.d(WriteDataM),.we(MemWriteM),.clk(clk),.spo(RD));
  
  W_RegFile W_RegFile(.clk(clk),.RegWriteM(RegWriteM),.MemtoRegM(MemtoRegM),.RD(RD),.ALUOutM(ALUOutM),.WriteRegM(WriteRegM),.RegWriteW(RegWriteW),.MemtoRegW(MemtoRegW),.ReadDataW(ReadDataW),.ALUOutW(ALUOutW),.WriteRegW(WriteRegW));
  MemtoRegW_Mulselect MemtoRegW_Mulselect(.MemtoRegW(MemtoRegW),.ReadDataW(ReadDataW),.ALUOutW(ALUOutW),.ResultW(ResultW));
  
  HU HU(.rst_n(rst_n),.BranchD(BranchD),.RsD(insD[25:21]),.RtD(insD[20:16]),.RtE(RtE),.RsE(RsE),.PCSrcD(PCSrcD),.WriteRegE(WriteRegE),.MemtoRegE(MemtoRegE),.RegWriteE(RegWriteE),.MemtoRegM(MemtoRegM),.RegWriteM(RegWriteM),.RegWriteW(RegWriteW),.WriteRegM(WriteRegM),.WriteRegW(WriteRegW),.StallF(StallF),.StallD(StallD),.ForwardAD(ForwardAD),.ForwardBD(ForwardBD),.FlushE(FlushE),.ForwardAE(ForwardAE),.ForwardBE(ForwardBE));
endmodule
