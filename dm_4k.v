module dm_4k( addr, din, DMWr, clk, dout);
   
   input  [31:0] addr;
   input  [31:0] din;
   input         DMWr;
   input         clk;
   output [31:0] dout;
     
   reg [31:0] dmem[127:0];
   initial
   begin
    dmem[0]=32'h00000002;
    dmem[1]=32'h00000004;
    dmem[2]=32'h00000008;
    dmem[3]=32'h00000003;
   end
   
   always @(posedge clk)
    begin
      if (DMWr)
         dmem[addr] <= din;
   end // end always
   
   assign dout = dmem[addr];
    
endmodule    
