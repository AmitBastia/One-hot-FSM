`include "one_hot_fsm.v"
`timescale 1ns/1ps
module one_hot_fsm_tb;
    reg in;
    reg [9:0]state;
    wire[9:0]next_state;
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
    top_module DUT(in,state,next_state,out1,out2);
    
    initial 
        begin
            $dumpfile("fsm.vcd");

            $dumpvars;
            $monitor($time, "state=%b, in=%b, next_state=%b, out1=%b, out2=%b", 
                    state, in, next_state, out1, out2);

            in = 0;
            state = s0;
            #10;

            in = 1; state = s0; #10;
            in = 1; state = s1; #10;
            in = 1; state = s2; #10;
            in = 1; state = s3; #10;
            in = 1; state = s4; #10;
            in = 1; state = s5; #10;
            in = 1; state = s6; #10;
            in = 1; state = s7; #10;
            in = 1; state = s8; #10;
            in = 1; state = s9; #10;
            in = 0; state = s9; #10;
            in = 0; state = s8; #10;
            in = 0; state = s7; #10;
            in = 0; state = s6; #10;
            in = 0; state = s5; #10;

            $finish;
        end

endmodule

    
