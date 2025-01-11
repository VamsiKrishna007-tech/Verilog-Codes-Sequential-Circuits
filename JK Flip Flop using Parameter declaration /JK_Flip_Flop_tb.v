module JK_FF_tb;
//Variables required for Testbench
reg clk,rst;
reg [1:0]state;
wire Q, Qn;

parameter HOLD   = 2'b00,
          SET    = 2'b01,
          RESET  = 2'b10,
          TOGGLE = 2'b11;
          
// Instantiate the Design
JK_FF DUT(clk,rst,Q,Qn,state);

// Clock generation
initial
 begin
  clk=0;
  forever #10 clk=~clk;
 end
 
// Initialization Task
task initialization();
 begin
  {clk,rst,state}=3'b000;
 end
endtask

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
task ST(input [1:0]i);
 begin
  @(negedge clk);
   state=i;
 end
endtask 

// Process that generates stimulus by call by value method
initial
 begin
  initialization;
  rst_dut;
  ST(2'b00);
  ST(2'b11);
  ST(2'b10);
  ST(2'b01);
  #400;
  $finish;
 end
 
// Display
initial
 begin
  $monitor("Values of clk=%b, reset=%b, State=%b, Q=%b, Qn=%b", clk,rst,state,Q,Qn);
 end
endmodule
