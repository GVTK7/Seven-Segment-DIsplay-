`timescale 1ns / 1ps

module top_module   #(parameter N=10,M=16)(y1,clk,rst,Seven_Seg,Digit);
input [N-1:0]y1;
input clk,rst;
output [7:0]Seven_Seg;
output [3:0]Digit;
wire rclk;                            
wire  [15:0]BCD;
wire [7:0]seven_out;
wire  [3:0]digit1;

//alu    #( N)  alu_top(A,B,select,Y);
binary_BCD top_dut(y1,BCD);
Clock_Divider  #(M)  clk_divider_Dut(clk,rst,rclk);
display_controller diply_contrlr_dut(BCD,rclk,rst,seven_out,digit1);
assign Seven_Seg=seven_out;
assign Digit=digit1;
endmodule
