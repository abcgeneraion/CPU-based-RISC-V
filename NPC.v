`include "ctrl_encode_def.v"
module NPC(Alu_out, PC, NPCOp, IMM12, IMM5, NPC);
   input  [31:0] Alu_out; 
   input  [31:0] PC;
   input  [1:0]  NPCOp;
   input  [11:0] IMM12;
   input  [4:0]  IMM5;
   output [31:0] NPC;
   
   reg [31:0] NPC;
   
   
   always @(*) begin
      case (NPCOp)
          `NPC_PLUS4:NPC = PC + 1;
          `NPC_BRANCH:                     
                if(IMM12[11]==1)begin
                NPC = PC + {20'hfffff,IMM12[11:5],IMM5[4:0]};
                end
                else begin
                NPC = PC + {20'h00000,IMM12[11:5],IMM5[4:0]};
                end       
          `NPC_JUMP :NPC = Alu_out;
          default: ;
      endcase
   end // end always
   
endmodule