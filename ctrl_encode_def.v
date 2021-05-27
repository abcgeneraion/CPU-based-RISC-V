 // ALU control signal
`define ALUOp_ADD  3'b000
`define ALUOp_SUB  3'b001
`define ALUOp_AND   3'b010
`define ALUOp_OR    3'b011
`define ALUOp_XOR  3'b100
`define ALUOp_LSHIFT 3'b101

//Instruction Type
`define INSTR_RTYPE_OP   7'b0110011
`define INSTR_ITYPE_OP   7'b0010011  
`define INSTR_LdType_OP  7'b0000011
`define INSTR_JpType_OP  7'b1100111
`define INSTR_STYPE_OP   7'b0100011 
`define INSTR_BTYPE_OP   7'b1100011
`define INSTR_UTYPE_OP   7'b0010111

// Funct3,Funct7
//Type R
`define INSTR_ADD_FUNCT3    3'b000 
`define INSTR_SUB_FUNCT3    3'b000
`define INSTR_OR_FUNCT3     3'b110
`define INSTR_AND_FUNCT3    3'b111
`define INSTR_XOR_FUNCT3    3'b100
`define INSTR_ADD_FUNCT7    7'b0000000
`define INSTR_SUB_FUNCT7    7'b0100000
`define INSTR_OR_FUNCT7     7'b0000000
`define INSTR_AND_FUNCT7    7'b0000000
`define INSTR_XOR_FUNCT7    7'b0000000
//Type I 
`define INSTR_ADDI_FUNCT3   3'b000
`define INSTR_SLLI_FUNCT3   3'b001
//LdType
`define INSTR_LW_FUNCT3   3'b010
//JpType
`define INSTR_JALR_FUNCT3   3'b000
//Type S
`define INSTR_SW_FUNCT3     3'b010
//Type B
`define INSTR_BGE_FUNCT3     3'b101
`define INSTR_BNE_FUNCT3     3'b001
`define INSTR_BLT_FUNCT3     3'b100

//ASel
`define ASel_FromRD1       1'b0
`define ASel_FromPC        1'b1

//Bsel
`define BSel_FromRD2        1'b0
`define BSel_FromEXT        1'b1

//WDSel
`define WDSel_FromALU 2'b01
`define WDSel_FromMEM 2'b10
`define WDSel_FromPC  2'b11
//EXTOp
`define ITYPE_EXT  2'b01
`define STYPE_EXT  2'b10
`define UTYPE_EXT  2'b11

// NPC control signal
`define NPC_PLUS4   2'b00
`define NPC_BRANCH  2'b01
`define NPC_JUMP    2'b10 