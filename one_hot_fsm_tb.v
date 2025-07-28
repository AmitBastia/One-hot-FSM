`include "one_hot_fsm.v"
`timescale 1ns/1ps
module one_hot_fsm_tb;
    reg in;
    reg clk,rst;

    wire [9:0]state,next_state;
    wire out1,out2;
    parameter s0 = 10'b0000000001,
              s1 = 10'b0000000010,
              s2 = 10'b0000000100,
              s3 = 10'b0000001000,
              s4 = 10'b0000010000,
              s5 = 10'b0000100000,
              s6 = 10'b0001000000,
              s7 = 10'b0010000000,
              s8 = 10'b0100000000,
              s9 = 10'b1000000000;
    top_module DUT(in,state,clk,rst,out1,out2);

    always #5 clk = ~clk;
    
    initial 
        begin
            $dumpfile("fsm.vcd");

            $dumpvars;
            $monitor($time, "state=%b, in=%b,  out1=%b, out2=%b", 
                    state, in,  out1, out2);

            in = 0;
            clk = 0;
            rst = 1; #10;
            rst = 0; #10;

            in = 1;  #10;
            in = 1;  #10;
            in = 1;  #10;
            in = 1;  #10;
            in = 1;  #10;
            in = 1;  #10;
            in = 1;  #10;
            in = 1;  #10;
            in = 1;  #10;
            in = 1;  #10;
            in = 1;  #10;
            in = 0;  #10;
            in = 0;  #10;
            in = 0;  #10;
            in = 0;  #10;
            in = 0;  #10;

            $finish;
        end

endmodule

    
