`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2023 11:13:57 PM
// Design Name: 
// Module Name: tb_ALU
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


module tb_ALU();
	reg signed [7:0] a, b;
	reg [2:0] op;
	wire signed [7:0] z;
	wire of;

	ALU DUT(
		.A(a),
		.B(b),
		.OP(op),
		.Z(z),
		.OF(of)
	);

	initial
	begin
		// non overflow sum
		a = 2;
		b = 3;
		op = 0;
		#50

		// overflow sum type 1
		a = 64;
		b = 64;
		op = 0;
		#50

		// overflow sum type 2
		a = -60;
		b = -75;
		op = 0;
		#50

		// non overflow subtract
		a = 7;
		b = 3;
		op = 1;
		#50;

		// overflow subtract type 1
		a = -100;
		b = 50;
		op = 1;
		#50;


		// overflow subtract type 2
		a = 100;
		b = -50;
		op = 1;
		#50;

		// max
		a = 12;
		b = 28;
		op = 2;
		#50;

		// max
		a = 15;
		b = -28;
		op = 2;
		#50;

		// min
		a = 64;
		b = 95;
		op = 3;
		#50;

		// min
		a = 100;
		b = -1;
		op = 3;
		#50;

		// right shift
		a = 10;
		b = 0;
		op = 4;
		#50;

		// right shift
		a = -5;
		b = 0;
		op = 4;
		#50;

		// left shift
		a = 0;
		b = 4;
		op = 5;
		#50;

		// left shift
		a = 0;
		b = -8;
		op = 5;
		#50;

	end
endmodule
