`include "ctrl_encode_def.v"
module ctrl(clk, rst, Op, Funct3,Funct7,
            Jump,RFWr, DMWr, PCWr, IRWr,
            EXTOp, ALUOp, NPCOp, WDSel,
            ASel, BSel, latch_en, state);
    
   input   clk, rst;       
   input  [6:0] Op;
   input  [2:0] Funct3; 
   input  [6:0] Funct7;
   input  [1:0] Jump;
   output reg [3:0] state;
   output       RFWr;
   output       DMWr;
   output       PCWr;
   output       IRWr;
   output [1:0] EXTOp;
   output [2:0] ALUOp;
   output [1:0] NPCOp;
   output [1:0] WDSel;
   output       ASel;
   output       BSel; 
   output	    latch_en;
       
   parameter Fetch  = 4'b0000,
             DCD    = 4'b0001,
             Exe    = 4'b0011,
             Mem    = 4'b0010,
             WB     = 4'b0110;
    
	
   wire RType;   // Type of R-Type Instruction
   wire IType;   // Type of I-Type Instruction
   wire LdType;  //Type of Load Instruction
   wire JpType;  // Type of Jump   Instruction
   wire SType;   // Type of S-Type Instruction
   wire BType;   // Type of Branch Instruction 
   wire UType;   // Type of U-Type(auipc)   Instruction

   assign RType   = (Op == `INSTR_RTYPE_OP );
   assign IType   = (Op == `INSTR_ITYPE_OP );
   assign LdType  = (Op == `INSTR_LdType_OP);
   assign JpType  = (Op == `INSTR_JpType_OP);
   assign SType   = (Op == `INSTR_STYPE_OP );
   assign BType   = (Op == `INSTR_BTYPE_OP ); 
   assign UType   = (Op == `INSTR_UTYPE_OP );
    
	/*************************************************/
	/******               FSM                   ******/
   reg [3:0] nextstate;
  // reg [3:0] state;
 /*
   always @(state) begin 
        case (state)
         Fetch: nextstate = DCD;
         DCD:  nextstate  = Exe;   
         Exe:  nextstate  = Mem;
         Mem:  nextstate  = WB;
         WB:   nextstate  = Fetch;
       	default: ;
       endcase
   end // end always
   */
  always @(posedge clk or posedge rst) begin
	   if ( rst )
		   state <= Fetch;
      else begin
        case (state)
         Fetch: nextstate  = DCD;
         DCD:  nextstate   = Exe;   
         Exe:  nextstate   = Mem;
         Mem:  nextstate   = WB;
         WB:   nextstate   = Fetch;
       	default: ;
       endcase
       
         state <= nextstate;
         end//endelse
	end // end always
             
	
	/*************************************************/
	/******         Control Signal              ******/
   reg       RFWr;
   reg       DMWr;
   reg       PCWr;
   reg       IRWr;
   reg [1:0] EXTOp;
   reg [2:0] ALUOp;
   reg [1:0] NPCOp;
   reg [1:0] WDSel;
   reg       ASel;
   reg       BSel;
   reg       latch_en;
	
