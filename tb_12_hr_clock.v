`include "12_hr_clock.v"
`timescale 1s/1ms

module tb_12_hr_clock;

    reg clk;
    reg rst;
    reg en;
    wire [3:0] hour;
    wire [5:0] min;
    wire [5:0] sec;
    wire pm;

    // Instantiate the DUT
    twelve_hr_clock uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .hour(hour),
        .min(min),
        .sec(sec),
        .pm(pm)
    );

    // Clock generation: 1 Hz
    initial clk = 0;
    always #0.5 clk = ~clk; // 1s period

    initial begin
        $display("Time\tHour\tMin\tSec\tPM");
        rst = 1;
        en = 0;
        #2;
        rst = 0;
        en = 1;

        // Run for 125 seconds to see clock increment
        repeat (125) begin
            #1;
            $display("%0t\t%0d\t%0d\t%0d\t%b", $time, hour, min, sec, pm);
        end

        // Test reset
        rst = 1;
        #2;
        rst = 0;
        #2;
        $display("After reset: %0d:%0d:%0d %s", hour, min, sec, pm ? "PM" : "AM");

        $finish;
    end
endmodule