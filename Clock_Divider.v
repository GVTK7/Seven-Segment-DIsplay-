//rclck_frequancy=clk_frequancy/2^(N+1);

module Clock_Divider   #(parameter N=5) (clk,rst,r_clk);
    input clk;
    input rst;
output  r_clk;
reg rclk;

reg [N:0]count; 

always @(posedge clk ) begin
    if (rst == 1'b1) begin
        count = 0;
        rclk = 0;
    end
    if ( count>{1'b1,{(N){1'b0}}  }   )begin
        rclk = ~rclk;
    end
    count = count + 1;
end
assign r_clk=rclk;
endmodule