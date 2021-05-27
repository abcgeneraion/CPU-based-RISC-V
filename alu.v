`include "ctrl_encode_def.v"
module alu(A, B, ALUOp, C, overflow,jump);
           
   input  [31:0] A, B;
   input  [2:0]  ALUOp;
   output  reg [31:0] C;
   output  wire overflow;
   output wire [1:0] jump;
   reg [32:0] A_,B_,C_;
   wire zero;
   
 /*  
    initial
 begin
	overflow=1'b0;
 end	
 */
   always @( A or B or ALUOp ) begin
  		A_[32:0]={A[31],A[31:0]};
		B_[32:0]={B[31],B[31:0]};
      case ( ALUOp )
         `ALUOp_ADD: begin
		     C_[32:0]=A_[32:0]+B_[32:0];
			 C[31:0]=C_[31:0];
			 /*
			if(C_[31]^C_[32]==1)
			begin
				overflow=1'b1;
			end			
			*/
		 end
         `ALUOp_SUB:begin
			C_[32:0]=A_[32:0]-B_[32:0];
			C[31:0]=C_[31:0];					
			/*
			if(C_[31]^C_[32]==1)
			begin
				overflow=1'b1;
			end
			*/
		end
		 `ALUOp_AND:
		    C = A & B;
         `ALUOp_OR: 
			C = A | B;
         `ALUOp_XOR:
            C = A ^ B;
         `ALUOp_LSHIFT:
            if(B[5]==0)begin
				C = A<<B[5:0];
			end
      endcase
   end // end always;
   
   assign zero = (!(|C)) ? 1 : 0;
   assign jump ={C[31],zero};
   assign overflow = (C_[31]^C_[32])?1 : 0;

endmodule