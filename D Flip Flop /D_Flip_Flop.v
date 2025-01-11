module D_FF(clk,rst,D,Q,Qn);
input clk, rst, D;
output reg Q;
output Qn;

always@(posedge clk)
 begin
  if(rst)
   Q<=1'b0;
  else
   Q<=D;
  end
 assign Qn=~Q;
endmodule
