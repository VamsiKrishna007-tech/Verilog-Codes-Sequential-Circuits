module SR_Latch(R,S,Q,Qn);
input R,S;
output Q,Qn;
wire [1:0]w;
nor n1(Q,R,w[1]);
nor n2(Qn,S,w[0]);
assign w[0]=Q;
assign w[1]=Qn;
endmodule
