module T_FF(clk,rst,T,Q,Qn);
input T,clk,rst;
inout Q;
output Qn;
wire w1;
D_FF D1(clk,rst,T,Q,Qn);
xor x1(w1,T,Q);
endmodule
