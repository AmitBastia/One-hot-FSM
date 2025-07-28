module top_module(
    input in,
    output  reg [9:0] state,
    input clk,
    input rst,
    output reg out1,
    output reg out2);
    
   

    
    
    parameter s0=10'b0000000001,
              s1=10'b0000000010,             
              s2=10'b0000000100,
              s3=10'b0000001000,
              s4=10'b0000010000,
              s5=10'b0000100000,
              s6=10'b0001000000,
              s7=10'b0010000000,
              s8=10'b0100000000,
              s9=10'b1000000000;

    reg [9:0] next_state;
    
    always @(posedge clk or posedge rst) 
    begin
    if (rst)
        state <= s0;
    else
        state <= next_state;
    end

    always@(*)
    begin
    next_state=s0;
     
        case(state)
            s0:
                begin
                    next_state=in?s1:s0;
                    out1=0;
                    out2=0;
                end
            s1:
                begin
                    next_state=in?s2:s0;
                    out1=0;
                    out2=0;
                end
            s2:
                begin
                    next_state=in?s3:s0;
                    out1=0;
                    out2=0;
                end
            s3:
                begin
                    next_state=in?s4:s0;
                    out1=0;
                    out2=0;
                end
            s4:
                begin
                    next_state=in?s5:s0;
                    out1=0;
                    out2=0;
                end
            s5:
                begin
                    next_state=in?s6:s8;
                    out1=0;
                    out2=0;
                end
            s6:
                begin
                    next_state=in?s7:s9;
                    out1=0;
                    out2=0;
                end
            s7:
                begin
                    next_state=in?s7:s0;
                    out1=0;
                    out2=1;
                end
            s8:
                begin
                    next_state=in?s1:s0;
                    out1=1;
                    out2=0;
                end
            s9:
                begin
                    next_state=in?s1:s0;
                    out1=1;
                    out2=1;
                end
            default:
                begin
                    next_state=s0;
                    out1=0;
                    out2=0;
                end
     
                
        endcase
    end
endmodule
