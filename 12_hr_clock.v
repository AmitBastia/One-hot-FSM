module twelve_hr_clock (
    input wire clk,         // 1 Hz clock input
    input wire rst,         // synchronous reset
    input wire en,          // enable counting
    output reg [3:0] hour,  // 1-12
    output reg [5:0] min,   // 0-59
    output reg [5:0] sec,   // 0-59
    output reg pm           // 0: AM, 1: PM
);

always @(posedge clk) begin
    if (rst) begin
        hour <= 4'd12;
        min  <= 6'd0;
        sec  <= 6'd0;
        pm   <= 1'b0;
    end else if (en) begin
        if (sec == 6'd59) begin
            sec <= 6'd0;
            if (min == 6'd59) begin
                min <= 6'd0;
                if (hour == 4'd12) begin
                    hour <= 4'd1;
                    pm <= ~pm;
                end else begin
                    hour <= hour + 4'd1;
                end
            end else begin
                min <= min + 6'd1;
            end
        end else begin
            sec <= sec + 6'd1;
        end
    end
end

endmodule