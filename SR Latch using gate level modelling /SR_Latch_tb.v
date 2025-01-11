module SR_Latch_tb;
reg S,R;
wire Q,Qn;

// Instantiate the Design
SR_Latch DUT(R,S,Q,Qn);

// Initialization Task
task initialization();
 begin
  R=0;
  S=0;
 end
endtask

// Data Task
task inputs(input a,b);
 begin
   R=a;
	S=b;
 end
endtask

// Process that generates stimulus by call by value method
initial
 begin
  initialization;
  inputs(1,1);
  #10;
  inputs(0,1);
  #10;
  inputs(1,0);
  #10;
 end

// Display
initial
 begin
  $monitor("Values of R=%b, S=%b, Q=%b, Qn=%b",R,S,Q,Qn);
 end
endmodule
