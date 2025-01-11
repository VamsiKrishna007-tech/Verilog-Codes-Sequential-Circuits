module D_FF_tb;
// Variables required for Test bench
reg clk, rst, D;
wire Q, Qn;
// Instantiate the design
D_FF DUT(clk, rst, D, Q, Qn);
//Initialization
initial
 begin
  {clk,D,rst}=0;
 end
// Clock generation
initial
 begin
  clk=0;
  forever #10 clk=~clk;
 end
// Reset Task
task rst_dut();
 begin
  @(negedge clk)
   rst=1'b1;
  @(negedge clk)  // To remove the reset in the next negative edge
   rst=1'b0;   
 end
endtask
// Data Task
task Din(input i);
 begin
  @(negedge clk);
   D=i;
 end
endtask 
// Process that generates stimulus by call by value method
initial
 begin
  rst_dut;
  Din(0);
  Din(1);
  rst_dut;
  Din(1);
  Din(1);
  #10;
  $finish;
 end
// Display
initial
 begin
  $monitor("Values of clk=%b, reset=%b, Data=%b, Q=%b, Qn=%b", clk,rst,D,Q,Qn);
 end
endmodule
