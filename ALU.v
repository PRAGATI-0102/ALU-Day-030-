`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2023 11:09:51 PM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(A, B, OP, Z, OF);

	input signed [7:0] A, B;
	input [2:0] OP;
	output signed [7:0] Z; 
	output OF;

	reg of;
	reg [7:0] z;


	always@(A or B or OP)
	begin
		of = 0;
		case(OP)
		
		0:  begin
			z = A+B; 
			of = (A[7] && B[7] && ~z[7]) || (~A[7] && ~B[7] && z[7]);
		   end
		   
		1:  begin
			z = A-B; 
			of = (A[7] && ~B[7] && ~z[7]) || (~A[7] && B[7] && z[7]);
		    end
		    
		2:  z = (A>B) ? A : B; 
		3:  z = (A<B) ? A : B; 
		4:  z = A <<< 2; 
		5:  z = B >>> 3; 
		
		endcase
	end
	
	assign OF = of;
	assign Z = z;
endmodule

