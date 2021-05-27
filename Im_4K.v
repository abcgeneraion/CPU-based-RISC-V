module Im_4K( addr, dout);
    input [31:0] addr;
    output  [31:0] dout;
    
    reg [31:0] imem[127:0];
  
	initial
	
	begin
	/*
	//bubble-sort 2.0
	imem[0]	=32'h00000113;//addi x2,x0,0
	imem[1] =32'h00500193;//addi x3,x0,5**********n
	imem[2]=32'h018000E7;//jalr x0,x0,24
	imem[3]=32'h00315AE3;//bge x2,x3,21
	imem[4]=32'h00000213;//addi x4,x0,0
	imem[5]=32'h00110293;//addi x5,x2,1
	imem[6]=32'h40518333;//sub x6,x3,x5
	imem[7]=32'h00624263;//blt x4,x6,4
	imem[8]=32'h00110113;//addi x2,x2,1
	imem[9]=32'h00000617;//auipc x12,0
	imem[10]=32'hFFA60067;//jalr x0,x12,-6
	imem[11]=32'h00022383;//lw x7,0(x4)
	imem[12]=32'h00122403;//lw x8,1(x4)
	imem[13]=32'h00744263;//blt x8,x7,4
	imem[14]=32'h00120213;//addi x4,x4,1
	imem[15]=32'h00000597;//auipc x11,0
	imem[16]=32'hFF858067;//jalr x0,x11,-8
	imem[17]=32'h00038493;//addi x9,x7,0
	imem[18]=32'h00040393;//addi x7,x8,0
	imem[19]=32'h00048413;//addi x8,x9,0
	imem[20]=32'h00722023;//sw x7,0(x4)
	imem[21]=32'h008220A3;//sw x8,1(x4)
	imem[22]=32'h00000517;//auipc x10,0
	imem[23]=32'hFF850067;//jalr x0,x10,-8
	imem[24]=32'h00000693;//addi x13,x0,0
	imem[25]=32'h0036D2E3;//bge x13,x3,5
	imem[26]=32'h0006A703;//lw x14,0(x13)
	imem[27]=32'h00168693;//addi x13,x13,1
	imem[28]=32'h00000797;//auipc x15,0
	imem[29]=32'hFFD78067;//jalr x0,x15,-3
	imem[30]=32'hFE3112E3;//bne x2,x3,-27
	imem[31]=32'h0;
	*/
	
	//Direct-insertion sort 2.0
	imem[0]	=32'h00100193;//addi x3,x0,1
	imem[1] =32'h00000213;//addi x4,x0,0
	imem[2]=32'h00219293;//slli x5,x3,2******************n
	imem[3]=32'h0051D863;//bge x3,x5,16
	imem[4]=32'h0001A303;//lw x6,0(x3)
	imem[5]=32'hFFF18213;//addi x4,x3,-1
	imem[6]=32'h000252E3;//bge x4,x0,5
	imem[7]=32'h006220A3;//sw x6,1(x4)
	imem[8]=32'h00118193;//addi x3,x3,1
	imem[9]=32'h00000517;//auipc x10,0
	imem[10]=32'hFFA50067;//jalr x0,x10,-6
	imem[11]=32'h00022383;//lw x7,0(x4)
	imem[12]=32'h007341E3;//blt x6,x7,3
	imem[13]=32'h00000497;//auipc x9,0
	imem[14]=32'hFFA48067;//jalr x0,x9,-6
	imem[15]=32'h007220A3;//sw x7,1(x4)
	imem[16]=32'hFFF20213;//addi,x4,x4,-1
	imem[17]=32'h00000417;//auipc x8,0
	imem[18]=32'hFF540067;//jalr x0,x8,-11
	imem[19]=32'h00002583;//lw x11,0(x0)
	imem[20]=32'h00102603;//lw x12,1(x0)
	imem[21]=32'h00202683;//lw x13,2(x0)
	imem[22]=32'h00302703;//lw x14,3(x0)
	//imem[23]=32'h00402783;//lw x15,4(x0)
	imem[23]=32'h0;
	
	
	end

assign  dout = imem[addr];
    
endmodule    
