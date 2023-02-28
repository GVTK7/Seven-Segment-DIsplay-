module display_controller (BCD,clk,rst,Seven_Seg,Digit);
input [15:0]BCD;
input clk,rst;
output [7:0]Seven_Seg;
output  [3:0]Digit;
wire [27:0]seven_in;//
reg [2:0]state; 
reg [7:0]seven_out;
reg [3:0]digit;


//BCD to seven segment signals generation
bcd_seven bcd_7dut1(BCD[3:0], seven_in[6:0]);
bcd_seven bcd_7dut2(BCD[7:4], seven_in[13:7]);
bcd_seven bcd_7dut3(BCD[11:8], seven_in[20:14]);
bcd_seven bcd_7dut4(BCD[15:12], seven_in[27:21]);

//state chaging
always@(posedge clk)
begin
	if(rst==1) begin
	   state=0;
	   
	end
    else if(state>3) begin
	   state=1;
	end
	else  
	state =state+1;
end

//state declaration
always@(posedge clk) begin
case(state)
		1:begin  	digit=0001;    seven_out[6:0]=seven_in[6:0];  end
		2:begin 	digit=0010;    seven_out[6:0]=seven_in[13:7];  end
		3:begin 	digit=0100;    seven_out[6:0]=seven_in[20:14];  end
		4:begin 	digit=1000;    seven_out[6:0]=seven_in[27:21];  end
endcase
    seven_out[7]=1'b1;
end
assign Seven_Seg=seven_out;
assign Digit=digit;
endmodule

	
	
	
		
	


		
