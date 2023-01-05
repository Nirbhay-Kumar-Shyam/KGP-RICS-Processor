`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:05:29 11/04/2022 
// Design Name: 
// Module Name:    look_ahead_carry_unit 
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
module look_ahead_carry_unit(
	input [3:0] p,
	input [3:0] g,
	input c_in,
	output [3:0] carry,
	output p_out,
	output g_out
    );
	carry[0] = c_in,
	carry[1] = g[0] | (p[0] & c_in);
	carry[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c_in);
	carry[3] = g[2] | (p{2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c_in);

	assign p_out = p[3] & p[2] & p[1] & p[0];
	assign g_out = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
endmodule
