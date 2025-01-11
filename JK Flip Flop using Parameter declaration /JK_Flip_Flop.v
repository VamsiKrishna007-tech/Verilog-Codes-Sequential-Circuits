module JK_FF(clk,rst,Q,Qn,state);
input clk, rst;
input [1:0]state;
output reg Q;
output Qn;

parameter HOLD   = 2'b00,
           SET    = 2'b01,
           RESET  = 2'b10,
           TOGGLE = 2'b11;
          
always@(posedge clk)
 begin
  if(rst)
   Q <= 1'b0;
  else
   begin,
    case(state)
     HOLD   : Q <= Q;
     SET    : Q <= 1'b1;
     RESET  : Q <= 1'b0;
     TOGGLE : Q <= (~Q);
    endcase
   end 
 end
assign Qn = ~Q;
endmodule
