module divider(FM,cout,cin);
    output cout;
    input FM;
    input cin;
    reg [31:0] c,flag;
    reg cout;
   always@(posedge cin)
    begin
     case(FM)
     1'b0:begin
     if ( c ==6249999)
      begin
       cout<=~cout;
       c <= 0;
      end
     else
      begin
     c <= c + 1 ;
    end
    end
    1'b1:begin
      if ( flag ==24999999)
      begin
       cout<=~cout;
       flag <= 0;
      end
     else
      begin
     flag <= flag + 1 ;
    end
    end
    endcase
 end
 endmodule
