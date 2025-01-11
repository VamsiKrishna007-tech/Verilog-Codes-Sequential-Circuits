module D_FF(clk,rst,D,Q,Qn);
input clk, rst, D;
output reg Q;
output Qn;

always@(posedge clk)
 begin
  if(rst)
   Q<=1'b0;
  else
   begin
    case(state)
     1'b0   : Q <= Q;
     1'b1   : Q <= (~Q);
    endcase
  end
 assign Qn=~Q;
endmodule
