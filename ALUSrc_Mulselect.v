module ALUSrcE_Mulselect(
   input [31:0]RD2_outE,
	input [15:0]extend_out,
	input ALUSrcE,
	output [31:0]SrcBE
    );

assign SrcBE[15:0] = (~ALUSrcE)?RD2_outE[15:0]:extend_out;
assign SrcBE[31:16]= (~ALUSrcE)?RD2_outE[31:16]:(extend_out[15:15]==0)?16'h0000:16'hFFFF;

endmodule
