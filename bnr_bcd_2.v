`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2023 20:14:45
// Design Name: 
// Module Name: binary_BCD
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

// EE20B007 Benstin Davis D

module binary_BCD (binary,BCD);

input [9:0]binary;
output [15:0]BCD;


reg [25:0]Rg;
reg [3:0]i;
wire [9:0]Mag;
wire sign_bit;

assign sign_bit = binary[9];
assign Mag = {1'b0,binary[9]? ~(binary[8:0]-1):binary[8:0]};

always @(*) begin
   // Rg = {{(16){1'b0}},Mag};
        Rg = {{4{sign_bit}},{(12){1'b0}},Mag};
        for(i = 0;i < 9;i = i + 1)begin
        Rg = Rg<<1;
      /*  if(Rg[25:22] > 4'b0100)
            Rg[25:22] = Rg[25:22] + 4'b0011;*/
        if(Rg[21:18] >  4'b0100)
            Rg[21:18] = Rg[21:18] + 4'b0011;  
        if(Rg[17:14] >  4'b0100)
            Rg[17:14] = Rg[17:14] + 4'b0011;
        if(Rg[13:10] >  4'b0100)
            Rg[13:10] = Rg[13:10] + 4'b0011;   
    end
    Rg = Rg<<1;
end
assign BCD =Rg[25:10];
//assign BCD ={{4{sign_bit}},Rg[21:10]};
endmodule

