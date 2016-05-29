`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:24:36 05/18/2016 
// Design Name: 
// Module Name:    CU 
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
module CU(
   input [5:0]Op,
	input [5:0]Funct,
	input rst_n,
	output reg RegWriteD,
	output reg MemtoRegD,
	output reg MemWriteD,
	output reg [3:0]ALUControlD,
	output reg ALUSrcD,
	output reg RegDstD
    );

always@(*)
begin
   if(~rst_n)
	  begin
	    RegWriteD = 0;
	    MemtoRegD = 0;
	    MemWriteD = 0;
		 ALUControlD = 4'd0;
		 ALUSrcD = 0;
		 RegDstD = 0;
	  end
	else
	  begin
	    case(Op)
	    6'h00:  //R-Type
		    begin
			   case(Funct)
				  6'h20: //add
				    begin
					   RegWriteD = 1;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'd1;
		            ALUSrcD = 0;
		            RegDstD = 1;
		    		 end
				  6'h21: //addu
				    begin
					   RegWriteD = 1;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'h7;
		            ALUSrcD = 0;
		            RegDstD = 1;
					 end
				  6'h22://sub
				    begin
					   RegWriteD = 1;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'h2;
		            ALUSrcD = 0;
		            RegDstD = 1;
					 end
				  6'h23: //subu
				    begin
					   RegWriteD = 1;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'h8;
		            ALUSrcD = 0;
		            RegDstD = 1;
					 end
				  6'h24: //and
				    begin
					   RegWriteD = 1;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'h3;
		            ALUSrcD = 0;
		            RegDstD = 1;
					 end
				  6'h25: //or
				    begin
					   RegWriteD = 1;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'h4;
		            ALUSrcD = 0;
		            RegDstD = 1;
					 end
				  6'h27: //nor
				    begin
					   RegWriteD = 1;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'h6;
		            ALUSrcD = 0;
		            RegDstD = 1;
					 end
				  6'h26: //xor
				    begin
					   RegWriteD = 1;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'h5;
		            ALUSrcD = 0;
		            RegDstD = 1;
					 end
				  6'h04: //sllv
				    begin
					   RegWriteD = 1;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'h9;
		            ALUSrcD = 0;
		            RegDstD = 1;
					 end
				  6'h07: //srav
				    begin
					   RegWriteD = 1;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'hA;
		            ALUSrcD = 0;
		            RegDstD = 1;
					 end
				  6'h06: //srlv
				    begin
					   RegWriteD = 1;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'hB;
		            ALUSrcD = 0;
		            RegDstD = 1;
					 end
				  6'h2A:  //slt
				    begin
					   RegWriteD = 1;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'hC;
		            ALUSrcD = 0;
		            RegDstD = 1;
					 end
				  6'h2B:  //sltu
				    begin
					   RegWriteD = 1;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'hD;
		            ALUSrcD = 0;
		            RegDstD = 1;
					 end
				  6'h08: //jr
				    begin
					   RegWriteD = 0;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'h0;
		            ALUSrcD = 0;
		            RegDstD = 0;
					 end
				  default:
				    begin
					   RegWriteD = 0;
	               MemtoRegD = 0;
	               MemWriteD = 0;
		            ALUControlD = 4'h0;
		            ALUSrcD = 0;
		            RegDstD = 0;
					 end
			   endcase
			 end
	    6'h08:  //addi
		    begin
			   RegWriteD = 1;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'd1;
		      ALUSrcD = 1;
		      RegDstD = 0;
			 end
		 6'h0D:  //ori
		    begin
			   RegWriteD = 1;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'd4;
		      ALUSrcD = 1;
		      RegDstD = 0;
			 end
		 6'h0E:  //xori
		     begin
			   RegWriteD = 1;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'd5;
		      ALUSrcD = 1;
		      RegDstD = 0;
			 end
		 6'h0F:  //lui
		     begin
			   RegWriteD = 1;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'hE;
		      ALUSrcD = 1;
		      RegDstD = 0;
			 end
		 6'h09:  //dddiu
		     begin
			   RegWriteD = 1;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'd7;
		      ALUSrcD = 1;
		      RegDstD = 0;
			  end
	    6'h0C: //andi
		    begin
			   RegWriteD = 1;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'd3;
		      ALUSrcD = 1;
		      RegDstD = 0;
			 end
		 6'h04: //beq
		    begin
			   RegWriteD = 0;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'd0;
		      ALUSrcD = 0;
		      RegDstD = 0;
			 end
		 6'h01: //bgez||bltz
		    begin
			   RegWriteD = 0;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'd0;
		      ALUSrcD = 0;
		      RegDstD = 0;
			 end
		 6'h06: //blez
		    begin
			   RegWriteD = 0;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'd0;
		      ALUSrcD = 0;
		      RegDstD = 0;
			 end
		 6'h07: //bgtz
		    begin
			   RegWriteD = 0;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'd0;
		      ALUSrcD = 0;
		      RegDstD = 0;
			 end
		 6'h05: //bne
		    begin
			   RegWriteD = 0;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'd0;
		      ALUSrcD = 0;
		      RegDstD = 0;
			 end
		 6'h02:  //j
		    begin
			   RegWriteD = 0;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'd0;
		      ALUSrcD = 0;
		      RegDstD = 0;
			 end
		 6'h0A: //slti
		    begin
			   RegWriteD = 1;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'hC;
		      ALUSrcD = 1;
		      RegDstD = 0;
			 end
		 6'h0B: //styui
		    begin
			   RegWriteD = 1;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'hD;
		      ALUSrcD = 1;
		      RegDstD = 0;
			 end
		 6'h23: //lw
		    begin
			   RegWriteD = 1;
	         MemtoRegD = 1;
	         MemWriteD = 0;
		      ALUControlD = 4'd1;
		      ALUSrcD = 1;
		      RegDstD = 0;
			 end
		 6'h2B: //sw
		    begin
			   RegWriteD = 0;
	         MemtoRegD = 0;
	         MemWriteD = 1;
		      ALUControlD = 4'd1;
		      ALUSrcD = 1;
		      RegDstD = 0;
			 end
	    default:
		    begin
			   RegWriteD = 0;
	         MemtoRegD = 0;
	         MemWriteD = 0;
		      ALUControlD = 4'd0;
		      ALUSrcD = 0;
		      RegDstD = 0;
			 end
		endcase
	  end
end

endmodule
