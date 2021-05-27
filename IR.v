module IR( rst, IRWr, im_dout, clk,Op,rs1,rs2,rd,Funct3,Funct7,Imm5,IMM12,Imm20);
               
   input         rst;
   input         IRWr;
   input         clk;
   input  [31:0] im_dout;
   output wire [6:0] Op;
   output wire [4:0] rs1,rs2,rd;
   output wire [2:0]Funct3;
   output wire [6:0]Funct7;
   output wire [4:0] Imm5;
   output wire [11:0] IMM12;
   output wire [19:0] Imm20;
   
   
   reg [31:0] instr;  
   assign Op = instr[6:0];
   assign Funct3 = instr[14:12];
   assign Funct7 = instr[31:25];
   assign rs1 = instr[19:15];
   assign rs2 = instr[24:20];
   assign rd = instr[11:7];
   assign Imm5 = instr[11:7];
   assign IMM12 = instr[31:20];
   assign Imm20 = instr[31:12];

               
always @(posedge clk or posedge rst) begin
      if ( rst ) 
         instr <= 0;
      else if (IRWr)
         instr <= im_dout;
   end 
      
endmodule
