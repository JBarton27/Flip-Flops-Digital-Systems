`include "fallingEdgeFF.v"

module fallingEdgeFF_tb;
reg D, S, R, clk;
wire Q, Qb;

fallingEdgeFF DFF0(D, S, R, clk, Q, Qb);
initial clk = 0;
    always begin 
        clk = ~clk;
        #10;
    end

    initial begin
    $monitor("At time %4t, clk = %d S = %d R = %d D = %d Q = %d Qb = %d",
    $time, clk, S, R, D, Q, Qb);
    $dumpfile("fallingEdgeFF.vcd");
    $dumpvars(0, fallingEdgeFF_tb);
    // initalize variables
      S = 1; R = 1; D = 0; 
    S=0; #4;
    S=1; #4;
    D=0; #45;
    D=1; #40;
    D=0; #40;
    $finish;    
    end
endmodule