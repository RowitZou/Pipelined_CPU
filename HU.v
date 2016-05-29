module HU(
   input rst_n,
   input [1:0]BranchD,
	input [4:0]RsD,
	input [4:0]RtD,
	input [4:0]RtE,
	input [4:0]RsE,
	input [4:0]WriteRegE,
	input MemtoRegE,
	input RegWriteE,
	input MemtoRegM,
	input RegWriteM,
	input RegWriteW,
	input [4:0]WriteRegM,
	input [4:0]WriteRegW,
	input [1:0]PCSrcD,
	output StallF,
	output StallD,
	output [1:0]ForwardAD,
	output [1:0]ForwardBD,
	output FlushE,
	output [1:0]ForwardAE,
	output [1:0]ForwardBE
    );
 
 assign ForwardAE = (RegWriteM&&WriteRegM==RsE)?2'b10:(RegWriteW&&WriteRegW==RsE)?2'b01:2'b00;
 assign ForwardBE = (RegWriteM&&WriteRegM==RtE)?2'b10:(RegWriteW&&WriteRegW==RtE)?2'b01:2'b00;
 assign StallF    = ((MemtoRegE&&(RtE==RsD||RtE==RtD))||((BranchD==2'd1||BranchD==2'd2)&&(RegWriteE||(MemtoRegM&&RegWriteM))&&(WriteRegE==RsD||WriteRegE==RtD)))?1:0;
 assign StallD    =  (~rst_n||StallF)?1:0;
 assign FlushE    =  (PCSrcD==2'd0)?0:1;
 assign ForwardAD = ((BranchD==2'd1||BranchD==2'd2)&&RegWriteM&&WriteRegM==RsD)?2'd1:((BranchD==2'd1||BranchD==2'd2)&&RegWriteW&&WriteRegW==RsD)?2'd2:2'd0;
 assign ForwardBD = ((BranchD==2'd1||BranchD==2'd2)&&RegWriteM&&WriteRegM==RtD)?2'd1:((BranchD==2'd1||BranchD==2'd2)&&RegWriteW&&WriteRegW==RsD)?2'd2:2'd0;
endmodule
