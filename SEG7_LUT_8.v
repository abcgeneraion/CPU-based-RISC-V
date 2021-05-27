//>>
module SEG7_LUT_8 (	
	output	[6:0]oSEG0,
	output	[6:0]oSEG1,
	output	[6:0]oSEG2,
	output	[6:0]oSEG3,
	output	[6:0]oSEG4,
	output	[6:0]oSEG5,
	output	[6:0]oSEG6,
    output	[6:0]oSEG7,
	input	[31:0]iDIG,
	input   [7:0]ON_OFF
 );
//7-Seg 0//
	SEG7_LUT u0(	
	    .iDIG  (iDIG[3:0]), 
	    .oSEG  (oSEG0),
		.ON_OFF(ON_OFF[0])			
	 );
//7-Seg 1//
	SEG7_LUT u1(	
		.iDIG  (iDIG[7:4]),
		.oSEG  (oSEG1),
		.ON_OFF(ON_OFF[1])
	 );
//7-Seg 2//
	SEG7_LUT u2(	
		.iDIG  (iDIG[11:8]),
		.oSEG  (oSEG2),
		.ON_OFF(ON_OFF[2])
	 );
//7-Seg 3//
	SEG7_LUT u3(	
		.iDIG  (iDIG[15:12]),
		.oSEG  (oSEG3),
		.ON_OFF(ON_OFF[3])
	 );
//7-Seg 4//
	SEG7_LUT u4(	
		.iDIG  (iDIG[19:16]),
		.oSEG  (oSEG4),
		.ON_OFF(ON_OFF[4])
	 );
//7-Seg 5//
	SEG7_LUT u5(	
		.iDIG  (iDIG[23:20]),
		.oSEG  (oSEG5),
		.ON_OFF(ON_OFF[5])
	 );
//7-Seg 6//
	SEG7_LUT u6(	
		.iDIG  (iDIG[27:24]),
		.oSEG  (oSEG6),
		.ON_OFF(ON_OFF[6])
	 );
//7-Seg 7//
	SEG7_LUT u7(	
		.iDIG  (iDIG[31:28]),
		.oSEG  (oSEG7),
		.ON_OFF(ON_OFF[7])
	 );
endmodule
//<<