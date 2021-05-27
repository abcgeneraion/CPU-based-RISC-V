module  latch_(qout,en,data,clk);
output[31:0] qout;
input en;
input[31:0] data; 
input clk;
reg[31:0] qout;

always @(posedge clk)
begin
	if(en)qout<=data;
	
end
endmodule