always @(posedge clk or posedge rst) begin
     if(rst) begin
            PCWr   = 1'b0;
            NPCOp  = 0; 
            IRWr   = 1'b0;
            RFWr  = 1'b0;
            DMWr   = 1'b0;
            EXTOp  = 0;
            WDSel  = 0;
            ASel   = 0;
            BSel   = 0;
            ALUOp  = 0;
            latch_en= 1'b0;
      end
    else
	   case ( state ) 
		 Fetch: begin
			IRWr   = 1'b1;
            PCWr   = 1'b0;
            NPCOp  = 0; 
            RFWr   = 1'b0;
            DMWr   = 1'b0;
            EXTOp  = 0;
            WDSel  = 0;
            ASel   = 0; 
            BSel   = 0;
            ALUOp  = 0;
            latch_en= 1'b0;
			end // end Fetch*************************************************************************************************************
         DCD: begin
            IRWr = 1'b0;
            ASel =`ASel_FromRD1;
            if(RType)begin	//fixed
				   
					 BSel=`BSel_FromRD2;
				end
			else if(IType)begin//fixed
				    
					EXTOp = `ITYPE_EXT;
					BSel = `BSel_FromEXT;
				end
			else if(LdType||JpType)begin	//fixed   
				     EXTOp = `ITYPE_EXT;
					 BSel =`BSel_FromEXT;
				 end
			else if(SType)begin
					EXTOp=`STYPE_EXT;
					BSel=`BSel_FromEXT;
				end
			else if(BType)begin
				BSel=`BSel_FromRD2;
				end
			else if(UType)begin
				  ASel  = `ASel_FromPC;
				  EXTOp = `UTYPE_EXT;
		          BSel  =`BSel_FromEXT;
				end
		   end//endDCD************************
		 Exe: 	begin
		    
			 if(RType)begin	//fixed
	   
					 if(Funct3==`INSTR_ADD_FUNCT3&&Funct7==`INSTR_ADD_FUNCT7) 
						  ALUOp = `ALUOp_ADD;
				     else if(Funct3==`INSTR_SUB_FUNCT3&&Funct7==`INSTR_SUB_FUNCT7) 
				          ALUOp = `ALUOp_SUB;
				     else if(Funct3==`INSTR_OR_FUNCT3&&Funct7==`INSTR_OR_FUNCT7)
				          ALUOp = `ALUOp_OR;
				     else if(Funct3==`INSTR_AND_FUNCT3&&Funct7==`INSTR_AND_FUNCT7)
				          ALUOp = `ALUOp_AND;
				     else if(Funct3==`INSTR_XOR_FUNCT3&&Funct7==`INSTR_XOR_FUNCT7)
						  ALUOp = `ALUOp_XOR;
				 end
			else if(IType)begin//fixed
					if(Funct3==`INSTR_ADDI_FUNCT3)
						ALUOp = `ALUOp_ADD;
					else if(Funct3==`INSTR_SLLI_FUNCT3)
					    ALUOp = `ALUOp_LSHIFT;
				end
			else if(LdType||JpType||SType||UType)begin	//fixed
				     ALUOp = `ALUOp_ADD;
				 end
			else if(BType)begin
				ALUOp =`ALUOp_SUB;
				end
			  latch_en= 1'b1;
		   end
		 Mem: begin	
			  latch_en=1'b0;	     		   
			    //updatePC
			    if(JpType)begin
			       NPCOp  =`NPC_JUMP;
			       PCWr   = 1'b1;
			    end
			    else if(BType)begin
			         if((Funct3==`INSTR_BGE_FUNCT3&&Jump[1]!=1)||
					    (Funct3==`INSTR_BNE_FUNCT3&&Jump[0]==0)||
					    (Funct3==`INSTR_BLT_FUNCT3&&Jump[1]==1))begin
			        	NPCOp =`NPC_BRANCH;		
					 end			            
                     else begin
			          NPCOp=`NPC_PLUS4;
			         end
			         PCWr = 1'b1;
			    end
			    else begin
			         
					NPCOp  = 0; 
					PCWr = 1'b1;
			         end   				                
			    if(SType) begin	
				    DMWr = 1'b1;
			    end
			 end // end MemWB

		   /////////////////////////////////////////////////////////////////////////////////
		  WB:begin
		    PCWr = 1'b0;
			DMWr = 1'b0;
			if(RType||IType||UType) begin
			   WDSel= `WDSel_FromALU;	  
			end 
			else if(JpType)  begin
		      WDSel = `WDSel_FromPC;
		    end
			else if(LdType)  begin
			   WDSel = `WDSel_FromMEM;	   
			end  
			if (RType||IType||UType||LdType||JpType)begin
				RFWr  = 1'b1;	
		    end
		    
		  end 
     endcase
   end// end always
endmodule
