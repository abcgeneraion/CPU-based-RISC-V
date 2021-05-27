// mux2
module mux2 #(parameter WIDTH = 32)
             (d0, d1,
              s, y);
              
    input  [WIDTH-1:0] d0, d1;
    input              s;
    output reg [WIDTH-1:0] y;          
     
	always @(*) begin         
     y = ( s == 1'b1 ) ? d1:d0;
    end// end always
    
endmodule

//mux4
module mux4 #(parameter WIDTH = 32)
             (d0,d1,d2,	
             d3,s,y);
    input  [WIDTH-1:0] d0,d1,d2,d3;
    input  [1:0] s;
    output wire [WIDTH-1:0] y;
    reg [WIDTH-1:0] y_r;
    
    always @( * ) begin
        case ( s )
            2'b00: y_r <= d0;
            2'b01: y_r <= d1;
            2'b10: y_r <= d2;
            2'b11: y_r <= d3+1'b1;
            default: ;
        endcase             
    end // end always
    
    assign y = y_r;

endmodule

// mux8
module mux8 #(parameter WIDTH = 32)
             (d0, d1, d2, d3,
              d4, d5, d6, d7,
              s, y);
    
    input  [WIDTH-1:0] d0, d1, d2, d3;
    input  [WIDTH-1:0] d4, d5, d6, d7;
    input  [2:0]       s;
    output wire [WIDTH-1:0] y;
    
    reg [WIDTH-1:0] y_r;
    
    always @( * ) begin
        case ( s )
            3'b000: y_r <= d0;
            3'b001: y_r <= d1;
            3'b010: y_r <= d2;
            3'b011: y_r <= d3;
            3'b100: y_r <= d4;
            3'b101: y_r <= d5;
            3'b110: y_r <= d6;
            3'b111: y_r <= d7;
            default: ;
        endcase
    end // end always
    
    assign y = y_r;    
    
endmodule