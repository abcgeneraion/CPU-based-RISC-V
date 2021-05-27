module RF( A1, A2, A3, WD, clk, RFWr, RD1, RD2 );
    
   input  [4:0]  A1, A2, A3;
   input  [31:0] WD;
   input         clk;
   input         RFWr;
   output [31:0] RD1, RD2;
   
   reg [31:0] rf[31:0];
   
   
   always @(posedge clk) begin
      if (RFWr)
         rf[A3] <= WD;
      end // end always
   
   assign RD1 = (A1 == 0) ? 32'd0 : rf[A1];
   assign RD2 = (A2 == 0) ? 32'd0 : rf[A2];
   
endmodule

