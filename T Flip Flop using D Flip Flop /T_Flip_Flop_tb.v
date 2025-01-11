module T_FF_tb();

// Variable required for Test Bench
reg clk,rst,T;
wire Q,Qn;

// Instantiate the design
T_FF DUT(clk, rst, T, Q, Qn);

//Initialization
initial
 begin
  {clk,T,rst}=0;
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
  @(negedge clk)
   rst=1'b0;
 end
endtask

// Data Task
task Tin(input i);
 begin
  @(negedge clk);
   T=i;
 end
endtask 

// Process that generates stimulus by call by value method
initial
 begin
  rst_dut;
  Tin(0);
  Tin(1);
  rst_dut;
  Tin(1);
  Tin(1);
  #10;
  $finish;
 end
 
// Display
initial
 begin
  $monitor("Values of clk=%b, reset=%b, T=%b, Q=%b, Qn=%b", clk,rst,T,Q,Qn);
 end
endmodule
