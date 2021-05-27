`include "ctrl_encode_def.v"
module EXT(Imm5,Imm12,Imm20,Imm32,EXTSigned);
  input [1:0] EXTSigned;
  input [4:0] Imm5;
  input  [11:0] Imm12;
  input [19:0] Imm20;
  output reg [31:0] Imm32;
  
   always@(*) begin
	   case(EXTSigned)
       `ITYPE_EXT:begin   
			  if(Imm12[11])begin
				Imm32={20'hfffff,Imm12[11:0]};
				end
			  else if(!Imm12[11])begin
				Imm32={20'h00000,Imm12[11:0]};
				end
			 end
	   `STYPE_EXT :begin
	         if(Imm12[11])begin
	            Imm32={20'hfffff,Imm12[11:5],Imm5[4:0]};
	            end
	         else if(!Imm12[11])begin
	            Imm32={20'h00000,Imm12[11:5],Imm5[4:0]};
	            end
	         end
	   `UTYPE_EXT :Imm32={Imm20[19:0],12'h000};
	    default: ;
	    endcase
   end //end always  
endmodule
